<?php

namespace App\Http\Controllers;

use App\Models\ComplianceReport;
use App\Models\PsvArea;
use App\Models\PsvParameter;
use App\Models\SurveyIndicatorType;
use App\Models\SurveyInstrument;
use App\Models\SurveyType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SurveyInstrumentController extends Controller
{

    public function getSurveyTypes(){
        $survey_types = SurveyType::all();

        return response()->json($survey_types);
    }

    public function getSurveyIndicatorTypes(){
        $survey_indicator_types = SurveyIndicatorType::all();

        return response()->json($survey_indicator_types);
    }

    public function getSurveyInstruments(){
        $survey_instruments = SurveyInstrument::orderBy('survey_order')->get();
        return response()->json($survey_instruments);
    }
    public function getComplianceReports(){
        $compliance_reports = ComplianceReport::orderBy('compliance_order')->get();

        return response()->json($compliance_reports);
    }

    public function getPsvParameters(){
        $psv_parameters = PsvParameter::all();

        return response()->json($psv_parameters);
    }

    public function totalSurveyInstrument(){
        $totalAreasCount = PsvArea::count();
        return response()->json(['total_survey_instrument' => $totalAreasCount]);
    }



    public function submitSurveyInstrument(Request $request){
        $request->validate([
            'survey_name' => ['required'],
            'type' => ['required'],
            'survey_indicator' =>['required'],
        ]);
        $user = Auth::user();
        
         

        $survey_instrument = SurveyInstrument::create([
            'survey_name' => $request->survey_name,
            'type' => $request->type,
            'survey_order' => $request->survey_order,
            'survey_indicator' => $request->survey_indicator,
            'user_id' => $user->id,
        ]);

        
        return response()->json(
            [
                'message' => 'Survey Instrument Submitted!',
                'survey_instrument' =>  $survey_instrument
        ], 201);

    }

    public function submitComplianceReport(Request $request){
        $request->validate([
            'psv_area_id' => ['required'],
            'aaccup_recommendations' => ['required'],
            'action_taken' => ['required'],
            'percent_compliance' => ['required']
        ]);
        $user = Auth::user();

        $compliance_report = ComplianceReport::create([
            'psv_area_id' => $request->psv_area_id,
            'compliance_order' => $request->compliance_order,
            'aaccup_recommendations' => $request->aaccup_recommendations,
            'action_taken' => $request->action_taken,
            'percent_compliance' => $request->percent_compliance,
            'user_id' => $user->id,
        ]);

        return response()->json(
            [
                'message' => 'Compliance Report Submitted!',
                'compliance_report' => $compliance_report,
            ], 201);



    }


}
