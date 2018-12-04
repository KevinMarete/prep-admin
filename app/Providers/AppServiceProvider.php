<?php

namespace App\Providers;


use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;
use \Illuminate\Support\Facades\Request;
use \Illuminate\Support\Facades\Storage;

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
      

        //Get RAST
        $data['rast'] = \App\Riskassessment::all();
        $sections = \App\Section::all();
        //Get section images
        foreach($sections as $section){
            $data['section_imgs_'.str_slug($section->title)] = Storage::allFiles('sections/'.$section->title);
        }

        //Get resources
        $data['resources_folders'] = Storage::directories('resources');

        //Get gallery
        $data['galleries'] = Storage::directories('galleries');
        
        //Get gallery pictures
        foreach($data['galleries'] as $gallery){
            $g = explode('/', $gallery);
            $data['galleries_'.$g[1]] = Storage::allFiles('galleries/'.$g[1]);
        }

        //Get resource files
        foreach($data['resources_folders'] as $folder){
            $resource = explode('/', $folder);
            $data['resource_files_'.$resource[1]] = Storage::allFiles('resources/'.$resource[1]);
        }
        
        //Get hero images
        $data['hero_imgs'] = Storage::files('pages/'.$page);

        //Get images depending on the page
        $data['images'] = Storage::files('faqs/'.$page);

        //Get misc data
        $data['misc'] = \App\Misc::all()->where('page', $page);

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
