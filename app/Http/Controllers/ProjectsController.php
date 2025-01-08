<?php

namespace App\Http\Controllers;

use App\Http\Services\UserProjectPermissionProviderService;
use App\Models\Project;
use App\Models\ProjectParticipant;
use App\Models\ProjectPermission;
use App\Models\Role;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class ProjectsController extends Controller
{
    public function __construct(
        private UserProjectPermissionProviderService $projectPermissionService
    ) {}

    public function index(Request $request) {
        $userProjects = Project::userProjects()->get();

        $userProjects = $userProjects->map(function (Project $project) {
            return $project->toFrontendObject();
        });

        return Inertia::render('ProjectsPage', [
            'userProjects' => $userProjects
        ]);
    }

    public function store(Request $request) {
        $data = $request->validate([
            'name' => 'required|min:3',
            'description' => 'required',
            'deadline' => 'required|date'
        ]);

        Project::create([
            ...$data,
            'user_id' => Auth::id()
        ]);

        return to_route('projects.index');
    }

    public function show(Project $project) {
        $permissions = $this->projectPermissionService->getUserPermissions($project);

        return Inertia::render("SingleProjectPage", [
            'project' => $project,
            'permissions' => $permissions
        ]);
    }
}
