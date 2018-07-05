<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // 解决 Unknown database type enum requested, Doctrine\DBAL\Platforms\MySqlPlatform may not support it.
        $platform  = DB::getDoctrineSchemaManager()->getDatabasePlatform();
        $platform->registerDoctrineTypeMapping('enum', 'string');

        $platform = DB::getDoctrineConnection()->getDatabasePlatform();
        $platform->registerDoctrineTypeMapping('enum', 'string');

        Schema::table('users', function (Blueprint $table) {
            $table->string('name')->comment('用户名')->change();
            $table->string('email')->unique()->comment('邮箱')->change();
            $table->string('password')->comment('密码')->change();
            $table->integer('time_created', false, true)->comment('创建时间')->change();
            $table->integer('time_updated', false, true)->comment('更新时间')->change();
            DB::statement("ALTER TABLE users MODIFY COLUMN status ENUM('Y','N') DEFAULT 'Y' COMMENT '状态'");
            $table->string('role', 16)->comment('角色')->change();

            $table->index('name');
            $table->index('time_created');
            DB::statement("ALTER TABLE `users` comment'用户'"); // 表注释
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('name')->comment('')->change();
            $table->string('email')->unique()->comment('')->change();
            $table->string('password')->comment('')->change();
            $table->integer('time_created', false, true)->comment('')->change();
            $table->integer('time_updated', false, true)->comment('')->change();
            $table->enum('status', ['Y', 'N'])->comment('')->change();
            $table->string('role', 16)->comment('')->change();

            DB::statement("ALTER TABLE `users` comment''"); // 表注释
        });
    }
}
