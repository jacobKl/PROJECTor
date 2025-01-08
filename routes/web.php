<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\ProjectParticipantController;
use App\Http\Controllers\ProjectsController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\TaskController;
use App\Http\Middleware\AuthenticatedUser;
use Illuminate\Support\Facades\Route;

Route::get('/login', [LoginController::class, 'index'])->name('login');
Route::post('/login', [LoginController::class, 'login']);

Route::get('/register', [RegisterController::class, 'index']);
Route::post('/register', [RegisterController::class, 'register']);

Route::middleware([AuthenticatedUser::class])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard.index');

    Route::get('/projects/{project}', [ProjectsController::class, 'show'])->name('projects.show');
    Route::get('/projects', [ProjectsController::class, 'index'])->name('projects.index');
    Route::post('/projects', [ProjectsController::class, 'store'])->name('projects.store');


    Route::get('/projects/{project}/task/create', [TaskController::class, 'create'])->name('task.create');
    Route::post('/projects/{project}/task/create', [TaskController::class, 'store'])->name('task.create');

    Route::get('/notifications', [NotificationController::class, 'index']);

    Route::post('/project-participant', [ProjectParticipantController::class, 'store']);
    Route::post('/join-project', [ProjectParticipantController::class, 'joinProject']);
});

