<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RiwayatTukarSampahSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('riwayat_tukar_sampahs')->insert([
            [
                'userID' => '1',
                'berat' => '10',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'userID' => '1',
                'berat' => '30',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'userID' => '1',
                'berat' => '5',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'userID' => '2',
                'berat' => '6',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'userID' => '2',
                'berat' => '0.7',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'userID' => '3',
                'berat' => '6',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'userID' => '4',
                'berat' => '100',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            // Add more dummy users as needed
        ]);
    }
}
