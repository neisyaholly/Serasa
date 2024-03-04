<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('alamats', function (Blueprint $table) {
            $table->id();
            $table->string('nama');
            $table->string('jalan');
            $table->string('kel');
            $table->string('kec');
            $table->string('kab_kota');
            $table->string('provinsi');
            $table->string('kode_pos');
            $table->integer('userID');
            $table->integer('utama');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('alamats');
    }
};
