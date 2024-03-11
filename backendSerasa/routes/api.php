<?php

use App\Http\Controllers\KeranjangController;
use App\Http\Controllers\PesananController;
use App\Models\ProdukResto;
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
Route::delete('/deleteUser/{id}', [UserController::class, 'deleteUser']);
Route::post('/poin-qr', [UserController::class, 'addPoin']);
Route::get('/get-resto', [RestoController::class, 'getResto']);
Route::get('/get-produkResto', [RestoController::class, 'getProdukResto']);
Route::post('/input-bantuan', [BantuanController::class, 'inputBantuan']);
Route::post('/create-produkKomunitas', [ProdukKomunitasController::class, 'createProdukKomunitas']);
Route::post('/get-voucher', [VoucherController::class, 'getVoucher']);
Route::get('/get-voucherUser', [VoucherController::class, 'getVoucherUser']);
Route::post('/get-bankSampah', [BankSampahController::class, 'getBankSampah']);
Route::get('/get-riwayatTukarSampah', [BankSampahController::class, 'getRiwayatTukarSampah']);
Route::put('/updateVoucherUser/{id}', [VoucherController::class, 'updateVoucherUser']);
Route::get('/get-riwayatTukarSampah', [BankSampahController::class, 'getRiwayatTukarSampah']);
Route::post('/create-pesanan', [PesananController::class,'createPesanan']);
Route::put('/update-pesanan/{id}', [PesananController::class,'updatePesanan']);
Route::post('/create-keranjang', [KeranjangController::class, 'createkeranjang']);
Route::post('/create-detailKeranjang', [KeranjangController::class, 'createDetailKeranjang']);
Route::put('/update-qtyDetail/{id}/{qty}', [KeranjangController::class, 'updateQtyDetail']);
Route::get('/get-keranjang', [KeranjangController::class, 'getKeranjang']);
Route::get('/get-detailKeranjang', [KeranjangController::class, 'getDetailKeranjang']);
Route::get('/get-pembayaran', [PesananController::class, 'getPembayaran']);
Route::get('/get-komunitas', [ProdukKomunitasController::class, 'getProdukKomunitas']);
Route::get('/get-allKomunitas', [ProdukKomunitasController::class, 'getAllProdukKomunitas']);
Route::post('/create-komunitas', [ProdukKomunitasController::class, 'createProdukKomunitas']);
Route::get('/get-pesanan', [PesananController::class, 'getPesanan']);
Route::get('/get-detailPesanan', [PesananController::class, 'getDetailPesanan']);
Route::post('/create-detailPesanan', [PesananController::class,'createDetailPesanan']);
Route::put('/update-quantityProdukKomunitas/{id}', [ProdukKomunitasController::class,'updateQuantityProdukKomunitas']);
Route::put('/update-quantityProdukResto/{id}/{qty}', [RestoController::class,'updateQuantityProdukResto']);
Route::delete('/deleteKeranjang/{id}', [KeranjangController::class, 'deleteKeranjang']);
Route::delete('/deleteDetailKeranjang/{id}', [KeranjangController::class, 'deleteDetailKeranjang']);