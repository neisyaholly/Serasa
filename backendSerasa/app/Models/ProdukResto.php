<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProdukResto extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $fillable = [
        'restoID',
        'nama',
        'deskripsi',
        'harga',
        'qty',
        'foto',
    ];
}
