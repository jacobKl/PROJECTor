<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class RegisterController extends Controller
{
    public function index(Request $request) {
        return Inertia::render('RegisterPage');
    }

    public function register(Request $request) {
        $data = $request->validate([
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:8'
        ]);

        User::create([
            ...$data,
            'name' => explode('@', $data['email'])[0]
        ]);

        return to_route('login');
    }
}
