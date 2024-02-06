<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function registerUser(Request $request){
        User::create([
            "username" => $request -> username, 
            "email" => $request -> email,  
            "password" => $request -> password
        ]);

        if($user.statusCode == 200){
            return "Register Success";
        }

        return response()->json(['message' => 'User created successfully!'], 200, $headers);

    }

    public function loginUser(Request $request){
        $user = User::where('username', $request->username)->where('password', $request->password)->get();
        return $user[0];
    }
}
