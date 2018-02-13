<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArticlesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('articles', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            //$table->string('name_en', 100);
            $table->string('alias', 100);
            $table->text('short_desc')->nullable();
            //$table->text('short_desc_en')->nullable();
            $table->text('desc')->nullable();
            //$table->text('desc_en')->nullable();
            $table->string('img', 100);
            $table->integer('views')->default(0);
            $table->json('tags');
            $table->integer('category_id')->unsigned();
            $table->foreign('category_id')->references('id')->on('category_articles');
            $table->enum('status', ['yes', 'no'])->default('yes');
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
        Schema::dropIfExists('articles');
    }
}
