<?php
/*
 * @Descripttion: 
 * @version: 
 * @Author: wzs
 * @Date: 2020-03-29 17:57:29
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-29 22:49:29
 */
namespace app\common\taglib;

use think\template\TagLib;
use think\facade\Db;
use think\facade\View;
use think\facade\Cache;
use think\facade\Request;

class Cool extends TagLib
{
    protected $tags = array(
        'list_join' => array('attr' => 'db,joindb,order,limit,where,id,key,dbfield,joinfield', 'close' => 1),
        'list' => array('attr' => 'db,order,limit,where,id,key', 'close' => 1),
        'info' => array('attr' => 'db,where,id', 'close' => 1),
        'tongji' => array('attr' => 'module', 'close' => 0),
        'form'      => ['attr' => 'fields,info', 'close' => 0], 
        'close'      => ['attr' => 'time,format', 'close' => 0], 
    );
    public function tagInfo($attr, $content)
    {
        $db = $attr['db']; //要查询的数据表
        $where = $attr['where']; //查询条件
        $id = $attr['id'];
        $str = '<?php ';
        $str .= '$' . $id . ' =db("' . $db . '")->where("' . $where . '")->find();';
        $str .= '?>';
        $str .= $content;
        return $str;
    }
    public function tagList_join($attr, $content)
    {
        $db = $attr['db']; //要查询的数据表
        $order = $attr['order']; //排序
        $limit = $attr['limit']; //多少条数据
        $where = $attr['where']; //查询条件
        $joindb = $attr['joindb']; //查询条件
        $dbfield = $attr['dbfield']; //查询条件
        $joinfield = $attr['joinfield']; //查询条件
        $posid = $attr['posid']; //推荐位
        $id = $attr['id'];
        $key = $attr['key'] ? $attr['key'] : 'k';
        $str = '<?php ';
        $str .= '$result = db("' . $db . '")->alias("a")->join("' . config("database.prefix") . $joindb . ' c","a.' . $dbfield . ' = c.' . $joinfield . '","left")
            ->where("' . $where . '")
            ->field("a.*,c.catdir")
            ->limit(' . $limit . ')
            ->order("' . $order . '")->select();';

        // $str .= 'print_r($result);';

        $str .= 'foreach ($result as $' . $key . '=>$' . $id . '):';
        $str .= '?>';
        $str .= $content;
        $str .= '<?php endforeach ?>';
        return $str;
    }

    public function tagList($attr, $content)
    {
        $db = $attr['db']; //要查询的数据表
        $order = $attr['order']; //排序
        $limit = $attr['limit']; //多少条数据
        $where = $attr['where']; //查询条件
        $id = $attr['id'];
        $key = $attr['key'] ? $attr['key'] : 'k';
        $str = '<?php ';
        $str .= '$result = \think\facade\Db::name("' . $db . '")->where("' . $where . '")->limit(' . $limit . ')->order("' . $order . '")->fetchsql(false)->select();';
        $str .= 'foreach ($result as $' . $key . '=>$' . $id . '):';
        $str .= '?>';
        $str .= $content;
        $str .= '<?php endforeach ?>';
        return $str;
    }

    public function tagtongji($attr, $content)
    {
        $module = $attr['module']; //要查询的数据表
        $str = '<?php ';
        $str .= '$list ="<script type=\"text/javascript\">
        var _hmt = _hmt || [];
       (function() {
        var hm = document.createElement(\"script\");
          hm.src = \"__HOME__/../common/js/tongji.min.js\";
          var s = document.getElementsByTagName(\"script\")[0];
          s.parentNode.insertBefore(hm, s);
        })();
       </script>
       ";';
        $str .= 'echo $list;';
        $str .= '?>';
        $str .= $content;
        return $str;
    }

    public function tagForm($tag, $content)
    {
        $id = Request::param('id');
        $catid = Request::param('catid');
        $moduleInfo = Db::name('category')->where('id', $catid)->field('module,moduleid')->find();
        $moduleName = $moduleInfo['module'];
        $moduleId = $moduleInfo['moduleid'];
        $module = Db::name($moduleName);
        $fields = Db::name('field')->where('moduleid', $moduleId)->where('status', 1)->order('sort asc,id desc')->select()->toArray();

        // dump($tag['fields']);
        $str = '';
        foreach ($fields as $v) {
            // dump($v);
            $str .= View::fetch('fields/' . $v['type'], $v);
        }
        return $str;
        // $parse = '';
        // return $parse;
    }

    public function tagClose($tag)
    {
        // dump($tag);
        $format = empty($tag['format']) ? 'Y-m-d H:i:s' : $tag['format'];
        $time = $tag['time'];
        $parse = '<?php ';
        $parse .= 'echo date("' . $format . '",' . $time . ');';
        $parse .= ' ?>';
        return $parse;
    }
}
