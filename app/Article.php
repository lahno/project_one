<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Request;

class Article extends Model
{
    public function cat()
    {
        return $this->hasOne('App\Category_article', 'id', 'category_id');
    }
    public function tags_id()
    {
        return $this->hasMany('App\Category_article', 'id', 'tags');
    }
}
