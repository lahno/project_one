<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public $timestamps = true;

    public function get_service()
    {
        return $this->belongsTo('App\Service', 'service_id', 'id');
    }

    public function client() {
        return $this->belongsToMany('App\Client', 'client_orders', 'order_id', 'client_id');
    }

    public function status() {
        return $this->belongsTo('App\StatusOrder','status_id', 'id');
    }
}
