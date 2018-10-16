<?php

namespace App\Providers;


use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;
use \Illuminate\Support\Facades\Request;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
        Schema::defaultStringLength(191);

        //Check if current page is home
        if(\URL::current() != url('/')){
            $page = Request::segment(1);
        }else{
            $page = 'home';
        }

        //Get misc data
        $data['misc'] = \App\Misc::all();

        //Get page uri segment name
        $data['page'] = $page;
             
        //Get Herotext data for current page
        $data['homeherotext'] = \App\Homeherotext::all()->where('page', $page);

        //Get Faqs data
        $data['faqs'] = \App\Faq::all();

        //Get user Faqs
        $data['faqs_user'] = \App\Faq::all()->where('category', 'User');

        //Get provider Faqs
        $data['faqs_provider'] = \App\Faq::all()->where('category', 'Provider');
        
        //Get policymaker Faqs
        $data['faqs_policymaker'] = \App\Faq::all()->where('category', 'Policymaker');


        //Get Contact and Address info
        $data['contacts'] = \App\Contact::all(['title', 'physical_address', 'postal_address', 'tel', 'email']);

        $data['contact_attribs'] = Schema::getColumnListing('contacts');

        //Share data with all views 
        View::share(compact('data'));
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
