<?php

namespace App\Http\Controllers;

use App\Models\Administrative;
use Illuminate\Http\Request;

class AdminOfficeController extends Controller
{
    public function getAdminOffice(){
        $admin_office = Administrative::all();

        return response()->json($admin_office);
    }
}
