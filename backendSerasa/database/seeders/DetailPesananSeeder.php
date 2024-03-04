<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DetailPesananSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('detail_pesanans')->insert([
            [
                'pesananID' => '1',
                'produkID' => '1',
                'qty' => '1',
             ],
            // Add more dummy users as needed
        ]);
    }
}
