<?php
/*
 * @Descripttion: 测试类 空类方便复制
 * @version: 1.0.0
 * @Author: wzs
 * @Date: 2020-03-16 15:28:25
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-16 15:31:46
 */
declare (strict_types = 1);
namespace app\admin\controller\system;

use app\common\controller\AdminBase;
use app\common\core\interfaces\InterfaceAdminController;
use app\Request;


class Test extends AdminBase implements InterfaceAdminController
{
    // 列表
    public function index(Request $request)
    {
        if ($request->isPost()) {
            
        } else {
            return view();
        }
    }
    // 添加修改页面
    public function form(Request $request)
    {
        
    }
    // 执行添加修改
    public function save(Request $request)
    {
       
    }
    // 删除
    public function del(Request $request)
    {
        
    }
    // 排序
    public function sort(Request $request)
    {

    }
    // 改状态
    public function state(Request $request)
    {
        
    }
}
