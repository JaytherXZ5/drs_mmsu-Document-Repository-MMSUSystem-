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
        'user_role_id',
        'user_type_id',
        'degree_id'
    ];

    public function user_role()
    {
        return $this->belongsTo(UserRole::class);
    }
    public function degree()
    {
        return $this->belongsTo(Degree::class);
    }
    public function user_type()
    {
        return $this->belongsTo(UserType::class);
    }
    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }

    public function folders()
    {
        return $this->hasMany(Folder::class);
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
