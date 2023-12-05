<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OfficeController extends Controller
{
    public function getUserOffice($id){
        
            $user = User::findOrFail($id);

            if($user->degree_id !==0){
                $office = $user->degree->degree;
                
                return response()->json([
                    'degree' => $office,
                ]);
            }elseif ($user->institution_id !==0) {
                $office = $user->institution->name;

                return response()->json([
                    'institution' => $office,
                ]);
            }elseif($user->psv_area_id !==0){
                $office = $user->psv_area->area_name;

                return response()->json([
                    'psv_area' => $office,
                ]);
            }elseif($user->administrative_id !==0){
                $office = $user->administrative->name;

                return response()->json([
                    'administrative' => $office,
                ]);
            }

        
    }
    public function getCurrentUserOffice(){
        
        $user = Auth::user();

        if($user->degree_id !==0){
            $office = $user->degree->abbr;
            
            return response()->json([
                'office' => $office,
            ]);
        }elseif ($user->institution_id !==0) {
            $office = $user->institution->name;

            return response()->json([
                'office' => $office,
            ]);
        }elseif($user->psv_area_id !==0){
            $office = $user->psv_area->area_name;

            return response()->json([
                'office' => $office,
            ]);
        }elseif($user->administrative_id !==0){
            $office = $user->administrative->name;

            return response()->json([
                'office' => $office,
            ]);
        }
    }
}
