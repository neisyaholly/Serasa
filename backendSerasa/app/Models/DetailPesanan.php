<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailPesanan extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $fillable = [
        'pesananID',
        'produkID',
        'qty',
    ];
}
