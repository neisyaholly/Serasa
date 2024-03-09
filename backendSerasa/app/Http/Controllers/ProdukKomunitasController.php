<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Models\ProdukKomunitas;
use App\Models\User;
use App\Models\Alamat;
use Illuminate\Http\Request;

class ProdukKomunitasController extends Controller
{
    public function getProdukKomunitas(){
        $produkKomunitas = DB::table('produk_komunitas')
        ->join('users', 'produk_komunitas.userID', '=', 'users.id')
        ->join('alamats', 'users.id', '=', 'alamats.userID')
        ->select('produk_komunitas.id', 'produk_komunitas.userID', 'produk_komunitas.nama', 'produk_komunitas.harga', 'produk_komunitas.deskripsi', 'produk_komunitas.exp', 'produk_komunitas.foto', 'users.name', 'alamats.kab_kota')
        ->where ('alamats.utama', 1)
        // ->groupBy('produk_komunitas.id')
        ->get();
        return response()->json($produkKomunitas, 200);
    }

}