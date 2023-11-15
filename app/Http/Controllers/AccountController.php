<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AccountController extends Controller
{
    public function getUsers()
    {
        $users = User::with(['user_role', 'institution'])->get();
        return response()->json($users);
    }
}
