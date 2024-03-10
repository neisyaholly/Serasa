<?php

namespace App\Http\Controllers;
use App\Models\DetailPesanan;
use App\Models\Pembayaran;
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
            $pesanan->ongkir = $request->ongkir;
            $pesanan->jenis = $request->jenis;
            $pesanan->selesai = 0;
            $pesanan->save();
            return response()->json($pesanan, 200);
        }catch(Exception $e){
            return response()->json($pesanan, 500);
        }
    }

    public function createDetailPesanan(Request $request){
        try{
            $detailPesanan = new DetailPesanan();
            $detailPesanan->pesananID = $request->pesananID;
            $detailPesanan->produkID = $request->produkID;
            $detailPesanan->qty = $request->qty;
            $detailPesanan->save();
            return response()->json($detailPesanan, 200);
        }catch(Exception $e){
            return response()->json($detailPesanan, 500);
        }
    }

    public function updatePesanan(Request $R, Int $id){
        $pesanan = Pesanan::where('id', $id)->update(['selesai'=>1]);
    }

    public function getPembayaran(){
        $pembayaran = Pembayaran::all();
        return response()->json($pembayaran, 200);
    }

    public function getPesanan(){
        $pesanan = Pesanan::all();
        return response()->json($pesanan, 200);
    }

    public function getDetailPesanan(){
        $detailpesanan = DetailPesanan::all();
        return response()->json($detailpesanan, 200);
    }

}
