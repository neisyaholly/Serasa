<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PembayaranSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('pembayarans')->insert([
            [
                'jenis' => 'Cash on Delivery (CoD)',
            ],
            [
                'jenis' => 'GoPay',
            ],
            [
                'jenis' => 'OVO',
            ],
            [
                'jenis' => 'ShopeePay',
            ],
            [
                'jenis' => 'Dana',
            ],
            [
                'jenis' => 'Transfer Bank',
            ],
            // Add more dummy users as needed
        ]);
    }
}
