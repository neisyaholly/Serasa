<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailKeranjang extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $fillable = [
        'keranjangID',
        'produkID',
        'qty',
    ];
}
