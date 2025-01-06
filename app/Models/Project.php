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

    public function scopeUserProjects($query) {
        $userId = Auth::id();

        $userProjects = ProjectParticipant::where('user_id', $userId)->pluck('project_id')->toArray();
        $createdByUser = Project::where('user_id', $userId)->pluck('id')->toArray();

        return $query->whereIn('id', [...$userProjects, ...$createdByUser]);
    }

    public function getParticipantsAmount() {
        $participants = ProjectParticipant::where('project_id', $this->id)->where('status', ProjectParticipant::STATUS_ACTIVE)->count() + 1;

        return $participants;
    }

    public function toFrontendObject() {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'description' => $this->description,
            'deadline' => $this->deadline,
            'participants' => $this->getParticipantsAmount()
        ];
    }
}
