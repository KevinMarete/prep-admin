<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

//Model namespaces
use App\Homeherotext;
use App\Homenumber;
use App\Section;
use App\Partner;
use App\Contact;

//Use Mail
use App\Mail\ContactUs;


class PrepFront extends Controller
{
    //Return Homepage
    public function index(){

        //Get home page data
        $data['herotext'] = Homeherotext::first();
        $data['sections'] = Section::all()->sortBy('hierrarchy');
        $data['homenumbers'] = Homenumber::all();
        $data['partners'] = Partner::all();

        //Pass data to home page
        return view('pages.home', $data);
    }

        //Return Homepage
        public function user(){
            return view('pages.user');
        }

        //Return Provider
        public function provider(){
            return view('pages.provider');
        }

        //Return Policymaker
        public function policymaker(){
            return view('pages.policymaker');
        }

        //Return Resources
        public function resources(){
            return view('pages.resources');
        }

        //Return Journey in Kenya
        public function journeyinkenya(){
            return view('pages.journeyinkenya');
        }

        //Return Journey in Kenya
        public function rast(){
            return view('pages.riskassessment');
        }

        //Mail
        public function sendMail(Request $request){
         
            //Get contact email
           $contact_email = Contact::all('email')->first();

           //Send Mail
           Mail::to($contact_email)->send(new ContactUs($request));

           //Redirect
           return redirect('/#contact-form')->with('status', 'Email sent!');
           
        }


}
