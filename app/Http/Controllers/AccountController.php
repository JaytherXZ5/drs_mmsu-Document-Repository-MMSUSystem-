<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AccountController extends Controller
{
    public function getUsers()
    {
        $users = User::with(['institution', 'role', 'degree', 'psv_area', 'admin_office'])->get();
        return response()->json($users);
    }


    public function destroy($id)
    {
        $area = User::find($id);

        if (!$area) {
            return response()->json(['message' => 'Area not found'], 404);
        }

        $area->delete();

        return response()->json(['message' => 'Area deleted successfully']);
    }


}
