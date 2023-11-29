<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;

class RoleController extends Controller
{   
    public function getUserRole($id){
        

       
        $role = Role::find($id);
        return response()->json($role);



    }
    public function getRoles(){
        $roles = Role::all();

        return response()->json($roles);
    }
}
