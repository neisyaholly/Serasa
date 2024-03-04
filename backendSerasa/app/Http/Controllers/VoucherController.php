<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Voucher;
use App\Models\VoucherUser;
use App\Models\RiwayatTukarVoucher;
use Illuminate\Http\Request;

class VoucherController extends Controller
{
    public function getVoucher(){
        $vouchers = Voucher::all();
        return response()->json($vouchers, 200);
    }

    //bikin function buat createVoucherUser

    //bikin function buat tukarVoucher (data riwayatnya)
}
