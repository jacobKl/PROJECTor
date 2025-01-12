<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function toFrontendObject() {
        return [
            'name' => $this->name
        ];
    }

    public function roles() {
        return $this->hasMany(ProjectPermission::class, 'user_id', 'id');
    }

    public function project() {
        return $this->hasOne(Project::class, 'user_id', 'id');
    }

    public function hasRole(int $roleId) {
        foreach ($this->roles as $role) {
            if ($role->role_id === $roleId) {
                return true;
            }
        }

        return false;
    }

    public function isProjectOwner(array $taskOrProject) {
        if (isset($taskOrProject['project'])) {
            if ($taskOrProject['project']->user_id === $this->id) return true;
        }

        if (isset($taskOrProject['task'])) {
            $project = Project::find($taskOrProject['task']->project_id);

            if (!$project) return false;
            if ($project->user_id === $this->id) return true;
        }

        return false;
    }
}
