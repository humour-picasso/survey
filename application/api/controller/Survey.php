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
use app\admin\model\category\Score;
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
            if (empty($categories[$key]['questions']->toArray())) {
                unset($categories[$key]);
            } else {
                foreach ($categories[$key]['questions'] as $k => $v) {
                    $categories[$key]['questions'][$k]['options'] = \app\admin\model\Options::where('qid', $v['id'])->select();
                }
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
        // $data 来源于以下json格式数据
        // {
        //     "uuid": "b1a6e4bf5040764a",
        //     "user_name": "test",
        //     "user_id": "123",
        //     "birth":"1996-09-22",
        //     "sex": "1", //1 男 2 女 3未知
        //     "department": "技术部",
        //     "categories": [
        //         {
        //             "id": 1,
        //             "questions": [
        //                 {
        //                     "id": 7,
        //                     "type": 1,
        //                     "options":[
        //                         {
        //                             "id":27,
        //                             "score":1
        //                         }
        //                     ]
        //                 },
        //                 {
        //                     "id": 7,
        //                     "type": 2,
        //                     "options":[
        //                         {
        //                             "id":30,
        //                             "score":1
        //                         },
        //                         {
        //                             "id":31,
        //                             "score":1
        //                         }
        //                     ]
        //                 },
        //                 {
        //                     "id": 7,
        //                     "type": 3,
        //                     "options":[{
        //                         "id":27,
        //                         "result": "问答题答案是XXXXX"
        //                     }]
        //                 }
        //             ]
        //         }
        //     ]
        // }
        
        $uuid = $data['uuid'];
        //获取问卷
        $survey = \app\admin\model\Survey::where('uuid', $uuid)->find();
        if (!$survey) {
            $this->error('问卷不存在');
        }
        //计算分数
        $score = 0;
        foreach ($data['categories'] as $key => $value) {
            foreach ($value['questions'] as $k => $v) {
                if ($v['type'] == 1) {
                    $score += $v['options'][0]['score'];
                } elseif ($v['type'] == 2) {
                    foreach ($v['options'] as $kk => $vv) {
                        $score += $vv['score'];
                    }
                }
            }
        }

        //遍历数组，查询各个category的分数对应的结论
        $categoryScore = [];
        foreach ($data['categories'] as $key => $value) {
            $categoryScore[$key] = Score::where('cid', $value['id'])->where('score_start', '<=', $score)->where('score_end', '>=', $score)->find();
        }
        //开启事务
        DB::startTrans();
        try {
            //添加用户信息到user表
            $user = new User();
            $userData = [
                'sid' => $survey['id'],
                'user_name' => $data['user_name'] ?? '',
                'user_id' => $data['user_id'] ?? '',
                'sex' => $data['sex'] ?? '',
                'department' => $data['department'] ?? '',
                'birth' => $data['birth'] ?? '',
            ];
            $user->save($userData);

            //添加用户答案到user_answer表
            $userAnswer = new \app\admin\model\UserAnswer();
            $answerData = [];
            foreach ($data['categories'] as $key => $value) {
                foreach ($value['questions'] as $k => $v) {
                    if ($v['type'] == 1) {
                        $answerData[] = [
                            'uid' => $user->id,
                            'cid' => $value['id'],
                            'qid' => $v['id'],
                            'oid' => $v['options'][0]['id'],
                            'score' => $v['options'][0]['score'],
                        ];
                    } elseif ($v['type'] == 2) {
                        foreach ($v['options'] as $kk => $vv) {
                            $answerData[] = [
                                'uid' => $user->id,
                                'cid' => $value['id'],
                                'qid' => $v['id'],
                                'oid' => $vv['id'],
                                'score' => $vv['score'],
                            ];
                        }
                    } elseif ($v['type'] == 3) {
                        $answerData[] = [
                            'uid' => $user->id,
                            'cid' => $value['id'],
                            'qid' => $v['id'],
                            'oid' => 0,
                            'answer' => $v['options'][0]['result'],
                        ];
                    }
                }
            }
            if (empty($answerData)) {
                throw new \Exception('答案为空，回答问卷失败');
            }
            $userAnswer->saveAll($answerData);

            //添加用户结论到user_result表
            $userResult = new \app\admin\model\UserResult();
            foreach ($categoryScore as $key => $value) {
                $resultData[] = [
                    'uid' => $user->id,
                    'cid' => $value['cid'],
                    'score' => $score,
                    'result' => $value['result'],
                    'title' => \app\admin\model\Category::where('id', $value['cid'])->value('name'),
                ];
            }
            if (empty($resultData)) {
                throw new \Exception('结论为空，请检查问卷配置');
            }
            $userResult->saveAll($resultData);
            //提交事务
            DB::commit();
        } catch (\Exception $e) {
            //回滚事务
            DB::rollback();
            $this->error($e->getMessage());
        }

        //返回结果
        $this->success('提交成功', $resultData);
        
    }

}
