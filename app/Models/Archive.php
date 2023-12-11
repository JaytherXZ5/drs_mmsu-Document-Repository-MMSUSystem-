<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Archive extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'user_id', 'name_generate', 'type', 'size'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }
    public function degree()
    {
        return $this->belongsTo(Degree::class);
    }
    public function administrative()
    {
        return $this->belongsTo(Administrative::class);
    }

    public $timestamps = false;
}
