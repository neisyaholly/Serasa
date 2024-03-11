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
        Schema::create('produk_komunitas', function (Blueprint $table) {
            $table->id();
            $table->integer('userID');
            $table->string('nama');
            $table->string('deskripsi');
            $table->integer('harga');
            $table->date('exp');
            $table->integer('qty');
            $table->string('foto');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('produk_komunitas');
    }
};
