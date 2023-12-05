<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class File extends Model
{   
    use HasFactory;

    protected $fillable =['name', 'type', 'size', 'folder_id', 'name_generate', 'user_id'];

    public function folder()
    {
        return $this->belongsTo(Folder::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public $timestamps = false;
}
