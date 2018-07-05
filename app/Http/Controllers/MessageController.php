<?php

namespace App\Http\Controllers;

use App\Base\BaseApiController;
use App\Base\BaseController;
use App\helpers\CommonHelper;
use App\Message;
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
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|string
     */
    public function list()
    {
        $list = Message::leftjoin('users', 'users.id' , '=', 'message.user_id')
            ->select(['message.*', 'users.name'])
            ->orderBy('message.time_created', 'DESC')
            ->paginate(10);

        if (CommonHelper::is_api()) {
            return CommonHelper::json_success('', $list);
        }

        return view('message.list', [
            'list' => $list
        ]);
    }

    /**
     * 添加留言
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View|string
     */
    public function create(Request $request)
    {
        if ($request->isMethod('post')) {
            $data = $request->input('Message');
            $validator = Message::validator();
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
                return CommonHelper::output('success', '发布留言成功');
            } else {
                return CommonHelper::output('error', '发布留言失败');
            }
        }

        if (CommonHelper::is_api()) {
            return CommonHelper::json('400', '这是啥呢？');
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
            return CommonHelper::output('success', '删除留言成功');
        }

        if ($this->is_api) {
            return $this->json_success('删除留言失败，请稍候再试');
        }
        return redirect()->back()->with('error')->with('删除留言失败，请稍候再试');
    }

    /**
     * 留言详情
     */
    public function detail()
    {}
}
