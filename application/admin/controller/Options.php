<?php

namespace app\admin\controller;

use app\common\controller\Adminbase;

/**
 * 
 */
class Options extends Adminbase
{

    /**
     * Options模型对象
     * @var \app\admin\model\Options
     */
    protected $modelClass = null;

    protected function initialize()
    {
        parent::initialize();
        $this->modelClass = new \app\admin\model\Options;

    }

    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Curd.php中对应的方法复制到当前控制器,然后进行修改
     */


}
