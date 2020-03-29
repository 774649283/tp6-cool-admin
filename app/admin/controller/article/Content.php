<?php
/*
 * @Descripttion: 内容管理
 * @version: 1.0.0
 * @Author: wzs
 * @Date: 2020-03-17 22:28:34
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-29 22:51:33
 */
declare (strict_types = 1);

namespace app\admin\controller\article;

use app\common\controller\AdminBase;
use app\common\core\interfaces\InterfaceAdminController;
use app\Request;
use think\App;
use think\facade\Db;
use think\facade\View;

class Content extends AdminBase implements InterfaceAdminController
{
    protected $id, $catid, $module, $moduleName, $moduleId;
    public function __construct(Request $request)
    {
        $cache_path = app()->getRootPath() . 'runtime';
        if (delete_dir_file($cache_path) || delete_dir_file($cache_path)) {

        }
        parent::__construct();
        $this->catid = $request->param('catid');
        $this->id = $request->param('id');
        $module = Db::name('category')->where('id', $this->catid)->field('module,moduleid')->find();
        $this->moduleName = $module['module'];
        // dump($this->catid);exit;
        $this->moduleId = $module['moduleid'];
        $this->module = Db::name($this->moduleName);
        View::assign('catid', $this->catid);
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
            $order = ['create_time' => 'desc'];
            $res = $this->module->where($where)->order($order)->paginate(array('list_rows' => $limit, 'page' => $page));
            $lists = empty($res) ? [] : $res->toArray();
            foreach ($lists['data'] as $k => $v) {
                $lists['data'][$k]['create_time'] = date('Y-m-d', $v['create_time']);
            }
            $data = ['code' => '0', 'msg' => 'ok', 'count' => !empty($lists['total']) ? $lists['total'] : 0, 'data' => !empty($lists['data']) ? $lists['data'] : []];
            return json($data);
        } else {
            return view();
        }
    }

    public function form(Request $request)
    {
        if ($this->moduleName == 'page') {
            $info = $this->module->where('id', $this->catid)->find();
            View::assign('info', json_encode($info));
            return view('page');
        } else {
            $info = $this->module->where('id', $this->id)->find();
            View::assign('info', json_encode($info));
            return view();
        }

    }

    public function save(Request $request)
    {
        // TODO: Implement save() method.
    }

    public function del(Request $request)
    {
        // TODO: Implement del() method.
    }

    public function state(Request $request)
    {
        $id = $request->param('id');
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }
        $info = $this->module->find($id);
        $res = $this->module->update(['status' => $info['status'] == 1 ? 0 : 1], ['id' => $id]);
        if ($res) {
            $this->success(1, '操作成功');
        } else {
            $this->error(-1, $res);
        }

    }

    public function sort(Request $request)
    {
        // TODO: Implement del() method.
    }

    public function a()
    {
        return 1;
    }

}
