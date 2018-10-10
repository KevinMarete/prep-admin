<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//Model namespaces
use App\Homeherotext;
use App\Homenumber;
use App\Section;


class PrepFront extends Controller
{
    //Return Homepage
    public function index(){

        //Get home page data
        $data['herotext'] = Homeherotext::first();
        $data['sections'] = Section::all();
        $data['homenumbers'] = Homenumber::all();

        //Pass data to home page
        return view('pages.home', $data);
    }
}
