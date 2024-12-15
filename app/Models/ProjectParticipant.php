<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectParticipant extends Model
{
    public const STATUS_INVITED = "INVITED";
    public const STATUS_ACTIVE = "ACTIVE";

    protected $fillable = [
        "user_id",
        "project_id",
        "status"
    ];
}
