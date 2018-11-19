<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class assessmentMessage extends Model
{
        //Connection, Table Name
        protected $connection = 'mysql2';
        protected $table = 'tbl_messages';
    
        public function assessmentUser(){
            return $this->belongsTo('App\assessmentUser');
        }
}
