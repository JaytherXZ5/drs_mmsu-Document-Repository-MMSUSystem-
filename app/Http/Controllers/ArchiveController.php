<?php

namespace App\Http\Controllers;

use App\Models\Archive;
use App\Models\Folder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ArchiveController extends Controller
{   

    public function getArchiveFiles(){
        $user = Auth::user();
        //$user_type = Auth::user()->user_type_id;
        $user_role = $user->role_id;
       
        if($user_role == 1){
            $archives = $user->administrative->archives;
            return response()->json(['archives' => $archives], 200);
        }elseif($user_role == 2 || $user_role == 4){
            $archives = $user->degree->archives;
            return response()->json(['archives' => $archives], 200);
        }elseif($user_role == 3 || $user_role == 5){
            $archives = $user->institution->archives;
            return response()->json(['archives' => $archives], 200);
        }
    }






}
