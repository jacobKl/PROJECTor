<?php

use App\Http\Controllers\CommentController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\ProjectParticipantController;
use App\Http\Controllers\ProjectsController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\TaskController;
use App\Http\Middleware\AuthenticatedUser;
use App\Http\Middleware\NotAuthenticatedUser;
use App\Http\Middleware\UserWithAccess;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware([NotAuthenticatedUser::class])->group(function () {
    Route::get('/login', [LoginController::class, 'index'])->name('login');
    Route::post('/login', [LoginController::class, 'login']);

    Route::get('/register', [RegisterController::class, 'index']);
    Route::post('/register', [RegisterController::class, 'register']);
});

Route::middleware([AuthenticatedUser::class])->group(function () {
    Route::post('/logout', function (Request $request) {
        auth()->logout();
        $request->session()->invalidate();
        return redirect('/login');
    })->name('logout');

    Route::get('/', [DashboardController::class, 'index'])->name('dashboard.index');

    Route::get('/projects/{project}', [ProjectsController::class, 'show'])->name('projects.show');
    Route::get('/projects', [ProjectsController::class, 'index'])->name('projects.index');
    Route::post('/projects', [ProjectsController::class, 'store'])->name('projects.store');

    Route::get('/tasks', [TaskController::class, 'index'])->name('task.index');
    Route::get('/tasks/{task}', [TaskController::class, 'show'])->name('task.show');


    Route::middleware([UserWithAccess::class])->group(function () {
        Route::post('/tasks/{task}', [TaskController::class, 'edit'])->name('task.edit');
        Route::post('/tasks/{task}/comment/store', [CommentController::class, 'store'])->name('comment.store');
        Route::post('/projects/{project}/task/create', [TaskController::class, 'store'])->name('task.create');
    });

    Route::get('/projects/{project}/task/create', [TaskController::class, 'create'])->name('task.create');

    Route::get('/notifications', [NotificationController::class, 'index']);

    Route::post('/project-participant', [ProjectParticipantController::class, 'store']);
    Route::post('/join-project', [ProjectParticipantController::class, 'joinProject']);
});

