<?php

namespace App\Http\Controllers;

use App\Models\UserRole;
use Illuminate\Http\Request;

class UserRoleController extends Controller
{
    public function getUserRoles()
    {
        $user_roles = UserRole::all();
        return response()->json($user_roles);
    }
}
