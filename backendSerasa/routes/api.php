<?php

use App\Http\Controllers\KeranjangController;
use App\Http\Controllers\PesananController;
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
Route::get('/get-address', [UserController::class, 'getAlamat']);
Route::put('/update-utama/{id}/{userID}', [UserController::class, 'updateAlamatUtama']);
Route::post('/input-help', [UserController::class, 'inputBantuan']);
Route::post('/edit-profil', [UserController::class, 'editProfil']);
Route::get('/get-resto', [RestoController::class, 'getResto']);
Route::get('/get-produkResto', [RestoController::class, 'getProdukResto']);
Route::post('/input-bantuan', [BantuanController::class, 'inputBantuan']);
Route::post('/create-produkKomunitas', [ProdukKomunitasController::class, 'createProdukKomunitas']);
Route::post('/get-voucher', [VoucherController::class, 'getVoucher']);
Route::post('/get-bankSampah', [BankSampahController::class, 'getBankSampah']);
Route::get('/get-riwayatTukarSampah', [BankSampahController::class, 'getRiwayatTukarSampah']);
Route::post('/create-pesanan', [PesananController::class,'createPesanan']);
Route::post('/create-detailPesanan', [PesananController::class,'createDetailPesanan']);
Route::put('/update-pesanan/{id}', [PesananController::class,'updatePesanan']);
Route::post('/create-keranjang', [KeranjangController::class, 'createKeranjang']);
Route::put('/update-qtyDetail/{id}', [KeranjangController::class, 'updateQtyDetail']);
Route::put('/updateProductCart/{id}', [KeranjangController::class, 'updateProductCart']);
Route::get('/get-keranjang', [KeranjangController::class, 'getKeranjang']);
Route::get('/get-detailKeranjang', [KeranjangController::class, 'getDetailKeranjang']);
Route::get('/get-pembayaran', [PesananController::class, 'getPembayaran']);
Route::get('/get-komunitas', [ProdukKomunitasController::class, 'getProdukKomunitas']);
Route::get('/get-pesanan', [PesananController::class, 'getPesanan']);
Route::get('/get-detailPesanan', [PesananController::class, 'getDetailPesanan']);
Route::post('/create-detailPesananKomunitas', [PesananController::class,'createDetailPesananKomunitas']);
