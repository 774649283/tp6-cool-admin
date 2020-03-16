<?php
/*
 * @Descripttion: 后台抽象类
 * @version: 1.0.0
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-13 21:57:08
 */
declare (strict_types = 1);

namespace app\common\core\interfaces;

use app\Request;

interface InterfaceAdminController
{
	public function index(Request $request);

	public function form(Request $request);

	public function save(Request $request);

	public function del(Request $request);

	public function sort(Request $request);

	public function state(Request $request);
}