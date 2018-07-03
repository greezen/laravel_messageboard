@extends('layouts.message')

@section('content')
    <style type="text/css">
        .pagination{margin: 0;}
    </style>
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3> <small></small></h3>
            </div>
        </div>

        <div class="clearfix"></div>
        @include('common.alert')
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>留言列表 <small></small></h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <p class="text-muted font-13 m-b-30"></p>
                        <table id="datatable" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>用户名</th>
                                <th>邮箱</th>
                                <th>角色</th>
                                <th>状态</th>
                                <th>注册时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>


                            <tbody>
                            @foreach($list as $row)
                                <tr>
                                    <td>{{ $row->id }}</td>
                                    <td>{{ $row->name }}</td>
                                    <td>{{ $row->email }}</td>
                                    <td>{{ \App\User::getRole($row->role) }}</td>
                                    <td>{{ \App\User::getStatus($row->status) }}</td>
                                    <td>{{ date('Y-m-d H:i:s', $row->time_created) }}</td>
                                    <td>
                                        <a href="{{ url('user/forbidden/' . $row->id) }}" onclick="if(window.confirm('确定禁言该用户吗？') == false){return false;}">禁言</a> |
                                        <a href="{{ url('user/allowed/' . $row->id) }}" onclick="if(window.confirm('确定解禁该用户吗？') == false){return false;}">解禁</a> |
                                        <a href="{{ url('user/setRole/' . $row->id . '/' . \App\User::ROLE_ADMIN) }}" onclick="if(window.confirm('确定要将该用户设为管理员吗？') == false){return false;}">设为管理员</a> |
                                        <a href="{{ url('user/setRole/' . $row->id . '/' . \App\User::ROLE_MEMBER) }}" onclick="if(window.confirm('确定要将该用户设为精准通？') == false){return false;}">设为普通用户</a> |
                                        <a href="{{ url('user/delete/' . $row->id) }}" onclick="if(window.confirm('确定要删除吗？') == false){return false;}">删除</a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-sm-5">
                            </div>
                            <div class="col-sm-7">
                                <div class="dataTables_paginate paging_simple_numbers">
                                    {{ $list->render() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection