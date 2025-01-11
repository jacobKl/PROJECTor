<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateTaskRequest;
use App\Models\Project;
use App\Models\ProjectParticipant;
use App\Models\Task;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Inertia\Inertia;

class TaskController extends Controller
{
    public function create(Project $project) {
        $asignees = ProjectParticipant::with('user')->where('project_id', $project->id)->get();
        $assigneesArray = $this->formatAsigneesArray($asignees);

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

    public function show(Task $task) {
        $asignees = ProjectParticipant::with('user')->where('project_id', $task->project_id)->get();
        $assigneesArray = $this->formatAsigneesArray($asignees);

        return Inertia::render('EditTaskPage', [
            'task' => $task->toFrontendObject(false),
            'asignees' => $assigneesArray
        ]);
    }

    public function edit(Request $request, Task $task) {
        foreach (['priority', 'due_date', 'status', 'description'] as $field) {
            if ($request->get($field)) {
                $task->$field = $request->get($field);
            }
        }

        $task->save();
        // TODO: asignee

        return to_route('task.show', [
            'task' => $task->id
        ]);
    }

    private function formatAsigneesArray(Collection $asignees) {
        return $asignees->map(function (ProjectParticipant $participant) {
            return [
                'value' => $participant->user->id,
                'textValue' => $participant->user->name
            ];
        });
    }
}
