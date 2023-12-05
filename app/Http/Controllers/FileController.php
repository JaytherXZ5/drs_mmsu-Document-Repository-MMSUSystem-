<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\File;
use App\Models\Folder;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class FileController extends Controller
{
    public function getFiles($id){
        $files = File::where('folder_id', $id)->get();
        //$path = storage_path('app/public/uploads/BSinfoTech/Aldrin/1701754681.txt');
        //dd(filesize($path) / (1024 * 1024) );
        return response()->json(['files' => $files]);
        
    }

    public function getFileUser($id){
        $user = User::findOrFail($id);
        return response()->json($user);
    }

    public function get_folder_files($id){
        try {
            $user = Auth::user();
            $user_role = Auth::user()->role_id;
    
            if ($user_role == 1) {
                $folder = Folder::where('id', $id)
                    ->where('admin_office_id', $user->admin_office_id)
                    ->firstOrFail();
            } elseif ($user_role == 2 || $user_role == 4) {
                $folder = Folder::where('id', $id)
                    ->where('degree_id', $user->degree_id)
                    ->firstOrFail();
            }elseif($user_role == 3 || $user_role == 5){
                $folder = Folder::where('id', $id)
                    ->where('institution_id', $user->institution_id)
                    ->firstOrFail();
            }
    
            // Check if the folder was found
            if ($folder) {
                // Fetch files belonging to the folder
                $files = File::where('folder_id', $folder->id)->get();
                //folder
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

    public function uploads(Request $request,$id){
        $request->validate([
            'file' => 'required|mimes:png,jpg,pdf,html,txt|max:2048'
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

public function deleteFile($id){
    $file = File::findOrFail($id);
    $user = User::findOrFail($file->user_id);
    $officeFolder = $user->degree->abbr;
    $folder = Folder::findOrFail($file->folder_id)->name;
    $filename = $file->name_generate;
    $path = 'app/public/uploads/'.$officeFolder.'/'.$folder.'/'.$filename;
   // Storage::delete($file->path);
    
    
    unlink(storage_path($path));
    $file->delete();

    return response()->json([
        'file'=>$file
    ]);
    //to archive

}

public function uploadFiles(Request $request, $id)
{
    $request->validate([
        'files.*' => 'required|mimes:png,jpg,pdf,html,txt,docx,xlsx,csv|max:8192',
    ]);

    $uploadedFiles = [];

    foreach ($request->file('files') as $file) {
        $filename = time(). '_'.uniqid() . '.' . $file->extension();
        $user_role = Auth::user()->role_id;
        $folder = Folder::findOrFail($id)->name;
        $user = Auth::user();
        $fileStorage = null;
       
        if ($user_role == 1) {
            $fileStorage = $user->admin_office->name;
        }elseif($user_role == 2 || $user_role == 4){
            $fileStorage = $user->degree->abbr;

        }elseif($user_role == 3 || $user_role == 5){
            $fileStorage = $user->institution->name;
        }

        $file->storeAs('uploads/'.$fileStorage.'/'.$folder, $filename, 'public');
       
        $fileModel = new File();
        $fileModel->name = $file->getClientOriginalName();
        $fileModel->name_generate = $filename;
        $fileModel->type = $file->guessExtension();
        $fileModel->size = $file->getSize();
        $fileModel->folder_id = $id;
        $fileModel->user_id = $user->id;
        $fileModel->save();

        // Add file details to the response array
        $uploadedFiles[] = [
            'id' => $fileModel->id,
            'name' => $fileModel->name,
            'type' => $fileModel->type,
            'size' => $fileModel->size,
        ];
    }

    return response()->json(['files' => $uploadedFiles]);
}

}

