<?php

namespace App\Http\Controllers;
use App\Models\BankSampah;
use App\Models\RiwayatTukarSampah;
use Illuminate\Http\Request;

class BankSampahController extends Controller
{
    public function getBankSampah(){
        $bank = BankSampah::all();
        return response()->json($bank, 200);
    }

    //bikin function tukarSampah di sini (riwayatnya)

}
