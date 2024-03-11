<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProdukKomunitasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('produk_komunitas')->insert([
            [
                'userID' => '1',
                'nama' => 'Nasi Goreng',
                'deskripsi' => 'Lorem ipsum enak',
                'harga' => '10000',
                'exp' => '2024-03-14',
                'qty' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_komunitas/nasgor.png',
            ],
            [
                'userID' => '2',
                'nama' => 'Ropang Srikaya 3 Potong',
                'deskripsi' => 'Lorem ipsum enak',
                'harga' => '5000',
                'exp' => '2024-12-07',
                'qty' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_komunitas/ropang.png',
            ],
[
                'userID' => '3',
                'nama' => 'Soto Kuning',
                'deskripsi' => 'Lorem ipsum enak',
                'harga' => '5000',
                'exp' => '2024-12-08',
                'qty' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_komunitas/sotokuning.png',
            ],
[
                'userID' => '4',
                'nama' => 'Bakso Beranak',
                'deskripsi' => 'Lorem ipsum enak',
                'harga' => '8000',
                'exp' => '2024-12-07',
                'qty' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_komunitas/bakso.png',
            ],
[
                'userID' => '1',
                'nama' => 'Mi Ayam',
                'deskripsi' => 'Lorem ipsum enak',
                'harga' => '9000',
                'exp' => '2024-12-09',
                'qty' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_komunitas/miayam.png',
            ],
[
                'userID' => '2',
                'nama' => 'Ketoprak',
                'deskripsi' => 'Lorem ipsum enak',
                'harga' => '8000',
                'exp' => '2024-12-07',
                'qty' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_komunitas/ketoprak.png',
            ],
[
                'userID' => '3',
                'nama' => 'Kopi Susu',
                'deskripsi' => 'Lorem ipsum enak',
                'harga' => '2000',
                'exp' => '2024-12-08',
                'qty' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_komunitas/kopsu.png',
            ],
[
                'userID' => '4',
                'nama' => 'Jus Pisang',
                'deskripsi' => 'Lorem ipsum enak',
                'harga' => '3500',
                'exp' => '2024-12-07',
                'qty' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_komunitas/juspisang.png',
            ],
            // Add more dummy users as needed
        ]);
    }
}
