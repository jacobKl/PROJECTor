<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class NotAuthenticatedUser
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = Auth::user();

        if ($user) return to_route('dashboard.index');

        return $next($request);
    }
}
