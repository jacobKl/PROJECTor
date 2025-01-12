<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
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
        $participants = ProjectParticipant::where('project_id', $this->id)->where('status', ProjectParticipant::STATUS_ACTIVE)->count();

        return $participants;
    }

    public function toFrontendObject() {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'description' => $this->description,
            'deadline' => $this->deadline,
            'participants' => $this->getParticipantsAmount(),
            'task_count' => $this->getTasksCount()
        ];
    }

    public function tasks(): HasMany
    {
        return $this->hasMany(Task::class);
    }

    private function getTasksCount(): array
    {
        $counts = [
            'new' => 0,
            'in-progress' => 0,
            'to-verification' => 0,
            'closed' => 0
        ];

        foreach ($this->tasks as $task) {
            if (isset($counts[$task->status])) {
                $counts[$task->status] = $counts[$task->status] + 1;
            }
        }

        return $counts;
    }
}
