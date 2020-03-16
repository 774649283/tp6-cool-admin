<?php
/*
 * @Descripttion: 管理员模型
 * @version: 1.0.1
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-13 20:36:52
 */
declare (strict_types = 1);

namespace app\common\model;

use app\BaseModel;

class Admin extends BaseModel
{
	public function role()
	{
		return $this->belongsTo(Role::class);
	}
}