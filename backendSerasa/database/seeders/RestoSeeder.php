<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RestoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('restos')->insert([
            [
                'nama' => 'Starbucks',
                'cabang' => 'Sentul City',
                'lokasi' => 'Sentul City, Bogor',
                'rating' => '4.8',
                'kategori' => 'Minuman, Roti',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/starbucks.png',
            ],
            // Add more dummy users as needed
        ]);
    }
}
