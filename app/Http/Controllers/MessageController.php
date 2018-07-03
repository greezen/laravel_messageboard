<?php

namespace App\Http\Controllers;

use App\Base\BaseController;
use App\Message;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MessageController extends BaseController
{
    public function index()
    {
        return view('message.index');
    }

    /**
     * 留言列表
     */
    public function list()
    {
        $list = Message::leftjoin('users', 'users.id' , '=', 'message.user_id')
            ->select(['message.*', 'users.name'])
            ->orderBy('message.time_created', 'DESC')
            ->paginate(10);

        return view('message.list', [
            'list' => $list
        ]);
    }

    /**
     * 添加留言
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function create(Request $request)
    {
        if ($request->isMethod('post')) {
            $data = $request->input('Message');
            $validator = \Validator::make($data, [
                'content' => 'required|max:1024|min:5'
            ], [
                'required' => '留言内容不能为空',
                'min' => '内容长度不能少于5个字符',
                'max' => '内容长度不能多于1024个字符',
            ]);
            if ($validator->fails()) {
                return redirect('message/create')->withErrors($validator)->withInput();
            }
            $res = Message::create([
                'content' => $data['content'],
                'user_id' => Auth::user()->id,
                'time_created' => time(),
                'time_updated' => time(),
            ]);

            if ($res) {
                return redirect('message')->with('success', '留言成功');
            } else {
                return redirect()->back();
            }
        }
        return view('message.create');
    }

    /**
     * 删除留言
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception
     */
    public function delete($id)
    {
        $message = Message::find($id);
        if (!empty($message) && $message->delete()) {
            return redirect()->back()->with('success', '删除留言成功');
        }

        return redirect()->back()->with('error')->with('删除留言失败，请稍候再试');
    }

    /**
     * 留言详情
     */
    public function detail()
    {}
}
