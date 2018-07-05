<?php
/**
 * Created by PhpStorm.
 * User: 10697
 * Date: 2018/7/4
 * Time: 15:21
 */

namespace App\helpers;


class CommonHelper
{
    /**
     * 判断是否为api请求
     * @return bool
     */
    public static function is_api()
    {
        if (substr(\Request::path(), 0, 3) === 'api') {
           return true;
        }

        return false;
    }

    /**
     * 数据json格式化输出
     * @param string $status 状态
     * @param string $msg 提示
     * @param array $data 数据
     * @return string
     */
    public static function json($status, $msg = '', $data = [])
    {
        return json_encode([
            'status' => $status,
            'msg' => $msg,
            'data' => $data
        ], 15);
    }

    /**
     * 返回成功的json数据
     * @param string $msg 提示
     * @param array $data 数据
     * @param string $status 状态
     * @return string
     */
    public static function json_success($msg = '', $data = [], $status = 'success')
    {
        return self::json($status, $msg, $data);
    }

    /**
     * 返回失败的json数据
     * @param string $msg 提示
     * @param array $data 数据
     * @param string $status 状态
     * @return string
     */
    public static function json_error($msg = '', $data = [], $status = 'error')
    {
        return self::json($status, $msg, $data);
    }

    /**
     * 根据不同的端输出不同格式的数据
     * @param $status
     * @param string $msg
     * @param array $data
     * @param string $redirect
     * @return \Illuminate\Http\RedirectResponse|string
     */
    public static function output($status, $msg = '', $data = [], $redirect = '')
    {
        if (self::is_api()) {
            return self::json_success($msg, $data, $status);
        }

       if (empty($redirect)) {
            return redirect()->back()->with($status, $msg);
       }

       return redirect($redirect)->with($status, $msg);
    }
}