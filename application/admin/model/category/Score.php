<?php

namespace app\admin\model\category;

use think\Model;
use app\admin\model\UserResult;


class Score extends Model
{

    

    

    // 表名
    protected $name = 'category_score';
    
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
        return $this->belongsTo('app\admin\model\Category', 'cid', 'id', [], 'LEFT');
    }

    public function survey()
    {
        return $this->belongsTo('app\admin\model\Survey', 'sid', 'id', [], 'LEFT');
    }

}
