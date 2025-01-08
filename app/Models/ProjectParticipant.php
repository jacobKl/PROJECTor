<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class ProjectParticipant extends Model
{
    public const STATUS_INVITED = "INVITED";
    public const STATUS_ACTIVE = "ACTIVE";

    protected $fillable = [
        "user_id",
        "project_id",
        "status"
    ];

    public function user(): HasOne
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }
}
