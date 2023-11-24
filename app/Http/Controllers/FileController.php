<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\File;
use App\Models\Folder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class FileController extends Controller
{
    public function getFiles($id){
        $files = File::where('folder_id', $id)->get();

        return response()->json(['files' => $files]);
        
    }
    public function get_folder_files($id){
        try {
            $user = Auth::user();
            $user_type = Auth::user()->user_type_id;
    
            if ($user_type == 1) {
                $folder = Folder::where('id', $id)
                    ->where('institution_id', $user->institution_id)
                    ->firstOrFail();
            } elseif ($user_type == 2) {
                $folder = Folder::where('id', $id)
                    ->where('degree_id', $user->degree_id)
                    ->firstOrFail();
            }
    
            // Check if the folder was found
            if ($folder) {
                // Fetch files belonging to the folder
                $files = File::where('folder_id', $folder->id)->get();
    
                return response()->json([
                    'success' => true,
                    'folder' => $folder,
                    'files' => $files,
                ], 200);
            }
    
            return response()->json([
                'success' => false,
                'message' => 'Folder not found.',
            ], 404);
    
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function upload(Request $request,$id){
        $request->validate([
            'file' => 'required|mimes:png,jpg,pdf,html|max:2048'
        ]);

        $file = $request->file('file');
        $filename = time() . '_' . $file->getClientOriginalName();
        $file->storeAs('uploads', $filename, 'public');

        DB::table('files')->insert([
            'name' => $file -> getClientOriginalName(),
            'name_generate' => $filename,
            'type' =>$file->guessExtension(),
            'size' =>$file->getSize(),
            'folder_id' => (int)$id
        ]);
    }
}

