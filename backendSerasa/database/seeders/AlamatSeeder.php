<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AlamatSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('alamats')->insert([
            [
                'nama' => 'Rumah Talenta BCA',
                'jalan' => 'Jalan Pakuan No. 5',
                'kec' => 'Sumurbatu',
                'kel' => 'Babakan Madang',
                'kab_kota' => 'Kabupaten Bogor',
                'provinsi' => 'Jawa Barat',
                'kode_pos' => '16810',
                'userID' => '1',
                'utama' => '1',
            ],
            [
                'nama' => 'Dorm',
                'jalan' => 'Jalan Pakuan No. 5',
                'kec' => 'Sumurbatu',
                'kel' => 'Babakan Madang',
                'kab_kota' => 'Kabupaten Bogor',
                'provinsi' => 'Jawa Barat',
                'kode_pos' => '16810',
                'userID' => '1',
                'utama' => '0',
            ],
            // Add more dummy users as needed
        ]);
    }
}
