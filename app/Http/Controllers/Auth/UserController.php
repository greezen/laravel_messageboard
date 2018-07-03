<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;

class UserController extends Controller
{
   public function index()
   {
       $s = \Hash::make('123456');
       var_dump($s);
   }
}
