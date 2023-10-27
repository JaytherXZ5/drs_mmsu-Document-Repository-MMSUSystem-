<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FileController extends Controller
{
    public function getData($id){
        $files = DB::table('files')->where('forlder_id', $folderId)->orderBy('id', 'desc')->get();
        return $files;
    }
}
