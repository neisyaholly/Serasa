<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RestoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('restos')->insert([
            [
                'nama' => 'Starbucks',
                'cabang' => 'Sentul City',
                'lokasi' => 'Jl. MH. Thamrin No. Kav. 8, Citaringgul, Kec. Babakan Madang, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.8',
                'kategori' => 'Minuman, Roti',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/starbucks.png',
            ],
            [
                'nama' => "McDonald's",
                'cabang' => 'Sentul City',
                'lokasi' => 'Jl. MH. Thamrin No. Kav. No. 9, Cipambuan, Kec. Babakan Madang, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.9',
                'kategori' => 'Nasi, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/mcd.png',
            ],
            [
                'nama' => "Marugame Udon",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.9',
                'kategori' => 'Nasi, Mie, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/marugame.jpg',
            ],
            [
                'nama' => "Solaria",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.7',
                'kategori' => 'Nasi, Mie, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/solaria.jpg',
            ],
            [
                'nama' => "Krispy Kreme",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.9',
                'kategori' => 'Roti, Camilan, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/krispy_kreme.png',
            ],
            [
                'nama' => "Subway",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.9',
                'kategori' => 'Roti, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/subway.jpg',
            ],
            [
                'nama' => "Hokben",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.7',
                'kategori' => 'Nasi, Mie, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/hokben.png',
            ],
            [
                'nama' => "A&W",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.9',
                'kategori' => 'Nasi, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/aw.png',
            ],
            [
                'nama' => "Bakmi Naga",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.9',
                'kategori' => 'Nasi, Mie, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/bakmi_naga.jpg',
            ],
            [
                'nama' => "Boost Juice Bar",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.9',
                'kategori' => 'Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/boost.jpg',
            ],
            [
                'nama' => "Chatime",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.9',
                'kategori' => 'Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/chatime.png',
            ],
            [
                'nama' => "Breadlife",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.7',
                'kategori' => 'Roti',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/breadlife.png',
            ],
            [
                'nama' => "Pizza Hut",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.7',
                'kategori' => 'Roti, Mie, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/pizzahut.png',
            ],
            [
                'nama' => "J.Co Donuts",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.9',
                'kategori' => 'Roti, Camilan, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/jco.png',
            ],
            [
                'nama' => "Domino's Pizza",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.7',
                'kategori' => 'Roti, Mie, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/domino_pizza.png',
            ],
            [
                'nama' => "Haagen Dazs",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.7',
                'kategori' => 'Camilan',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/haagen-dazs.jpg',
            ],
            [
                'nama' => "Baskin Robbins",
                'cabang' => 'AEON Mall Sentul',
                'lokasi' => 'AEON Mall Sentul City, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.7',
                'kategori' => 'Camilan',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/baskin_robbins.png',
            ],
            [
                'nama' => "Janji Jiwa",
                'cabang' => 'Jungleland Sentul',
                'lokasi' => 'Jl. Raya Jungle Land Avenue No. 92, Karang Tengah, Kec. Babakan Madang, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.7',
                'kategori' => 'Minuman, Roti',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/janjiw.png',
            ],
            [
                'nama' => "Burger King",
                'cabang' => 'West Sentul',
                'lokasi' => 'Jl. Raya Jakarta-Bogor No. 4, Cimandala, Kec. Sukaraja, Kab. Bogor, Jawa Barat 16810',
                'rating' => '4.7',
                'kategori' => 'Nasi, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/burger_king.jpeg',
            ],
            [
                'nama' => "Mie Gacoan",
                'cabang' => 'Bogor',
                'lokasi' => 'Jl. Raya Pajajaran No .63, Bantarjati, Kec. Bogor Utara, Kota Bogor, Jawa Barat 16810',
                'rating' => '4.6',
                'kategori' => 'Nasi, Minuman',
                'logo' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/restoran/gacoan.jpeg',
            ],
        ]);
    }
}
