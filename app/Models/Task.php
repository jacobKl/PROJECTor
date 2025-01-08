<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $fillable = [
        'name',
        'due_date',
        'asignee',
        'priority',
        'status',
        'description',
        'project_id'
    ];
}
