<?php

namespace app\admin\controller;

use app\common\controller\Adminbase;
use app\common\library\QRCode;
use app\admin\model\Category;
use think\Db;
/**
 * 问卷管理
 */
class Survey extends Adminbase
{

    /**
     * Survey模型对象
     * @var \app\admin\model\Survey
     */
    protected $modelClass = null;


    protected $apiRoute = '/app/#/pages/login/login';

    protected function initialize()
    {
        parent::initialize();
        $this->modelClass = new \app\admin\model\Survey;

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
        $this->relationSearch = false;
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
        
            [$page, $limit, $where, $sort, $order] = $this->buildTableParames();
            
            $list = $this->modelClass
                    ->where($where)
                    ->order($sort, $order)
                    ->paginate($limit);
            foreach ($list as $key =>$row) {
                $list[$key]['categories'] = explode(',', $row['categories']);
                $categories = [];
                if (!empty($list[$key]['categories'])) {
                    foreach ($list[$key]['categories'] as $k => $v) {
                        $categories[$k] = Category::where('id', $v)->value('name');
                    }
                    $list[$key]['categories'] = implode(',', $categories);
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
            $params = $this->request->post('row/a');
            if ($params) {
                $params = $this->preExcludeFields($params);
                if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                $result = false;
                Db::startTrans();
                try {
                    if (empty($params['categories'])) {
                        $this->error('请选择分类');
                    }
                    $params['create_at'] = time();
                    $domain = $this->request->domain();
                    $params['uuid'] = $this->generateUniqueId();
                    $url = $domain . $this->apiRoute . '?uuid='.$params['uuid'];
                    $path = './qrcode/'.$params['uuid'].'.png';
                    QRCode::generate($url, $path);
                    $params['qr_code'] = '/qrcode/'.$params['uuid'].'.png';
                    $params['categories'] = !empty($params['categories']) ? implode(',', $params['categories']) : $params['categories'][0];
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
            $params = $this->request->post('row/a');
            if ($params) {
                $params = $this->preExcludeFields($params);
                $result = false;
                Db::startTrans();
                try {
                    if (empty($params['categories'])) {
                        $this->error('请选择分类');
                    }
                    $params['categories'] = !empty($params['categories']) ? implode(',', $params['categories']) : $params['categories'][0];
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
        $row['categories'] = explode(',', $row['categories']);
        $this->view->assign("data", $row);
        return $this->fetch();
    }


    /**
     * 生成唯一ID
     * @param int $length
     * @return string
     */
    protected function generateUniqueId($length = 16) {
        $timestamp = microtime(true);
        $randomNumber = mt_rand();
        $uniqueString = $timestamp . $randomNumber;
        $uniqueId = md5($uniqueString);
        return substr($uniqueId, 0, $length);
    }

}
