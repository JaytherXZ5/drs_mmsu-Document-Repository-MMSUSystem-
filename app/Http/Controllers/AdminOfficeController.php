<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;

class AdminOfficeController extends Controller
{
    public function getAdminOffice(){
        $admin_office = Admin::all();

        return response()->json($admin_office);
    }
}
