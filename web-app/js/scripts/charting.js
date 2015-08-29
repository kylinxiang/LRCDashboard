$(function($){
    window.allcharts=new Array();
});

function executionstat1(){
    $("#radio").hide();
    var type='executionstat1';
    var aTitle = 'CI Regression Execution Ratio';
    $.getJSON("data", function(jsonData) {
        stackedarea(aTitle,type,[]);
        while(allcharts[type].series.length > 0) {
            allcharts[type].series[0].remove();
        }
        // allcharts[type].showLoading();
        var j = 0;
        $.each(jsonData['execratio'], function(key, value) {
            allcharts[type].addSeries({name:key,'type':'line'});
            allcharts[type].series[j].setData(value,true);
            j++;
        });
        // allcharts[type].hideLoading();
        allcharts[type].redraw();
    });
}

function executionstat3(){
    var type='executionstat3';
    var aTitle = 'CBR Duration & LEVEL';
    $.getJSON("data", function(jsonData) {
        stackedarea(aTitle,type,[]);
        while(allcharts[type].series.length > 0) {
            allcharts[type].series[0].remove();
        }
        allcharts[type].showLoading();
        var j = 0;
        $.each(jsonData['execratio'], function(key, value) {
            allcharts[type].addSeries({name:key,type:'area'});
            allcharts[type].series[j].setData(value,true);
            j++;
        });
        allcharts[type].hideLoading();
        allcharts[type].redraw();
    });
}

function executionstat4(){
    var type='executionstat4';
    var aTitle = 'CBR Regression PASS Ratio';
    $.getJSON("data", function(jsonData) {
        stackedarea(aTitle,type,[]);
        while(allcharts[type].series.length > 0) {
            allcharts[type].series[0].remove();
        }
        allcharts[type].showLoading();
        var j = 0;
        $.each(jsonData['passratio'], function(key, value) {
            allcharts[type].addSeries({name:key,type:'area'});
            allcharts[type].series[j].setData(value,true);
            j++;
        });
        allcharts[type].hideLoading();
        allcharts[type].redraw();
    });
}

function executionstat2(){
    $("#radio").hide();
    var type='executionstat2';
    var aTitle = 'CI Regression PASS Ratio';
    $.getJSON("data", function(jsonData) {
        stackedarea(aTitle,type,[]);
        while(allcharts[type].series.length > 0) {
            allcharts[type].series[0].remove();
        }
        // allcharts[type].showLoading();
        var j = 0;
        $.each(jsonData['passratio'], function(key, value) {
            allcharts[type].addSeries({name:key,'type':'line'});
            allcharts[type].series[j].setData(value,true);
            j++;
        });
        // allcharts[type].hideLoading();
        allcharts[type].redraw();
    });
}

