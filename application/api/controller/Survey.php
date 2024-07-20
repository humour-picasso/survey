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
use app\admin\model\User;
use think\Db;
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
        $survey['web_site_survey_result_display'] =  config('site.web_site_survey_result_display');
        $this->success('发送成功', $survey);
    }

    /**
     * 提交问卷
     */
    public function submit(){
        //判断提交方式，只允许post提交
        if (!$this->request->isPost()) {
            $this->error('非法请求');
        }
        //获取参数
        $data = $this->request->post();
        $uuid = $data['uuid'];
        //获取问卷
        $survey = \app\admin\model\Survey::where('uuid', $uuid)->find();
        if (!$survey) {
            $this->error('问卷不存在');
        }
        DB::startTrans();
        //添加用户信息到user表
        $user = new User();
        $userData = [
            'sid' => $data['sid'],
            'user_name' => $data['user_name'] ?? '',
            'user_id' => $data['user_id'] ?? '',
            'sex' => $data['sex'] ?? '',
            'department' => $data['department'] ?? '',
            'birth' => $data['birth'] ?? '',
            'result_score' => $data['result_score'] ?? '',
            'result_text' => $data['result_text'] ?? '',
        ];

        $user->save($userData);

        
    }



}
