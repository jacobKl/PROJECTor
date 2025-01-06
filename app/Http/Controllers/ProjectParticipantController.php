<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use App\Models\Project;
use App\Models\ProjectParticipant;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ProjectParticipantController extends Controller
{
    public function store(Request $request) {
        $data = $request->validate([
            'project_id' => 'required',
            'email' => 'required|exists:users'
        ]);

        $project = Project::findOrFail($data['project_id']);
        $invited = User::where('email', $data['email'])->firstOrFail();

        $projectParticipant = ProjectParticipant::create([
            'project_id' => $project->id,
            'user_id' => $invited->id,
            'status' => ProjectParticipant::STATUS_INVITED
        ]);

        Notification::userInvited($project, $invited->id, $projectParticipant->id);
    }

    public function joinProject(Request $request) {
        $data = $request->validate([
            'invitation_id' => 'required',
            'notification_id' => 'required'
        ]);

        $projectParticipant = ProjectParticipant::find($data['invitation_id']);
        $projectParticipant->status = ProjectParticipant::STATUS_ACTIVE;
        $projectParticipant->save();

        $notification = Notification::find($data['notification_id']);
        $notification->received = true;
        $notification->save();

        return new JsonResponse([
            "message" => "You have successfully joined the project."
        ]);
    }
}
