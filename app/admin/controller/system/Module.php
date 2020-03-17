<?php
/*
 * @Descripttion:
 * @version:
 * @Author: wzs
 * @Date: 2020-03-13 20:06:50
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-17 15:20:10
 */
declare (strict_types = 1);

namespace app\admin\controller\system;

use app\common\controller\AdminBase;
use app\common\core\interfaces\InterfaceAdminController;
use app\common\model\Field as FieldModel;
use app\common\model\Module as ModuleModel;
use app\Request;
use think\facade\Db;
use think\facade\View;

class Module extends AdminBase implements InterfaceAdminController
{
    public function __construct()
    {
        parent::__construct();
        // $tables = Db::query("show tables");
        // dump($tables);
    }
    public function index(Request $request)
    {
        if ($request->isPost()) {
            $page = intval($request->param('page'));
            $limit = $request->param('limit') ? intval($request->param('limit')) : $this->pageSize;
            $key = $request->param('key') ? $request->param('key') : '';
            $where = [];
            if ($key) {
                array_push($where, ['title', 'like', '%' . htmlspecialchars($key) . '%']);
            }
            $lists = ModuleModel::findPage($where, [], $page, $limit);
            $data = ['code' => '0', 'msg' => 'ok', 'count' => !empty($lists['total']) ? $lists['total'] : 0, 'data' => !empty($lists['data']) ? $lists['data'] : []];
            return json($data);
        } else {
            return view();
        }
    }

    public function form(Request $request)
    {
        $id = $request->param('id');
        $p_id = $request->param('p_id');
        $info = [];
        if (!empty($id)) {
            $info = ModuleModel::findSingle(['id' => $id]);
        }

        return view('', [
            'info' => $info,
            'p_id' => $p_id,
        ]);
    }

