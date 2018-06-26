var countyURL = 'API/county'
var subcountyURL = 'API/subcounty'
//var subcountyURL='API/subcounty?county=?'
var chartURL = 'Dashboard/get_chart'
//main filters
var mainFilterURLs = {
    'facility_service': [{'link': countyURL, 'type': 'County'}],
    'commodity_management': [{'link': countyURL, 'type': 'County'}],
    'communication_advocacy': [{'link': countyURL, 'type': 'County'}],
    'partner_support': [{'link': countyURL, 'type': 'County'}],
    'human_resource': [{'link': countyURL, 'type': 'County'}],
}
//tab filters
var tabFiltersURLs = {
    'facility_service': [{'link': subcountyURL, 'type': 'Sub_County', 'filters': ['#facility_facility_ownership_chart_filter', '#facility_facility_level_chart_filter', '#hiv_service_offered_chart_filter']}],
    'commodity_management': [{'link': subcountyURL, 'type': 'Sub_County', 'filters': ['#PrEP_drug_dispensation_chart_filter', '#training_national_PrEP_ME_tools_chart_filter', '#cadre_staff_dispensing_PrEP_chart_filter', '#commodity_mgmt_facility_level_chart_filter', '#commodity_mgmt_facility_ownership_chart_filter']}],
    'communication_advocacy': [{'link': subcountyURL, 'type': 'Sub_County', 'filters': ['#rapid_assessment_tool_availability_chart_filter', '#tools_availability_chart_filter', '#prep_summary_tool_chart_filter', '#clinical_encounter_form_chart_filter', '#prep_register_availability_chart_filter', '#hepatitis_b_availability_chart_filter', '#hepatitis_c_availability_chart_filter', '#creatinine_availability_chart_filter', '#communication_adv_facility_level_chart_filter', '#communication_adv_facility_ownership_chart_filter']}],
    'partner_support': [{'link': subcountyURL, 'type': 'Sub_County', 'filters': ['#support_implementing_partners_chart_filter', '#partner_supported_component_chart_filter', '#partner_support_facility_level_chart_filter', '#partner_support_facility_ownership_chart_filter']}],
    'human_resource': [{'link': subcountyURL, 'type': 'Sub_County', 'filters': ['#human_resource_facility_level_chart_filter', '#human_resource_facility_ownership_chart_filter', '#human_resource_support_implementing_partners_chart_filter', '#human_resource_cadre_staff_dispensing_PrEP_chart_filter', '#human_resource_training_national_PrEP_ME_tools_chart_filter']}],
}
//charts
var charts = {
    'facility_service': ['facility_facility_ownership_chart', 'facility_facility_level_chart', 'hiv_service_offered_chart', 'facility_facility_count_chart'],
    'commodity_management': ['software_managing_prep_commodities_chart', 'facility_source_ARVs_chart', 'PrEP_drug_dispensation_chart', 'training_national_PrEP_ME_tools_chart', 'cadre_staff_dispensing_PrEP_chart', 'commodity_mgmt_facility_level_chart', 'commodity_mgmt_facility_ownership_chart', 'commodity_mgmt_facility_ownership_chart', 'commodity_mgmt_commodity_mgmt_facility_count_chart'],
    'communication_advocacy': ['rapid_assessment_tool_availability_chart', 'tools_availability_chart', 'prep_summary_tool_chart', 'clinical_encounter_form_chart', 'prep_register_availability_chart', 'hepatitis_b_availability_chart', 'hepatitis_c_availability_chart', 'creatinine_availability_chart', 'PrEP_clients_both_ever_initiated_and_currently_on_care_chart', 'communication_adv_facility_level_chart', 'communication_adv_facility_ownership_chart', 'communication_adv_facility_count_chart'],
    'partner_support': ['support_implementing_partners_chart', 'partner_supported_component_chart', 'partner_support_facility_level_chart', 'partner_support_facility_ownership_chart', 'partner_support_facility_count_chart'],
    'human_resource': ['human_resource_facility_level_chart', 'human_resource_facility_ownership_chart', 'human_resource_facility_count_chart', 'human_resource_cadre_staff_dispensing_PrEP_chart', 'human_resource_training_national_PrEP_ME_tools_chart', 'human_resource_support_implementing_partners_chart']
}
var filters = {}
var tabName = 'facility_service'

//Autoload
$(function () {
    //Load default tab charts
    LoadTabContent(tabName)
    //Tab change Event
    $("#main_tabs li a").on("click", TabFilterHandler);
    //Filter click Event
    $(".filter_btn").on("click", FilterBtnHandler);
    //Clear click Event
    $(".clear_btn").on("click", ClearBtnHandler);
    //Main filter click event
    $("#btn_filter").on("click", MainFilterHandler);
    //Main clear click event 
    $("#btn_clear").on("click", MainClearHandler);
    //Add This to Block SHIFT Key for multiselect 
    disableShiftKey()
});

function LoadTabContent(tabName) {
    //Refresh tab chart(s)
    if (charts[tabName].length > 0) {
        $.each(charts[tabName], function (key, chartName) {
            LoadSpinner('#' + chartName)
        });
    }
    //Set main filter
    setMainFilter(tabName)
    //Set tab filter
    setTabFilter(tabName)
}

function setMainFilter(tabName) {
    $.each(mainFilterURLs[tabName], function (key, value) {
        $.getJSON(value.link, function (data) {
            //Create multiselect box
            CreateSelectBox("#filter_item", "300px", 10)
            //Add data to selectbox
            $("#filter_item option").remove();
            $.each(data, function (i, v) {
                $("#filter_item").append($("<option value='" + v.name + "'>" + v.name.toUpperCase() + "</option>"));
            });
            $('#filter_item').multiselect('rebuild');
            $("#filter_item").data('filter_type', value.type)
        });
    });
}

