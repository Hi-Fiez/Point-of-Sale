<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCabangsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cabangs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('kode');
            $table->string('nama_cabang');
            $table->text('alamat');
            $table->string('kota');
            $table->string('provinsi');
            $table->integer('kodepos');
            $table->integer('telp');
            $table->integer('fax');
            $table->string('bank');
            $table->integer('rek');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cabangs');
    }
}
