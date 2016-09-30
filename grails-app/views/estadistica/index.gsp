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
            $('#proyectospublicosprivados').highcharts({
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
                         name: 'PUBLICOS',
                         y: ${totalPublicos},
                         sliced: true
                     }, {
                         name: 'PRIVADOS',
                         y: ${totalPrivados}
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
                            name: 'APROBADAS',
                            y: ${auditoriasAprobadas},
                            sliced: true
                        }, {
                            name: 'RECHAZADAS',
                            y: ${auditoriasRechazadas}
                        }]
                    }]
                });
            });
        });
        $(function () {
            $(document).ready(function () {
                $('#tipoauditorias').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: 'Programas en Auditorias'
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
                            name: 'COMPITE +1000',
                            y: ${audiCompite},
                            sliced: true
                        }, {
                            name: 'COMPITE INNOVA',
                            y: ${audiInnova}
                        }, {
                            name: 'CONSULTORÍA',
                            y: ${audiConsultoria}
                        }]
                    }]
                });
            });
        });
        $(function () {
            $(document).ready(function () {
                $('#containeregresodoc').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: 'Documentos en egresos'
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
                            name: 'BOLETAS',
                            y: ${boletasEgreso},
                            sliced: true
                        }, {
                            name: 'FACTURAS',
                            y: ${facturasEgreso}
                        }]
                    }]
                });
            });
        });
        $(function () {
            var chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'graficoconrotacion',
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
                    text: 'Programas en Proyectos'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.y}%</b>'
                },
                subtitle: {
                    text: 'Compite +1000 - Compite Innova - Consultaria'
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                xAxis: {
                    categories: ['COMPITE +1000', 'COMPITE INNOVA', 'CONSULTORIA']
                },
                yAxis: {
                    title: {
                        text: 'Total en proyectos'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                series: [{
                    name: 'Programas',
                    colorByPoint: true,
                    data: [{
                        name: 'Compite +1000',
                        y: ${percentCompite1000},
                        sliced: true
                    }, {
                        name: 'Compite Innova',
                        y: ${percentCompiteInnova},
                    }, {
                        name: 'Consultoria',
                        y: ${percentConsultoria}
                    }]
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
            $('#propyectospormes').highcharts({
                title: {
                    text: 'Proyectos Publicos y Privados',
                    x: -20 //center
                },
                subtitle: {
                    text: 'Meses año 2016',
                    x: -20
                },
                xAxis: {
                    categories: ['ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO',
                        'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE', 'DICIEMBRE']
                },
                yAxis: {
                    title: {
                        text: 'Cantidad por mes'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: ' Proyectos'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [{
                    name: 'Publicos',
                    data: [10, 6, 9, 14, 11, 21, 25, 26, 23, 18, 13, 9]
                }, {
                    name: 'Privados',
                    data: [1, 2, 3, 11, 17, 22, 24, 24, 20, 14, 8, 2]
                }]
            });
        });
        $(function () {
            $('#container4').highcharts({
                chart: {
                    type: 'area'
                },
                title: {
                    text: 'Proyectos Publicos y Privados',
                },
                subtitle: {
                    text: 'Meses año 2016',
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
                        text: 'Cantidad por mes'
                    },
                    labels: {
                        formatter: function () {
                            return this.value / 1000 + '';
                        }
                    }
                },
                xAxis: {
                    categories: ['ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO',
                        'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE', 'DICIEMBRE']
                },
                tooltip: {
                    pointFormat: '{series.name} <b>{point.y:,.0f}</b><br/> {point.x}'
                },
                series: [{
                    name: 'Publicos',
                    data: [10, 6, 9, 14, 11, 21, 25, 26, 23, 18, 13, 9]
                }, {
                    name: 'Privados',
                    data: [1, 2, 3, 11, 17, 22, 24, 24, 20, 14, 8, 2]
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
                        <a href="${createLink(controller:'programa')}">
                            <i class="fa grails-icon">
                                <asset:image src="grails-cupsonly-logo-white.svg"/>
                            </i> COMPITE
                        </a>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a class="navbar-brand" href="${createLink(controller:'programa')}">Programas</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'proyecto')}">Proyectos</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'usuario')}">Usuarios</a></li>

                    <li><a class="navbar-brand" href="${createLink(controller:'transporte')}">Transporte</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'empresa')}">Empresa</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'asignacion')}">Asignación</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'item')}">Item</a></li>

                    <li><a class="navbar-brand" href="${createLink(controller:'Egreso')}">Egresos</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'rendicion')}">Rendiciones</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'auditoria')}">Auditoría</a></li>

                    <li><a class="navbar-brand" href="${createLink(controller:'administrador', action:'reportes')}">Reportes</a></li>
                    <li><a class="navbar-brand" href="${createLink(controller:'estadistica')}">Estadísticas</a></li>

                    <li><a class="navbar-brand" href="${createLink(controller:'administrador', action:'cargarperfil',)}"
                        data-toggle="tooltip"
                            title="Modifica los datos de tu perfil">
                            Perfil
                        </a>
                    </li>
                    <li>
                        <a class="navbar-brand" href="${createLink(controller:'login', action:'logout')}" data-toggle="tooltip"
                            title="Cerrar sesión ${session.usuarioLogueado.nombres} ${session.usuarioLogueado.paterno}">
                            Salir
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row" style="padding-top:2em">
        <div class="col-md-6">
            <div id="proyectospublicosprivados" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
        </div>
        <div class="col-md-6">
            <div id="containerauditoriasre" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
        </div>
    </div>
    <div class="row" style="padding-top:2em">
        <div class="col-md-6">
            <div id="tipoauditorias" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
        </div>
        <div class="col-md-6">
            <div id="containeregresodoc" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
        </div>
    </div>
    <div class="row" style="padding-top:2em">
        <div class="col-md-12">
            <div id="graficoconrotacion" style="min-width: 400px; height: 600px; margin: 0 auto"></div>
            <div id="sliders">
                <table>
                    <tr>
                        <td>Angulo alfa</td>
                        <td><input id="alpha" type="range" min="0" max="45" value="15"/> <span id="alpha-value" class="value"></span></td>
                    </tr>
                    <tr>
                        <td>Angulo beta</td>
                        <td><input id="beta" type="range" min="-45" max="45" value="15"/> <span id="beta-value" class="value"></span></td>
                    </tr>
                    <tr>
                        <td>Base</td>
                        <td><input id="depth" type="range" min="20" max="100" value="50"/> <span id="depth-value" class="value"></span></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="footer" role="contentinfo"></div>
</body>