    public function save(Request $request)
    {
        $param = $request->param();
        $id = $param['id'];
        unset($param['id']);
        $where = [];
        if (!empty($id)) {
            // 修改
            $where = ['id' => $id];
            $res = ModuleModel::saveData($param, $where);
            if (is_string($res)) {
                $this->error(-1, $res);
            }
            $this->success(1, '操作成功');
        } else {
            // 添加
            $tables = Db::query("show tables");
            // dump(env('database.prefix'));exit;
            $prefix = env('database.prefix');
            $tablename = $prefix . $param['name'];
            $info = [];
            foreach ($tables as $key => $val) {
                foreach ($val as $k => $v) {
                    $info[$key] = $v;
                }
            }
            if (in_array($tablename, $info)) {
                $this->error(-1, '该表已经存在！');
            }
            $param['type'] = 1;
            $param['setup'] = "";
            $res = ModuleModel::saveData($param, $where);
            if (is_string($res)) {
                $this->error(-1, $res);
            }
            // dump($res['id']);exit;
            $moduleid = $res['id'];
            $emptytable = $param['emptytable'];
            if ($emptytable == '0') {
                // $this->dosqlfile();
                Db::execute("CREATE TABLE `" . $tablename . "` (
					`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
					`catid` smallint(5) unsigned NOT NULL DEFAULT '0',
					`userid` int(8) unsigned NOT NULL DEFAULT '0',
					`username` varchar(40) NOT NULL DEFAULT '',
					`title` varchar(120) NOT NULL DEFAULT '',
					`title_style` varchar(225) NOT NULL DEFAULT '',
					`thumb` varchar(225) NOT NULL DEFAULT '',
					`keywords` varchar(120) NOT NULL DEFAULT '',
					`description` mediumtext NOT NULL,
					`content` mediumtext NOT NULL,
					`template` varchar(40) NOT NULL DEFAULT '',
					`posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
					`status` tinyint(1) unsigned NOT NULL DEFAULT '0',
					`recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
					`readgroup` varchar(100) NOT NULL DEFAULT '',
					`readpoint` smallint(5) NOT NULL DEFAULT '0',
					`listorder` int(10) unsigned NOT NULL DEFAULT '0',
					`hits` int(11) unsigned NOT NULL DEFAULT '0',
					`createtime` int(11) unsigned NOT NULL DEFAULT '0',
					`updatetime` int(11) unsigned NOT NULL DEFAULT '0',
					PRIMARY KEY (`id`),
					KEY `status` (`id`,`status`,`listorder`),
					KEY `catid` (`id`,`catid`,`status`),
					KEY `listorder` (`id`,`catid`,`status`,`listorder`)
				  ) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8");
                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'catid', '栏目', '', '1', '1', '6', '', '必须选择一个栏目', '', 'catid', '','1','', '1', '1', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'title', '标题', '', '1', '1', '80', '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)','1','',  '2', '1', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'keywords', '关键词', '', '0', '0', '80', '', '', '', 'text', 'array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)','1','',  '3', '1', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'description', 'SEO简介', '', '0', '0', '0', '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)','1','',  '4', '1', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'content', '内容', '', '0', '0', '0', '', '', '', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'default\' => \'\',\n  \'height\' => \'\',\n  \'showpage\' => \'1\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'\',\n  \'enablesaveimage\' => \'0\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)','1','',  '5', '1', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', '', 'datetime', '','1','',  '6', '1', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'status', '状态', '', '0', '0', '0', '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)','1','','7', '1', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'recommend', '允许评论', '', '0', '0', '1', '', '', '', 'radio', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)','1','', '8', '0', '0')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'readpoint', '阅读收费', '', '0', '0', '5', '', '', '', 'number', 'array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)','1','', '9', '0', '0')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)','1','',  '10', '0', '0')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'readgroup', '访问权限', '', '0', '0', '0', '', '', '', 'groupid', 'array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)','1','', '11', '0', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'posid', '推荐位', '', '0', '0', '0', '', '', '', 'posid', '','1','', '12', '1', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '','1','', '13', '1', '1')");

            } else {

                Db::execute("CREATE TABLE `" . $tablename . "` (
					`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
					`title` varchar(120) NOT NULL DEFAULT '',
					`title_style` varchar(225) NOT NULL DEFAULT '',
					`thumb` varchar(225) NOT NULL DEFAULT '',
					`hits` int(11) unsigned NOT NULL DEFAULT '0',
					`status` tinyint(1) unsigned NOT NULL DEFAULT '0',
					`userid` int(8) unsigned NOT NULL DEFAULT '0',
					`username` varchar(40) NOT NULL DEFAULT '',
					`listorder` int(10) unsigned NOT NULL DEFAULT '0',
					`createtime` int(11) unsigned NOT NULL DEFAULT '0',
					`updatetime` int(11) unsigned NOT NULL DEFAULT '0',
					`lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
					`template` varchar(40) NOT NULL DEFAULT '',
					PRIMARY KEY (`id`)
				  ) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'title', '标题', '', '1', '1', '80', '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)','1','',  '2', '1', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'hits', '点击次数', '', '0', '0', '8', '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)','1','',  '8', '0', '0')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'createtime', '发布时间', '', '1', '0', '0', 'date', '', '', 'datetime', '','1','',  '97', '1', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'template', '模板', '', '0', '0', '0', '', '', '', 'template', '','1','', '99', '1', '1')");

                Db::execute("INSERT INTO `" . $prefix . "field` VALUES (NULL, '" . $moduleid . "', 'status', '状态', '', '0', '0', '0', '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)','1','', '98', '1', '1')");

            }
            $this->success(1, '操作成功');
        }
    }

    public function del(Request $request)
    {
        $id = $request->param('id');
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }
        $r = ModuleModel::findSingle(['id' => $id]);
        if (!empty($r)) {
            $res = ModuleModel::del(['id' => $id]);
            if (is_string($res)) {
                $this->error(-1, $res);
            } else {
                $tablename = env('database.prefix') . $r['name'];
                Db::execute("DROP TABLE IF EXISTS `" . $tablename . "`");
                Db::table(env('database.prefix') . 'field')->where(array('moduleid' => $id))->delete();
                $this->success(1, '操作成功');
            }
            $this->error(-1, '数据表不存在');
        }
    }

    public function sort(Request $request)
    {

    }

    public function state(Request $request)
    {
        $id = $request->param('id');
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }

        $res = ModuleModel::changeState(['id' => $id]);
        if (is_string($res)) {
            $this->error(-1, $res);
        }

        $this->success(1, '操作成功');

    }

    /**
     * 执行sql文件
     * @param  [type] $file [文件名]
     * @return [type]       [description]
     */
    private function dosqlfile($file)
    {
        $_sql = file_get_contents($file);
        $_arr = explode(';', $_sql);
        $num = 0;
        unset($_arr[count($_arr) - 1]);
        dump($_arr);exit;
        foreach ($_arr as $_value) {
            $res = Db::query($_value . ';');
        }
        return true;
    }
    /**
     * 模型字段
     */
    public function field(Request $request)
    {
        if ($request->isPost()) {
            $moduleid = $request->param('moduleid');
            if (empty($moduleid)) {
                $this->error(-1, '非法请求');
            }
            $page = intval($request->param('page'));
            $limit = $request->param('limit') ? intval($request->param('limit')) : $this->pageSize;
            $key = $request->param('key') ? $request->param('key') : '';
            $where = [
                ['moduleid', '=', $moduleid],
            ];
            if ($key) {
                array_push($where, ['title', 'like', '%' . htmlspecialchars($key) . '%']);
            }
            $lists = FieldModel::findPage($where, [], $page, $limit);
            $data = ['code' => '0', 'msg' => 'ok', 'count' => !empty($lists['total']) ? $lists['total'] : 0, 'data' => !empty($lists['data']) ? $lists['data'] : []];
            return json($data);
        } else {
            // dump(pathinfo($_SERVER['REQUEST_URI'])['dirname']);
            $moduleid = $request->param('moduleid');
            if (empty($moduleid)) {
                $this->error(-1, '非法请求');
            }
            return view('', [
                'moduleid' => $moduleid,
            ]);
        }
    }

    public function fieldform(Request $request)
    {
        if (input('isajax')) {
            View::assign(input('get.'));
            View::assign(input('post.'));
            $name = ModuleModel::where(array('id' => input('moduleid')))->value('name');
            if (input('name')) {
                return view('fieldType');
            } else {
                return view('fieldAddType');
            }
        } else {
            $id = $request->param('id');
            $moduleid = $request->param('moduleid');
            $info = [];
            if (!empty($id)) {
                $info = FieldModel::findSingle(['id' => $id]);
                $info['setup'] = string2array($info['setup']);
            } else {
                if (empty($moduleid)) {
                    $this->error(-1, '非法请求');
                }
            }
            $field_pattern = [
                ['name' => 'defaul', 'title' => '默认'],
                ['name' => 'email', 'title' => '电子邮件'],
                ['name' => 'url', 'title' => '网址'],
                ['name' => 'date', 'title' => '日期'],
                ['name' => 'number', 'title' => '有效的数值'],
                ['name' => 'digits', 'title' => '数字'],
                ['name' => 'creditcard', 'title' => '信用卡号码'],
                ['name' => 'equalTo', 'title' => '再次输入相同的值'],
                ['name' => 'ip4', 'title' => 'IP'],
                ['name' => 'mobile', 'title' => '手机号码'],
                ['name' => 'zipcode', 'title' => '邮编'],
                ['name' => 'qq', 'title' => 'QQ'],
                ['name' => 'idcard', 'title' => '身份证号'],
                ['name' => 'chinese', 'title' => '中文字符'],
                ['name' => 'cn_username', 'title' => '中文英文数字和下划线'],
                ['name' => 'tel', 'title' => '电话号码'],
                ['name' => 'english', 'title' => '英文'],
                ['name' => 'en_num', 'title' => '英文数字和下划线'],
            ];

            return view('', [
                'info' => $info,
                'moduleid' => $moduleid,
                'pattern' => $field_pattern,
            ]);
        }

    }

    public function fieldsave(Request $request)
    {
        $param = $request->param();
        $id = $param['id'];
        unset($param['id']);
        $where = [];
        if (!empty($id)) {
            // 修改
            $where = ['id' => $id];
            if($param['setup']) {
                $param['setup'] = array2string($param['setup']);
            }else{
                $param['setup'] ="";
            }
            if($param['pattern']==''||$param['pattern'] == 'defaul'){
                $param['pattern'] = 'defaul';
            }
            if(empty($param['class'])){
                $param['class'] = $param['field'];
            }
            $param['status'] =1;
            $res = FieldModel::saveData($param, $where);
            if (is_string($res)) {
                $this->error(-1, $res);
            }
            $this->success(1, '操作成功');
        }else{
            // 添加
            $fieldName=$param['field'];
            $name = Db::name('module')->where(array('id'=>$param['moduleid']))->value('name');
            $Fields=Db::name($name)->getFields();
            $ishave = 0;
            foreach ($Fields as $key =>$r){
                if($key==$fieldName){
                    $ishave=1;
                }
            }
            if($ishave) {
                $this->error(-1, '字段名已存在！');
            }
            
            // dump($param);exit;
            $addfieldsql =$this->get_tablesql($param,'add');
            if($param['setup']) {
                $param['setup'] = array2string($param['setup']);
            }else{
                $param['setup'] ="";
            }
            
            $param['status'] =1;
            if($param['pattern']==''||$param['pattern'] == 'defaul'){
                $param['pattern'] = 'defaul';
            }
            if(empty($param['class'])){
                $param['class'] = $param['field'];
            }
           
            $res = FieldModel::saveData($param, $where);
            if (is_string($res)) {
                $this->error(-1, $res);
            } else {
                if(is_array($addfieldsql)){
                    foreach($addfieldsql as $sql){
                        Db::execute($sql);
                    }
                }else{
                    Db::execute($addfieldsql);
                }
                $this->success(1, '操作成功');
            } 
        }
        
        

        
    }

    public function fielddel(Request $request)
    {
        $id = $request->param('id');
        $info = FieldModel::findSingle(['id' => $id]);
        $field = $info['field'];
        $moduleid = $info['moduleid'];
        $name = Db::name('module')->where(array('id'=>$moduleid))->value('name');
        $prefix = env('database.prefix');
        $tablename=$prefix.$name;
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }
        $res = FieldModel::del(['id' => $id]);
        if (is_string($res)) {
            $this->error(-1, $res);
        }
        $resdrop = Db::execute("ALTER TABLE `$tablename` DROP `$field`");
        // dump($resdrop);
        if (is_string($resdrop)) {
            $this->error(-1, $resdrop);
        }
        $this->success(1, '操作成功');
    }

    public function fieldsort(Request $request)
    {
        $param = $request->param();
        $id = $param['id'];
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }
		unset($param['id']);
		$where = ['id' => $id];
		$res = FieldModel::saveData($param, $where);
		if (is_string($res)) $this->error(-1, $res);
		$this->success(1, '操作成功');
    }

    public function fieldrequired(Request $request)
    {
        $param = $request->param();
        $id = $param['id'];
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }
        unset($param['id']);
        $issystem = FieldModel::where(array('id'=>$id))->value('issystem');
        if($issystem == 1){
            $this->error(-1, '系统字段不能修改！');
        }
		$where = ['id' => $id];
		$res = FieldModel::saveData($param, $where);
		if (is_string($res)) $this->error(-1, $res);
		$this->success(1, '操作成功');
    }

    public function fieldstate(Request $request)
    {
        $id = $request->param('id');
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }

        $res = FieldModel::changeState(['id' => $id]);
        if (is_string($res)) {
            $this->error(-1, $res);
        }

        $this->success(1, '操作成功');

    }

    protected function get_tablesql($info,$do){
        $fieldtype = $info['type'];
        if($info['setup']['fieldtype']){
            $fieldtype=$info['setup']['fieldtype'];
        }
        $moduleid = $info['moduleid'];
        $default=   $info['setup']['default'];
        $field = $info['field'];
        $prefix = env('database.prefix');
        $name = Db::name('module')->where(array('id'=>$moduleid))->value('name');
        $tablename=$prefix.$name;
        $maxlength = intval($info['maxlength'])??0;
        $minlength = intval($info['minlength'])??0;
        $numbertype = $info['setup']['numbertype']??'';
        $oldfield = $info['oldfield']??'';
        if($do=='add'){
            $do = ' ADD ';
        }else{
            $do =  " CHANGE `".$oldfield."` ";
        }
        switch($fieldtype) {
            case 'varchar':
                if(!$maxlength){$maxlength = 255;}
                $maxlength = min($maxlength, 255);
                $sql = "ALTER TABLE `$tablename` $do `$field` VARCHAR( $maxlength ) NOT NULL DEFAULT '$default'";
                break;

            case 'title':
                $thumb = $info['setup']['thumb'];
                $style = $info['setup']['style'];
                if(!$maxlength){$maxlength = 255;}
                $maxlength = min($maxlength, 255);
                $sql[] = "ALTER TABLE `$tablename` $do `$field` VARCHAR( $maxlength ) NOT NULL DEFAULT '$default'";


                if(!$this->_iset_field($name,'thumb')){
                    if($thumb==1) {
                        $sql[] = "ALTER TABLE `$tablename` ADD `thumb` VARCHAR( 100 ) NOT NULL DEFAULT ''";
                    }
                }else{
                    if($thumb==0) {
                        $sql[] = "ALTER TABLE `$tablename` drop column `thumb`";
                    }
                }

                if(!$this->_iset_field($name,'title_style')){
                    if($style==1) {
                        $sql[] = "ALTER TABLE `$tablename` ADD `title_style` VARCHAR( 100 ) NOT NULL DEFAULT ''";
                    }
                }else{
                    if($style==0) {
                        $sql[] = "ALTER TABLE `$tablename` drop column `title_style`";
                    }
                }
                break;
            case 'catid':
                $sql = "ALTER TABLE `$tablename` $do `$field` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0'";
                break;

            case 'number':
                $decimaldigits = $info['setup']['decimaldigits'];
                $default = $decimaldigits == 0 ? intval($default) : floatval($default);
                $sql = "ALTER TABLE `$tablename` $do `$field` ".($decimaldigits == 0 ? 'INT' : 'decimal( 10,'.$decimaldigits.' )')." ".($numbertype ==1 ? 'UNSIGNED' : '')."  NOT NULL DEFAULT '$default'";
                break;

            case 'tinyint':
                if(!$maxlength) $maxlength = 3;
                $maxlength = min($maxlength,3);
                $default = intval($default);
                $sql = "ALTER TABLE `$tablename` $do `$field` TINYINT( $maxlength ) ".($numbertype ==1 ? 'UNSIGNED' : '')." NOT NULL DEFAULT '$default'";
                break;


            case 'smallint':
                $default = intval($default);
                $sql = "ALTER TABLE `$tablename` $do `$field` SMALLINT ".($numbertype ==1 ? 'UNSIGNED' : '')." NOT NULL DEFAULT '$default'";
                break;

            case 'int':
                $default = intval($default);
                $sql = "ALTER TABLE `$tablename` $do `$field` INT ".($numbertype ==1 ? 'UNSIGNED' : '')." NOT NULL DEFAULT '$default'";
                break;

            case 'mediumint':
                $default = intval($default);
                $sql = "ALTER TABLE `$tablename` $do `$field` INT ".($numbertype ==1 ? 'UNSIGNED' : '')." NOT NULL DEFAULT '$default'";
                break;

            case 'mediumtext':
                $sql = "ALTER TABLE `$tablename` $do `$field` MEDIUMTEXT NOT NULL";
                break;

            case 'text':
                $sql = "ALTER TABLE `$tablename` $do `$field` TEXT NOT NULL";
                break;

            case 'posid':
                $sql = "ALTER TABLE `$tablename` $do `$field` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0'";
                break;

            case 'classify':
            $sql = "ALTER TABLE `$tablename` $do `$field` VARCHAR(100) NOT NULL DEFAULT '0'";
            break;

            case 'datetime':
                $sql = "ALTER TABLE `$tablename` $do `$field` INT(11) UNSIGNED NOT NULL DEFAULT '0'";
                break;

            case 'editor':
                $sql = "ALTER TABLE `$tablename` $do `$field` TEXT NOT NULL";
                break;

            case 'image':
                $sql = "ALTER TABLE `$tablename` $do `$field` VARCHAR( 80 ) NOT NULL DEFAULT ''";
                break;

            case 'images':
                $sql = "ALTER TABLE `$tablename` $do `$field` MEDIUMTEXT NOT NULL";
                break;

            case 'file':
                $sql = "ALTER TABLE `$tablename` $do `$field` VARCHAR( 80 ) NOT NULL DEFAULT ''";
                break;

            case 'files':
                $sql = "ALTER TABLE `$tablename` $do `$field` MEDIUMTEXT NOT NULL";
                break;
            case 'template':
                $sql = "ALTER TABLE `$tablename` $do `$field` VARCHAR( 80 ) NOT NULL DEFAULT ''";
                break;
            case 'addbox':
                $sql = "ALTER TABLE `$tablename` $do `$field` TEXT NOT NULL";
                break;
            case 'multicolumn':
                $sql = "ALTER TABLE `$tablename` $do `$field` VARCHAR( 255 ) NOT NULL DEFAULT ''";
                break;
            case 'linkage':
                $comment = $info['setup']['comment']??'';
                $sql = "ALTER TABLE `$tablename` $do `$field` VARCHAR( 80 ) NOT NULL DEFAULT '' COMMENT '$comment'";
                break;
            case 'video':
                $sql = "ALTER TABLE `$tablename` $do `$field` TEXT NOT NULL";
                break;
        }
        return $sql;
    }

    protected function _iset_field($table,$field){
        $fields=Db::name($table)->getTableFields();
        return array_search($field,$fields);
    }

}
