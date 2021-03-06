<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePortfoliosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('portfolios', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->string('name_en', 100);
            $table->string('alias', 100);
            $table->text('short_desc')->nullable();
            $table->text('short_desc_en')->nullable();
            $table->text('desc')->nullable();
            $table->text('desc_en')->nullable();
            $table->string('img', 100);
            $table->string('link', 50)->nullable();
            $table->string('iframe_link', 50)->nullable();
            $table->string('views', 10)->default('0');
            $table->integer('category_id')->unsigned();
            $table->foreign('category_id')->references('id')->on('category_portfolios');
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
        Schema::dropIfExists('portfolios');
    }
}
