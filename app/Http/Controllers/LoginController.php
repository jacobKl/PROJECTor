<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class LoginController extends Controller
{
    public function index(Request $request) {
        $users = User::all();

        return Inertia::render('Login', [
            'users' => $users
        ]);
    }
}
