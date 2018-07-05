<?php

namespace App\Http\Controllers;

use App\Base\BaseController;
use App\helpers\CommonHelper;
use App\User;

class UserController extends BaseController
{
    /**
     * 用户列表
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|string
     */
    public function list()
    {
        $list = User::select(['id', 'name', 'email', 'role', 'status', 'time_created'])
            ->orderBy('time_created', 'DESC')
            ->paginate(10);

        if (CommonHelper::is_api()) {
            return CommonHelper::json_success('', $list);
        }

        return view('user.list', [
            'list' => $list
        ]);
    }

    /**
     * 用户禁言
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function forbidden($id)
    {
        $user = User::find($id);
        if (empty($user)) {
            return CommonHelper::output('error', '想法很好哦！');
        }

        $user->status = User::STATUS_N;

        if ($user->save()) {
            return CommonHelper::output('success', '禁言成功');
        }

        return CommonHelper::output('error', '禁言失败，请稍候再试！');
    }

    /**
     * 解除禁言
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function allowed($id)
    {
        $user = User::find($id);
        if (empty($user)) {
            return CommonHelper::output('error', '想法很好哦！');
        }

        $user->status = User::STATUS_Y;

        if ($user->save()) {
            return CommonHelper::output('success', '解禁成功');
        }

        return CommonHelper::output('error', '解禁失败，请稍候再试！');
    }

    /**
     * 修改用户角色
     * @param int $id 用户id
     * @param string $role 用户角色
     * @return \Illuminate\Http\RedirectResponse
     */
    public function setRole($id, $role)
    {
        if (!in_array($role, array_keys(User::getRole()))) {
            return CommonHelper::output('error', '您设备的用户角色不存在');
        }

        $user = User::find($id);
        if (empty($user)) {
            return CommonHelper::output('error', '想法很好哦！');
        }

        $user->role = trim($role);
        if ($user->save()) {
            return CommonHelper::output('success', '修改角色成功');
        }

        return CommonHelper::output('error', '修改角色失败');
    }

    /**
     * 删除用户
     * @param int $id 用户id
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception
     */
    public function delete($id)
    {
        $user = User::find($id);
        if (empty($user)) {
            return CommonHelper::output('error', '想法很好哦！');
        }

        if ($user->delete()) {
            return CommonHelper::output('success', '删除用户成功');
        }

        return CommonHelper::output('error', '删除用户失败');
    }
}
