<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class VoucherUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('voucher_users')->insert([
            [
                'voucherID' => '1',
                'userID' => '1',
                'terpakai' => '0',
            ],
            // Add more dummy users as needed
        ]);
    }
}
