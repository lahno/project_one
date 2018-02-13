<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Portfolio extends Model
{
    public function cat()
    {
        return $this->hasOne('App\Category_portfolio', 'id', 'category_id');
    }
}
