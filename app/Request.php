<?php
/*
 * @Descripttion: 
 * @version: 
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-13 19:02:14
 */
namespace app;

// 应用请求对象类
class Request extends \think\Request
{
    
    public function __construct()
	{
		parent::__construct();
	}
    public function get($name = '', $default = null, $filter = ''){
        $data = parent::get($name,$default,$filter);
        if(is_array($data)){
            reset($data);
            $firstKey = key($data);
            if(substr_count($firstKey, '/')>0){ //去掉第一个数组
                array_shift($data);
            }
            return $data;
        }
        return $data;
    }

    public function post($name = '', $default = null, $filter = ''){
        $data = parent::post($name,$default,$filter);
        if(is_array($data)){
            reset($data);
            $firstKey = key($data);
            if(substr_count($firstKey, '/')>0){ //去掉第一个数组
                array_shift($data);
            }
            return $data;
        }
        return $data;
    }
}
