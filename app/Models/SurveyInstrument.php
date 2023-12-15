<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SurveyInstrument extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'survey_order',
        'parameter_id',
        'type',
        'survey_level',
        'parent_id',
        'survey_name',
        'survey_indicator',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function surveyFiles(){
        return $this->hasMany(SurveyFile::class);
    }
}
