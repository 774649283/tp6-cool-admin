<?php
/*
 * @Descripttion: 用户
 * @version: 1.0.0
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-13 17:55:41
 */
declare (strict_types=1);

namespace app\admin\controller\user;

use app\common\controller\AdminBase;
use app\common\core\interfaces\InterfaceAdminController;
use app\common\model\User as UserModel;
use app\common\model\Role;
use app\Request;

class User extends AdminBase implements InterfaceAdminController
{
	public function index(Request $request)
	{
		$where = [
			['a.role_id', '<>', 0]
		];
		$lists = UserModel::paginate($this->pageSize);
		return view('', [
			'lists' => $lists
		]);
	}

	public function form(Request $request)
	{
		$id = $request->param('id');
		$info = [];
		if (!empty($id)) $info = UserModel::findSingle(['id' => $id]);
		return view('', [
			'info'       => $info,
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
			if (empty($param['username']) || empty($param['status'])) $this->error(-1, '请将信息填写完整');
			if (!empty($param['password'])) {
				$param['salt'] = get_random_str();
				$param['password'] = md5($param['password'] . $param['salt']);
			} else {
				unset($param['password']);
			}
		} else {
			if (empty($param['username']) || empty($param['password']) || empty($param['status'])) $this->error(-1, '请将信息填写完整');
			$param['salt'] = get_random_str();
			$param['password'] = md5($param['password'] . $param['salt']);
		}
		$res = UserModel::saveData($param, $where);
		if (is_string($res)) $this->error(-1, $res);
		$this->success(1, '操作成功');
	}

	public function del(Request $request)
	{
		$id = $request->param('id');
		$res = UserModel::del(['id' => $id]);
		if (is_string($res)) $this->error(-1, $res);
		$this->success(1, '操作成功');
	}
}