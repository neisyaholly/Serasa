<?php

namespace App\Http\Controllers;
use App\Models\Bantuan;
use Illuminate\Http\Request;

class BantuanController extends Controller
{
    public function inputBantuan(){
        //sementara
        $bantuans = Bantuan::all();
        return response()->json($bantuans, 200);
    }

}
