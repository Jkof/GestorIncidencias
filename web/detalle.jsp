<%-- 
    Document   : vistaConfirmacionFormulario
    Created on : 28-dic-2016, 12:07:45
    Author     : mario
--%>

<%@page import="modelo.Incidencia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        
        <%@include file="WEB-INF/jspf/includes.jspf" %>
        
        <script type="text/javascript">
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        });
        </script>
        
        <title>Detalle incidencia</title>
    </head>
    <body class="body-login center-block">
        <%
            Incidencia incidencia = (Incidencia) session.getAttribute("incidencia");
        %>
        <div class="container well col-md-6 col-md-offset-3">
            <div class="page-header col-md-6 col-md-offset-3">
                <h1>Detalle incidencia</h1>
            </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="id-incidendia">Identificador incidencia:</label>
                    <p class="form-control-static"><%=incidencia.getIdentificador()%></p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="usuario">Usuario:</label>
                    <p class="form-control-static"><%=incidencia.getUsuario()%></p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="inventario">Inventario afectado:</label>
                    <p class="form-control-static">PC_Lab1_001</p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="fecha">¿Cuando ocurrió?</label>
                    <p class="form-control-static">29/12/2016</p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="prioridad">Prioridad:</label>
                    <p class="form-control-static"><%=incidencia.getPrioridad()%></p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="categoria">Categoría:</label>
                    <p class="form-control-static"><%=incidencia.getCategoria()%></p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="descripcion">Descripción:</label>
                    <p class="form-control-static">Parrafo donde va la descripción 
                        escrita por el usuario que la crea</p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="cerrada">¿Cerrada?</label>
                    <p class="form-control-static">Si/No</p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="resolucion">Resolución:</label>
                    <p class="form-control-static">Parrafo donde va la descripción 
                        de la resolución</p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <br><br>
                    
                    <button type="cancel" class="btn btn-success btn-lg col-lg-offset-4" onclick="location.href='Cancelar';">Cerrar</button>
                </div>
        </div>
    </body>
</html>