<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Homeherotext;
use App\Section;

class PrepFront extends Controller
{
    //Return Homepage
    public function index(){
        //Get Hero Text
        $herotext = Homeherotext::first();
        $sections = Section::all();
        return view('pages.home', compact('herotext'));
    }
}
