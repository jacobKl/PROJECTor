<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\JsonResponse;

class NotificationController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        $newNotifications = Notification::userNewNotifications($user)->get();

        return new JsonResponse([
            'notifications' => $newNotifications
        ]);
    }
}
