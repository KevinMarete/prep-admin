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
use App\Map;
use App\Seo as SeoTable;

//Use Mail
use App\Mail\ContactUs;

//SEO
use SEOMeta;
use OpenGraph;

//Guzzle
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;

class PrepFront extends Controller
{
   

    //Return Homepage
    public function index(){

        //setSEO
        $this->setSEO('home');

        //Get home page data
        $data['herotext'] = Homeherotext::first();
        $data['sections'] = Section::all()->sortBy('hierrarchy');
        $data['homenumbers'] = Homenumber::all();
        $data['partners'] = Partner::all();
        $data['patient_numbers'] = $this->getAPINumbers();

        //Get map data
        $map_data = array('main' => array(), 'drilldown' => array(), 'columns' => array());
        $map_data = Map::get_facility_distribution_map();
        $data['chart_series_data'] = json_encode($map_data['main'], JSON_NUMERIC_CHECK);

        //Pass data to home page
        return view('pages.home', $data);
    }


        public function setSeO($page){
        
        //Get seo details
        $seo_details = SeoTable::where('page', $page)->first();

        //Set SeoMeta
        SEOMeta::setTitle($seo_details->title);
        SEOMeta::setDescription($seo_details->description);
        SEOMeta::setKeywords($seo_details->keywords);
        OpenGraph::setTitle($seo_details->title);
        OpenGraph::setDescription($seo_details->description);
        Opengraph::setURL(\URL::current());

        }

        //Return Homepage
        public function user(){
            $this->setSEO('user');
            return view('pages.user');
        }

        //Return Provider
        public function provider(){
            $this->setSEO('provider');
            return view('pages.provider');
        }

        //Return Policymaker
        public function policymaker(){
            $this->setSEO('policymaker');
            return view('pages.policymaker');
        }

        //Return Resources
        public function resources(){
            $this->setSEO('resources');
            return view('pages.resources');
        }

        //Return Journey in Kenya
        public function journeyinkenya(){
            $this->setSEO('journeyinkenya');
            return view('pages.journeyinkenya');
        }

        //Return Testimonials
        public function testimonials(){
            $this->setSEO('testimonials');
            return view('pages.testimonials');
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

        //Get Numbers
        public function getAPINumbers(){
            $client = new Client();
            $api_url = "http://commodities.nascop.org/API/dashboard/patient?year=2018&month=oct&service=prep";
            $numbers = $client->get($api_url);
            $numbers_json = $client->get($api_url)->getBody();
            return json_decode($numbers_json);
        
        }


}
