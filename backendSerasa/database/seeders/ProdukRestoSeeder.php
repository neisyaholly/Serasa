<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProdukRestoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('produk_restos')->insert([
            [
                'restoID' => '1',
                'nama' => 'Americano',
                'deskripsi' => 'Double Shot Espresso + water',
                'harga' => '44000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/americano.jpeg',
            ],
            [
                'restoID' => '1',
                'nama' => 'Caramel Macchiato',
                'deskripsi' => 'Espresso + Milk + Caramel',
                'harga' => '61000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/machiato.jpeg',
            ],
            [
                'restoID' => '1',
                'nama' => 'Green Tea Latte',
                'deskripsi' => 'Matcha + Milk',
                'harga' => '57000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/greentea.jpeg',
            ],
            [
                'restoID' => '1',
                'nama' => 'Hazelnut Signature Chocolate',
                'deskripsi' => 'Chocolate + Hazelnut',
                'harga' => '62000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/hazelnut.jpeg',
            ],
            [
                'restoID' => '1',
                'nama' => 'Ice Shaken Lemonade Tea',
                'deskripsi' => 'Passion Lemonade + Tea',
                'harga' => '44000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/lemonade.jpeg',
            ],
            [
                'restoID' => '1',
                'nama' => 'Java Chip Frapuccino',
                'deskripsi' => 'Java Chip + Espresso + Milk',
                'harga' => '60000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/lemonade.jpeg',
            ],
            [
                'restoID' => '2',
                'nama' => 'Cheeseburger',
                'deskripsi' => 'Burger Keju',
                'harga' => '32000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/cb.jpeg',
            ],
            [
                'restoID' => '2',
                'nama' => 'Panas Special',
                'deskripsi' => 'Nasi, Ayam, Telur, Minuman',
                'harga' => '21000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/panas.jpeg',
            ],
            [
                'restoID' => '2',
                'nama' => 'McFlurry',
                'deskripsi' => 'Es Krim Vanila',
                'harga' => '12500',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/mcflurry.jpeg',
            ],
            [
                'restoID' => '4',
                'nama' => 'Express Bowl Ayam Mayo',
                'deskripsi' => 'Nasi ayam mayo',
                'harga' => '26000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/express.jpeg',
            ],
            [
                'restoID' => '3',
                'nama' => 'Niku Udon',
                'deskripsi' => 'Udon dan Daging Sapi',
                'harga' => '69000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/nikudon.jpeg',
            ],
            [
                'restoID' => '5',
                'nama' => 'Original Glazed 12 pcs',
                'deskripsi' => 'Donat original 12 pcs',
                'harga' => '99000',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/ori.jpeg',
            ],
            [
                'restoID' => '6',
                'nama' => 'Italian BMT',
                'deskripsi' => 'Sandwich favorit di dunia yang terdiri dari salami, pepperoni, daging, dan sayuran segar',
                'harga' => '48500',
                'qty' => '10',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_resto/italian.jpeg',
            ],
        ]);
    }
}
