<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Información de la aplicación - Resumida</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:javascript src="/compite/highchartjs/highcharts.js"/>
    <asset:javascript src="/compite/highchartjs/highcharts-3d.js"/>
    <asset:javascript src="/compite/highchartjs/modules/exporting.js"/>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="grails.css"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="main.css"/>
    <asset:stylesheet src="mobile.css"/>
    <style type="text/css">
        a:link {
            text-decoration: none;
        }
        #container, #sliders {
            min-width: 310px;
            max-width: 800px;
            margin: 0 auto;
        }
        #container {
            height: 400px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
               return {
                   radialGradient: {
                       cx: 0.5,
                       cy: 0.3,
                       r: 0.7
                   },
                   stops: [
                       [0, color],
                       [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
                   ]
               };
            });
            $('#container1').highcharts({
                 chart: {
                     plotBackgroundColor: null,
                     plotBorderWidth: null,
                     plotShadow: false,
                     type: 'pie'
                 },
                 title: {
                     text: 'Cantidad de proyectos publicos y privados'
                 },
                 tooltip: {
                     pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                 },
                 plotOptions: {
                     pie: {
                         allowPointSelect: true,
                         cursor: 'pointer',
                         dataLabels: {
                             enabled: true,
                             format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                             style: {
                                 color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                             }
                         }
                     }
                 },
                 series: [{
                     name: 'Cantidad',
                     colorByPoint: true,
                     data: [{
                         name: 'PROYECTOS PUBLICOS',
                         y: ${percentPub},
                         sliced: true
                     }, {
                         name: 'PROYECTOS PRIVAODS',
                         y: ${percentPri}
                     }]
                 }]
             });

        });
        $(function () {
            $(document).ready(function () {
                $('#containerauditoriasre').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: 'Resumen Auditorias'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                style: {
                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                }
                            }
                        }
                    },
                    series: [{
                        name: 'Cantidad',
                        colorByPoint: true,
                        data: [{
                            name: 'AUDITORIAS APROBADAS',
                            y: ${auditoriasAprobadas},
                            sliced: true
                        }, {
                            name: 'AUDITORIAS RECHAZADAS',
                            y: ${auditoriasRechazadas}
                        }]
                    }]
                });
            });
        });
        $(function () {
            var chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'container2',
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 15,
                        depth: 50,
                        viewDistance: 25
                    }
                },
                title: {
                    text: 'GRAFICO CON ROTACIÓN'
                },
                subtitle: {
                    text: 'PRUEBA LAS OPCIONES DE MOVIMIENTOS'
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                series: [{
                    data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
                }]
            });
            function showValues() {
                $('#alpha-value').html(chart.options.chart.options3d.alpha);
                $('#beta-value').html(chart.options.chart.options3d.beta);
                $('#depth-value').html(chart.options.chart.options3d.depth);
            }
            $('#sliders input').on('input change', function () {
                chart.options.chart.options3d[this.id] = this.value;
                showValues();
                chart.redraw(false);
            });
            showValues();
        });
        $(function() {
            $('#containerbasicline').highcharts({
                title: {
                    text: 'Monthly Average Temperature',
                    x: -20 //center
                },
                subtitle: {
                    text: 'Source: WorldClimate.com',
                    x: -20
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yAxis: {
                    title: {
                        text: 'Temperature (°C)'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '°C'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [{
                    name: 'Tokyo',
                    data: [10.0, 6.9, 9.5, 14.5, 11.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                }, {
                    name: 'New York',
                    data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                }, {
                    name: 'Berlin',
                    data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                }, {
                    name: 'London',
                    data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                }]
            });
        });
        $(function() {
            $('#container3').highcharts({
                title: {
                    text: 'Monthly Average Temperature',
                    x: -20 //center
                },
                subtitle: {
                    text: 'Source: WorldClimate.com',
                    x: -20
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yAxis: {
                    title: {
                        text: 'Temperature (°C)'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '°C'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [{
                    name: 'Tokyo',
                    data: [10.0, 6.9, 9.5, 14.5, 11.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                }, {
                    name: 'New York',
                    data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                }, {
                    name: 'Berlin',
                    data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                }, {
                    name: 'London',
                    data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                }]
            });
        });
        $(function () {
            $('#container4').highcharts({
                chart: {
                    type: 'area'
                },
                title: {
                    text: 'US and USSR nuclear stockpiles'
                },
                subtitle: {
                    text: 'Source'
                },
                xAxis: {
                    allowDecimals: false,
                    labels: {
                        formatter: function () {
                            return this.value; // clean, unformatted number for year
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: 'Nuclear weapon states'
                    },
                    labels: {
                        formatter: function () {
                            return this.value / 1000 + '';
                        }
                    }
                },
                tooltip: {
                    pointFormat: '{series.name} produced <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
                },
                plotOptions: {
                    area: {
                        pointStart: 1940,
                        marker: {
                            enabled: false,
                            symbol: 'circle',
                            radius: 2,
                            states: {
                                hover: {
                                    enabled: true
                                }
                            }
                        }
                    }
                },
                series: [{
                    name: 'USA',
                    data: [null, null, null, null, null, 6, 11, 32, 110, 235, 369, 640,
                        1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,
                        27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342, 26662,
                        26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605,
                        24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586,
                        22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,
                        10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104]
                }, {
                    name: 'USSR/Russia',
                    data: [null, null, null, null, null, null, null, null, null, null,
                        5, 25, 50, 120, 150, 200, 426, 660, 869, 1060, 1605, 2471, 3322,
                        4238, 5221, 6129, 7089, 8339, 9399, 10538, 11643, 13092, 14478,
                        15915, 17385, 19055, 21205, 23044, 25393, 27935, 30062, 32049,
                        33952, 35804, 37431, 39197, 45000, 43000, 41000, 39000, 37000,
                        35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000, 22000,
                        21000, 20000, 19000, 18000, 18000, 17000, 16000]
                }]
            });
        });
    </script>
</head>

<body>
    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container" style="float: right; margin-right: 0%">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
                <ul class="nav navbar-nav navbar-left">
                    <li>
                        <a href="/programa/index">
                            <i class="fa grails-icon">
                                <img src="/assets/grails-cupsonly-logo-white.svg" />
                            </i> COMPITE
                        </a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="navbar-brand" href="/proyecto/index">Proyectos</a></li>
                    <li><a class="navbar-brand" href="/transporte/index">Transporte</a></li>
                    <li><a class="navbar-brand" href="/empresa/index">Empresa</a></li>
                    <li><a class="navbar-brand" href="/asignacion/index">Asignación</a></li>
                    <li><a class="navbar-brand" href="/auditoria/index">Auditoría</a></li>
                    <li><a class="navbar-brand" href="/usuario/index">Usuarios</a></li>
                    <li><a class="navbar-brand" href="/item/index">Item</a></li>
                    <li><a class="navbar-brand" href="/rendicion/index">Rendición</a></li>
                    <li><a class="navbar-brand" href="/egreso/index">Egreso</a></li>
                    <li><a class="navbar-brand" href="/administrador/reportes">Reportes</a></li>
                    <li><a class="navbar-brand" href="/estadistica/index">Estadísticas</a></li>
                    <li role="presentation" class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            ${session.usuarioLogueado.nombres} ${session.usuarioLogueado.paterno}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="navbar-brand" href="/administrador/cargarperfil">Perfil</a></li>
                            <li>
                                <a class="navbar-brand" href="/login/logout">
                                    Cerrar sesión
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row" style="padding-top:2em">
        <div class="col-md-6">
            <div id="container1" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
        </div>
        <div class="col-md-6">
            <div id="containerauditoriasre" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
        </div>
    </div>
    <div class="row" style="padding-top:2em">
        <div class="col-md-6">
            <div id="containerbasicline" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
        </div>
        <div class="col-md-6">
            <div id="container2" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
            <div id="sliders">
                <table>
                    <tr>
                    	<td>Alpha Angle</td>
                    	<td><input id="alpha" type="range" min="0" max="45" value="15"/> <span id="alpha-value" class="value"></span></td>
                    </tr>
                    <tr>
                    	<td>Beta Angle</td>
                    	<td><input id="beta" type="range" min="-45" max="45" value="15"/> <span id="beta-value" class="value"></span></td>
                    </tr>
                    <tr>
                    	<td>Depth</td>
                    	<td><input id="depth" type="range" min="20" max="100" value="50"/> <span id="depth-value" class="value"></span></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div id="container3" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
        </div>
        <div class="col-md-6">
            <div id="container4" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
        </div>
    </div>
    <div class="footer" role="contentinfo"></div>
</body>
