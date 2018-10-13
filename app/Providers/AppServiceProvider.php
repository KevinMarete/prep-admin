<?php

namespace App\Providers;


use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;


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

        //Get Faqs data
        $data['faqs'] = \App\Faq::all();

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