function fbnewstat() {
    var type = 'fbnewstat';
    var json;
    $.getJSON("fbstat2", function(jsonData) {
        json = jsonData;
        allcharts[type] = new Highcharts.Chart({
            chart: {
                renderTo: type,
                zoomType: 'x',
                defaultSeriesType: 'line',
                spacingRight: 20
            },
            title: {
                text: 'Feature build QT Statics'
            },
            subtitle: {
                text: document.ontouchstart === undefined ?
                    'Click and drag in the plot area to zoom in' :
                    'Drag your finger over the plot to zoom in'
            },
            xAxis: {
                type: 'datetime',
                maxZoom: 28 * 24 * 3600 * 1000, // fourteen days
                title: {
                    text: null
                }
            },
            yAxis: [{
                title: {
                    text: 'Quality Level'
                },
                startOnTick: false,
                showFirstLabel: false,
                opposite: false,
                max:8,
                min:0
            },
            {
                title: {
                    text: 'Test Time'
                },
                startOnTick: false,
                opposite: true,
                max:160,
                min:0
            }],
            tooltip: {
                formatter: function() {
                        var result = '';
                        if (this.series.name.indexOf('FB') >= 0){
                            result = 'Received at: ' + Highcharts.dateFormat("%Y-%m-%d %H:%M", this.x);
                            $.each(jsonData[this.series.name.split('_')[0]]['content'][this.x], function(key, value) {
                                result = result + '<br>' + value;
                            });
                        } else {
                            result = 'Week/Month from: ' + Highcharts.dateFormat("%Y-%m-%d %H:%M", this.x);
                        }
                        if (this.series.name.indexOf('level') >= 0) {
                            result = result + '<br>Quality Level: ' + this.y; 
                        }else if(this.series.name.indexOf('time') >= 0) {
                            result = result + '<br>Test time: ' + this.y + ' hours'; 
                        }
                        return result;
                    },
                shared: false
            },
            plotOptions: {
                scatter: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            click: function() {
                                if (this.series.name.indexOf('FB') >= 0) {
                                    var package = jsonData[this.series.name.split('_')[0]]['content'][this.x][0].replace('Name: ','');
                                    window.open("show?build=" + package);
                                }
                            }
                        }
                    }
                },
                line: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            click: function() {
                                if (this.series.name.indexOf('FB') >= 0) {
                                    var package = jsonData[this.series.name.split('_')[0]]['content'][this.x][0].replace('Name: ','');
                                    window.open("show?build=" + package);
                                }
                            }
                        }
                    }
                }
            },
            legend: {
                enabled: true
            },
            series: []
        });
        
        daily(json);
        
        $('#radio1').click(function() {
            daily(json);
        });
        $('#radio2').click(function() {
            weekly(json,'week');
        });
        $('#radio3').click(function() {
            weekly(json,'month');
        });
    });
}
function daily(jsonData){
    while(allcharts['fbnewstat'].series.length > 0) {
        allcharts['fbnewstat'].series[0].remove();
    }
    // allcharts['fbnewstat'].showLoading();
    var j = 0;
    $.each(jsonData, function(key, value) {
        allcharts['fbnewstat'].addSeries({name:key+'_level','type':'line'});
        allcharts['fbnewstat'].series[j].setData(value['level'],true);
        j++;
    });
    //cost time
    $.each(jsonData, function(key, value) {
        allcharts['fbnewstat'].addSeries({name:key+'_time','type':'scatter','yAxis': 1}); 
        allcharts['fbnewstat'].series[j].setData(value['time'],true);
        j++;
    });
    // allcharts['fbnewstat'].hideLoading();
    allcharts['fbnewstat'].redraw();
}

function weekly(jsonData,interval){
    var calendar = new Array();
    var result = {'level':[],'time':[]};
    if (interval == 'week'){
        calendar = [];
        var start = Date.parse('2012/8/6') + (8 * 3600 * 1000); //+8 hours -1 second
        var end = new Date();
        end = end.getTime();
        // while(end.getDay() != 1) {
            // end = new Date(end.getTime() + 24 * 3600 * 1000);
        // }
        while(start < end) {
            calendar.push([start,0,0,0]);
            start = start + 7 * 24 * 3600 * 1000;
        }
        calendar.push([end,0,0,0]);
    } else if (interval == 'month') {
        calendar = [];
        var start = Date.parse("2012/8/1") + (8 * 3600 * 1000);
        startTime = new Date(start);
        var end = new Date();
        end = end.getTime();
        while(start < end){
            calendar.push([start,0,0,0]);
            startTime = new Date(startTime.setMonth(startTime.getMonth()+1));
            start = startTime.getTime();
        }
        calendar.push([end,0,0,0]);
    }
    //result = ['level':[point,value],[point,value]],'time':[point,value],[point,value]]
    //calendar = [[1222222121,3,32,1222,3.1,45.1],]
    //json = ['FB12.08':['time':[[1222222,12],[1232234444,21]],'level':[[1222222,12],[1232234444,21]]]]
    $.each(jsonData, function(key, value) {
        $.each(value['level'], function(j, item) {
            $.each(calendar, function(k, atom) {
                if ( calendar[k][0] < item[0] && k < calendar.length-1 && item[0] < calendar[k+1][0] ){
                    calendar[k][1] = calendar[k][1] + 1;
                    calendar[k][2] = calendar[k][2] + item[1];//level
                    calendar[k][3] = calendar[k][3] + value['time'][j][1];//time
                }
            });
        });  
    });
    $.each(calendar, function(i, value) {
        if (value[1] != 0) {
            result['level'].push([value[0],value[2]/value[1]]);
            result['time'].push([value[0],value[3]/value[1]]);
        } else {
            result['level'].push([value[0],0]);
            result['time'].push([value[0],0]);
        }
    });
    allcharts['fbnewstat'].showLoading();
    while(allcharts['fbnewstat'].series.length > 0) {
        allcharts['fbnewstat'].series[0].remove();
    }
    allcharts['fbnewstat'].addSeries({name:'level','type':'line'});
    allcharts['fbnewstat'].series[0].setData(result['level'],true);
    allcharts['fbnewstat'].addSeries({name:'time','type':'line','yAxis': 1});
    allcharts['fbnewstat'].series[1].setData(result['time'],true);
    allcharts['fbnewstat'].hideLoading();
    allcharts['fbnewstat'].redraw();
}
function update(chart,jsonData,interval){
        var startDay = jsonData['startDay'].replace(/-/g, '/');
        var i = 0;
        chart.showLoading();
        $.each(jsonData['data'], function(key, value) {
            var seriesData = new Array();
            $.each(value,function(j,item){
                seriesData.push([Date.parse(startDay) + (8 * 3600 * 1000) + (interval * 24 * 3600 * 1000 * j),item])
            });
            chart.series[i].setData(seriesData,true);
            i++;
        });
        chart.hideLoading();
        chart.redraw();
}
function prontostat(type) {
    $.getJSON("standard?type="+type, function(jsonData) {
        var startDay = jsonData['startDay'].replace(/-/g, '/');
        var seriesData = new Array();
        $.each(jsonData['data'], function(key, value) {        
            seriesData.push({'type':'line','name': key,'pointInterval': 24 * 3600 * 1000,'pointStart': Date.parse(startDay) + 8 * 3600 * 1000,'data':value});
        });
        stackedarea(type,type,seriesData); 
        $('#radio2').click(function() {
        $.getJSON('standard?type='+type+'&interval=weekly',function(jsonData) {
            update(allcharts[type],jsonData,7);
            });
        });
        $('#radio1').click(function() {
            $.getJSON('standard?type='+type+'&interval=daily',function(jsonData) {
                update(allcharts[type],jsonData,1);
            });
        });
    })
}

