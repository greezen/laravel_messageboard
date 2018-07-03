<?php

namespace App\Http\Controllers;

use App\Base\BaseController;
use App\Message;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends BaseController
{
    /**
     * 留言列表
     */
    public function list()
    {
        $list = User::select(['id', 'name', 'email', 'role', 'status', 'time_created'])
            ->orderBy('time_created', 'DESC')
            ->paginate(10);

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
        if (!User::isAdmin()) {
            return redirect()->back()->with('error', '您没有该操作权限');
        }

        $user = User::find($id);
        if (empty($user)) {
            return redirect()->back()->with('error', '想法很好哦！');
        }

        $user->status = User::STATUS_N;

        if ($user->save()) {
            return redirect()->back()->with('success', '禁言成功');
        }

        return redirect()->back()->with('error', '禁言失败，请稍候再试！');
    }

    /**
     * 解除禁言
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function allowed($id)
    {
        if (!User::isAdmin()) {
            return redirect()->back()->with('error', '您没有该操作权限');
        }

        $user = User::find($id);
        if (empty($user)) {
            return redirect()->back()->with('error', '想法很好哦！');
        }

        $user->status = User::STATUS_Y;

        if ($user->save()) {
            return redirect()->back()->with('success', '解禁成功');
        }

        return redirect()->back()->with('error', '解禁失败，请稍候再试！');
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
            return redirect()->back()->with('error', '您设备的用户角色不存在');
        }

        $user = User::find($id);
        if (empty($user)) {
            return redirect()->back()->with('error', '想法很好哦！');
        }

        $user->role = trim($role);
        if ($user->save()) {
            return redirect()->back()->with('success', '修改角色成功');
        }

        return redirect()->back()->with('error', '修改角色失败');
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
            return redirect()->back()->with('error', '想法很好哦！');
        }

        if ($user->delete()) {
            return redirect()->back()->with('success', '删除用户成功！');
        }

        return redirect()->back()->with('error', '删除用户失败！');
    }
}
