<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FileFolderController extends Controller
{
    public function create_folder(Request $request){
        $request->validate([
            'name' => 'required|unique:folders,name'
        ]);

        $folder = DB::table('folders')->insert($request->all());
        
        return $folder;

    }

    public function getFileFolders(){
        $folders = DB::table('folders')->get();
        $files = DB::table('files')->orderBy('id', 'desc')->get();
        return [
            'folders' => $folders,
            'files' => $files
        ];
    }

    
}
