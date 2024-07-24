<?php
// +----------------------------------------------------------------------
// | Yzncms [ 御宅男工作室 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://yzncms.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: fastadmin: https://www.fastadmin.net/
// +----------------------------------------------------------------------

// +----------------------------------------------------------------------
// | 在线命令管理
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\common\controller\Adminbase;
use think\console\Input;
use think\Db;
use think\Exception;
use think\facade\Config;

class Command extends Adminbase
{
    /**
     * Command模型对象
     */
    protected $modelClass  = null;
    protected $noNeedRight = ['get_controller_list', 'get_field_list'];

    public function initialize()
    {
        parent::initialize();
        $this->modelClass = new \app\admin\model\Command;
        $this->assign("statusList", $this->modelClass->getStatusList());
    }

    /**
     * 添加
     */
    public function add()
    {

        $tableList = [];
        $list      = Db::query("SHOW TABLES");

        foreach ($list as $key => $row) {
            $tableList[reset($row)] = reset($row);
        }

        $this->assign("tableList", $tableList);
        return $this->fetch();
    }

    /**
     * 获取字段列表
     * @internal
     */
    public function get_field_list()
    {
        $dbname = Config::get('database.database');
        $prefix = Config::get('database.prefix');
        $table  = $this->request->request('table');
        //从数据库中获取表字段信息
        $sql = "SELECT * FROM `information_schema`.`columns` "
            . "WHERE TABLE_SCHEMA = ? AND table_name = ? "
            . "ORDER BY ORDINAL_POSITION";
        //加载主表的列
        $columnList = Db::query($sql, [$dbname, $table]);
        $fieldlist  = [];
        foreach ($columnList as $index => $item) {
            $fieldlist[] = $item['COLUMN_NAME'];
        }
        $this->success("", null, ['fieldlist' => $fieldlist]);
    }

    /**
     * 获取控制器列表
     * @internal
     */
    public function get_controller_list()
    {
        //搜索关键词,客户端输入以空格分开,这里接收为数组
        $word = (array) $this->request->request("q_word/a");
        $word = implode('', $word);

        $adminPath     = dirname(__DIR__) . DS;
        $controllerDir = $adminPath . 'controller' . DS;
        $files         = new \RecursiveIteratorIterator(
            new \RecursiveDirectoryIterator($controllerDir), \RecursiveIteratorIterator::LEAVES_ONLY
        );
        $list = [];
        foreach ($files as $name => $file) {
            if (!$file->isDir()) {
                $filePath = $file->getRealPath();
                $name     = str_replace($controllerDir, '', $filePath);
                $name     = str_replace(DS, "/", $name);
                if (!preg_match("/(.*)\.php\$/", $name)) {
                    continue;
                }
                if (!$word || stripos($name, $word) !== false) {
                    $list[] = ['id' => $name, 'name' => $name];
                }
            }
        }
        $pageNumber = $this->request->request("pageNumber");
        $pageSize   = $this->request->request("pageSize");
        return json(['data' => array_slice($list, ($pageNumber - 1) * $pageSize, $pageSize), 'count' => count($list)]);
    }

    /**
     * 详情
     */
    public function detail($ids)
    {
        $row = $this->modelClass->get($ids);
        if (!$row) {
            $this->error('记录未找到');
        }
        $this->assign("row", $row);
        return $this->fetch();
    }

    /**
     * 执行
     */
    public function execute($ids)
    {
        $row = $this->modelClass->get($ids);
        if (!$row) {
            $this->error('记录未找到');
        }
        $result = $this->doexecute($row['type'], json_decode($row['params'], true));
        $this->success("Crud成功", null, ['result' => $result]);
    }

    /**
     * 生成命令
     */
    public function command($action = '')
    {
        $commandtype = $this->request->request("commandtype");
        $params      = $this->request->request();
        $allowfields = [
            'crud' => 'table,controller,model,fields,force,local,delete,menu',
            'menu' => 'controller,force,delete',
        ];
        $argv        = [];
        $allowfields = isset($allowfields[$commandtype]) ? explode(',', $allowfields[$commandtype]) : [];
        $allowfields = array_filter(array_intersect_key($params, array_flip($allowfields)));

        if (isset($params['local']) && !$params['local']) {
            $allowfields['local'] = $params['local'];
        } else {
            unset($allowfields['local']);
        }
        foreach ($allowfields as $key => $param) {
            $argv[] = "--{$key}=" . (is_array($param) ? implode(',', $param) : $param);
        }
        if ($commandtype == 'crud') {
            $extend    = 'setcheckboxsuffix,enumradiosuffix,imagefield,filefield,intdatesuffix,switchsuffix,citysuffix,selectpagesuffix,selectpagessuffix,ignorefields,sortfield,editorsuffix,headingfilterfield,tagsuffix,jsonsuffix,fixedcolumns';
            $extendArr = explode(',', $extend);
            foreach ($params as $index => $item) {
                if (in_array($index, $extendArr)) {
                    foreach (explode(',', $item) as $key => $value) {
                        if ($value) {
                            $argv[] = "--{$index}={$value}";
                        }
                    }
                }
            }
            $isrelation = (int) $this->request->request('isrelation');
            if ($isrelation && isset($params['relation'])) {
                foreach ($params['relation'] as $index => $relation) {
                    foreach ($relation as $key => $value) {
                        $value            = (is_array($value) ? implode(',', $value) : $value);
                        $value && $argv[] = "--{$key}=" . $value;
                    }
                }
            }
        } elseif ($commandtype == 'menu') {
            foreach (explode(',', $params['controllerfile']) as $index => $param) {
                if ($param) {
                    $argv[] = "--controller=" . substr($param, 0, -4);
                }
            }
        }
        if ($action == 'execute') {
            if (Config::get('app_debug')) {
                $result = $this->doexecute($commandtype, $argv);
                $this->success("", null, ['result' => $result]);
            } else {
                $this->error("只允许在开发环境下执行命令");
            }
        } else {
            $this->success("", null, ['command' => "php think {$commandtype} " . implode(' ', $argv)]);
        }

        return;
    }

    protected function doexecute($commandtype, $argv)
    {
        if (!Config::get('app_debug')) {
            $this->error("只允许在开发环境下执行命令");
        }
        if (preg_match("/([;\|&]+)/", implode(' ', $argv))) {
            $this->error("不支持的命令参数");
        }
        $commandName = "\\app\\admin\\command\\" . ucfirst($commandtype);
        $input       = new Input($argv);
        $output      = new \addons\command\library\Output();
        $command     = new $commandName($commandtype);
        $data        = [
            'type'         => $commandtype,
            'params'       => json_encode($argv),
            'command'      => "php think {$commandtype} " . implode(' ', $argv),
            'execute_time' => time(),
        ];
        $this->modelClass->save($data);
        try {
            $command->run($input, $output);
            $result                   = implode("\n", $output->getMessage());
            $this->modelClass->status = 1;
        } catch (Exception $e) {
            $result = implode("\n", $output->getMessage()) . "\n";
            $result .= $e->getMessage();
            $this->modelClass->status = 0;
        }
        $result                    = trim($result);
        $this->modelClass->content = $result;
        $this->modelClass->save();
        return $result;
    }

}
