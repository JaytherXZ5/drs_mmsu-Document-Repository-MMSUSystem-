<?php

namespace App\Http\Controllers;

use App\Models\Institution;
use Illuminate\Http\Request;

class InstitutionController extends Controller
{
    public function getInstitutions()
    {
        $institutions = Institution::all();
        return response()->json($institutions);
    }
}
