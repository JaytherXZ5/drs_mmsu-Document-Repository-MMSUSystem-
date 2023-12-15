<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PsvArea extends Model
{
    use HasFactory;
    protected $fillable=[
        'area_name',
        'area_description',
        'area_status',
        'area_order'
    ];

    public function users()
    {
        return $this->hasMany(User::class);

    }

    public function file()
    {
        return $this->hasMany(File::class);
        
    }
    public function ppps()
    {
        return $this->hasMany(Ppp::class);
    }
    public function surveyFiles()
    {
        return $this->hasMany(SurveyFile::class);
    }



    protected $casts = [
        'area_status' => 'boolean',
    ];
}
