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
                $detailKeranjang->produkID = $detail('produkID');
                $detailKeranjang->qty = $detail('qty');
                $detailKeranjang->save();
            }
        
            $response = ['status' => 200, 'message' => 'Keranjang created successfully'];
            return response()->json($response, 200);
        }catch(Exception $e){
            $response = ['status' => 500, 'message' => $e->getMessage()];
            return response()->json($response, 500);
        }
    }

    public function updateQtyDetail(Request $R, Int $id){
        try{
            $detailKeranjang = DetailKeranjang::where('id', $id)->update(['qty'=>$R->qty]);
                $response = ['status' => 200, 'message' => 'Cart product updated successfully'];
                return response()->json($response, 200);
            }catch (Exception $e){
            $response = ['status' => 500, 'message' => $e->getMessage()];
            return response()->json($response, 500);
        }
    }

    public function updateProductCart(Request $request, Int $id){
        try{
            // $keranjang = Keranjang::where('id', $request->id);
            
            foreach ($request->detailKeranjang as $detail){
                // $detailKeranjang = DetailKeranjang::where('keranjangID', $keranjang->id)->where('keranjangID', $detail['keranjangID'])->first();
                
                // if($detailKeranjang){
                //     $detailKeranjang->qty = $detail['qty'];
                //     $detailKeranjang->save();
                //     continue;
                // }
                
                $newDetailKeranjang = new DetailKeranjang();
                $newDetailKeranjang->keranjangID = $id;
                $newDetailKeranjang->produkID = $detail['produkID'];
                $newDetailKeranjang->qty = $detail['qty'];
                $newDetailKeranjang->save();

                // if ($detailKeranjang) {
                //     $detailKeranjang->update(['qty' => $detail['qty']]);
                // } else {
                //     DetailKeranjang::create([
                //         'keranjangID' => $keranjang->id,
                //         'id' => $detail['keranjangID'],
                //         'qty' => $detail['qty']
                //     ]);
                // }
            }
            
            $response = ['status' => 200, 'message' => 'Cart updated successfully'];
            return response()->json($response, 200);
        }catch (Exception $e){
            $response = ['status' => 500, 'message' => $e ->getMessage()];
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
