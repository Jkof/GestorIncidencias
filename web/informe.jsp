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
       <title>Informe</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="WEB-INF/jspf/includes.jspf" %>
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
                        <input type="text" class="form-control" name="fechaInicio" placeholder="dia/mes/año">
                    </div>
                    <div class="form-group col-md-1">
                        <h4>Hasta:</h4>
                    </div>
                    <div class="form-group col-md-3">
                        <input type="text" class="form-control" name="fechaFin" placeholder="dia/mes/año">
                    </div>
                    <button type="submit" class="btn btn-info btn-default col-md-3 col-md-offset-1 ">Generar informe</button>
                </form>
                <br/><br/>
            </div>
        </div>
        
        <!--Jumbotron con resumen general-->
        <div class="container">
            <div class="container well col-md-10 col-md-offset-1">
                <h3>Resumen del análisis</h3>
                <div class="col-md-12"><hr></div>
                <form role="form" action="search" method="GET">
                    <div class="form-group col-md-6">
                        <h4>Periodo mostrado</h4>
                    </div>
                    <div class="form-group col-md-6">
                        <h4>08-10-2016 a 30-11-2016</h4>
                    </div>
                    <div class="form-group col-md-3">
                        <input type="text" class="form-control" name="fechaFin" placeholder="dia/mes/año">
                    </div>
                    <div class="form-group col-md-3">
                        <input type="text" class="form-control" name="fechaFin" placeholder="dia/mes/año">
                    </div>
                    <div class="form-group col-md-3">
                        <input type="text" class="form-control" name="fechaFin" placeholder="dia/mes/año">
                    </div>
                    <div class="form-group col-md-3">
                        <input type="text" class="form-control" name="fechaFin" placeholder="dia/mes/año">
                    </div>
                </form>
                <br/><br/>
            </div>
        </div>
        
        <!--Pestañas con descripciones-->
        <div class="container">
            <div class="container well col-md-10 col-md-offset-1">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="#">Resumen diario</a>
                    
                    </li>
                    <li role="presentation"><a href="#">Resumen por técnico</a>
                    
                    </li>
                    <li role="presentation"><a href="#">Resumen por tipo de incidencia</a>
                    
                    </li>
                    <li role="presentation"><a href="#">Resumen por prioridad de incidencia</a>
                    
                    </li>
                </ul>
            </div>
        </div>
    </body>
</html>
