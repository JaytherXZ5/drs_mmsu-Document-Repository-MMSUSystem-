<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Archive;
use App\Models\File;
use App\Models\Folder;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class FolderController extends Controller
{
    
    public function create_folder(Request $request)
    {   
        $request->validate([
            'name' => 'required|string|max:255',
            'institution_id' => 'nullable|exists:institutions,id',
            'degree_id' => 'nullable|exists:degrees,id',
            'administrative_id' => 'nullable|exists:administratives,id',
        ]);

        
        $user = Auth::user();

        $existingFolder = Folder::where('name', $request->input('name'))->first();

        if ($existingFolder) {
            return response()->json(['error' => 'Folder Already Exists!'], 422);
        }

        $folder = new Folder([
            'name' => $request->input('name'),
            'user_id' => $user->id,
            'institution_id' => $request->input('institution_id', 0), 
            'degree_id' => $request->input('degree_id', 0),
            'administrative_id'=>$request->input('administrative_id', 0),
        ]);
        
        $folder->save();

        return response()->json(['message' => 'Folder created successfully', 'folder' => $folder], 201);
    }
    public function get_folders(){
        $user = Auth::user();
        //$user_type = Auth::user()->user_type_id;
        $user_role = $user->role_id;
       
        if($user_role == 1){
            $folders = $user->administrative->folders;
            return response()->json(['folders' => $folders], 200);
        }elseif($user_role == 2 || $user_role == 4){
            $folders = $user->degree->folders;
            return response()->json(['folders' => $folders], 200);
        }elseif($user_role == 3 || $user_role == 5){
            $folders = $user->institution->folders;
            return response()->json(['folders' => $folders], 200);
        }

        /*if($user_type == 1){
            $folders = $user->institution->folders;

            return response()->json(['folders' => $folders], 200);
        }elseif($user_type == 2){
            $folders = $user->degree->folders;

            return response()->json(['folders' => $folders], 200);
        }*/
        
    }
    

    public function get_folder($id){
        try {
            $user = Auth::user();
            //$user_type = Auth::user()->user_type_id;
            
            $user_role = Auth::user()->role_id;
            
            if($user_role == 1){
                $folder = Folder::where('id', $id)
                ->where('administrative_id', $user->administrative_id)
                ->firstOrFail();

            
                return response()->json([
                    'success' => true,
                    'folder' => $folder,
                ], 200);
            }elseif($user_role == 2 || $user_role == 4){
                $folder = Folder::where('id', $id)
                ->where('degree_id', $user->degree_id)
                ->firstOrFail();

                return response()->json([
                    'success' => true,
                    'folder' => $folder,
                ], 200);
            }elseif($user_role == 3 || $user_role == 5){
                $folder = Folder::where('id', $id)
                ->where('institution_id', $user->institution_id)
                ->firstOrFail();

                return response()->json([
                    'success' => true,
                    'folder' => $folder,
                ], 200);
            }
            
        } catch (\Exception $e) {
            
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 404);
        }
    }

    public function deleteFolder($id)
    {
        $folder = Folder::findOrFail($id);
        
        foreach ($folder->file as $file) {
            $user = User::findOrFail($file->user_id);
    
        $officeFolder = null;
        $degree_id = null;
        $institution_id = null;
        $administrative_id = null;
    
        if ($user->degree_id !== 0) {
            $officeFolder = $user->degree->abbr;
            $degree_id = $user->degree->id;
        } elseif ($user->institution_id !== 0) {
            $officeFolder = $user->institution->name;
            $institution_id = $user->institution->id;
        } elseif ($user->administrative_id !== 0) {
            $officeFolder = $user->administrative->name;
            $administrative_id = $user->administrative->id;
        }
    
        $folder_name = Folder::findOrFail($file->folder_id)->name;
        $filename = $file->name_generate;
    
        $path = 'public/uploads/'.$officeFolder.'/'.$folder_name.'/'.$filename;
        $newPath = 'public/uploads/Archives/' . $officeFolder.'/'. $filename;
    
        Storage::move($path, $newPath);
    
        $newFilename = time() . '_' . uniqid() . '.' . $file->extension;
    
        $archive = new Archive();
        $archive->user_id = $file->user_id;
        $archive->name = $file->name;
        $archive->type = $file->type;
        $archive->size = $file->size;
        $archive->name_generate = $file->name_generate;
        $archive->degree_id = $degree_id;
        $archive->institution_id = $institution_id;
        $archive->administrative_id = $administrative_id;
        $archive->save();
        $file->surveyFiles()->delete();
        $file->delete();
       
        Storage::deleteDirectory( $path = 'public/uploads/'.$officeFolder.'/'.$folder_name);
        return $archive;
            
        }
    
        $folder->delete();

    
        return response()->json(['message' => 'Folder and associated files moved to archives successfully']);
    }
    
 
    private function moveFileToArchives($file)
    {
       
    }
    

}
