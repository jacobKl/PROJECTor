<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class AuthenticatedUser
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = Auth::user();

        if (!$user) return to_route('login');

        return $next($request);
    }
}
