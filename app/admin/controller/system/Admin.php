<?php
/*
 * @Descripttion: 管理员
 * @version: 1.0.0
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-15 15:56:17
 */
declare (strict_types = 1);

namespace app\admin\controller\system;

use app\common\controller\AdminBase;
use app\common\core\interfaces\InterfaceAdminController;
use app\common\model\Admin as AdminModel;
use app\common\model\Role;
use app\Request;


class Admin extends AdminBase implements InterfaceAdminController
{
    // 列表
    public function index(Request $request)
    {
        if ($request->isPost()) {
            $page = intval($request->param('page'));
            $limit = $request->param('limit') ? intval($request->param('limit')) : $this->pageSize;
            $key = $request->param('key') ? $request->param('key') : '';
            $where = [
                ['a.role_id', '<>', 0]
			];
			if($key){
				array_push($where, ['a.username', 'like', '%' . htmlspecialchars($key) . '%']);
			}
            $res = AdminModel::alias('a')->leftJoin('role b', 'a.role_id=b.id')->where($where)->field('a.*,b.name')->paginate(array('list_rows'=>$limit,'page'=>$page));
            $lists = empty($res) ? [] : $res->toArray();
            $data = ['code' => '0', 'msg' => 'ok', 'count' => !empty($lists['total']) ? $lists['total'] : 0, 'data' => !empty($lists['data']) ? $lists['data'] : []];
            return json($data);
        } else {
            return view();
        }
    }
    // 添加修改页面
    public function form(Request $request)
    {
        $id = $request->param('id');
        $info = [];
        if (!empty($id)) {
            $info = AdminModel::findSingle(['id' => $id]);
        }

        $role_lists = Role::findAll();
        return view('', [
            'info' => $info,
            'role_lists' => $role_lists,
        ]);
    }
    // 执行添加修改
    public function save(Request $request)
    {
        $param = $request->param();
        $id = $param['id'];
        unset($param['id']);
        $where = [];
        if (!empty($id)) {
            $where = ['id' => $id];
            if (empty($param['username']) || empty($param['role_id'])) {
                $this->error(-1, '请将信息填写完整');
            }

            if (!empty($param['password'])) {
                $param['salt'] = get_random_str();
                $param['password'] = md5($param['password'] . $param['salt']);
            } else {
                unset($param['password']);
            }
        } else {
            if (empty($param['username']) || empty($param['password']) || empty($param['role_id'])) {
                $this->error(-1, '请将信息填写完整');
            }

            $param['salt'] = get_random_str();
            $param['password'] = md5($param['password'] . $param['salt']);
        }
        $res = AdminModel::saveData($param, $where);
        if (is_string($res)) {
            $this->error(-1, $res);
        }

        $this->success(1, '操作成功');
    }
    // 删除
    public function del(Request $request)
    {
        $id = $request->param('id');
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }

        $res = AdminModel::del(['id' => $id]);
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
        $id = $request->param('id');
        if (empty($id)) {
            $this->error(-1, '非法请求');
        }

        $res = AdminModel::changeState(['id' => $id]);
        if (is_string($res)) {
            $this->error(-1, $res);
        }

        $this->success(1, '操作成功');
    }
}
