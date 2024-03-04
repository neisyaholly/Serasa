<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProdukRestoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('produk_restos')->insert([
            [
                'restoID' => '1',
                'nama' => 'Americano',
                'deskripsi' => 'Double Shot Espresso + water',
                'harga' => '44000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/starbucks.png',
            ],
            // Add more dummy users as needed
        ]);
    }
}
