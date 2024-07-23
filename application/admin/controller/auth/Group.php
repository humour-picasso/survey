<?php
// +----------------------------------------------------------------------
// | Yzncms [ 御宅男工作室 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2007 http://yzncms.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: fastadmin: https://www.fastadmin.net/
// +----------------------------------------------------------------------
namespace app\admin\Controller\auth;

use app\admin\model\AuthGroup as AuthGroupModel;
use app\common\controller\Adminbase;
use think\Db;
use util\Tree;

/**
 * 权限管理控制器
 */
class Group extends Adminbase
{
    //当前登录管理员所有子组别
    protected $childrenGroupIds = [];
    //当前组别列表数据
    protected $grouplist   = [];
    protected $groupdata   = [];
    protected $noNeedRight = [];

    protected function initialize()
    {
        parent::initialize();
        $this->modelClass = new AuthGroupModel;

        $this->childrenGroupIds = $this->auth->getChildrenGroupIds(true);

        $groupList = AuthGroupModel::where('id', 'in', $this->childrenGroupIds)->select()->toArray();

        Tree::instance()->init($groupList);
        $groupList = [];
        if ($this->auth->isAdministrator()) {
            $groupList = Tree::instance()->getTreeList(Tree::instance()->getTreeArray(0), 'title');
        } else {
            $groups   = $this->auth->getGroups();
            $groupIds = [];
            foreach ($groups as $m => $n) {
                if (in_array($n['id'], $groupIds) || in_array($n['parentid'], $groupIds)) {
                    continue;
                }
                $groupList = array_merge($groupList, Tree::instance()->getTreeList(Tree::instance()->getTreeArray($n['parentid']), 'title'));
                foreach ($groupList as $index => $item) {
                    $groupIds[] = $item['id'];
                }
            }
        }

        $groupName = [];
        foreach ($groupList as $k => $v) {
            $groupName[$v['id']] = $v['title'];
        }
        $this->grouplist = $groupList;
        $this->groupdata = $groupName;
        $this->assign('groupdata', $this->groupdata);
    }

    //权限管理首页
    public function index()
    {
        if ($this->request->isAjax()) {
            $list   = $this->grouplist;
            $total  = count($list);
            $result = ["code" => 0, "count" => $total, "data" => $list];
            return json($result);
        } else {
            return $this->fetch();
        }
    }

    //创建管理员用户组
    public function add()
    {
        if ($this->request->isPost()) {
            $this->token();
            $params = $this->request->post("row/a", [], 'strip_tags');
            $result = $this->validate($params, 'app\admin\validate\AuthGroup');
            if (true !== $result) {
                return $this->error($result);
            }
            if (!in_array($params['parentid'], $this->childrenGroupIds)) {
                $this->error('父组别超出权限范围');
            }
            $parentmodel = AuthGroupModel::get($params['parentid']);
            if (!$parentmodel) {
                $this->error('父组别未找到');
            }
            if ($params) {
                $this->modelClass->create($params);
                $this->success('新增成功');
            }
            $this->error('参数不能为空');
        }
        return $this->fetch();

    }

