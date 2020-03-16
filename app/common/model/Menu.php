<?php
/*
 * @Descripttion: 菜单模型
 * @version: 1.0.1
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-13 20:38:09
 */

declare (strict_types=1);

namespace app\common\model;

use app\BaseModel;

class Menu extends BaseModel
{
	public static function getAllSon($p_id, $hook = false)
	{
		$data = self::where('p_id', 'in', $p_id)->field('id')->select()->toArray();
		if ($hook == false) $id = [];
		static $id = [];
		if (empty($data)) return $id;
		foreach ($data as $v) {
			$id[] = $v['id'];
		}
		return self::getAllSon($id, true);
	}
}