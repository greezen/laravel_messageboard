<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterMessageTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('message', function (Blueprint $table) {
            $table->string('content', 1024)->comment('留言内容')->change();
            $table->integer('time_created', false, true)->comment('创建时间')->change();
            $table->integer('time_updated', false, true)->comment('更新时间')->change();
            $table->integer('user_id', false, true)->comment('用户ID')->change();

            $table->index('time_created');
            $table->index('user_id', 'uid');

            DB::statement("ALTER TABLE `message` comment'留言'"); // 表注释
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('message', function (Blueprint $table) {
            $table->increments('id')->comment('')->change();
            $table->string('content', 1024)->comment('')->change();
            $table->integer('time_created', false, true)->comment('')->change();
            $table->integer('time_updated', false, true)->comment('')->change();
            $table->integer('user_id', false, true)->comment('')->change();
            DB::statement("ALTER TABLE `message` comment''"); // 表注释
        });
    }
}
