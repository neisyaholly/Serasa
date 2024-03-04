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
            ],
            [
                'userID' => '1',
            ],
            [
                'userID' => '2',
            ],
            // Add more dummy users as needed
        ]);
    }
}