    //编辑管理员用户组
    public function edit()
    {
        $id = $this->request->param('id/d');
        if (!in_array($id, $this->childrenGroupIds)) {
            $this->error('你没有权限访问!');
        }
        $row = $this->modelClass->get($id);
        if (!$row) {
            $this->error('记录未找到');
        }
        if ($this->request->isPost()) {
            $this->token();
            $params = $this->request->post("row/a", [], 'strip_tags');
            //父节点不能是非权限内节点
            if (!in_array($params['parentid'], $this->childrenGroupIds)) {
                $this->error('父组别超出权限范围');
            }
            // 父节点不能是它自身的子节点或自己本身
            if (in_array($params['parentid'], Tree::instance()->getChildrenIds($row->id, true))) {
                $this->error('父角色不能是自身！');
            }
            $params['rules'] = explode(',', $params['rules']);

            $parentmodel = AuthGroupModel::get($params['parentid']);
            if (!$parentmodel) {
                $this->error('父组别未找到');
            }

            // 父级别的规则节点
            $parentrules = explode(',', $parentmodel->rules);
            // 当前组别的规则节点
            $currentrules = $this->auth->getRuleIds();
            $rules        = $params['rules'];
            // 如果父组不是超级管理员则需要过滤规则节点,不能超过父组别的权限
            $rules = in_array('*', $parentrules) ? $rules : array_intersect($parentrules, $rules);
            // 如果当前组别不是超级管理员则需要过滤规则节点,不能超当前组别的权限
            $rules           = in_array('*', $currentrules) ? $rules : array_intersect($currentrules, $rules);
            $params['rules'] = implode(',', $rules);
            if ($params) {
                Db::startTrans();
                try {
                    $row->save($params);
                    $children_auth_groups = model("AuthGroup")->all(['id' => ['in', implode(',', (Tree::instance()->getChildrenIds($row->id)))]]);
                    $childparams          = [];
                    foreach ($children_auth_groups as $key => $children_auth_group) {
                        $childparams[$key]['id']    = $children_auth_group->id;
                        $childparams[$key]['rules'] = implode(',', array_intersect(explode(',', $children_auth_group->rules), $rules));
                    }
                    model("AuthGroup")->saveAll($childparams);
                    Db::commit();
                } catch (Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                $this->success('编辑成功');
            }
            $this->error('参数不能为空');
        }
        $this->assign("data", $row);
        return $this->fetch();
    }

    //访问授权页面
    public function access()
    {
        $id  = $this->request->param('id/d');
        $pid = $this->request->param('pid/d');
        if (!in_array($id, $this->childrenGroupIds)) {
            $this->error('你没有权限访问!');
        }
        $row = $this->modelClass->get($id);
        if (!$row) {
            $this->error('记录未找到');
        }
        if ($this->request->isPost()) {
            $this->token();
            $params          = $this->request->post("row/a", [], 'strip_tags');
            $params['rules'] = explode(',', $params['rules']);

            $parentmodel = $this->modelClass->get($params['parentid']);
            if (!$parentmodel) {
                $this->error('父组别未找到');
            }
            // 父级别的规则节点
            $parentrules = explode(',', $parentmodel->rules);
            // 当前组别的规则节点
            $currentrules = $this->auth->getRuleIds();
            $rules        = $params['rules'];
            // 如果父组不是超级管理员则需要过滤规则节点,不能超过父组别的权限
            $rules = in_array('*', $parentrules) ? $rules : array_intersect($parentrules, $rules);
            // 如果当前组别不是超级管理员则需要过滤规则节点,不能超当前组别的权限
            $rules = in_array('*', $currentrules) ? $rules : array_intersect($currentrules, $rules);
            Db::startTrans();
            try {
                $row->rules = implode(',', $rules);
                $row->save();
                $children_auth_groups = model("AuthGroup")->all(['id' => ['in', implode(',', (Tree::instance()->getChildrenIds($row->id)))]]);
                $childparams          = [];
                foreach ($children_auth_groups as $key => $children_auth_group) {
                    $childparams[$key]['id']    = $children_auth_group->id;
                    $childparams[$key]['rules'] = implode(',', array_intersect(explode(',', $children_auth_group->rules), $rules));
                }
                model("AuthGroup")->saveAll($childparams);
                Db::commit();
            } catch (Exception $e) {
                Db::rollback();
                $this->error($e->getMessage());
            }
            $this->success('编辑成功');
        }
        $parentGroupModel = $this->modelClass->get($pid);

        $ruleList = model('AuthRule')->order('listorder', 'desc')->order('id', 'asc')->select()->toArray();
        //读取父类角色所有节点列表
        $parentRuleList = [];
        if (in_array('*', explode(',', $parentGroupModel->rules))) {
            $parentRuleList = $ruleList;
        } else {
            $parentRuleIds = explode(',', $parentGroupModel->rules);
            foreach ($ruleList as $k => $v) {
                if (in_array($v['id'], $parentRuleIds)) {
                    $parentRuleList[] = $v;
                }
            }
        }

        $ruleTree  = new Tree();
        $groupTree = new Tree();
        //当前所有正常规则列表
        $ruleTree->init($parentRuleList);
        //角色组列表
        $groupTree->init(model('AuthGroup')->where('id', 'in', $this->childrenGroupIds)->select()->toArray());

        //读取当前角色下规则ID集合
        $adminRuleIds = $this->auth->getRuleIds();
        //是否是超级管理员
        $superadmin = $this->auth->isAdministrator();
        //当前拥有的规则ID集合
        $currentRuleIds = explode(',', $row->rules);
        $parentRuleList = $ruleTree->getTreeList($ruleTree->getTreeArray(0), 'name');
        /*$hasChildrens = [];
        foreach ($parentRuleList as $k => $v) {
        if ($v['haschild']) {
        $hasChildrens[] = $v['id'];
        }
        }*/
        $parentRuleIds = array_map(function ($item) {
            return $item['id'];
        }, $parentRuleList);
        $nodeList = [];
        foreach ($parentRuleList as $k => $v) {
            if (!$superadmin && !in_array($v['id'], $adminRuleIds)) {
                continue;
            }
            if ($v['parentid'] && !in_array($v['parentid'], $parentRuleIds)) {
                continue;
            }
            //$ischeck = in_array($v['id'], $currentRuleIds) && !in_array($v['id'], $hasChildrens);
            $ischeck    = in_array($v['id'], $currentRuleIds);
            
            $nodeList[] = ['id' => $v['id'], 'parentid' => $v['parentid'], 'name' => $v['title'], 'checked' => $ischeck, 'status'=> $v['status']];
        }
        
        // $nodeList = array(83) {
        //     [0] => array(5) {
        //       ["id"] => int(1)
        //       ["parentid"] => int(0)
        //       ["name"] => string(12) "常规管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [1] => array(5) {
        //       ["id"] => int(10)
        //       ["parentid"] => int(1)
        //       ["name"] => string(12) "配置管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [2] => array(5) {
        //       ["id"] => int(23)
        //       ["parentid"] => int(10)
        //       ["name"] => string(6) "新增"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [3] => array(5) {
        //       ["id"] => int(24)
        //       ["parentid"] => int(10)
        //       ["name"] => string(6) "编辑"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [4] => array(5) {
        //       ["id"] => int(25)
        //       ["parentid"] => int(10)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [5] => array(5) {
        //       ["id"] => int(26)
        //       ["parentid"] => int(10)
        //       ["name"] => string(12) "批量更新"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [6] => array(5) {
        //       ["id"] => int(27)
        //       ["parentid"] => int(10)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [7] => array(5) {
        //       ["id"] => int(11)
        //       ["parentid"] => int(1)
        //       ["name"] => string(12) "网站设置"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [8] => array(5) {
        //       ["id"] => int(13)
        //       ["parentid"] => int(1)
        //       ["name"] => string(12) "附件管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [9] => array(5) {
        //       ["id"] => int(14)
        //       ["parentid"] => int(13)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [10] => array(5) {
        //       ["id"] => int(15)
        //       ["parentid"] => int(13)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [11] => array(5) {
        //       ["id"] => int(16)
        //       ["parentid"] => int(13)
        //       ["name"] => string(15) "图片本地化"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [12] => array(5) {
        //       ["id"] => int(17)
        //       ["parentid"] => int(13)
        //       ["name"] => string(12) "图片选择"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [13] => array(5) {
        //       ["id"] => int(4)
        //       ["parentid"] => int(1)
        //       ["name"] => string(12) "个人资料"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [14] => array(5) {
        //       ["id"] => int(5)
        //       ["parentid"] => int(4)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [15] => array(5) {
        //       ["id"] => int(6)
        //       ["parentid"] => int(4)
        //       ["name"] => string(12) "资料更新"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [16] => array(5) {
        //       ["id"] => int(28)
        //       ["parentid"] => int(0)
        //       ["name"] => string(12) "权限管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [17] => array(5) {
        //       ["id"] => int(29)
        //       ["parentid"] => int(28)
        //       ["name"] => string(15) "管理员管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [18] => array(5) {
        //       ["id"] => int(30)
        //       ["parentid"] => int(29)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [19] => array(5) {
        //       ["id"] => int(31)
        //       ["parentid"] => int(29)
        //       ["name"] => string(6) "编辑"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [20] => array(5) {
        //       ["id"] => int(32)
        //       ["parentid"] => int(29)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [21] => array(5) {
        //       ["id"] => int(33)
        //       ["parentid"] => int(29)
        //       ["name"] => string(6) "新增"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [22] => array(5) {
        //       ["id"] => int(34)
        //       ["parentid"] => int(28)
        //       ["name"] => string(12) "管理日志"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [23] => array(5) {
        //       ["id"] => int(35)
        //       ["parentid"] => int(34)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [24] => array(5) {
        //       ["id"] => int(36)
        //       ["parentid"] => int(34)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [25] => array(5) {
        //       ["id"] => int(37)
        //       ["parentid"] => int(28)
        //       ["name"] => string(12) "角色管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [26] => array(5) {
        //       ["id"] => int(38)
        //       ["parentid"] => int(37)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [27] => array(5) {
        //       ["id"] => int(39)
        //       ["parentid"] => int(37)
        //       ["name"] => string(6) "新增"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [28] => array(5) {
        //       ["id"] => int(40)
        //       ["parentid"] => int(37)
        //       ["name"] => string(6) "编辑"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [29] => array(5) {
        //       ["id"] => int(41)
        //       ["parentid"] => int(37)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [30] => array(5) {
        //       ["id"] => int(42)
        //       ["parentid"] => int(37)
        //       ["name"] => string(12) "访问授权"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [31] => array(5) {
        //       ["id"] => int(12)
        //       ["parentid"] => int(28)
        //       ["name"] => string(12) "菜单管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [32] => array(5) {
        //       ["id"] => int(18)
        //       ["parentid"] => int(12)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [33] => array(5) {
        //       ["id"] => int(19)
        //       ["parentid"] => int(12)
        //       ["name"] => string(6) "新增"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [34] => array(5) {
        //       ["id"] => int(20)
        //       ["parentid"] => int(12)
        //       ["name"] => string(6) "编辑"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [35] => array(5) {
        //       ["id"] => int(21)
        //       ["parentid"] => int(12)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [36] => array(5) {
        //       ["id"] => int(22)
        //       ["parentid"] => int(12)
        //       ["name"] => string(12) "批量更新"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [37] => array(5) {
        //       ["id"] => int(2)
        //       ["parentid"] => int(0)
        //       ["name"] => string(12) "插件管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(0)
        //     }
        //     [38] => array(5) {
        //       ["id"] => int(45)
        //       ["parentid"] => int(2)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [39] => array(5) {
        //       ["id"] => int(46)
        //       ["parentid"] => int(2)
        //       ["name"] => string(6) "配置"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [40] => array(5) {
        //       ["id"] => int(49)
        //       ["parentid"] => int(2)
        //       ["name"] => string(12) "禁用启用"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [41] => array(5) {
        //       ["id"] => int(50)
        //       ["parentid"] => int(0)
        //       ["name"] => string(18) "在线命令管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(0)
        //     }
        //     [42] => array(5) {
        //       ["id"] => int(51)
        //       ["parentid"] => int(50)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [43] => array(5) {
        //       ["id"] => int(52)
        //       ["parentid"] => int(50)
        //       ["name"] => string(6) "添加"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [44] => array(5) {
        //       ["id"] => int(53)
        //       ["parentid"] => int(50)
        //       ["name"] => string(6) "详情"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [45] => array(5) {
        //       ["id"] => int(54)
        //       ["parentid"] => int(50)
        //       ["name"] => string(21) "生成并执行命令"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [46] => array(5) {
        //       ["id"] => int(55)
        //       ["parentid"] => int(50)
        //       ["name"] => string(18) "再次执行命令"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [47] => array(5) {
        //       ["id"] => int(56)
        //       ["parentid"] => int(50)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [48] => array(5) {
        //       ["id"] => int(57)
        //       ["parentid"] => int(50)
        //       ["name"] => string(12) "批量更新"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [49] => array(5) {
        //       ["id"] => int(149)
        //       ["parentid"] => int(0)
        //       ["name"] => string(18) "量表分类管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [50] => array(5) {
        //       ["id"] => int(155)
        //       ["parentid"] => int(149)
        //       ["name"] => string(18) "分数结论管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [51] => array(5) {
        //       ["id"] => int(156)
        //       ["parentid"] => int(155)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [52] => array(5) {
        //       ["id"] => int(157)
        //       ["parentid"] => int(155)
        //       ["name"] => string(6) "添加"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [53] => array(5) {
        //       ["id"] => int(158)
        //       ["parentid"] => int(155)
        //       ["name"] => string(6) "编辑"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [54] => array(5) {
        //       ["id"] => int(159)
        //       ["parentid"] => int(155)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [55] => array(5) {
        //       ["id"] => int(160)
        //       ["parentid"] => int(155)
        //       ["name"] => string(12) "批量更新"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [56] => array(5) {
        //       ["id"] => int(162)
        //       ["parentid"] => int(149)
        //       ["name"] => string(12) "量表分类"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [57] => array(5) {
        //       ["id"] => int(163)
        //       ["parentid"] => int(162)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [58] => array(5) {
        //       ["id"] => int(164)
        //       ["parentid"] => int(162)
        //       ["name"] => string(6) "添加"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [59] => array(5) {
        //       ["id"] => int(165)
        //       ["parentid"] => int(162)
        //       ["name"] => string(6) "编辑"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [60] => array(5) {
        //       ["id"] => int(166)
        //       ["parentid"] => int(162)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [61] => array(5) {
        //       ["id"] => int(167)
        //       ["parentid"] => int(162)
        //       ["name"] => string(12) "批量更新"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [62] => array(5) {
        //       ["id"] => int(168)
        //       ["parentid"] => int(0)
        //       ["name"] => string(18) "量表试题管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [63] => array(5) {
        //       ["id"] => int(174)
        //       ["parentid"] => int(168)
        //       ["name"] => string(12) "试题列表"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [64] => array(5) {
        //       ["id"] => int(169)
        //       ["parentid"] => int(174)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [65] => array(5) {
        //       ["id"] => int(170)
        //       ["parentid"] => int(174)
        //       ["name"] => string(6) "添加"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [66] => array(5) {
        //       ["id"] => int(171)
        //       ["parentid"] => int(174)
        //       ["name"] => string(6) "编辑"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [67] => array(5) {
        //       ["id"] => int(172)
        //       ["parentid"] => int(174)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [68] => array(5) {
        //       ["id"] => int(173)
        //       ["parentid"] => int(174)
        //       ["name"] => string(12) "批量更新"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [69] => array(5) {
        //       ["id"] => int(175)
        //       ["parentid"] => int(0)
        //       ["name"] => string(12) "问卷管理"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [70] => array(5) {
        //       ["id"] => int(176)
        //       ["parentid"] => int(175)
        //       ["name"] => string(12) "问卷列表"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [71] => array(5) {
        //       ["id"] => int(177)
        //       ["parentid"] => int(176)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [72] => array(5) {
        //       ["id"] => int(178)
        //       ["parentid"] => int(176)
        //       ["name"] => string(6) "添加"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [73] => array(5) {
        //       ["id"] => int(179)
        //       ["parentid"] => int(176)
        //       ["name"] => string(6) "编辑"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [74] => array(5) {
        //       ["id"] => int(180)
        //       ["parentid"] => int(176)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [75] => array(5) {
        //       ["id"] => int(181)
        //       ["parentid"] => int(176)
        //       ["name"] => string(12) "批量更新"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [76] => array(5) {
        //       ["id"] => int(182)
        //       ["parentid"] => int(175)
        //       ["name"] => string(12) "提交记录"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [77] => array(5) {
        //       ["id"] => int(183)
        //       ["parentid"] => int(182)
        //       ["name"] => string(6) "查看"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [78] => array(5) {
        //       ["id"] => int(184)
        //       ["parentid"] => int(182)
        //       ["name"] => string(6) "添加"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [79] => array(5) {
        //       ["id"] => int(185)
        //       ["parentid"] => int(182)
        //       ["name"] => string(6) "编辑"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [80] => array(5) {
        //       ["id"] => int(186)
        //       ["parentid"] => int(182)
        //       ["name"] => string(6) "删除"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [81] => array(5) {
        //       ["id"] => int(187)
        //       ["parentid"] => int(182)
        //       ["name"] => string(12) "批量更新"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //     [82] => array(5) {
        //       ["id"] => int(188)
        //       ["parentid"] => int(175)
        //       ["name"] => string(12) "得分统计"
        //       ["checked"] => bool(false)
        //       ["status"] => int(1)
        //     }
        //   }
        // 删除status=0的节点和parentid等于该节点id的节点
        $unsetParentIds = [];
        foreach ($nodeList as $k => $v) {
            if ($v['status'] == 0) {
                $unsetParentIds[] = $v['id'];
                unset($nodeList[$k]);
            }
        }
        foreach ($nodeList as $k => $v) {
            if (in_array($v['parentid'], $unsetParentIds)) {
                unset($nodeList[$k]);
            }
        }
        $nodeList = array_values($nodeList);
        $this->assign('nodeList', json_encode($nodeList));
        $this->assign("data", $row);
        return $this->fetch();
    }

    //批量更新
    public function multi()
    {
        // 管理员禁止批量操作
        $this->error();
    }

}
