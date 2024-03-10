<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RiwayatTukarVoucherSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('riwayat_tukar_vouchers')->insert([
            [
                'userID' => '1',
                'voucherID' => '1',
            ],
            // Add more dummy users as needed
        ]);
    }
}
