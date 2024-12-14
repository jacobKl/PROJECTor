<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function index(Request $request)
    {
        return Inertia::render('LoginPage');
    }

    public function login(Request $request)
    {
        $data = $request->validate([
            'email' => ['required'],
            'password' => ['required'],
        ]);


        if (Auth::attempt($data, true)) {
            $request->session()->regenerate();

            return to_route('dashboard.index');
        }


        return to_route('dashboard.index')->withErrors([
            "email" => "The provided credentials do not match our records."
        ]);
    }
}
