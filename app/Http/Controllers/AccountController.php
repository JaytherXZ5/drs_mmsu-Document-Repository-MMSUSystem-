<?php

namespace App\Http\Controllers;

use App\Models\File;
use App\Models\Folder;
use App\Models\SurveyFile;
use App\Models\User;
use Illuminate\Http\Request;

class AccountController extends Controller
{
    public function getUsers()
    {
        $users = User::with(['institution', 'role', 'degree', 'psv_area', 'administrative'])->get();
        return response()->json($users);
    }


    public function destroy($id)
    {
        $user = User::findOrFail($id);

        $deletedUser = $user->name;

        Folder::where('user_id', $user->id)->update(['user_id' => null, ]);
        File::where('user_id', $user->id)->update(['user_id' => null, ]);
        $user->delete();
        return response()->json(['message' => 'User deleted successfully']);
        
    }


}
