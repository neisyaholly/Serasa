<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BantuanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('bantuans')->insert([
            [
                'userID' => '1',
                'isi' => 'tolongg gatau cara pakenya',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            // Add more dummy users as needed
        ]);
    }
}
