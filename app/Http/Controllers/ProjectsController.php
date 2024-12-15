<?php

namespace App\Http\Controllers;

use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class ProjectsController extends Controller
{
    public function index(Request $request) {
        $userProjects = Project::createdByUser()->get();


        return Inertia::render('ProjectsPage', [
            "userProjects" => $userProjects
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
}