function stackedarea(aTitle,type,seriesData) {
    allcharts[type] = new Highcharts.Chart({
        chart: {
            renderTo: type,
            zoomType: 'x',
            spacingRight: 20
        },
        title: {
            text: aTitle
        },
        subtitle: {
            text: document.ontouchstart === undefined ?
                'Click and drag in the plot area to zoom in' :
                'Drag your finger over the plot to zoom in'
        },
        xAxis: {
            type: 'datetime',
            maxZoom: 14 * 24 * 3600 * 1000, // fourteen days
            title: {
                text: null
            }
        },
        yAxis: {
            title: {
                text: false
            },
            startOnTick: false,
            showFirstLabel: false
        },
        tooltip: {
        	// formatter: function() {
				// return 'Total:';
				// },
            shared: true,
        },
        legend: {
            enabled: true
        },
        plotOptions: {
            area: {
                stacking: true,
                // fillColor: {
                    // linearGradient: [0, 0, 0, 300],
                    // stops: [
                        // [0, Highcharts.getOptions().colors[0]],
                        // [1, 'rgba(2,0,0,0)']
                    // ]
                // },
                lineWidth: 1,
                marker: {
                    enabled: false,
                    states: {
                        hover: {
                            enabled: true,
                            radius: 5
                        }
                    }
                },
                shadow: false,
                states: {
                    hover: {
                        lineWidth: 1						
                    }
                }
            }
        },
        series: seriesData
    });
    // chart.tooltip.hide=function(){
        //alert("hide");
    // };
    
}
function prpie() {
    $.getJSON("prstat", function(jsonData) {
        pie('status',jsonData);
        pie('open',jsonData);
        pie('total',jsonData);
    })
}
function prcolumn() {
    $.getJSON("prhistory", function(jsonData) {
        column('totalcolumn',jsonData);
        column('opencolumn',jsonData);
        //alert(jsonData['x'][0].replace(new RegExp('-','gm'),','));
        //alert(jsonData['x'][0].replace(/-/g, ','));
    })
}
function pie(kind,jsonData) {
    var mytitle = '';
    if (kind == 'open') {
        mytitle = 'Open prontos by DA';
    } else if (kind == 'status') {
        mytitle = 'Current prontos by status';
    } else if (kind == 'total') {               
        mytitle = 'All prontos by DA';
    }
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: kind,
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: mytitle
        },
        tooltip: {
            formatter: function() {
                return '<b>'+ this.point.name +'</b>: '+ this.y;
            },
            enabled: true
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false,
                    color: '#000000',
                    connectorColor: '#000000',
                    formatter: function() {
                        return '<b>'+ this.point.name +'</b>: '+ this.y;
                    }
                },
                showInLegend: true
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            data: jsonData[kind]
        }]
    });
}

