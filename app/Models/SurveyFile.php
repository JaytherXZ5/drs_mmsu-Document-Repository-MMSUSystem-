<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SurveyFile extends Model
{
    use HasFactory;
    
    protected $fillable=[
        'survey_instrument_id',
        'compliance_report_id',
        'ppps_id',
        'description',
        'file_id',
        'psv_area_id'

    ];

    public $timestamps = false;

    public function file()
    {
        return $this->belongsTo(File::class);
    }
    public function psv_area()
    {
        return $this->belongsTo(PsvArea::class);
    }
    public function surveyInstrument(){
        return $this->belongsTo(SurveyInstrument::class);
    }

    public function complianceReport(){
        return $this->belongsTo(ComplianceReport::class);
    }

    public function ppps(){
        return $this->belongsTo(Ppp::class);
    }
    
}
