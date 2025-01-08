<?php

namespace App\Http\Services;

use App\Models\Project;
use App\Models\ProjectPermission;
use Illuminate\Support\Facades\Auth;

class UserProjectPermissionProviderService {
    public function __construct()
    {

    }

    public function getUserPermissions(Project $project) {
        $isMainCreator = Auth::id() == $project->user_id;
        $projectPermissions = ProjectPermission::with('role')->where('user_id', Auth::id())->get();

        $permissions = $projectPermissions->map(function (ProjectPermission $permission) {
            return $permission->role->name;
        });

        if ($isMainCreator) $permissions[] = 'admin';

        return $permissions;
    }
}
