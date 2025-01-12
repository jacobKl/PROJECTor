<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Comment extends Model
{
    protected $fillable = ['comment', 'task_id', 'user_id'];

    public function scopeTask($query, Task $task) {
        return $query->where('task_id', $task->id);
    }

    public function user(): HasOne
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }
}
