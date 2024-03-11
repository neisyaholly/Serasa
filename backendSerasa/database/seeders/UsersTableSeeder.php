<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            [
                'name' => 'Nathasya Rizandi',
                'tglLahir' => '2004-02-20',
                'telp' => '0858',
                'email' => 'ener@gmail.com',
                'password' => Hash::make('user1'),
                'poin' => '450',
                'role' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/pfp_def.png',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Ariya Gunananda',
                'tglLahir' => '2004-11-29',
                'telp' => '0852',
                'email' => 'ariya@gmail.com',
                'password' => Hash::make('user2'),
                'poin' => '67',
                'role' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/pfp.png',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Neisya Holly',
                'tglLahir' => '2004-12-25',
                'telp' => '0813',
                'email' => 'neisya@gmail.com',
                'password' => Hash::make('user3'),
                'poin' => '60',
                'role' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/pfp.png',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Andreas Liujaya',
                'tglLahir' => '2004-08-29',
                'telp' => '0888',
                'email' => 'eas@gmail.com',
                'password' => Hash::make('user4'),
                'poin' => '1000',
                'role' => '1',
                'foto' => 'https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/pfp.png',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            // Add more dummy users as needed
        ]);
    }
}
