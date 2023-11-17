<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\AreaController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\FileController;
use App\Http\Controllers\FileFolderController;
use App\Http\Controllers\InstitutionController;
use App\Http\Controllers\UserRoleController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware(['auth', 'verified'])->post('/folder/create', [FileFolderController::class, 'create_folder']);
Route::get('/file/get-data/{id}', [FileController::class, 'getData']);
Route::get('/home/get-data', [FileFolderController::class, 'getFileFolders']);
Route::get('check-token', [AuthController::class, 'checkToken']);
Route::middleware(['auth', 'verified'])->get('isAdmin', [AuthController::class, 'isAdmin']);
Route::post('login',[AuthController::class, 'login']);
Route::post('register',[AuthController::class, 'register']);
Route::post('logout',[AuthController::class, 'logout']);

//areas
Route::get('/areas', [AreaController::class, 'get_area']);
Route::post('/create_area', [AreaController::class, 'create_area']);
Route::get('/areas/total-count', [AreaController::class, 'getTotalAreasCount']);
Route::put('/areas/{id}', [AreaController::class, 'update']);
Route::delete('/areas/{id}', [AreaController::class, 'destroy']);


//psv_areas
Route::get('/psv_areas', [AreaController::class, 'get_psv_areas']);
Route::post('/create_psv_area', [AreaController::class, 'create_psv_area']);
Route::get('/psv_areas/total-count', [AreaController::class, 'getTotalPsvAreasCount']);
Route::put('/psv_areas/{id}', [AreaController::class, 'update_psv_area']);
Route::delete('/psv_areas/{id}', [AreaController::class, 'destroy_psv_area']);
//ia_areas
Route::get('/ia_areas', [AreaController::class, 'get_ia_areas']);
Route::post('/create_ia_area', [AreaController::class, 'create_ia_area']);
Route::get('/ia_areas/total-count', [AreaController::class, 'getTotalIaAreasCount']);
Route::put('/ia_areas/{id}', [AreaController::class, 'update_ia_area']);
Route::delete('/ia_areas/{id}', [AreaController::class, 'destroy_ia_area']);



Route::post('/create_ia_area', [AreaController::class, 'create_ia_area']);

Route::get('/users', [AccountController::class, 'getUsers']);
Route::get('/institutions', [InstitutionController::class, 'getInstitutions']);
Route::get('/user_roles', [UserRoleController::class, 'getUserRoles']);