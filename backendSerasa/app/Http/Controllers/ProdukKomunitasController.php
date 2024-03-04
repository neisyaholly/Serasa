<?php

namespace App\Http\Controllers;
use App\Models\ProdukKomunitas;
use Illuminate\Http\Request;

class ProdukKomunitasController extends Controller
{
    public function createProdukKomunitas(){
        //sementara
        $produkKomunitas = ProdukKomunitas::all();
        return response()->json($produkKomunitas, 200);
    }
}