//column
function column(kind,jsonData) {
    var mytitle = '';
    var xday = '';
    if (kind == 'opencolumn') {
        mytitle = 'Open prontos amount';
        xday = jsonData['xopen'].replace(/-/g, '/');
    } else if (kind == 'totalcolumn') {
        mytitle = 'All prontos amount';
        xday = jsonData['xtotal'].replace(/-/g, '/');
    }
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: kind,
            zoomType: 'x',
            spacingRight: 20
        },
        title: {
            text: mytitle
        },
        subtitle: {
            text: document.ontouchstart === undefined ?
                'Click and drag in the plot area to zoom in' :
                'Drag your finger over the plot to zoom in'
        },
        xAxis: {
            type: 'datetime',
            maxZoom: 14 * 24 * 3600 * 1000, // fourteen days
            title: {
                text: null
            }
        },
        yAxis: {
            title: {
                text: 'Amount'
            },
            startOnTick: false,
            showFirstLabel: false
        },
        tooltip: {
            shared: true					
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            area: {
                fillColor: {
                    linearGradient: [0, 0, 0, 300],
                    stops: [
                        [0, Highcharts.getOptions().colors[0]],
                        [1, 'rgba(2,0,0,0)']
                    ]
                },
                lineWidth: 1,
                marker: {
                    enabled: false,
                    states: {
                        hover: {
                            enabled: true,
                            radius: 5
                        }
                    }
                },
                shadow: false,
                states: {
                    hover: {
                        lineWidth: 1						
                    }
                }
            }
        },
        series: [{
            type: 'area',
            name: kind,
            pointInterval: 24 * 3600 * 1000,
            pointStart: Date.parse(xday) + 8 * 3600 * 1000,//2012-11-7
            data: jsonData[kind]
        }]
    });
}   
//chart for FB
function fbchart(branch) {
    $.getJSON("fbstat?id="+branch, function(jsonData) {
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: branch,
                defaultSeriesType: 'column'
            },
            title: {
                text: jsonData["t"] +' Statics'
            },
            xAxis: {
                categories: jsonData["x"],
                labels: {
                    rotation: -45,
                    align: 'right',
                    style: {
                         font: 'normal 13px Verdana, sans-serif'
                    }
                 },
                 showEmpty: false,
                 startOnTick: false
            },
            yAxis: [{ 
                title: {
                    text: 'Quality level',
                    style: {
                        color: '#4572A7'
                    }
                },
                allowDecimals:false,
                tickInterval:1,
                labels: {
                    formatter: function() {
                        return this.value;
                    },
                    style: {
                        color: '#4572A7'
                    }
                },
                min: -1,
                max: 7
            },
            { 
                title: {
                    text: 'Test time(hours)',
                    style: {
                        color: '#AA4643'
                    }
                },
                labels: {
                    formatter: function() {
                        return this.value;
                    },
                    style: {
                        color: '#AA4643'
                    }
                },
                opposite: true,
                max:50
            }],
            tooltip: {
                formatter: function() {
                    if (this.series.name == "Quality level") {
                            var result = '<b>' + this.x + '</b>';
                            for( var i = 0; i < jsonData["x"].length; i++ ) {
                                if ( jsonData["x"][i] == this.x ) {
                                    for( var j = 0; j < jsonData["c"][i].length; j++ ) {
                                        result = result + '<br>' + jsonData["c"][i][j];
                                    }
                                var ql = this.y
                                if ( this.y == -1 ) ql = "Not tested" 
                                result = result + '<br>Quality level: ' + ql;
                                return result;                                
                                }
                            }
                     } else {
                        return '<b>' + this.x +'</b><br/>'+ this.series.name +': '+ this.y;
                     }
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 100,
                borderWidth: 0
            },
            plotOptions: {
                column: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            click: function() {
                                window.open("show?build=" + jsonData["x"][this.x]);
                            }
                        }
                    },
                    dataLabels: {
                        enabled: true
                    },
                    pointWidth: 10,
                    pointInvertal: 1
                },
                spline: {
                    dataLabels: {
                        enabled: true
                    },
                    pointInvertal: 1
                }
            },
            series: [{
                name: 'Quality level',
                type: 'column',
                data: jsonData["q"]
            },
            {
                name: 'Test time',
                type: 'spline',
                data: jsonData["d"],
                yAxis: 1
            }]
        });
    });
}
