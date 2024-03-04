<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Resto extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $fillable = [
        'nama',
        'cabang',
        'lokasi',
        'rating',
        'kategori',
        'logo',
    ];

}
