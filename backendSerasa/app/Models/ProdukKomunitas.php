<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProdukKomunitas extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $fillable = [
        'userID',
        'nama',
        'deskripsi',
        'harga',
        'exp',
        'foto',
    ];
}
