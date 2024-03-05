<?php

namespace App\Http\Controllers;
use App\Models\Keranjang;
use App\Models\DetailKeranjang;
use App\Models\Pesanan;
use Illuminate\Http\Request;


class KeranjangController extends Controller
{
    //bikin function di sini, jangan lupa tambahin route yh
    public function createKeranjang(Request $request){
        try{
            $keranjang = new Keranjang();
            $keranjang->userID = $request->userID;
            $keranjang->save();

            foreach ($request->detailKeranjang as $detail){
                $detailKeranjang = new DetailKeranjang();
                $detailKeranjang->keranjangID = $keranjang->id;
                $detailKeranjang->keranjangID = $detail('keranjangID');
                $detailKeranjang->keranjangID = $detail('qty');
                $detailKeranjang->save();
            }
        
            $response = ['status' => 200, 'message' => 'Keranjang created successfully'];
            return response()->json($response, 200);
        }catch(Exception $e){
            $response = ['status' => 500, 'message' => $e->getMessage()];
            return response()->json($response, 500);
        }
    }

    public function updateKeranjang(Request $R, Int $id){
        try{
            $keranjang = Keranjang::where('userID',  $R->userID);

            foreach($R->detailKeranjang as $detail){
                $detailKeranjang = detailKeranjang::where('keranjangID', $keranjang->id)->where('keranjangID', $detail['keranjangID']);
                
                $detailKeranjang->qty = $detail['qty'];
                if(!$detailKeranjang->save()){
                    throw new Exception('Failed to update cart item quantity');
                }
            }
            
            $response = ['status' => 200, 'message' => 'Cart updated successfully'];
        }catch (Exception $e){
            $response = ['status' => 500, 'message' => $e->getMessage()];
            return response()->json($response, 500);
        }
    }
    public function getKeranjang(){
        $keranjang = Pesanan::all();
        return response()->json($keranjang, 200);
    }
}
