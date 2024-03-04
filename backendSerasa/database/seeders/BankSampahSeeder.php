<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BankSampahSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('bank_sampahs')->insert([
            [
                'nama' => 'Rumah Talenta BCA',
                'lokasi' => 'Jalan Pakuan No. 5',
            ],
            [
                'nama' => 'Bellanova Sentul',
                'lokasi' => 'Jalan Pakuan No. 1',
            ],
            // Add more dummy users as needed
        ]);
    }
}
