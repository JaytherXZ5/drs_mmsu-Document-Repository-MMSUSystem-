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
            'password' =>['required', 'min:6', 'confirmed '],
            'user_role_id' => ['required', 'exists:user_roles,id'],
            'institution_id' => ['required', 'exists:institutions,id'],
        ]);

        User::create([ 
            'name' => $request->name,
            'email' =>$request->email,
            'password' =>Hash::make($request->password),
            'user_role_id' => $request->user_role_id,
            'institution_id' => $request->institution_id,
        ]);
        return response()->json(['message' => 'User registered successfully'], 201);
        
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

        $user = Auth::user();

        if ($user->isAdmin) {
            return response([
                'message' => 'admin',
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
