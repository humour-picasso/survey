<?php

namespace app\admin\model;

use think\Model;

class Command extends Model
{

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 追加属性
    protected $append = [
        'execute_time_text',
        'type_text',
        'status_text',
    ];

    public function getStatusList()
    {
        return ['失败', '成功'];
    }

    public function getExecuteTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['execute_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    public function getTypeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['type'];
        $list  = ['crud' => '一键生成CRUD', 'menu' => '一键生成菜单'];
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : $data['status'];
        $list  = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    protected function setExecuteTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

}
