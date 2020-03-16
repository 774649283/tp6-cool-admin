<?php
/*
 * @Descripttion: 
 * @version: 
 * @Author: wzs
 * @Date: 2020-03-14 12:11:27
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-14 12:17:07
 */
// +----------------------------------------------------------------------
// | 应用设置
// +----------------------------------------------------------------------

return [
    // 应用地址
    'app_host'         => env('app.host', ''),
    'app_express'    =>    true,
    // 应用的命名空间
    'app_namespace'    => '',
    // 是否启用路由
    'with_route'       => true,
    // 是否启用事件
    'with_event'       => true,
    // 默认应用
    'default_app'      => 'index',
    // 默认时区
    'default_timezone' => 'Asia/Shanghai',

    // 'deny_app_list'    => ['common'],
    
    // 应用映射（自动多应用模式有效）
    'app_map'          => [
        'index' => 'index',
        'admin'=>'admin'
    ],
    // 域名绑定（自动多应用模式有效）
    'domain_bind'      => [],
    // 禁止URL访问的应用列表（自动多应用模式有效）
    'deny_app_list'    => [],

    // 异常页面的模板文件
    'exception_tmpl'   => app()->getThinkPath() . 'tpl/think_exception.tpl',
    
    // 错误显示信息,非调试模式有效
    'error_message'    => '您访问的内容不存在',
    // 显示错误信息
    'show_error_msg'   => true,
    // 全局加密字符串
	'salt'             => '5qFoSMhlO0ufd9cgvApJIaUGrEX7wVst'
];
