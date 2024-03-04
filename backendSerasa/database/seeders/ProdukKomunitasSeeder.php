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
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/starbucks.png',
            ],
            // Add more dummy users as needed
        ]);
    }
}
