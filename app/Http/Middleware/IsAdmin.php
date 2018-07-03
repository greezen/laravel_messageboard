<?php

namespace App\Http\Middleware;

use App\User;
use Closure;

class IsAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (\Auth::user()->role !== User::ROLE_ADMIN) {
            return redirect('message')->with('error', '您没有此操作权限');
        }
        return $next($request);
    }
}
