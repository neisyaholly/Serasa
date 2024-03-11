<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Models\ProdukKomunitas;
use App\Models\User;
use App\Models\Alamat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProdukKomunitasController extends Controller
{
    public function getProdukKomunitas(){
        $produkKomunitas = DB::table('produk_komunitas')
        ->join('users', 'produk_komunitas.userID', '=', 'users.id')
        ->join('alamats', 'users.id', '=', 'alamats.userID')
        ->select('produk_komunitas.id','produk_komunitas.userID','produk_komunitas.nama', 'produk_komunitas.harga', 'produk_komunitas.deskripsi', 'produk_komunitas.exp', 'produk_komunitas.foto', 'produk_komunitas.qty','users.name', 'alamats.kab_kota')
        ->where('alamats.utama', 1)
        ->where('produk_komunitas.qty', 1)
        ->get();
        return response()->json($produkKomunitas, 200);
    }
    public function getAllProdukKomunitas(){
        $produkKomunitas = DB::table('produk_komunitas')
        ->join('users', 'produk_komunitas.userID', '=', 'users.id')
        ->join('alamats', 'users.id', '=', 'alamats.userID')
        ->select('produk_komunitas.id','produk_komunitas.userID','produk_komunitas.nama', 'produk_komunitas.harga', 'produk_komunitas.deskripsi', 'produk_komunitas.exp', 'produk_komunitas.foto', 'produk_komunitas.qty','users.name', 'alamats.kab_kota')
        ->where('alamats.utama', 1)
        ->get();
        return response()->json($produkKomunitas, 200);
    }

    public function createProdukKomunitas(Request $R){

        // Storage::put('local')->put('public', 'Contents');
        try{
            $pk = new ProdukKomunitas();
            $pk->userID = $R->userID;
            $pk->nama = $R->nama;
            $pk->harga = $R->harga;
            $pk->exp = $R->exp;
            $pk->deskripsi = $R->deskripsi;
            $pk->qty = 1;
            $pk->save();
            $response = ['status' => 200, 'pk' => $pk, 'message' => 'Successfully!'];
            return response()->json($pk, 200);
        }catch(Exception $e){
            $response = ['status' => 500, 'message' => $e];
        }

    }

    public function updateQuantityProdukKomunitas(Request $request, $id){
        $produkKomunitas = ProdukKomunitas::find($id);
        if ($produkKomunitas) {
            $produkKomunitas->qty = $produkKomunitas->qty - 1;
            $produkKomunitas->save();
        }
    }

}
