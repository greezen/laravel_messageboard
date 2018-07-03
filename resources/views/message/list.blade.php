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
                                <th width="20%">留言内容</th>
                                <th>发布时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>


                            <tbody>
                            @foreach($list as $row)
                                <tr>
                                    <td>{{ $row->id }}</td>
                                    <td>{{ $row->name }}</td>
                                    <td>{{ $row->content }}</td>
                                    <td>{{ \App\Message::handleTime($row->time_created) }}</td>
                                    <td>
                                        <a href="{{ url('message/delete/' . $row->id) }}" onclick="if(window.confirm('确定要删除吗？') == false){return false;}">删除</a>
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