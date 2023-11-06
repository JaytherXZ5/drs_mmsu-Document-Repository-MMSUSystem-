<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response;

class AuthController extends Controller
{
    public function register(Request $request){

        $request->validate([
            'name' => ['required'], 
            'email' =>['required', 'email', 'unique:users'],
            'password' =>['required', 'min:6', 'confirmed ']
        ]);

        User::create([ 
            'name' => $request->name,
            'email' =>$request->email,
            'password' =>Hash::make($request->password)
        ]);

        
    }

    ////////////////////////////login
    public function login(Request  $request){
        
        $request->validate([
            'email' => ['required', 'email'], 
            'password' => ['required']
        ]);
        
        

        if(!Auth::attempt($request->only('email', 'password'))){
            return response([
                'message' => 'Invalid Credentials'
            ], Response::HTTP_UNAUTHORIZED);

        }

        

       //OVERRIDE
        $user = User::where('email', request('email'))->first();

        $token = $user->createToken(time())->plainTextToken;
       
        if(Hash::check(request('password'), $user->getAuthPassword())){
            
            return [
                'token' => $token

            ];
        }

        Auth::login($user);

       
    }
    public function isAdmin(Request $request){

        $user = User::where('email', request('email'))->first();;

        if ($user->isAdmin) {
            return response([
                'message' => 'admin',
                'status' => 200
            ]);
        }
    }


    public function checkToken()
    {
        $user = Auth::user();

        if (!$user->tokens->isEmpty()) {
            // The user has a personal access token
            return response()->json(['message' => 'Token exists']);
        } else {
            // The user does not have a personal access token
            return response()->json(['message' => 'Token does not exist'], Response::HTTP_UNAUTHORIZED);
        }
    }

    public function logout(Request $request){
        $request->user()->tokens()->delete();
        Auth::logout();
        
    }
}
