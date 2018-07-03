<?php

namespace App\Http\Middleware;

use App\User;
use Closure;

class IsForbidden
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
        if (\Auth::user()->status == User::STATUS_N) {
            return redirect('message')->with('error', '您已经被禁言，请联系管理员解除禁言!');
        }
        return $next($request);
    }
}
