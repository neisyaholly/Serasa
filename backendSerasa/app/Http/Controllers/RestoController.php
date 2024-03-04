<?php

namespace App\Http\Controllers;
use App\Models\Resto;
use App\Models\ProdukResto;
use Illuminate\Http\Request;

class RestoController extends Controller
{
    public function getResto(){
        $resto = Resto::all();
        return response()->json($resto, 200);
    }

    public function getProdukResto(){
        $produkResto = ProdukResto::all();
        return response()->json($produkResto, 200);
    }
}
