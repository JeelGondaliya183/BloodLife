<!doctype html>
<html lang="en">
<head>
    <title>Reporting</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0 , shrink-to-fit=no"
            name="viewport"/>

    <!--     Fonts and icons     -->
    <link
            href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
            rel="stylesheet"/>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"/>

    <!-- Material Kit CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/css/paper-dashboard.css?v=2.0.0" rel="stylesheet"/>
    <link rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
          rel="stylesheet"/>
    <link
            href="/css/dark-unica.css"
            rel="stylesheet"/>
    <style>
        a {
            color: #ef8157;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="main-panel">
        <jsp:include page="navbar.jsp"></jsp:include>
        <div class="content">
            <div class="row">
                <div class="container">
                    <div class="card card-nav-tabs card-plain">
                        <div class="card-header card-header-info">
                            <!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
                            <div class="nav-tabs-navigation">
                                <div class="nav-tabs-wrapper">
                                    <ul class="nav nav-tabs" data-tabs="tabs">
                                        <li class="nav-item"><a class="nav-link active"
                                                                href="#blood" data-toggle="tab"
                                                                id="bloodTab"><b>Blood</b></a></li>

                                        <li class="nav-item"><a class="nav-link"
                                                                href="#receiver" data-toggle="tab" id="receiverTab"><b>Receiver</b></a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" href="#donor"
                                                                data-toggle="tab" id="donorTab"><b>Donor</b></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body ">
                            <div class="tab-content text-center">
                                <div class="tab-pane active" id="blood">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <select class="form-control" id="selectMonthBlood"></select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <select class="form-control" id="selectYearBlood"></select>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <button class="btn btn-default btn-md" style="margin: 0px" id="bloodChartbtn">
                                                    Get Report
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="bloodChart" class="container"></div>
                                </div>
                                <div class="tab-pane" id="receiver">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <select class="form-control" id="selectMonthReceiver"></select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <select class="form-control" id="selectYearReceiver"></select>
                                                </div>
                                            </div>

                                            <div class="col-md-2">
                                                <button class="btn btn-default btn-md" style="margin: 0px" id="receiverChartBtn">
                                                    Get Report
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="receiverChart" class="container"></div>
                                </div>
                                <div class="tab-pane" id="donor">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <select class="form-control" id="selectMonthDonor"></select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <select class="form-control" id="selectYearDonor"></select>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <button class="btn btn-default btn-md" style="margin: 0px"  id="donationChartBtn">
                                                    Get Report
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="donorChart" class="container"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row"></div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</div>

<!--   Core JS Files   -->
<script src="/js/core/jquery.min.js"></script>
<script src="/js/core/popper.min.js"></script>
<script src="/js/core/bootstrap.min.js"></script>
<script src="/js/plugins/perfect-scrollbar.jquery.min.js"
></script>
<script src="/js/plugins/bootstrap-notify.js"></script>
<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/paper-dashboard.js?v=2.0.0"></script>
<script src="https://code.highcharts.com/highcharts.src.js"></script>

<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script>
    var token = '<%= session.getAttribute("token") %>';
    var chart;
    $(document).ready(function () {
        $("#header").html("Reports");
        $("li").removeClass("active");
        $("#reportJsp").addClass("active");
        addMonthsYears();
        getCount();
        loadBloodChart();


    });

    $("#bloodTab").click(function () {
        e.preventDefault();
        while (chart.series.length > 0) chart.series[0].remove(true);
        $('#bloodChartbtn').click();
    });

    $('#donorTab').click(function () {
        addMonthsYears();
        $('#donationChartBtn').click();
    });

    $('#receiverTab').click(function () {
        addMonthsYears();
        $('#receiverChartBtn').click();
    });

    function loadDonorChart(bloodGroup, count , month , year) {
        if ($('#donorChart').highcharts() != null) {
            $('#donorChart').highcharts().destroy();
        }

        Highcharts.chart('donorChart', {
            chart: {
                height: 500,
                type: 'column',
            },
            title: {
                style: {
                    color: '#FFFFFFF',
                },
                text: 'Number of Donor in '+ month+' , ' + year
            },

            subtitle: {
                style: {
                    color: '#FFFFFFF',
                },
                text: 'Source:blood-life'
            },

            yAxis: {

                title: {
                    text: 'Quantity of blood in litres',
                    style: {
                        color: '#FFFFFFF',
                    }
                },
                labels: {
                    style: {
                        color: 'white'
                    }
                }
            },
            xAxis: {
                categories: bloodGroup,
                labels: {
                    style: {
                        color: 'white'
                    }
                }
            },

            tooltip: {

                style: {
                    color: '#FFFFFFF',
                    fontSize: '14px'

                }
            },

            plotOptions: {
                series: {
                    label: {
                        connectorAllowed: true
                    },
                    animation: true
                }
            },

            series: [{

                data: count
            }
            ],

            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }

        });
    }

    $('#donationChartBtn').click(function(){
        getDonation();
    });

    $('#bloodChartbtn').click(function(){
        getCount();
    });

    function getDonation(){
        var from = $('#selectYearDonor').val()  + "-" + $('#selectMonthDonor').val()  + "-01";
        var to = $('#selectYearDonor').val()  + "-" + $('#selectMonthDonor').val()  + "-01";

        $.ajax({
            type: 'GET',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            url: '/reporting/getDonationCount?from='+from+'&to='+to,
            aync:false,
            success: function (response) {
                if (response.status == 200) {
                    var bloodGroups = [];
                    var count = [];
                    $.each( response.data, function( key, value ) {
                        var bloodCount = [] ;
                        bloodGroups.push(key);
                        count.push(value);

                    });
                    loadDonorChart(bloodGroups, count ,$('#selectMonthDonor :selected').text(),  $('#selectYearDonor').val()   );
                }
            }
        });
    }


    $('#receiverChartBtn').click(function(){
        getReceiverCount();
    });

    function getReceiverCount(){
        var from = $('#selectYearReceiver').val()  + "-" + $('#selectMonthReceiver').val()  + "-01";
        var to = $('#selectYearReceiver').val()  + "-" + $('#selectMonthReceiver').val()  + "-01";

        $.ajax({
            type: 'GET',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            url: '/reporting/getReceiverCount?from='+from+'&to='+to,
            aync:false,
            success: function (response) {
                if (response.status == 200) {
                    var bloodGroups = [];
                    var count = [];
                    $.each( response.data, function( key, value ) {
                        var bloodCount = [] ;
                        bloodGroups.push(key);
                        count.push(value);

                    });
                   loadReceiverChart(bloodGroups, count, $('#selectMonthReceiver :selected').text() , $('#selectYearReceiver').val());
                }
            }
        });
    }


    function getCount() {

        var from = $('#selectYearBlood').val()  + "-" + $('#selectMonthBlood').val()  + "-01";
        var to = $('#selectYearBlood').val()  + "-" + $('#selectMonthBlood').val()  + "-31";

        $.ajax({
            type: 'GET',
            contentType: "application/json",
            headers: {
                "Authorization": "Bearer " + token
            },
            url: '/reporting/getCount?from='+from+'&to='+to,
            aync:false,
            success: function (response) {
                if (response.status == 200) {
                   var series = [];
                    $.each( response.data, function( key, value ) {
                        var bloodCount = [] ;
                        bloodCount.push(key);
                        bloodCount.push(value);
                        series.push(bloodCount);
                    });
                    console.log(series);
                    loadBloodChart(series, $('#selectMonthBlood :selected').text() , $('#selectYearBlood').val() );
                }
            }
        });


    }

    function loadReceiverChart(bloodGroup,count, month , year) {
        Highcharts.chart('receiverChart', {
            chart: {
                height: 500,
                type: 'column',
            },
            title: {
                style: {
                    color: '#FFFFFFF',
                },
                text: 'Number of Receiver in '+ month +' , ' + year
            },

            subtitle: {
                style: {
                    color: '#FFFFFFF',
                },
                text: 'Source:blood-life'
            },

            yAxis: {

                title: {
                    text: 'Quantity of blood in litres',
                    style: {
                        color: '#FFFFFFF',
                    }
                },
                labels: {
                    style: {
                        color: 'white'
                    }
                }
            },
            xAxis: {
                categories:bloodGroup,
                labels: {
                    style: {
                        color: 'white'
                    }
                }
            },
            // legend: {
            //     layout: 'vertical',
            //     align: 'right',
            //     verticalAlign: 'middle',
            //     padding: 3,
            //     itemMarginTop: 5,
            //     itemMarginBottom: 5,
            //     itemStyle: {
            //         color: '#FFFFFFF',
            //         fontWeight: 'bold',
            //
            //     }
            //
            // },
            tooltip: {

                style: {
                    color: '#FFFFFFF',
                    fontSize: '14px'

                }
            },

            plotOptions: {
                series: {
                    label: {

                        connectorAllowed: true
                    }
                }
            },

            series: [{

                data: count
            }],

            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }

        });
    }

    function loadBloodChart(series, month, year) {
        // Build the chart
        chart = Highcharts
            .chart(
                'bloodChart',
                {
                    chart: {
                        height: 500,
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        style: {
                            fontFamily: 'serif'
                        }
                    },
                    title: {
                        style: {
                            color: '#FFFFFFF',
                        },
                        text: 'Quantity of blood in '+month+' , '+year
                    },
                    tooltip: {
                        pointFormat: '<b>{series.name} : {point.percentage:.1f}%</b>',
                        style: {
                            color: '#FFFFFFF',
                            fontSize: '14px'

                        }
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b> : {point.percentage:.1f} %',
                                style: {
                                    color: (Highcharts.theme)
                                        || 'white',
                                    fontWeight: 'bold',
                                    fontSize: '18px'
                                },
                                connectorColor: 'silver'
                            }
                        }
                    },
                    series: [{
                        data: series
                    }],
                    name: 'Brands',
                    colorByPoint: true
                });


    }


    function addMonthsYears() {
        var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        var years = ['2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019'];
        years = years.reverse();
        var optionsMonths = "";
        var optionsYears = "";
        $('#selectYearBlood').html("");
        $('#selectMonthBlood').html("");
        $('#selectYearReceiver').html("");
        $('#selectMonthReceiver').html("");
        $('#selectYearDonor').html("");
        $('#selectMonthDonor').html("");
        for (var i = 0; i < months.length; i++) {
            if(i<10){
                optionsMonths += '<option value=0' + (i+1) + '> ' + months[i];
                optionsMonths += '</option>';
            }else{
                optionsMonths += '<option value=' + (i+1) + '> ' + months[i];
                optionsMonths += '</option>';
            }

        }


        for (var i = 0; i < years.length; i++) {
            optionsYears += '<option value=' + years[i] + '> ' + years[i];
            optionsYears += '</option>';
        }
        $('#selectYearReceiver').append(optionsYears);
        $('#selectMonthReceiver').append(optionsMonths);
        $('#selectYearDonor').append(optionsYears);
        $('#selectMonthDonor').append(optionsMonths);
        $('#selectYearBlood').append(optionsYears);
        $('#selectMonthBlood').append(optionsMonths);
    }


   
</script>
</body>
</html>