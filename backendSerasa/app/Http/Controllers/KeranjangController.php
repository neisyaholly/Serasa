<?php

namespace App\Http\Controllers;
use App\Models\Keranjang;
use App\Models\DetailKeranjang;
use Illuminate\Http\Request;


class KeranjangController extends Controller
{
    public function createKeranjang(Request $request){
        try{
            $keranjang = new Keranjang();
            $keranjang->userID = $request->userID;
            $keranjang->save();
            return response()->json($keranjang, 200);
        }catch(Exception $e){
            return response()->json($keranjang, 500);
        }
    }

    public function createDetailKeranjang(Request $request){
        try{
            $detailKeranjang = new DetailKeranjang();
            $detailKeranjang->keranjangID = $request->keranjangID;
            $detailKeranjang->produkID = $request->produkID;
            $detailKeranjang->qty = $request->qty;
            $detailKeranjang->save();
            $response = ['status' => 200, 'message' => 'Detail Keranjang created successfully'];
            $detail = DetailKeranjang::find($detailKeranjang->id);
            return response()->json($detail, 200);
        }catch(Exception $e){
            $response = ['status' => 500, 'message' => $e->getMessage()];
            return response()->json($response, 500);
        }
    }

    public function updateQtyDetail(Int $id, Int $qty){
        try{
            $detailKeranjang = DetailKeranjang::where('id', $id)->update(['qty'=>$qty]);
            $response = ['status' => 200, 'message' => 'Cart product updated successfully'];
            return response()->json($response, 200);
            }catch (Exception $e){
            $response = ['status' => 500, 'message' => $e->getMessage()];
            return response()->json($response, 500);
        }
    }

    public function getKeranjang(){
        $keranjang = Keranjang::all();
        return response()->json($keranjang, 200);
    }

    public function getDetailKeranjang(){
        $detailKeranjang = DetailKeranjang::all();
        return response()->json($detailKeranjang, 200);
    }
}
