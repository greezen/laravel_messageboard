@extends('layouts.message')

@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>留言板</h3>
            </div>
        </div>
        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>发表留言 <small></small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    @include('message._form')
                </div>
            </div>
        </div>
    </div>
    <script src="/js/jquery.min.js"></script>
    <!-- validator -->
    <script src="/js/validator.js"></script>
@endsection