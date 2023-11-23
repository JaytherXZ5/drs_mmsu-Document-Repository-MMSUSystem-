<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Area;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\PsvArea;

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

    public function updateAreaStatus(Request $request, $id)
    {
        try {
            $status = $request->input('status');

            // Using Eloquent to update the area_status column for the specific area
            Area::where('id', $id)->update(['area_status' => $status]);

            return response()->json(['message' => 'Area status updated successfully']);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
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
        $data = $request->validate([
            'area_name' => 'required|unique:areas,area_name',
            'area_description' => 'nullable|string',
            'area_status' => 'boolean',
            'area_order' => 'integer',
        ]);

        $area = PsvArea::create($data);

        return response()->json($area, 201);
    }

    public function update_psv_area(Request $request, $id)
    {
        $area = PsvArea::find($id);

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

    public function getTotalPsvAreasCount()
    {
        $totalAreasCount = PsvArea::count();
        return response()->json(['total_areas_count' => $totalAreasCount]);
    }

    public function get_psv_areas(){
        return PsvArea::orderBy('area_order')->get();    
    }

    public function updatePsvAreaStatus(Request $request, $id)
    {
        try {
            $status = $request->input('status');

            
            PsvArea::where('id', $id)->update(['area_status' => $status]);

            return response()->json(['message' => 'Area status updated successfully']);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }


    public function destroy_psv_area($id)
    {
        $area = PsvArea::find($id);

        if (!$area) {
            return response()->json(['message' => 'Area not found'], 404);
        }

        $area->delete();

        return response()->json(['message' => 'Area deleted successfully']);
    }
    
///////////////////////////////////IA AREAS////////////////////////////////


    public function create_ia_area(Request $request){
        $request->validate([
            'area_name' => 'required|unique:areas,area_name',
            'area_description' => 'nullable|string',
            'area_status' => 'boolean',
            'area_order' => 'integer',
        ]);

        $ia_area = DB::table('ia_areas')->insert($request->all());
        return response()->json($ia_area, 201);
    }

    public function update_ia_area(Request $request, $id)
    {
        $request->validate([
            'area_name' => 'required|string',
            'area_description' => 'required|string',
        ]);

        try {
            
            DB::table('ia_areas')
                ->where('id', $id)
                ->update([
                    'area_name' => $request->input('area_name'),
                    'area_description' => $request->input('area_description'),
                ]);

            return response()->json(['message' => 'Area updated successfully']);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function updateIaAreaStatus(Request $request, $id)
    {
        try {
            $status = $request->input('status');

            DB::table('ia_areas')->where('id', $id)->update(['area_status' => $status]);

            return response()->json(['message' => 'Area status updated successfully']);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function get_ia_areas(){
        return DB::table('ia_areas')->orderBy('area_order')->get();
        
    }

    public function getTotalIaAreasCount()
    {
        $totalAreasCount = DB::table('ia_areas')->count();

        return response()->json(['total_areas_count' => $totalAreasCount]);
    }

    public function destroy_ia_area($id)
    {
        try {
          
            DB::table('ia_areas')->where('id', $id)->delete();

            return response()->json(['message' => 'Area deleted successfully']);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }





   

}
