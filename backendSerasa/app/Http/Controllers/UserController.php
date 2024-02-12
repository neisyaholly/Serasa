<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
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
            $cred->role = 1;
            $cred->save();
            $response = ['status' => 200, 'message' => 'Register Successfully! Welcome to Serasa'];
            return response()->json($response);
        }catch(Exception $e){
            $response = ['status' => 500, 'message' => $e];
        }
    }

    public function loginUser(Request $request){
        $user = User::where('email', $request->email)->first(); //pake ->get() dapetnya user[0]

        if ($user != '[]' && Hash::check($request->password, $user->password)) {
            // return $user[0];
            $token = $user->createToken('Personal Access Token')->plainTextToken;
            $response = ['status' => 200, 'token' => $token, 'user' => $user, 'message' => 'Successfully Login! Welcome Back'];
            return response()->json($response);
        }else if($user == '[]'){
            $response = ['status' => 500, 'message' => 'No account found with this email'];
            return response()->json($response);
        }else{
            $response = ['status' => 500, 'message' => 'Wrong email or password! Please try again'];
            return response()->json($response);
        }

    }
}
