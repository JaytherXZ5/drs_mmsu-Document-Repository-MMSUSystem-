<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ComplianceReport extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'psv_area_id', 
        'compliance_order',
        'aaccup_recommendations',
        'action_taken',
        'percent_compliance',

    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function surveyFiles(){
        return $this->hasMany(SurveyFile::class);

    }


}
