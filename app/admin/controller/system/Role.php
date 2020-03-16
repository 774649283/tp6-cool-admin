<?php
/*
 * @Descripttion: 角色
 * @version: 1.0.0
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-15 13:14:50
 */
declare (strict_types = 1);

namespace app\admin\controller\system;

use app\common\controller\AdminBase;
use app\common\core\interfaces\InterfaceAdminController;
use app\common\model\Menu;
use app\common\model\Role as RoleModel;
use app\Request;

class Role extends AdminBase implements InterfaceAdminController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(Request $request)
    {
        if ($request->isPost()) {
            $page = intval($request->param('page'));
            $limit = $request->param('limit') ? intval($request->param('limit')) : $this->pageSize;
            $key = $request->param('key') ? $request->param('key') : '';
            $where = [];
            if($key){
                array_push($where, ['name', 'like', '%' . htmlspecialchars($key) . '%']);
            }
			$lists = RoleModel::findPage($where, [], $page, $limit);
			$data = ['code' => '0', 'msg' => 'ok', 'count' => !empty($lists['total']) ? $lists['total'] : 0, 'data' => !empty($lists['data']) ? $lists['data'] : []];
			return json($data);
        } else {
            return view();
        }
    }

    public function form(Request $request)
    {
        $id = $request->param('id');
        $info = [];
        $auth = [];
        if (!empty($id)) {
            $info = RoleModel::findSingle(['id' => $id]);
            $auth = explode(',', $info['role']);
        }
        $menu_lists = Menu::findAll();
        return view('', [
            'info' => $info,
            'auth' => $auth,
            'menu_lists' => array2tree($menu_lists),
        ]);
    }

    public function save(Request $request)
    {
        $param = $request->param();
        $id = $param['id'];
        unset($param['id']);
        $where = [];
        if (!empty($id)) {
            $where = ['id' => $id];
        }

        $param['role'] = implode(',', $param['role']);
        $res = RoleModel::saveData($param, $where);
        if (is_string($res)) {
            $this->error(-1, $res);
        }

        $this->success(1, '操作成功');
    }

    public function del(Request $request)
    {
        $id = $request->param('id');
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }

        $res = RoleModel::del(['id' => $id]);
        if (is_string($res)) {
            $this->error(-1, $res);
        }

        $this->success(1, '操作成功');
    }

    public function sort(Request $request)
    {

    }

    public function state(Request $request)
    {
		$id = $request->param('id');
		if (empty($id)) $this->error(-1, '非法请求');
		$res = RoleModel::changeState(['id' => $id]);
		if (is_string($res)) $this->error(-1, $res);
		$this->success(1, '操作成功');
    }
}
