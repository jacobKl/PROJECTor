<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    public function store(Request $request, Task $task) {
        $user = Auth::user();

        if (!$user) return to_route('login');

        Comment::create([
            'user_id' => $user->id,
            'task_id' => $task->id,
            'comment' => $request->get('comment')
        ]);

        return to_route('task.show', [
            'task' => $task->id
        ]);
    }
}