function setTabFilter(tabName) {
    if (tabFiltersURLs[tabName].length > 0) {
        $.each(tabFiltersURLs[tabName], function (key, value) {
            $.ajax({
                url: value.link,
                datatype: 'JSON',
                success: function (data) {
                    $.each(value.filters, function (index, filterID) {
                        //Create multiselect box
                        CreateSelectBox(filterID, '100%', 10)
                        //Add data to selectbox
                        $(filterID + " option").remove();
                        $.each(data, function (i, v) {
                            $(filterID).append($("<option value='" + v.name + "'>" + v.name.toUpperCase() + "</option>"));
                        });
                        $(filterID).multiselect('rebuild');
                        $(filterID).data('filter_type', value.type);
                    });
                },
                complete: function () {
                    //Load charts after filter options
                    $.each(charts[tabName], function (key, chartName) {
                        chartID = '#' + chartName
                        LoadChart(chartID, chartURL, chartName, filters)
                    });
                }
            });
        });
    } else {
        //Load charts without filter options
        if (charts[tabName].length > 0) {
            $.each(charts[tabName], function (key, chartName) {
                chartID = '#' + chartName
                LoadChart(chartID, chartURL, chartName, filters)
            });
        }
    }
}

function CreateSelectBox(elementID, width, limit) {
    $(elementID).val('').multiselect({
        enableCaseInsensitiveFiltering: true,
        enableFiltering: true,
        disableIfEmpty: true,
        maxHeight: 300,
        buttonWidth: width,
        nonSelectedText: 'None selected',
        includeSelectAllOption: false,
        selectAll: false,
        onChange: function (option, checked) {
            //Get selected options.
            var selectedOptions = $(elementID + ' option:selected');
            if (selectedOptions.length >= limit) {
                //Disable all other checkboxes.
                var nonSelectedOptions = $(elementID + ' option').filter(function () {
                    return !$(this).is(':selected');
                });
                nonSelectedOptions.each(function () {
                    var input = $('input[value="' + $(this).val() + '"]');
                    input.prop('disabled', true);
                    input.parent('li').addClass('disabled');
                });
            } else {
                //Enable all checkboxes.
                $(elementID + ' option').each(function () {
                    var input = $('input[value="' + $(this).val() + '"]');
                    input.prop('disabled', false);
                    input.parent('li').addClass('disabled');
                });
            }
        }
    });
}

function disableShiftKey() {
    var shiftClick = $.Event("click");
    shiftClick.shiftKey = true;
    $(".multiselect-container li *").click(function (event) {
        if (event.shiftKey) {
            event.preventDefault();
            return false;
        }
    });
}

function LoadChart(divID, chartURL, chartName, selectedfilters) {
    //Load Spinner
    LoadSpinner(divID)
    //Load Chart*
    $(divID).load(chartURL, {'name': chartName, 'selectedfilters': selectedfilters}, function () {
        //Pre-select filters for charts
        $.each($(divID + '_filters').data('filters'), function (key, data) {
            $(divID + "_filter").val(data).multiselect('refresh');
            //Output filters
            var filtermsg = '<b><u>' + key.toUpperCase() + ':</u></b><br/>'
            if ($.isArray(data)) {
                filtermsg += data.join('<br/>')
            } else {
                filtermsg += data
            }
            $("." + chartName + "_heading").html(filtermsg)
        });
    });
}

function LoadSpinner(divID) {
    var spinner = new Spinner().spin()
    $(divID).empty('')
    $(divID).height('auto')
    $(divID).append(spinner.el)
}

function TabFilterHandler(e) {
    var filtername = $(e.target).attr('href');
    if (filtername !== '#' && filtername.charAt(0) == "#") {
        filters = {}
        //Set tabName
        tabName = filtername.replace('#', '');
        //Clear heading
        $(".heading").empty();
        //Load selected tab charts
        LoadTabContent(tabName)
    }
}

function FilterBtnHandler(e) {
    var filterName = String($(e.target).attr("id")).replace('_btn', '')
    var filterID = "#" + filterName
    var filterType = $(filterID).data('filter_type')
    var chartName = filterName.replace('_filter', '')
    var chartID = "#" + chartName

    if ($(filterID).val() != null) {
        filters[filterType] = $(filterID).val()
    }
    LoadChart(chartID, chartURL, chartName, filters)

    //Hide Modal
    $(filterID + '_modal').modal('hide')
}

function ClearBtnHandler(e) {
    var filterName = String($(e.target).attr("id")).replace('_clear_btn', '')
    var filterID = "#" + filterName
    var filterType = $(filterID).data('filter_type')

    //Clear filterType
    filters[filterType] = {}

    //Filter multiple multiselect
    $(filterID).multiselect('deselectAll', false);
    $(filterID).multiselect('updateButtonText');
    $(filterID).multiselect('refresh');

    //Trigger filter event
    $(filterID + '_btn').trigger('click');
}

function MainFilterHandler(e) {
    if ($("#filter_item").val() != null) {
        filters[$("#filter_item").data("filter_type")] = $("#filter_item").val()
    }

    //Load charts
    $.each(charts[tabName], function (key, chartName) {
        chartID = '#' + chartName
        LoadChart(chartID, chartURL, chartName, filters)

    });
}

function MainClearHandler(e) {
    //Clear filters
    filters = {}

}