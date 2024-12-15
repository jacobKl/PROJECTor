<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    public const TYPE_PROJECT_INVITATION = "PROJECT_INVITATION";

    protected $fillable = [
        "user_id",
        "type",
        "message",
        "received",
        "data"
    ];

    protected $casts = [
        'data' => 'array'
    ];

    public function scopeUserNewNotifications($query, User $user)
    {
        return $query->where("user_id", $user->id)->where('received', false);
    }

    public static function userInvited(Project $project, int $userId)
    {
        self::create([
            "user_id" => $userId,
            "type" => self::TYPE_PROJECT_INVITATION,
            "message" => "You were invited to project " . $project->name,
            "received" => false,
            "data" => [
                "project_id" => $project->id
            ]
        ]);
    }
}
