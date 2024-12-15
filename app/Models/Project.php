<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Project extends Model
{
    protected $fillable = [
        'name',
        'description',
        'deadline',
        'user_id'
    ];

    public function scopeCreatedByUser($query) {
        return $query->where('user_id', Auth::id());
    }
}
