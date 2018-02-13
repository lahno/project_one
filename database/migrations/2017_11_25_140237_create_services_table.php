<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('services', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->string('name_en', 100);
            $table->string('alias', 100);
            $table->json('service_list');
            $table->json('service_list_en');
            $table->text('desc')->nullable();
            $table->text('desc_en')->nullable();
            $table->string('form_title');
            $table->string('form_title_en');
            $table->string('form_pod_title');
            $table->string('form_pod_title_en');
            $table->string('sort', 3)->default('0');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('services');
    }
}
