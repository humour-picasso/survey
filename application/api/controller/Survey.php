<?php
// +----------------------------------------------------------------------
// | Yzncms [ 御宅男工作室 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://yzncms.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | fastadmin: https://www.fastadmin.net/
// +----------------------------------------------------------------------

// +----------------------------------------------------------------------
// | 邮箱验证码接口
// +----------------------------------------------------------------------
namespace app\api\controller;

use app\common\controller\Api;
use app\common\library\Ems as Emslib;
use app\member\model\Member;
use think\facade\Hook;
use think\facade\Validate;

/**
 * @title 邮箱验证码接口
 * @controller api\controller\Ems
 * @group base
 */
class Survey extends Api
{
    /**
     * 获取问卷信息
     */
    public function index()
    {
        $uuid = $this->request->param('uuid');
        $survey = \app\admin\model\Survey::where('uuid', $uuid)->find();
        if (!$survey) {
            $this->error('问卷不存在');
        }
        $survey = $survey->toArray();
        $survey['categories'] = explode(',', $survey['categories']);
        //获取量表
        $categories = [];
        //优化下面的查询代码
        foreach ($survey['categories'] as $key => $value) {
            $categories[$key] = \app\admin\model\Category::where('id', $value)->find();
            //获取题目
            $categories[$key]['questions'] = \app\admin\model\Question::where('cid', $value)->select();
            foreach ($categories[$key]['questions'] as $k => $v) {
                $categories[$key]['questions'][$k]['options'] = \app\admin\model\Options::where('qid', $v['id'])->select();
            }
        }

        $survey['categories'] = $categories;
        $survey['web_site_survey_result_display'] =  config('web_site_survey_result_display');
        $this->success('发送成功', $survey);
    }



}
