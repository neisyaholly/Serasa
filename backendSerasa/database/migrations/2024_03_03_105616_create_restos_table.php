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
        Schema::create('restos', function (Blueprint $table) {
            $table->id();
            $table->string('nama');
            $table->string('cabang');
            $table->string('lokasi');
            $table->string('rating');
            $table->string('kategori');
            $table->string('logo');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('restos');
    }
};
