<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RiwayatTukarVoucher extends Model
{
    use HasFactory;
    protected $fillable = [
        'userID',
        'voucherID',
    ];
}
