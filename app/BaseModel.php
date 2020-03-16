<?php
/*
 * @Descripttion: 
 * @version: 
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-16 15:56:23
 */
declare (strict_types=1);

namespace app;

use app\common\core\interfaces\InterfaceModel;
use think\Model;
use app\ExceptionHandle;

abstract class BaseModel extends Model implements InterfaceModel
{
	/**
	 * 查找单条数据
	 * @param array $where
	 * @return array|string
	 */
	public static function findSingle(array $where = [])
	{
		try {
			$res = self::where($where)->cache(true)->find();
			return empty($res) ? [] : $res->toArray();
		} catch (\Exception $e) {
			return $e->getMessage();
		}
	}

	/**
	 * 查找全部数据
	 * @param array $where
	 * @param array $order
	 * @return array|string
	 */
	public static function findAll(array $where = [], array $order = ['create_time' => 'desc'], string $group = '')
	{
		try {
			$res = self::where($where)->order($order)->group($group)->cache(true)->fetchSql(false)->select();
			// echo( self::where($where)->order($order)->fetchSql(true)->select());
			return empty($res) ? [] : $res->toArray();
		} catch (\Exception $e) {
			return $e->getMessage();
		}
	}

	/**
	 * 查找部分数据
	 * @param array $where
	 * @param array $order
	 * @param int $offset
	 * @param int $length
	 * @return array|string
	 */
	public static function findLimit(array $where = [], array $order = ['create_time' => 'desc'], int $offset = 0, int $length = 10)
	{
		try {
			$res = self::where($where)->order($order)->cache(true)->limit($offset, $length)->select();
			return empty($res) ? [] : $res->toArray();
		} catch (\Exception $e) {
			return $e->getMessage();
		}
	}

	/**
	 * 新增和更新
	 * @param array $data
	 * @param array $where
	 * @return array|string
	 */
	public static function saveData(array $data = [], array $where = [])
	{
		// dump($data);exit;
		try {
			if (empty($where))
				return self::create($data)->cache(true)->toArray();
			else
				return self::update($data, $where)->cache(true)->toArray();
		} catch (\Exception $e) {
			return $e->getMessage();
		}

	}

	/**
	 * 删除
	 * @param array $where
	 * @return bool|string
	 */
	public static function del(array $where = [])
	{
		try {
			return self::where($where)->cache(true)->delete();
		} catch (\Exception $e) {
			return $e->getMessage();
		}
	}
	/**	 
	 * 修改状态
	 * @param array $where
	 * @return array|string
	*/
	public static function changeState(array $where = [])
	{
		try {
			$info = self::findSingle($where);
			return self::update(['status'=>$info['status'] == 1 ? 0 : 1], $where)->cache(true)->toArray();
		} catch (\Exception $e) {
			return $e->getMessage();
		}
	}
	/**
	 * 查找部分数据
	 * @param array $where
	 * @param array $order
	 * @param int $offset
	 * @param int $length
	 * @return array|string
	 */
	public static function findPage(array $where = [], array $order = ['create_time' => 'desc'], int $page = 0, int $length = 10)
	{
		try {
			$res = self::where($where)->order($order)->cache(true)->paginate(array('list_rows'=>$length,'page'=>$page));
			// dump($res->toArray());exit;
			return empty($res) ? [] : $res->toArray();
		} catch (\Exception $e) {
			return $e->getMessage();
		}
	}

}