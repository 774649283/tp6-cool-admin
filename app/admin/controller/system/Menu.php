<?php
/*
 * @Descripttion: 菜单
 * @version: 1.0.0
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-13 22:38:40
 */
declare (strict_types=1);

namespace app\admin\controller\system;

use app\common\controller\AdminBase;
use app\common\core\interfaces\InterfaceAdminController;
use app\Request;
use app\common\model\Menu as MenuModel;

class Menu extends AdminBase implements InterfaceAdminController
{
	public function __construct()
	{
		parent::__construct();
	}

	public function index(Request $request)
	{
		if($request->isPost()){
			$p_id = $request->param('p_id', 0);
			$lists = MenuModel::findAll([],['sort' => 'asc']);
			$data = ['code' => '0','msg'=>'ok','data'=>!empty($lists) ? auth2tree($lists) : []];
        	return json($data);
		}else{
			return view('', []);
		}
	}

	public function form(Request $request)
	{
		$id = $request->param('id');
		$p_id = $request->param('p_id');
		$info = [];
		if (!empty($id)) $info = MenuModel::findSingle(['id' => $id]);
		return view('', [
			'info' => $info,
			'p_id' => $p_id
		]);
	}

	public function save(Request $request)
	{
		$param = $request->param();
		$id = $param['id'];
		unset($param['id']);
		$where = [];
		if (!empty($id)) $where = ['id' => $id];
		$res = MenuModel::saveData($param, $where);
		if (is_string($res)) $this->error(-1, $res);
		$this->success(1, '操作成功');
	}

	public function del(Request $request)
	{
		$id = $request->param('id');
		if (empty($id)) $this->error(-1, '非法请求');
		$res = MenuModel::getAllSon($id);
		if (empty($res)) {
			$res = MenuModel::del(['id' => $id]);
		} else {
			array_push($res, $id);
			$res = MenuModel::destroy($res);
		}
		if (is_string($res)) $this->error(-1, $res);
		$this->success(1, '操作成功');
	}

	public function sort(Request $request)
	{
		
	}

	public function state(Request $request)
	{
		$id = $request->param('id');
		if (empty($id)) $this->error(-1, '非法请求');
		$res = MenuModel::changeState(['id' => $id]);
		if (is_string($res)) $this->error(-1, $res);
		$this->success(1, '操作成功');
	}

}
