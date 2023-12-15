<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ppp extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'psv_area_id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function psv_area()
    {
        return $this->belongsTo(PsvArea::class);
    }
    public function surveyFiles(){
        return $this->hasMany(SurveyFile::class);
    }
    public $timestamps = false;
}
