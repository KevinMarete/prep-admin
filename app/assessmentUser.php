<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class assessmentUser extends Model
{
    //Connection, Table Name
    protected $connection = 'mysql2';
    protected $table = 'auth_tbl_users';

    public function assessmentMessages(){
        return $this->hasMany('App\assessmentMessage');
    }

}
