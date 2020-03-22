<?php
/*
 * @Descripttion: 栏目管理
 * @version: 1.0.0
 * @Author: wzs
 * @Date: 2020-03-17 22:27:46
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-22 21:19:26
 */
declare (strict_types = 1);

namespace app\admin\controller\article;

use app\common\controller\AdminBase;
use app\common\core\interfaces\InterfaceAdminController;
use app\common\model\Category as CategoryModel;
use app\Request;
use think\App;
use think\facade\Db;

class Category extends AdminBase implements InterfaceAdminController
{
    protected $dao, $categorys , $module;
    public function __construct()
    {
        parent::__construct();
        $this->categorys =  $this->categorys();
    }

    // 列表
    public function index(Request $request)
    {
        if ($request->isPost()) {
            $p_id = $request->param('p_id', 0);
            if (cache('cate_au2t')) {
                $lists = cache('cate_au2t');
            } else {
                $res = $this->categorys;
                $lists = empty($res) ? [] : auth2tree($this->categorys);
                cache('cate_au2t', $lists);
            }
            $data = ['code' => '0', 'msg' => 'ok', 'data' => $lists];
            return json($data);
        } else {
            return view('', []);
        }
    }
    // 添加修改页面
    public function form(Request $request)
    {
        $id = $request->param('id');
        $p_id = $request->param('p_id');
        $modulelist = Db::name('module')->select()->toArray();
        if (cache('cate_a2t')) {
            $categorys = cache('cate_a2t');
        } else {
            $categorys = CategoryModel::findAll([], ['sort' => 'asc']);
            $categorys = array2tree($categorys);
            cache('cate_a2t', $categorys);
        }
        $info = [];
        if (!empty($id)) {
            $info = CategoryModel::findSingle(['id' => $id]);
        }

        return view('', [
            'info' => $info,
            'p_id' => $p_id,
            'modulelist' => $modulelist,
            'categorys' => $categorys,
        ]);

    }
    // 执行添加修改
    public function save(Request $request)
    {
        $param = $request->param();
        $id = $param['id'];
        $where = [];
        $param['module'] = Db::name('module')->where(array('id'=>$param['moduleid']))->value('name');
        if (empty($id)) {
            // 添加
        } else {
            // 编辑
            $where = ['id' => $id];
            $param['arrparentid'] = $this->get_arrparentid($param['id']);
            $res = CategoryModel::saveData($param, $where);
            if (is_string($res)) {
                $this->error(-1, $res);
            }
            $this->repair();
            cache('cate_au2t', null);
            cache('cate_a2t', null);
            dump($param);
            exit;
            $this->success(1, '操作成功');
        }
        
        // dump($param);exit;

    }
    // 删除
    public function del(Request $request)
    {
        $id = $request->param('id');
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }

        $res = CategoryModel::del(['id' => $id]);
        if (is_string($res)) {
            $this->error(-1, $res);
        }

        $this->success(1, '操作成功');
    }
    // 排序
    public function sort(Request $request)
    {
        $param = $request->param();
        $id = $param['id'];
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }
        unset($param['id']);
        $where = ['id' => $id];
        $res = CategoryModel::saveData($param, $where);
        cache('cate_au2t', null);
        if (is_string($res)) {
            $this->error(-1, $res);
        }

        $this->success(1, '操作成功');
    }
    // 改状态
    public function state(Request $request)
    {
        $id = $request->param('id');
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }

        $res = CategoryModel::changeState(['id' => $id]);
        cache('cate_au2t', null);
        if (is_string($res)) {
            $this->error(-1, $res);
        }

        $this->success(1, '操作成功');
    }

    /**
     * 修复栏目关系
     */
    public function repair()
    {
        @set_time_limit(500);
        $this->categorys = $categorys = array();
        $categorys =  CategoryModel::where("p_id=0")->order('sort ASC,id ASC')->select()->toArray();
        $this->set_categorys($categorys);
        if(is_array($this->categorys)) {
            foreach($this->categorys as $id => $cat) {
                if($id == 0 || $cat['type']==1) continue;
                $this->categorys[$id]['arrparentid'] = $arrparentid = $this->get_arrparentid($id);
                $this->categorys[$id]['arrchildid'] = $arrchildid = $this->get_arrchildid($id);
                $this->categorys[$id]['parentdir'] = $parentdir = $this->get_parentdir($id);
                CategoryModel::update(array('parentdir'=>$parentdir,'arrparentid'=>$arrparentid,'arrchildid'=>$arrchildid,'id'=>$id));
            }
        }
    }

    public function set_categorys($categorys = array())
    {
        if (is_array($categorys) && !empty($categorys)) {
            foreach ($categorys as $id => $c) {
                $this->categorys[$c['id']] = $c;
                $r = CategoryModel::where("p_id",$c['id'])->Order('sort ASC,id ASC')->select()->toArray();
                $this->set_categorys($r);
            }
        }
        return true;
    }
    /**
     * 获取所有父级id
     * @param  [int] $id          [当前id]
     * @param  string $arrparentid [description]
     * @return [type]              [description]
     */
    public function get_arrparentid($id, $arrparentid = '')
    {
        // dump($this->categorys[$id]);
        if (!is_array($this->categorys) || !isset($this->categorys[$id])) {
            return false;
        }

        $p_id = $this->categorys[$id]['p_id'];
        $arrparentid = $arrparentid ? $p_id . ',' . $arrparentid : $p_id;
        if ($p_id) {
            $arrparentid = $this->get_arrparentid($p_id, $arrparentid);
        } else {
            $this->categorys[$id]['arrparentid'] = $arrparentid;
        }
        return $arrparentid;
    }
    /**
     * 获取所有子级id
     * @param  [int] $id [description]
     * @return [type]     [description]
     */
    public function get_arrchildid($id)
    {
        $arrchildid = $id;
        if (is_array($this->categorys)) {
            foreach ($this->categorys as $catid => $cat) {
                if ($cat['p_id'] && $id != $catid) {
                    $arrparentids = explode(',', $cat['arrparentid']);
                    if (in_array($id, $arrparentids)) {
                        $arrchildid .= ',' . $catid;
                    }
                }
            }
        }
        return $arrchildid;
    }
    /**
     * 获取父级id目录
     * @param  [type] $id [当前id]
     */
    public function get_parentdir($id)
    {
        if ($this->categorys[$id]['p_id'] == 0) {
            return '';
        }
        $arrparentid = $this->categorys[$id]['arrparentid'];
        unset($r);
        if ($arrparentid) {
            $arrparentid = explode(',', $arrparentid);
            $arrcatdir = array();
            foreach ($arrparentid as $pid) {
                if ($pid == 0) {
                    continue;
                }

                $arrcatdir[] = $this->categorys[$pid]['catdir'];
            }
            return implode('/', $arrcatdir) . '/';
        }
    }

    public function categorys(){
        $category = CategoryModel::alias('c')->leftJoin('module m', 'c.moduleid = m.id')->field('c.*,m.title as modulename')->order('p_id asc,sort asc')->select()->toArray();
        foreach ($category as $k => $val){
            $cate[$val['id']] = $val;
        }
        if(!$category){
            $cate = [];
        }
        return $cate;
    }
}
