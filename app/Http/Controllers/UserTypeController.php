<?php

namespace App\Http\Controllers;

use App\Models\UserType;
use Illuminate\Http\Request;

class UserTypeController extends Controller
{
    public function get_user_types(){
        $userTypes = UserType::all();

        return response()->json($userTypes);
    }
}
