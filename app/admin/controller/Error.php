<?php
/*
 * @Descripttion: 
 * @version: 
 * @Author: wzs
 * @Date: 2020-03-26 23:24:03
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-26 23:26:36
 */
namespace app\admin\controller;

class Error 
{
    public function __call($method, $args)
    {
        return view('index/miss', []);
    }
}