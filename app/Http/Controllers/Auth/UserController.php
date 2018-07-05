<?php

namespace App\Http\Controllers\Auth;

use App\helpers\CommonHelper;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;

class UserController extends Controller
{
    /**
     * 登录
     * @return \Illuminate\Http\JsonResponse|string
     */
    public function login(){
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){
            $user = Auth::user();
            $success['token'] =  $user->createToken('message_board')->accessToken;
            return response()->json(['success' => $success]);
        }
        else{
            return CommonHelper::json_success('Unauthorised', [], '401');
        }
    }

    /**
     * 注册
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse|string
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);
        }

        $time = time();
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $input['time_created'] = $time;
        $input['time_updated'] = $time;
        $input['role'] = User::ROLE_MEMBER;
        $input['status'] = User::STATUS_Y;
        $user = User::create($input);
        $success['token'] =  $user->createToken('message_board')->accessToken;
        $success['name'] =  $user->name;

        return CommonHelper::json_success('', $success);
    }

    /**
     * 退出登录
     * @return string
     */
    public function logout()
    {
        if (\Auth::guard('api')->check()) {
            \Auth::guard('api')->user()->token()->delete();
        }

        return CommonHelper::json_success('登出成功');

    }
}
