<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Folder extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'institution_id', 'user_id', 'degree_id', 'admin_office_id'];

    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function degree()
    {
        return $this->belongsTo(Degree::class);
    }
    public function admin_office()
    {
        return $this->belongsTo(Admin::class);
    }
    public function file()
    {
        return $this->hasMany(File::class);
    }
    public $timestamps = false;
}
