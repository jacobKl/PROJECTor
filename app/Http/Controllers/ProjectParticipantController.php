<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use App\Models\Project;
use App\Models\ProjectParticipant;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProjectParticipantController extends Controller
{
    public function store(Request $request) {
        $data = $request->validate([
            'project_id' => 'required',
            'email' => 'required|exists:users'
        ]);

        $project = Project::findOrFail($data['project_id']);
        $invited = User::where('email', $data['email'])->firstOrFail();

        ProjectParticipant::create([
            'project_id' => $project->id,
            'user_id' => $invited->id,
            'status' => ProjectParticipant::STATUS_INVITED
        ]);

        Notification::userInvited($project, $invited->id);
    }
}
