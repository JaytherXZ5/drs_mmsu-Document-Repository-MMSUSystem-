<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Degree extends Model
{
    use HasFactory;
    protected $fillable = ['degree'];

    public function users()
    {
        return $this->hasMany(User::class);
    }
    public function folders()
    {
        return $this->hasMany(Folder::class);
    }
}
