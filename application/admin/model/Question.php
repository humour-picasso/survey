<?php

namespace app\admin\model;

use think\Model;


class Question extends Model
{

    

    

    // 表名
    protected $name = 'question';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];


    public function category()
    {
        return $this->belongsTo('Category', 'cid', 'id', [], 'LEFT');
    }


    

}
