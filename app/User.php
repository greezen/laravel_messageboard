<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Auth;

class User extends Authenticatable
{
    use Notifiable;

    const STATUS_Y = 'Y';

    const STATUS_N = 'N';

    const ROLE_ADMIN = 'admin';

    const ROLE_MEMBER = 'member';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'time_created', 'time_updated', 'role', 'status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * 获取用户状态
     * @param null $flag
     * @return array|mixed
     */
    public static function getStatus($flag = null)
    {
        $map_status = [
            self::STATUS_Y => '正常',
            self::STATUS_N => '禁用',
        ];

        if (!is_null($flag) && array_key_exists($flag, $map_status)) {
            return $map_status[$flag];
        }

        return $map_status;
    }

    /**
     * 获取用户角色
     * @param null $flag
     * @return array|mixed
     */
    public static function getRole($flag = null)
    {
        $map_role = [
            self::ROLE_MEMBER => '普通用户',
            self::ROLE_ADMIN => '管理员',
        ];

        if (!is_null($flag) && array_key_exists($flag, $map_role)) {
            return $map_role[$flag];
        }

        return $map_role;
    }

    /**
     * 判断用户是否禁言
     * @param int $id 用户id
     * @return bool
     */
    public static function isForbidden($id = null)
    {
        $auth = Auth::user();
        if (is_int($id)) {
            $auth = User::find($id);
        }

        if ($auth->status === self::STATUS_N) {
            return true;
        }

        return false;
    }

    /**
     * 判断用户是否为管理员
     * @param int $id 用户id
     * @return bool
     */
    public static function isAdmin($id = null)
    {
        $auth = Auth::user();
        if (is_int($id)) {
            $auth = User::find($id);
        }
        if ($auth->role === self::ROLE_ADMIN) {
            return true;
        }

        return false;
    }
}
