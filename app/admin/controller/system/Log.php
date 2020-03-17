<?php
/*
 * @Descripttion: 日志
 * @version: 1.0.0
 * @Author: wzs
 * @Date: 2020-03-16 15:27:28
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-16 22:00:05
 */
declare (strict_types = 1);
namespace app\admin\controller\system;

use app\common\controller\AdminBase;
use app\common\core\interfaces\InterfaceAdminController;
use app\common\model\Log as LogModel;
use app\Request;

class Log extends AdminBase implements InterfaceAdminController
{
    // 列表
    public function index(Request $request)
    {
        if ($request->isPost()) {
            $page = intval($request->param('page'));
            $limit = $request->param('limit') ? intval($request->param('limit')) : $this->pageSize;
            $key = $request->param('key') ? $request->param('key') : '';
            $where = [];
            $admin = session('admin');
            if ($admin['role_id'] != 0) {
                array_push($where, ['aid', '=', $admin['id']]);
            }
            if ($key) {
                array_push($where, ['name', 'like', '%' . htmlspecialchars($key) . '%']);
            }
            $lists = LogModel::findPage($where, ['create_time' => 'desc'], $page, $limit, 'log');
            $data = ['code' => '0', 'msg' => 'ok', 'count' => !empty($lists['total']) ? $lists['total'] : 0, 'data' => !empty($lists['data']) ? $lists['data'] : []];
            return json($data);
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
        $id = $request->param('id');
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }

        $res = LogModel::del(['id' => $id]);
        if (is_string($res)) {
            $this->error(-1, $res);
        }

        $this->success(1, '操作成功');
    }
    // 排序
    public function sort(Request $request)
    {

    }
    // 改状态
    public function state(Request $request)
    {

    }
    // 批量删除
    public function delall(Request $request)
    {
        $admin = session('admin');
        $where = [];
        if ($admin['role_id'] != 0) {
            array_push($where, ['aid', '=', $admin['id']]);
        } else {
            array_push($where, ['aid', '>=', 0]);
        }
        $res = LogModel::del($where);
        if (is_string($res)) {
            $this->error(-1, $res);
        }

        $this->success(1, '操作成功');
    }
}
