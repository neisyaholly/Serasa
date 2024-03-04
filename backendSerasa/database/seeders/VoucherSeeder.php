<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class VoucherSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('vouchers')->insert([
            [
                'restoID' => '1',
                'nama' => 'Caramel Frappucino Large',
                'poin' => '100',
                'deskripsi' => 'Lorem ipsum',
                'sk' => 'Lorem ipsum',
                'exp' => '2025-03-03',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/starbucks.png',
            ],
            // Add more dummy users as needed
        ]);
    }
}
