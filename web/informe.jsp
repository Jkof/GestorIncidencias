<%-- 
    Document   : generarInforme
    Created on : 25-dic-2016, 11:22:24
    Author     : DAVID
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <%@include file="WEB-INF/jspf/includes.jspf" %>

        <script type="text/javascript">
            $(document).ready(
                    function () {
                        $('.dropdown-toggle').dropdown();
                    });
            );
        </script>
        <script>
            $.datepicker.regional['es'] = {
                closeText: 'Cerrar',
                prevText: '< Ant',
                nextText: 'Sig >',
                currentText: 'Hoy',
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                weekHeader: 'Sm',
                dateFormat: 'dd/mm/yy',
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: ''
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);
            $(function () {
                $("#datepicker").datepicker({
                    maxDate: new Date,
                    autoclose: true,
                    todayHighlight: true,
                    dateFormat: "dd/mm/yy"
                });
                $("#datepicker").datepicker("setDate", new Date());
                $("#datepicker2").datepicker({
                    maxDate: new Date,
                    autoclose: true,
                    todayHighlight: true,
                    dateFormat: "dd/mm/yy"
                });
                $("#datepicker2").datepicker("setDate", new Date());
            });
        </script>
        
        <title>Informes</title>
    </head>
    <body class="body-login center-block">
        <!--Cabecera-->
        <div class="page-header col-md-8 col-md-offset-2">
            <h2>Informe resumen</h2>
        </div>
        <!--Jumbotron con fechas-->
        <div class="container">
            <div class="container well col-md-10 col-md-offset-1">
                <h3>Periodo de análisis</h3>
                <div class="col-md-12"><hr></div>
                <form role="form" action="search" method="GET">
                    <div class="form-group col-md-1">
                        <h4>Desde:</h4>
                    </div>
                    <div class="form-group col-md-3">
                        <input class="form-control" type="text" id="datepicker" name="fechaInicio">
                    </div>
                    <div class="form-group col-md-1">
                        <h4>Hasta:</h4>
                    </div>
                    <div class="form-group col-md-3">
                        <input class="form-control" type="text" id="datepicker2" name="fechaFin">
                    </div>
                    <button type="submit" class="btn btn-info btn-default col-md-3 col-md-offset-1 ">Generar informe</button>
                </form>
                <br/><br/>
            </div>
        </div>
        
        
        
        <!--Pestañas con descripciones-->
        <div class="container">
            <div class="container well col-md-10 col-md-offset-1">
                <div class="tabbable">
                    <ul class="nav nav-tabs">
                      <li class="active"><a href="#tab1" data-toggle="tab">Resumen del análisis</a></li>
                      <li><a href="#tab2" data-toggle="tab">Resumen por técnico</a></li>
                      <li><a href="#tab3" data-toggle="tab">Resumen por tipo de incidencia</a></li>
                      <li><a href="#tab4" data-toggle="tab">Resumen por prioridad de incidencia</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                <h3>Resumen del análisis</h3>
                <div class="col-md-12"><hr></div>
                <div class="col-md-3">
                        <h4>Periodo de análisis</h4>
                </div>
                <div class="col-md-3">
                        <h4>18/12/2016</h4>
                </div>
                <div class="col-md-3">
                        <h4>20/12/2016</h4>
                </div>
                <div class="col-md-12"><hr></div>
                <table class="table table-bordered">
                    <tr class="text-center">
                        <td>Incidencias totales</td>
                        <td>Incidencias resueltas</td>
                        <td>Incidencias no resueltas</td>
                        <td>Incidencias no asignadas</td>
                    </tr>
                    <tr class="text-center">
                        <td>Resuelta</td>
                        <td>Resuelta</td>
                        <td>Resuelta</td>
                        <td>Resuelta</td>
                    </tr>
                </table>
                <br/><br/>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <p>Howdy, I'm in Section 2.</p>
                        </div>
                        <div class="tab-pane" id="tab3">
                            <p>I'm in Section 3.</p>
                        </div>
                        <div class="tab-pane" id="tab4">
                            <p>Howdy, I'm in Section 4.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
