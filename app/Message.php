<?php

namespace App;


use App\Base\BaseModel;

class Message extends BaseModel
{
    protected $table = 'message';

    protected $fillable = [
        'content' , 'time_created' , 'time_updated' , 'user_id'
    ];

    public $timestamps = false;

    /**
     * 转换发布时间
     * @param $time
     * @return false|string
     */
    public static function handleTime($time)
    {
        $duration = time() - $time;
        if ($duration < 3600) {
            return ceil($duration / 60) . ' 分钟前';
        } elseif ($duration >= 3600 && $duration < 86400) {
            return ceil($duration / 3600) . ' 小时前';
        } elseif ($duration >= 86400 && $duration <  2592000) {
            return ceil($duration / 86400) . ' 天前';
        } else {
            return date('Y-m-d H:i:s');
        }
    }
}
