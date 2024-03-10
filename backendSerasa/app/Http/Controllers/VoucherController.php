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

    public function getVoucherUser(){
        $voucherUser = VoucherUser::all();
        return response()->json($voucherUser, 200);
    }

    public function updateVoucherUser(Int $id){
        try {
            $voucherUser = VoucherUser::findOrFail($id);
            $voucherUser->terpakai = 1;
            $voucherUser->save();
            return response()->json(['message' => 'Voucher user updated successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    //bikin function buat createVoucherUser

    //bikin function buat tukarVoucher (data riwayatnya)
}
