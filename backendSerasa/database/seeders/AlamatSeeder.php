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
            [
                'nama' => 'Blue Tower',
                'jalan' => 'Jalan Serpong No. 20',
                'kec' => 'Serpong',
                'kel' => 'Pakualam',
                'kab_kota' => 'Kabupaten Tangerang', // Diacak
                'provinsi' => 'Banten',
                'kode_pos' => '16810',
                'userID' => '2', // Diacak
                'utama' => '1',
            ],
            [
                'nama' => 'Red House',
                'jalan' => 'Jalan Serpong No. 50',
                'kec' => 'Serpong',
                'kel' => 'Pakualam',
                'kab_kota' => 'Kabupaten Tangerang', // Diacak
                'provinsi' => 'Banten',
                'kode_pos' => '16810',
                'userID' => '2', // Diacak
                'utama' => '0',
            ],
            [
                'nama' => 'Green Residence',
                'jalan' => 'Jalan Sukabumi No. 10',
                'kec' => 'Cikakak',
                'kel' => 'Cikawung',
                'kab_kota' => 'Kabupaten Bogor',
                'provinsi' => 'Jawa Barat',
                'kode_pos' => '16810',
                'userID' => '3', // Diacak
                'utama' => '1',
            ],
            [
                'nama' => 'Sunset Villa',
                'jalan' => 'Jalan Raya Bogor No. 30',
                'kec' => 'Ciomas',
                'kel' => 'Purwakarta',
                'kab_kota' => 'Kabupaten Bogor',
                'provinsi' => 'Jawa Barat',
                'kode_pos' => '16810',
                'userID' => '4',
                'utama' => '1',
            ],
            [
                'nama' => 'Starlight Palace',
                'jalan' => 'Jalan Puncak No. 40',
                'kec' => 'Cisaat',
                'kel' => 'Cipinang',
                'kab_kota' => 'Kabupaten Sukabumi', // Diacak
                'provinsi' => 'Jawa Barat',
                'kode_pos' => '16810',
                'userID' => '4', // Diacak
                'utama' => '0',
            ],
            // Add more dummy users as needed
        ]);
    }
}
