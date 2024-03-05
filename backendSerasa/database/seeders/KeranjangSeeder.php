<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class KeranjangSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('keranjangs')->insert([
            [
                'userID' => '1',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'userID' => '1',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'userID' => '2',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            // Add more dummy users as needed
        ]);
    }
}
