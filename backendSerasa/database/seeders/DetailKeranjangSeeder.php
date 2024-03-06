<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DetailKeranjangSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('detail_keranjangs')->insert([
            [
                'keranjangID' => '1',
                'produkID' => '1',
                'qty' => '1',
            ],
            [
                'keranjangID' => '2',
                'produkID' => '2',
                'qty' => '1',
            ],
            [
                'keranjangID' => '2',
                'produkID' => '1',
                'qty' => '2',
            ],
            [
                'keranjangID' => '3',
                'produkID' => '1',
                'qty' => '2',
            ],
            [
                'keranjangID' => '3',
                'produkID' => '6',
                'qty' => '2',
            ],
            // Add more dummy users as needed
        ]);
    }
}
