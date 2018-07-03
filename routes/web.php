<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', ['uses' => 'MessageController@index']);

Route::get('/user', 'auth\UserController@index');

// 用户权限相关
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

// 留言列表
Route::any('/message', ['uses' => 'MessageController@list']);

Route::group(['middleware' => ['auth']], function () {
    // 添加留言
    Route::any('/message/create', ['uses' => 'MessageController@create'])->middleware(\App\Http\Middleware\IsForbidden::class);
    // 删除留言
    Route::get('/message/delete/{id}', ['uses' => 'MessageController@delete']);

    Route::get('/user/list', ['uses' => 'UserController@list']);

    Route::group(['middleware' => [\App\Http\Middleware\IsAdmin::class]], function () {
        Route::get('/user/forbidden/{id}', ['uses' => 'UserController@forbidden']);
        Route::get('/user/allowed/{id}', ['uses' => 'UserController@allowed']);
        Route::get('/user/delete/{id}', ['uses' => 'UserController@delete']);
        Route::get('/user/setRole/{id}/{role?}', ['uses' => 'UserController@setRole']);
    });

});

