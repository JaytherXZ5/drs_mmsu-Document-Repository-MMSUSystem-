<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\FileController;
use App\Http\Controllers\FolderController;
use App\Http\Controllers\SurveyInstrumentController;

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/{any}', function () {
    return view('app');
})->where('any', '.*');


Route::post('/register',[AuthController::class, 'register']);
Route::post('/folder/create', [FolderController::class, 'create_folder']);
Route::get('/get-folders', [FolderController::class, 'get_folders']);
Route::put('/rename-file/{id}', [FileController::class, 'renameFile']);
Route::post('/submit-ppp', [FileController::class, 'submit_ppp']);
Route::get('/get-survey-file/{id}', [FileController::class, 'getSurveyFile']);
//Route::post('/file/upload/{id}', [FileController::class, 'upload']);
Route::post('/submit-survey-instrument', [SurveyInstrumentController::class, 'submitSurveyInstrument']);
Route::post('/submit-compliance-report', [SurveyInstrumentController::class, 'submitComplianceReport']);

Route::delete('/delete-folder/{id}', [FolderController::class, 'deleteFolder']);