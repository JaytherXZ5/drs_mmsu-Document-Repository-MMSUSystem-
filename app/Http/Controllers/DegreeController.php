<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Degree;
class DegreeController extends Controller
{
    public function getDegrees()
    {
        
        $degrees = Degree::all();

        return response()->json($degrees);
    }
}
