<?php
/*
 * @Descripttion: 系统
 * @version: 1.0.0
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-26 23:35:13
 */
declare (strict_types=1);

namespace app\admin\controller\system;

use app\common\controller\AdminBase;
use app\common\core\interfaces\InterfaceAdminController;
use app\Request;
use think\cache\driver\Redis;

class System extends AdminBase implements InterfaceAdminController
{
	public function clear()
	{
		$res = delete_dir_file(app('app')->getRuntimePath() . 'cache/') || delete_dir_file(app('app')->getRuntimePath() . 'temp/');
		if ($res)
			return json(['code' => 1, 'msg' => '清除缓存成功']);
		else
			return json(['code' => -1, 'msg' => '清除缓存失败']);
	}

	public function index(Request $request)
	{
		// TODO: Implement index() method.
	}

	public function form(Request $request)
	{
		return view('', []);
	}

	public function save(Request $request)
	{
		// TODO: Implement save() method.
	}

	public function del(Request $request)
	{
		// TODO: Implement del() method.
	}

	public function sort(Request $request)
	{
		
	}

	public function state(Request $request)
	{
		
	}

}