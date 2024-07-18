<?php

namespace app\admin\controller;

use app\admin\model\Options;
use app\common\controller\Adminbase;
use app\admin\model\Category;
use think\Db;
/**
 * 
 */
class Question extends Adminbase
{

    /**
     * Question模型对象
     * @var \app\admin\model\Question
     */
    protected $modelClass = null;

    protected function initialize()
    {
        parent::initialize();
        $this->modelClass = new \app\admin\model\Question;

    }

    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Curd.php中对应的方法复制到当前控制器,然后进行修改
     */


    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            [$page, $limit, $where, $sort, $order] = $this->buildTableParames();
            $order = 'ASC';
            $list = $this->modelClass
                    ->withJoin(['category'])
                    ->where($where)
                    ->order($sort, $order)
                    ->paginate($limit);

            foreach ($list as $key =>$row) {
                switch($row['type']) {
                    case 2:
                        $list[$key]['type'] = '多选';
                        break;
                    case 3:
                        $list[$key]['type'] = '问答';
                        break;
                    case 1:
                    default:
                        $list[$key]['type'] = '单选';
                        break;
                }
            }

            $result = ["code" => 0, "count" => $list->total(), "data" => $list->items()];

            return json($result);
        }
        return $this->fetch();
    }


    /**
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $params = $this->request->post();
            if ($params) {
                $params = $this->preExcludeFields($params);
                if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                $result = false;
                Db::startTrans();
                try {
                    $result = $this->modelClass->allowField(true)->save($params['row']);
                    $qid = $this->modelClass->getData('id');
                    //添加选项
                    $optionData = [];
                    $optionModel = new Options();
                    if (!empty($params['option']) && !empty($params['score'])) {
                        $options = array_combine($params['option'], $params['score']);
                        foreach ($options as $k => $v) {
                            $optionData[] = ['qid'=> $qid, 'option_name' => $k, 'score' => $v];
                        }
                        $optionModel->saveAll($optionData);
                    }
                    Db::commit();
                } catch (ValidateException | PDOException | Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success('新增成功');
                } else {
                    $this->error('未插入任何行');
                }
            }
            
            $this->error('参数不能为空');
        } else {
            $category = Category::all();
            $this->assign('category', $category);
        }
        
        return $this->fetch();
    }

    /**
     * 编辑
     */
    public function edit()
    {
        $id  = $this->request->param('id/d', 0);

        $row = $this->modelClass->get($id);

        if (!$row) {
            $this->error('记录未找到');
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            if (!in_array($row[$this->dataLimitField], $adminIds)) {
                $this->error('你没有权限访问');
            }
        }
        if ($this->request->isPost()) {
            $params = $this->request->post();
            if ($params) {
                $params = $this->preExcludeFields($params);
                $result = false;
                Db::startTrans();
                try {
                    $result = $row->allowField(true)->save($params['row']);
                    $optionsData = [];
                    $optionsModel = new Options();
                    if (!empty($params['id'])) {
                        foreach ($params['id'] as $k => $v) {

                            $optionsData[$k] = [
                                'id' => $v,
                                'option_name' => $params['option'][$k],
                                'score' => $params['score'][$k],
                                'qid' => $params['qid'],
                            ];
                            if ($v == 0) {
                                unset($optionsData[$k]['id']);
                            }
                            if (empty($params['option'][$k]) && empty($params['score'][$k])) {
                                unset($optionsData[$k]);
                                $optionsModel->where(['id' => $v])->delete();
                            }
                        }
                    }

                    $optionsModel->saveAll($optionsData);
                    Db::commit();
                } catch (ValidateException | PDOException | Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success('修改成功');
                } else {
                    $this->error('未更新任何行');
                }
            }
            $this->error('参数不能为空');
        }
        $category = Category::all();
        $options = Options::where(['qid'=>$id])->select();
        $this->assign('category', $category);
        $this->assign('options', $options);
        $this->view->assign("data", $row);
        return $this->fetch();
    }

    /**
     * 删除
     */
    public function del()
    {
        if (false === $this->request->isPost()) {
            $this->error('未知参数');
        }
        $ids = $this->request->param('id/a', null);
        if (empty($ids)) {
            $this->error('参数错误！');
        }
        if (!is_array($ids)) {
            $ids = [0 => $ids];
        }
        $pk       = $this->modelClass->getPk();
        $adminIds = $this->getDataLimitAdminIds();
        $where    = [];
        if (is_array($adminIds)) {
            $where[] = [$this->dataLimitField, 'in', $adminIds];
        }
        $where[] = [$pk, 'in', $ids];
        $list    = $this->modelClass->where($where)->select();
        $count   = 0;
        Db::startTrans();
        try {
            foreach ($list as $k => $v) {
                $count += $v->delete();
                //删除选项
                Options::where(['qid'=>$v->getData('id')])->delete();
            }
            Db::commit();
        } catch (PDOException | Exception $e) {
            Db::rollback();
            $this->error($e->getMessage());
        }
        if ($count) {
            $this->success("操作成功！");
        }
        $this->error('没有数据删除！');
    }

}
