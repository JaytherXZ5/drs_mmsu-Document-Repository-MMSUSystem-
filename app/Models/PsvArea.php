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
    protected $casts = [
        'area_status' => 'boolean',
    ];
}
