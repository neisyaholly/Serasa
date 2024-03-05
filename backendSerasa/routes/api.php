<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RestoController;
use App\Http\Controllers\BantuanController;
use App\Http\Controllers\ProdukKomunitasController;
use App\Http\Controllers\VoucherController;
use App\Http\Controllers\BankSampahController;

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

//gatau ni yang get get methodnya bener post atau harus diganti get, tolong sesuaikan tutor yang kalian ikuti ges
//yang routesnya UserController jangan diubah yh maaci
Route::post('/register-user', [UserController::class, 'registerUser']);
Route::post('/login-user', [UserController::class, 'loginUser']);
Route::post('/add-address', [UserController::class, 'addAlamat']);
Route::get('/get-resto', [RestoController::class, 'getResto']);
Route::get('/get-produkResto', [RestoController::class, 'getProdukResto']);
Route::post('/input-bantuan', [BantuanController::class, 'inputBantuan']);
Route::post('/create-produkKomunitas', [ProdukKomunitasController::class, 'createProdukKomunitas']);
Route::post('/get-voucher', [VoucherController::class, 'getVoucher']);
Route::post('/get-bankSampah', [BankSampahController::class, 'getBankSampah']);
