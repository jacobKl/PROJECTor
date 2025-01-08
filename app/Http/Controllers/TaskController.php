<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateTaskRequest;
use App\Models\Project;
use App\Models\ProjectParticipant;
use App\Models\Task;
use Illuminate\Http\Request;
use Inertia\Inertia;

class TaskController extends Controller
{
    public function create(Project $project) {
        $asignees = ProjectParticipant::with('user')->where('project_id', $project->id)->get();

        $assigneesArray = $asignees->map(function (ProjectParticipant $participant) {
            return [
                'value' => $participant->user->id,
                'textValue' => $participant->user->name
            ];
        });

        return Inertia::render('CreateTaskPage', [
            'projectId' => $project->id,
            'asigneesArray' => $assigneesArray
        ]);
    }

    public function store(CreateTaskRequest $request, Project $project) {
        Task::create([
            'asignee' => null,
            ...$request->validated()
        ]);


        return to_route('projects.show', [
            'project' => $project->id
        ]);
    }
}
