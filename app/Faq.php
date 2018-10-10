<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Faq extends Model
{
    //

    public function section(){
        return $this->belongsTo('App\Section');
    }
}
