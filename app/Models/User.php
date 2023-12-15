<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'username',
        'email',
        'password',
        'institution_id',
        'role_id',
        'administrative_id',
        'psv_area_id',
        'degree_id'
    ];

    public function role(){
        return $this->belongsTo(Role::class);
    }

    public function psv_area(){
        return $this->belongsTo(PsvArea::class);

    }

    public function administrative(){
        return $this->belongsTo(Administrative::class);
    }

    public function degree()
    {
        return $this->belongsTo(Degree::class);
    }
 
    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }

    public function folders()
    {
        return $this->hasMany(Folder::class);
    }
    public function files()
    {
        return $this->hasMany(File::class);
    }
    public function archives()
    {
        return $this->hasMany(Archive::class);
    }
    public function surveyInstruments(){
        return $this->hasMany(SurveyInstrument::class);
    }

    public function complianceReports(){
        return $this->hasMany(ComplianceReport::class);
    }
    public function ppps(){
        return $this->hasMany(Ppp::class);
    }


    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];
}
