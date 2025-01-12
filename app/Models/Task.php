<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

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

    public function scopeProject($query, Project $project)
    {
        return $query->where('project_id', $project->id);
    }

    public function toFrontendObject(bool $formatDate = true): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'priority' => $this->priority,
            'status' => $this->status,
            'due_date' => $formatDate ? Carbon::parse($this->due_date)->format('d-m-y H:i:s') : $this->due_date,
            'updated_at' => Carbon::parse($this->updated_at)->format('d-m-y H:i:s'),
            'asignee' => $this->asignee ? $this->asignee->toFrontendObject() : null,
            'description' => $this->description
        ];
    }

    public function scopeAssignedToUser($query) {
        return $query->where('asignee', Auth::id());
    }
}
