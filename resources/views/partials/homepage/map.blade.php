<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Maps | Kenya</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div id="locator" style="height: 500px ; margin-left: 0" class="col-md-10"></div>
            </div>
        </div>
    </section>
    <!--scripts-->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.highcharts.com/maps/highmaps.js"></script>
    <script src="https://code.highcharts.com/maps/modules/data.js"></script>
    <script src="https://code.highcharts.com/maps/modules/drilldown.js"></script>
    <script src="https://code.highcharts.com/maps/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/maps/modules/offline-exporting.js"></script>
    <script src="https://code.highcharts.com/mapdata/countries/us/us-all.js"></script>
    <!--maps-script-->
    <script>
        var api_data;
		var mapDIV = 'locator';
               $.get("json/kenya.json", function(datam, status){
        	var api_data=datam.data;

		    var data = Highcharts.geojson(api_data),
		        separators = Highcharts.geojson(api_data, 'mapline'),
		        // Some responsiveness
		        small = $('#'+mapDIV).width() < 400;

		    // Set drilldown pointers
		    $.each(data, function (i, v) {
		        this.drilldown = this.properties['code'];
		        var county_name = this.properties['name'].replace(" ", "_").replace("'", "").replace("-", "_").toLowerCase();
		        //Get facility count 
		        this.value = 0;
		        if(county_name in chart_data){
		        	this.value = chart_data[county_name]['total'];
		    	}
		    });

		    var chart;

		    //Instantiate the map
		    Highcharts.mapChart(mapDIV, {
		        chart: {
		            events: {
		                drilldown: function (e) {
		                    if (!e.seriesOptions) {
		                        var county_name = e.point.name.replace(" ", "_").replace("'", "").replace("-", "_").toLowerCase();
		                        chart = this,
		                            mapKey = 'public/dashboard/json/counties/' + county_name + '.json' ,
		                            // Handle error, the timeout is cleared on success
		                            fail = setTimeout(function () {
		                                if (mapKey) {
		                                    chart.showLoading('<i class="icon-frown"></i> Failed loading ' + e.point.name);
		                                    fail = setTimeout(function () {
		                                        chart.hideLoading();
		                                    }, 1000);
		                                }
		                            }, 3000);

		                        // Show the spinner
		                        chart.showLoading('<i class="icon-spinner icon-spin icon-3x"></i>'); // Font Awesome spinner

		                        $.get('public/dashboard/json/counties/' + county_name + '.json', function(datam, status){
		                            data = Highcharts.geojson(datam.data);
		                            //Get facility count
		                            $.each(data, function (i, v) {
		                            	var subcounty_name = v.properties.name.replace(" ", "_").replace("'", "").replace("-", "_").toLowerCase();
		                            	this.value = 0;
		                                if(county_name in chart_data){
		                                	//Confirm subcounty
		                                	if(subcounty_name in chart_data[county_name]['subcounties']){
								        		this.value = chart_data[county_name]['subcounties'][subcounty_name]['total'];
								        	}
								    	}
								    });

		                            // Hide loading and add series
		                            chart.hideLoading();
		                            clearTimeout(fail);
		                            chart.addSeriesAsDrilldown(e.point, {
		                                name: e.point.name,
		                                data: data,
		                                dataLabels: {
		                                    enabled: true,
		                                    format: '{point.name}'
		                                }
		                            });

		                            //Update facilities/partners
		                            chart.update({
									    tooltip: {
									      	formatter: function() {
									      		var subcounty_name = this.key.replace(" ", "_").replace("'", "").replace("-", "_").toLowerCase();
									      		var rV = '<b>' + this.key + '</b><br/>';
		                                		if(county_name in chart_data){
		                                			//Confirm subcounty
		                                			if(subcounty_name in chart_data[county_name]['subcounties']){
								        				$.each(chart_data[county_name]['subcounties'][subcounty_name]['facilities'], function(i, facility_name){
								        					if(i == 0){
								        						rV += '<span><b>Total</b></span>: ' + Highcharts.numberFormat(chart_data[county_name]['subcounties'][subcounty_name]['total'], 0)+'<br/>';
								        					}
								        					rV += facility_name+'<br/>';
								        				});
								        			}else{
								        				rV += '<span><b>Total</b></span>: 0 <br/>';
								        			}
								    			}
							                    return rV;
									      	}
									    }
									});
		                        });
		                    }

		                    this.setTitle(null, { text: e.point.name });
		                },
		                drillup: function (e) {
		                    this.setTitle(null, { text: '' });
		                    chart.update({
							    tooltip: {
							      	formatter: function() {
							      		var county_name = this.key.replace(" ", "_").replace("'", "").replace("-", "_").toLowerCase();
							      		var rV = '<b>' + this.key + '</b><br/>';
                                		if(county_name in chart_data){
                                			rV += '<span><b>Total</b></span>: ' + Highcharts.numberFormat(chart_data[county_name]['total'], 0)+'<br/>';
						    			}else{
					        				rV += '<span><b>Total</b></span>: 0 <br/>';
					        			}
					                    return rV;
							      	}
							    }
							});
		                }
		            }
		        },

		        title: {
		            text: 'Title'
		        },

		        subtitle: {
		            text: 'Source'
		        },

		        legend: small ? {} : {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle'
		        },
		        credits: false,
		        colorAxis: {
		            min: 0,
		            minColor: '#aaaebc',
		            maxColor: '#008080'
		        },

		        mapNavigation: {
		            enabled: true,
		            buttonOptions: {
		                verticalAlign: 'bottom'
		            }
		        },

		        plotOptions: {
		            map: {
		                states: {
		                    hover: {
		                        color: '#ee6e6e'
		                    }
		                }
		            }
		        },

		        series: [{
		            data: data,
		            name: 'Kenya',
		            dataLabels: {
		                enabled: true,
		                format: '{point.properties.postal-code}'
		            }
		        }, {
		            type: 'mapline',
		            data: separators,
		            color: 'silver',
		            enableMouseTracking: false,
		            animation: {
		                duration: 500
		            }
		        }],

		        drilldown: {
		            activeDataLabelStyle: {
		                color: '#FFFFFF',
		                textDecoration: 'none',
		                textOutline: '1px #000000'
		            },
		            drillUpButton: {
		                relativeTo: 'spacingBox',
		                position: {
		                    x: 0,
		                    y: 60
		                }
		            }
		        }
		    });
		});
    </script>
</body>
</html>