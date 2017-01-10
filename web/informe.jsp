<%-- 
    Document   : generarInforme
    Created on : 25-dic-2016, 11:22:24
    Author     : DAVID
--%>

<%@page import="modelo.Tecnico"%>
<%@page import="java.util.ArrayList"%>
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
        
        
        <title>Informes</title>
    </head>
    <body class="body-login center-block">
        <%
            int[] valores = (int[]) session.getAttribute("informe");
            ArrayList<Tecnico> tecnicos = (ArrayList<Tecnico>) session.getAttribute("tecnicos");
        %>
        <!--Cabecera-->
        <div class="page-header col-md-8 col-md-offset-2">
            <h2>Informe resumen</h2>
        </div>
         <div class="container">
            <div class="container well col-md-10 col-md-offset-1">
            <h3>Resumen del análisis</h3>
                <div class="col-md-12"><hr></div>
                <div class="col-md-12"><hr></div>
                <table class="table table-bordered">
                    <tr class="text-center">
                        <td>Incidencias totales</td>
                        <td>Incidencias resueltas</td>
                        <td>Incidencias no resueltas</td>
                        <td>Incidencias no asignadas</td>
                    </tr>
                    <tr class="text-center">
                        <td><%=valores[0]%></td>
                        <td><%=valores[1]%></td>
                        <td><%=valores[2]%></td>
                        <td><%=valores[3]%></td>
                    </tr>
                </table>
                <br/><br/>
            </div>
         </div>
        <!--Pestañas con descripciones-->
        <div class="container">
            <div class="container well col-md-10 col-md-offset-1">
                <div class="tabbable">
                    <ul class="nav nav-tabs">
                      <li class="active"><a href="#tab1" data-toggle="tab">Resumen por técnicos</a></li>
                      <li><a href="#tab2" data-toggle="tab">Resumen por tipo de incidencia</a></li>
                      <li><a href="#tab3" data-toggle="tab">Resumen por prioridad de incidencia</a></li>
                    </ul>
                    <div class="tab-content">
                
                        <div class="tab-pane active" id="tab1">
                            <h3>Resumen por técnico</h3>
                <div class="col-md-12"><hr></div>
                <div class="col-md-12"><hr></div>
                <table class="table table-bordered">
                    <tr class="text-center">
                        <td>Nombre</td>
                        <td>Incidencias resueltas</td>
                        <td>Incidencias no resueltas</td>
                    </tr>
                    <%for(int i = 0; i<tecnicos.size();i++){%>
                    <tr class="text-center">
                        <td><%=tecnicos.get(i).getNombre()%></td>
                        <td><%=tecnicos.get(i).getNumeroIncidencias()%></td>
                        <td>0</td>
                    </tr>
                    <%}%>
                </table>
                <br/><br/>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <h3>Resumen por tipo de incidencia</h3>
                <div class="col-md-12"><hr></div>
                <div class="col-md-12"><hr></div>
                <table class="table table-bordered">
                    <tr class="text-center">
                        <td>Incidencias Hardware</td>
                        <td>Incidencias Software básico</td>
                        <td>Incidencias Programas de aplicaciones</td>
                        <td>Problemas con las comunicaciones</td>
                    </tr>
                    <tr class="text-center">
                        <td><%=valores[4]%></td>
                        <td><%=valores[5]%></td>
                        <td><%=valores[6]%></td>
                        <td><%=valores[7]%></td>
                    </tr>
                </table>
                <br/><br/>
                        </div>
                        <div class="tab-pane" id="tab3">
                            <h3>Resumen por prioridad de incidencia</h3>
                <div class="col-md-12"><hr></div>
                <div class="col-md-12"><hr></div>
                <table class="table table-bordered">
                    <tr class="text-center">
                        <td>Incidencias con prioridad alta</td>
                        <td>Incidencias con prioridad media</td>
                        <td>Incidencias con prioridad baja</td>
                    </tr>
                    <tr class="text-center">
                        <td><%=valores[8]%></td>
                        <td><%=valores[9]%></td>
                        <td><%=valores[10]%></td>
                    </tr>
                </table>
                <br/><br/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
