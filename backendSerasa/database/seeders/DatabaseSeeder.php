<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(UsersTableSeeder::class);
        $this->call(AlamatSeeder::class);
        $this->call(RestoSeeder::class);
        $this->call(ProdukRestoSeeder::class);
        $this->call(BantuanSeeder::class);
        $this->call(ProdukKomunitasSeeder::class);
        $this->call(VoucherSeeder::class);
        $this->call(VoucherUserSeeder::class);
        $this->call(BankSampahSeeder::class);
        $this->call(RiwayatTukarSampahSeeder::class);
        $this->call(KeranjangSeeder::class);
        $this->call(DetailKeranjangSeeder::class);
        $this->call(PesananSeeder::class);
        $this->call(DetailPesananSeeder::class);
        $this->call(PembayaranSeeder::class);
    }
}
