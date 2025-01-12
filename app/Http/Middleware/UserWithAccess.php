<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class UserWithAccess
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = Auth::user();

        if (!$user) return abort(404);

        if ($user->hasRole(2) || $user->isProjectOwner($request->route()->parameters())) {
            return $next($request);
        }

        return abort(404);
    }
}
