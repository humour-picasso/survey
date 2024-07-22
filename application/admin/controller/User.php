<?php

namespace app\admin\controller;

use app\common\controller\Adminbase;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use think\Db;
/**
 * 
 */
class User extends Adminbase
{

    /**
     * User模型对象
     * @var \app\admin\model\User
     */
    protected $modelClass = null;

    protected function initialize()
    {
        parent::initialize();
        $this->modelClass = new \app\admin\model\User;

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
                    ->withJoin(['survey'])
                    ->where($where)
                    ->order($sort, $order)
                    ->paginate($limit);

            foreach ($list as $row) {
                
                $row->getRelation('survey')->visible(['survey_name']);
            }

            $result = ["code" => 0, "count" => $list->total(), "data" => $list->items()];

            return json($result);
        }
        return $this->fetch();
    }

    public function view($id)
    {
        $where = ['uid'=>$id];
        
        $list = Db::name('user_result')->join('category', 'category.id = cid')
                ->where($where)
                ->select();
        $this->assign('data', $list);
        return $this->fetch();
    }



    /**
     * 导出excel
     */
    public function export() {
        $ids = $this->request->post('id'); 
        $where = ['yzn_user.id'=>$ids];
        $list = Db::name('user')->alias('u')
                ->leftjoin('survey s', 's.id = sid')
                ->where($where)
                ->field(['u.*','s.categories','s.id as sid', 's.survey_name'])
                ->select();
        if (count(array_unique(array_column($list, 'sid'))) > 1) {
            $this->error('请选择同一个调查问卷的数据');
        }
        $header = ['姓名', '编号', '性别', '生日', '部门', '调查问卷'];
        $excelData = [];
        foreach ($list as $key => $row) {
            $excelData[$key][] = $row['user_name'];
            $excelData[$key][] = $row['user_id'];
            $excelData[$key][] = $row['sex'];
            $excelData[$key][] = $row['birth'];
            $excelData[$key][] = $row['department'];
            $excelData[$key][] = $row['survey_name'];
            //获取调查问卷的问题
            $cids = $row['categories'];
            foreach (explode(',', $cids) as $ck => $cid) {
                $key == 0 ? array_push($header, '量表'.($ck + 1)) : '';
                $list[$key]['category'][$ck] = Db::name('category')->where(['id'=> $cid])->find();
                $excelData[$key][] = $list[$key]['category'][$ck]['name'];
                $list[$key]['category'][$ck]['question'] = Db::name('question')->where(['cid'=> $cid])->select();
                //获取用户回答
                foreach ($list[$key]['category'][$ck]['question'] as $k => $q) {
                    $key == 0 ? array_push($header, '问题'.($k + 1)) : '';
                    $key == 0 ? array_push($header, '得分') : '';
                    $excelData[$key][] = $q['title'];
                    $list[$key]['category'][$ck]['question'][$k]['score'] = Db::name('user_answer')->where(['uid'=>$row['id'], 'qid'=>$q['id'], 'cid'=>$q['cid']])->value('score');
                    $excelData[$key][] = $list[$key]['category'][$ck]['question'][$k]['score'];
                }
            }
        }
            
        
        
        // 创建新的电子表格对象
        $spreadsheet = new Spreadsheet();

        // 设置活动工作表的标题
        $spreadsheet->getActiveSheet()->setTitle('问卷调查结果');

        $spreadsheet->getActiveSheet()->fromArray($header, NULL, 'A1');

        // 将数据写入表格，从第二行开始
        $spreadsheet->getActiveSheet()->fromArray($excelData, NULL, 'A2');

        // 创建 XLSX 文件
        $writer = new Xlsx($spreadsheet);

        // 保存文件到本地
        $outputFileName = './wjdc.xlsx';
        $writer->save($outputFileName);

        $this->success('导出成功', '/wjdc.xlsx');
    }



    /**
     * 导出所有数据
     */
    public function exportAll() {
        $where = ['yzn_user.id'=>$ids];
        $list = Db::name('user')->alias('u')
                ->leftjoin('survey s', 's.id = sid')
                ->where($where)
                ->field(['u.*','s.categories','s.id as sid', 's.survey_name'])
                ->select();
        if (count(array_unique(array_column($list, 'sid'))) > 1) {
            $this->error('请选择同一个调查问卷的数据');
        }
        $header = ['姓名', '编号', '性别', '生日', '部门', '调查问卷'];
        $excelData = [];
        foreach ($list as $key => $row) {
            $excelData[$key][] = $row['user_name'];
            $excelData[$key][] = $row['user_id'];
            $excelData[$key][] = $row['sex'];
            $excelData[$key][] = $row['birth'];
            $excelData[$key][] = $row['department'];
            $excelData[$key][] = $row['survey_name'];
            //获取调查问卷的问题
            $cids = $row['categories'];
            foreach (explode(',', $cids) as $ck => $cid) {
                $key == 0 ? array_push($header, '量表'.($ck + 1)) : '';
                $list[$key]['category'][$ck] = Db::name('category')->where(['id'=> $cid])->find();
                $excelData[$key][] = $list[$key]['category'][$ck]['name'];
                $list[$key]['category'][$ck]['question'] = Db::name('question')->where(['cid'=> $cid])->select();
                //获取用户回答
                foreach ($list[$key]['category'][$ck]['question'] as $k => $q) {
                    $key == 0 ? array_push($header, '问题'.($k + 1)) : '';
                    $key == 0 ? array_push($header, '得分') : '';
                    $excelData[$key][] = $q['title'];
                    $list[$key]['category'][$ck]['question'][$k]['score'] = Db::name('user_answer')->where(['uid'=>$row['id'], 'qid'=>$q['id'], 'cid'=>$q['cid']])->value('score');
                    $excelData[$key][] = $list[$key]['category'][$ck]['question'][$k]['score'];
                }
            }
        }
            
        
        
        // 创建新的电子表格对象
        $spreadsheet = new Spreadsheet();

        // 设置活动工作表的标题
        $spreadsheet->getActiveSheet()->setTitle('问卷调查结果');

        $spreadsheet->getActiveSheet()->fromArray($header, NULL, 'A1');

        // 将数据写入表格，从第二行开始
        $spreadsheet->getActiveSheet()->fromArray($excelData, NULL, 'A2');

        // 创建 XLSX 文件
        $writer = new Xlsx($spreadsheet);

        // 保存文件到本地
        $outputFileName = './wjdc.xlsx';
        $writer->save($outputFileName);

        $this->success('导出成功', '/wjdc.xlsx');
    }
}
