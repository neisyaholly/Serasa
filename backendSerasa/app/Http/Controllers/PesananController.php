<?php

namespace App\Http\Controllers;
use App\Models\DetailPesanan;
use App\Models\Pesanan;
use Illuminate\Http\Request;

class PesananController extends Controller
{
    //bikin function buat pesanan, detailpesanan, sama pembayaran di sinii. jangan lupa routesnya

    public function createPesanan(Request $request){
        try{
            $pesanan = new Pesanan();
            $pesanan->userID = $request->userID;
            $pesanan->sellerID = $request->sellerID;
            $pesanan->pembayaranID = $request->pembayaranID;
            $pesanan->jenis = $request->jenis;
            $pesanan->selesai = 0;
            $pesanan->save();
    
            foreach ($request->detailPesanan as $detail) {
                $detailPesanan = new DetailPesanan();
                $detailPesanan->pesananID = $pesanan->id;
                $detailPesanan->produkID = $detail['produkID'];
                $detailPesanan->qty = $detail['qty'];
                $detailPesanan->save();
            }
    
            $response = ['status' => 200, 'message' => 'Pesanan created successfully'];
            return response()->json($response, 200);
        }catch(Exception $e){
            $response = ['status' => 500, 'message' => $e->getMessage()];
            return response()->json($response, 500);
        }
    }
    
    public function updatePesanan(Request $R, Int $id){
        $pesanan = Pesanan::where('id', $id)->update(['selesai'=>1]);
    }
}
