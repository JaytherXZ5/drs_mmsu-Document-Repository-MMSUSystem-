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
            'username' => ['required','unique:users' ],
            'password' =>['required', 'min:6', 'confirmed '],
            'user_role_id' => ['required', 'exists:user_roles,id'],
            'institution_id' => ['required', 'exists:institutions,id'],
            'user_type_id' => ['required', 'exists:user_types,id'],
            'degree_id' => ['required', 'exists:degrees,id'],
        ]);

        User::create([ 
            'name' => $request->name,
            'email' =>$request->email,
            'username' =>$request->username,
            'password' =>Hash::make($request->password),
            'user_role_id' => $request->user_role_id,
            'user_type_id' => $request->user_type_id,
            'degree_id' => $request->degree_id,
            'institution_id' => $request->institution_id,

        ]);
        return response()->json(['message' => 'User registered successfully'], 201);
        
    }

    ////////////////////////////login
    /*public function login(Request  $request){
        
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

       
    }*/

    public function login(Request $request)
{
    $request->validate([
        'login' => ['required'],
        'password' => ['required']
    ]);

    $loginField = filter_var($request->input('login'), FILTER_VALIDATE_EMAIL)
        ? 'email'
        : 'username';

    $credentials = [
        $loginField => $request->input('login'),
        'password' => $request->input('password'),
    ];

    if (!Auth::attempt($credentials)) {
        return response([
            'message' => 'Invalid Credentials'
        ], Response::HTTP_UNAUTHORIZED);
    }

    $user = $request->user();
    $token = $user->createToken(time())->plainTextToken;

    return [
        'token' => $token
    ];
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
