<?php
/*
 * @Descripttion: 
 * @version: 
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-11 20:54:33
 */
// +----------------------------------------------------------------------
// | Captcha配置文件
// +----------------------------------------------------------------------

// return [
//     //验证码位数
//     'length'   => 5,
//     // 验证码字符集合
//     'codeSet'  => '2345678abcdefhijkmnpqrstuvwxyzABCDEFGHJKLMNPQRTUVWXY',
//     // 验证码过期时间
//     'expire'   => 1800,
//     // 是否使用中文验证码
//     'useZh'    => false,
//     // 是否使用算术验证码
//     'math'     => false,
//     // 是否使用背景图
//     'useImgBg' => false,
//     //验证码字符大小
//     'fontSize' => 25,
//     // 是否使用混淆曲线
//     'useCurve' => true,
//     //是否添加杂点
//     'useNoise' => true,
//     // 验证码字体 不设置则随机
//     'fontttf'  => '',
//     //背景颜色
//     'bg'       => [243, 251, 254],
//     // 验证码图片高度
//     'imageH'   => 0,
//     // 验证码图片宽度
//     'imageW'   => 0,

//     // 添加额外的验证码设置
//     // verify => [
//     //     'length'=>4,
//     //    ...
//     //],
// ];

/**
 * 验证码配置
 */
return [
//        'config_name'=>[
//            'fontttf'=>'1.ttf'
//        ],

        'codeSet'  => '12345678abcdefhijkmnpqrstuvwxyzABCDEFGHJKLMNPQRTUVWXY',         // 验证码字体大小(px)5.
        'fontSize' => 50,         // 是否画混淆曲线7.
        'useCurve' => true,         //是否画混淆曲线.
        'useNoise' => false,         //是否添加杂点.
//        'useImgBg' => true,         //是否添加背景图.
//        'imageH'   => 50,        // 验证码图片高度
//        'imageW'   => 200,         // 验证码图片宽度11.
        'math'=>true,       //使用算术验证码
        'length'   => 4,        //长度
        'reset'    => true, // 验证成功后是否重置        15.
        'expire'    =>60*5, //过期时间
];