<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\assessmentFacilities;

use Spatie\ArrayToXml\ArrayToXml;

/*
 * Facilities table related logic goes here 
 * 
 */

class FacilitiesController extends Controller
{

    //Get Location Markers Array
    public function getLocationMarkers(){
        $facilityLocations = assessmentFacilities::all('ID','facility', 'County', 'Sub_County', 'Level', 'Latitude', 'Longitude');
        return $facilityLocations;
    }

    //Convert Location Markers Array to XML
    public function getLocationMarkersXML(){
        $array = $this->getLocationMarkers();
        $xml = ArrayToXml::convert($array);

        return $xml;
    }


}
