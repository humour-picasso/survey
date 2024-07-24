<?php

namespace app\admin\controller\category;

use app\admin\model\Category;
use app\common\controller\Adminbase;
use think\Db;
use think\exception\PDOException;
use think\exception\ValidateException;

/**
 * 
 */
class Score extends Adminbase
{

    /**
     * Score模型对象
     * @var \app\admin\model\category\Score
     */
    protected $modelClass = null;

    protected function initialize()
    {
        parent::initialize();
        $this->modelClass = new \app\admin\model\category\Score;

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

            $list = $this->modelClass
                    ->withJoin(['category'])
                    ->where($where)
                    ->order($sort, $order)
                    ->paginate($limit);

            foreach ($list as $key => $row) {
                
                $row->getRelation('category')->visible(['name']);
                $list[$key]['score_limit'] = $row['score_start'] . ' - ' . $row['score_end'];
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
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                $result = false;
                Db::startTrans();
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name     = str_replace("\\model\\", "\\validate\\", get_class($this->modelClass));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : $name) : $this->modelValidate;
                        $this->validateFailException(true)->validate($params, $validate);
                    }
                    $result = $this->modelClass->allowField(true)->save($params);
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
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                $result = false;
                Db::startTrans();
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name     = str_replace("\\model\\", "\\validate\\", get_class($this->modelClass));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : $name) : $this->modelValidate;
                        $this->validateFailException(true)->validate($params, $validate);
                    }
                    $result = $row->allowField(true)->save($params);
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
        $this->assign('category', $category);
        $this->view->assign("data", $row);
        return $this->fetch();
    }



    /**
     * 得分统计
     */
    public function score()
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

            $list = $this->modelClass
                    ->withJoin(['category'])
                    ->where($where)
                    ->order($sort, $order)
                    ->paginate($limit);

            foreach ($list as $key=>$row) {
                $row->getRelation('category')->visible(['name']);
                $list[$key]['userCount'] = Db::name('user_result')
                ->where('score', '>=', $row['score_start'])
                ->where('score', '<=', $row['score_end'])
                ->where('cid', $row['cid'])
                ->count();
                $list[$key]['score_limit'] = $row['score_start'] . ' - ' . $row['score_end'];
            }
            $result = ["code" => 0, "count" => $list->total(), "data" => $list->items()];
            return json($result);
        }
        return $this->fetch();
    }

}
