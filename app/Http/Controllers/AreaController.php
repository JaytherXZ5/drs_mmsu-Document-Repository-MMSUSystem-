<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Area;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AreaController extends Controller
{   //Areas
    public function create_area(Request $request){
        $data = $request->validate([
            'area_name' => 'required|unique:areas,area_name',
            'area_description' => 'nullable|string',
            'area_status' => 'boolean',
            'area_order' => 'integer',
        ]);

        $area = Area::create($data);

        return response()->json($area, 201);
    }

    public function update(Request $request, $id)
    {
        $area = Area::find($id);

        if (!$area) {
            return response()->json(['message' => 'Area not found'], 404);
        }

        $data = $request->validate([
            'area_name' => 'required|string',
            'area_description' => 'nullable|string',
        ]);

        $area->update($data);

        return response()->json($area);
    }

    public function getTotalAreasCount()
    {
        $totalAreasCount = Area::count();
        return response()->json(['total_areas_count' => $totalAreasCount]);
    }

    public function get_area(){
        return Area::orderBy('area_order')->get();    
    }

    public function destroy($id)
    {
        $area = Area::find($id);

        if (!$area) {
            return response()->json(['message' => 'Area not found'], 404);
        }

        $area->delete();

        return response()->json(['message' => 'Area deleted successfully']);
    }


    //////////////////////PSV/////////////////////////////////
    
    public function create_psv_area(Request $request){
        $request->validate([
            'area_name' => 'required|unique:areas,area_name',
            'area_description' => 'nullable|string',
            'area_status' => 'boolean',
            'area_order' => 'integer',
        ]);

        $psv_area = DB::table('psv_areas')->insert($request->all());
        return response()->json($psv_area, 201);
    }

    public function update_psv_area(Request $request, $id)
    {
        $area = Area::find($id);

        if (!$area) {
            return response()->json(['message' => 'Area not found'], 404);
        }

        $data = $request->validate([
            'area_name' => 'required|string',
            'area_description' => 'nullable|string',
        ]);

        $area->update($data);

        return response()->json($area);
    }



    /*
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
    }*/

}
