<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

/*Route::get('/redirect', function (){
    $query = http_build_query([
        'client_id' => '9',
        'redirect_uri' => 'http://mb.com/auth/callback',
        'response_type' => 'code',
        'scope' => '',
    ]);

    return redirect('http://mb.com/oauth/authorize?' . $query);
});*/

Route::post('login', 'Auth\UserController@login');

Route::group(['middleware' => ['auth:api']], function () {

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