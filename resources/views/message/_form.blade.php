<div class="x_content">
    <form method="post" class="form-horizontal form-label-left" novalidate action="{{ url('message/create') }}">
        <span class="section">请在此提交您的留言</span>

        @csrf
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">留言内容 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <textarea id="textarea" required="required" name="Message[content]" class="form-control col-md-7 col-xs-12" rows="16">{{ old('Message.content') }}</textarea>
                @if ($errors->has('content'))
                    <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('content') }}</strong>
                                        </span>
                @endif
            </div>
        </div>

        <div class="ln_solid"></div>
        <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
                <button type="submit" class="btn btn-primary">取消</button>
                <button id="send" type="submit" class="btn btn-success">提交</button>
            </div>
        </div>
    </form>
</div>