<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Alamat;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function registerUser(Request $R){

        $time = strtotime($R->tglLahir);
        $newformat = date('Y-m-d', $time);

        try{
            $cred = new User();
            $cred->name = $R->name;
            $cred->tglLahir = $newformat;
            $cred->telp = $R->telp;
            $cred->email = $R->email;
            $cred->password = Hash::make($R->password);
            $cred->poin = 0;
            $cred->role = 1;
            $cred->save();
            $response = ['status' => 200, 'user' => $cred, 'message' => 'Register Successfully! Welcome to Serasa'];
            return response()->json($cred, 201);
        }catch(Exception $e){
            $response = ['status' => 500, 'message' => $e];
        }
    }

    public function loginUser(Request $request){
        $user = User::where('email', $request->email)->first(); //pake ->get() dapetnya user[0]

        if ($user && Hash::check($request->password, $user->password)) {
            // return $user[0];
            $token = $user->createToken('Personal Access Token')->plainTextToken;
            $response = ['status' => 200, 'token' => $token, 'user' => $user, 'message' => 'Successfully Login! Welcome Back'];
            return response()->json($response, 200);
        }else if(!$user){
            $response = ['status' => 500, 'message' => 'No account found with this email'];
            return response()->json($response, 500);
        }else{
            $response = ['status' => 400, 'message' => 'Wrong email or password! Please try again'];
            return response()->json($response, 400);
        }
    }

    public function addAlamat(Request $R){

        try{
            $alamat = new Alamat();
            $alamat->nama = $R->nama;
            $alamat->jalan = $R->jalan;
            $alamat->kel = $R->kel;
            $alamat->kec = $R->kec;
            $alamat->kab_kota = $R->kab_kota;
            $alamat->provinsi = $R->provinsi;
            $alamat->kode_pos = $R->kode_pos;
            $alamat->userID = $R->userID;
            $alamat->utama = 0;
            $alamat->save();
            $response = ['status' => 200, 'alamat' => $alamat, 'message' => 'Register Successfully! Welcome to Serasa'];
            return response()->json($alamat, 200);
        }catch(Exception $e){
            $response = ['status' => 500, 'message' => $e];
        }
    }

    public function getAlamat(){
        $alamat = Alamat::all();
        return response()->json($alamat, 200);
    }

}
