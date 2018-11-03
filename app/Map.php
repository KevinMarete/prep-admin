<?php

namespace App;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Map extends Model
{
    //Define default connection for Assessment Db
    protected $connection = 'mysql2';
    protected $table = 'tbl_facility_details';

    //Get counties and subcounties
    public static function get_facility_distribution_map(){

        //Define Arrays
        $columns = array();
        $response = array();    

        //Get county data
        $counties = Map::select(DB::raw("County name, COUNT(*) total"))
        ->groupBy('name')
        ->orderBy('total', 'DESC')
        ->get()
        ->toArray();
 
        //Get subcounty data
        $subcounties = Map::select(DB::raw("Sub_County name, County, COUNT(*) total"))
        ->groupBy('name', 'County')
        ->orderBy('total', 'DESC')
        ->get()
        ->toArray();

        //Get facilities data
        $facilities = Map::select(DB::raw("facility name, County, Sub_County"))
        ->groupBy('name', 'County', 'Sub_County')
        ->get()
        ->toArray();

        //Construct the response (County)
        foreach ($counties as $county) {
            $county_name = strtolower(str_ireplace(array("'", " ", "-"), array("", "_", "_"), $county['name']));
            $response[$county_name] = array(
                'total' => $county['total'],
                'subcounties' => array()
            ); 
        }
        
        //Construct the response (Subcounty)
        foreach ($subcounties as $subcounty) {
            $county_name = strtolower(str_ireplace(array("'", " ", "-"), array("", "_", "_"), $subcounty['County']));
            $subcounty_name = strtolower(str_ireplace(array("'", " ", "-"), array("", "_", "_"), $subcounty['name']));
            $response[$county_name]['subcounties'][$subcounty_name] = array(
                'total' => $subcounty['total'],
                'facilities' => array()
            ); 
        }
        
        //Construct the response (Facility)
        foreach ($facilities as $facility) {
            $county_name = strtolower(str_ireplace(array("'", " ", "-"), array("", "_", "_"), $facility['County']));
            $subcounty_name = strtolower(str_ireplace(array("'", " ", "-"), array("", "_", "_"), $facility['Sub_County']));
            $facility_name = ucwords(str_ireplace(array("'", " ", "-"), array("", "_", "_"), $facility['name']));
            $response[$county_name]['subcounties'][$subcounty_name]['facilities'][] = $facility_name; 
        }
        
        return array('main' => $response, 'columns' => $columns);
    }

}
