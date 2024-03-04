<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PesananSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('pesanans')->insert([
            [
                'userID' => '1',
                'sellerID' => '1',
                'pembayaranID' => '1',
                'jenis' => '1',
                'selesai' => '1',
            ],
            // Add more dummy users as needed
        ]);
    }
}
