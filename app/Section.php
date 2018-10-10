<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Section extends Model
{
    //

    public function faqs(){
        return $this->hasMany('App\Faq');
    }
}
