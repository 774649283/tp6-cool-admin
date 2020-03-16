<?php
/*
 * @Descripttion: 后台管理员中间件 判断权限及写入日志
 * @version: 1.0.0
 * @Author: wzs
 * @Date: 2020-03-14 12:50:36
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-16 16:01:44
 */
declare (strict_types = 1);

namespace app\middleware;

use app\common\controller\AdminBase;
use app\common\model\Log;
use app\common\model\Menu;
use app\common\model\Role;
use think\facade\Request;

class AdminAuth extends AdminBase
{
    protected $except = [
        'admin/login/login',
        'admin/login/captcha',
        'admin/system/clear',
    ];

    /**
     * @param $request
     * @param \Closure $next
     * @return mixed|\think\response\Redirect
     */
    public function handle($request, \Closure $next)
    {
        // $path = ltrim($request->root() . '/' . explode('.', $request->pathinfo())[0], '/');
        $path = substr(strtolower(pathinfo($_SERVER['REQUEST_URI'])['dirname'] . '/' . pathinfo($_SERVER['REQUEST_URI'])['filename']), 1);
        $admin = session('admin');
        if (!in_array($path, $this->except) && empty($admin)) {
            return redirect(config('app.host') . '/admin/login/login');
        }

        if (!empty($admin)) {
            $menu_id = Menu::findSingle(['name' => $path]);
            if ($admin['role_id'] != 0) {
                $role_lists = explode(',', Role::findSingle(['id' => $admin['role_id']])['role']);
            }

            if (!in_array($path, $this->except) && $admin['role_id'] != 0 && !in_array($menu_id['id'], $role_lists)) {
                $this->error(-3, '暂无权限');
            }

            if ($request->isPost()) {
                $param['username'] = $admin['username'];
                $param['aid'] = $admin['id'];
                $param['role_id'] = $admin['role_id'];
                $param['name'] = $menu_id['name'];
                $param['title'] = $menu_id['title'];
                $param['ip'] = Request::ip();
                $this->logSave($param, []);
            }

        }
        return $next($request);
    }
    /**
     * 写入日志
     */
    public function logSave($param, $where)
    {
        $res = Log::saveData($param, $where);
        if (is_string($res)) {
            return false;
        }
        return true;
    }
}
