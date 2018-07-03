{{-- 操作成功提示 --}}
@if(Session::has('success'))
<div class="alert alert-success alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   {{ Session::get('success') }}
</div>
@endif

{{-- 操作失败提示 --}}
@if(Session::has('error'))
<div class="alert alert-warning alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    {{ Session::get('error') }}
</div>
@endif

<!-- jQuery -->
<script src="/js/jquery.min.js"></script>
<script>
    $(function () {
        window.setTimeout(function () {
            $('.alert').slideUp();
        }, 3000);
    })
</script>