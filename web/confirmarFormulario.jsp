<%-- 
    Document   : vistaConfirmacionFormulario
    Created on : 28-dic-2016, 12:07:45
    Author     : mario
--%>

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
        
        <title>Confirmar Formulario</title>
    </head>
    <body class="body-login center-block">
        <div class="container well col-md-6 col-md-offset-3">
            <form role="form" method="post" id="conformulario">
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="id-incidendia">Identificador incidencia:</label>
                    <p class="form-control-static">INC_2016_001</p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="usuario">Usuario:</label>
                    <p class="form-control-static">Silvia Arias</p><br><br>
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
                    <p class="form-control-static">Alta</p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="categoria">Categoría:</label>
                    <p class="form-control-static">Hardware</p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="descripcion">Descripción:</label>
                    <p class="form-control-static">Parrafo donde va la descripción 
                        escrita por el usuario que la crea</p>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <br><br>
                    <button type="submit" class="btn btn-success btn-lg col-lg-offset-0">Confirmar</button>
                </div>
            </form>
        </div>
    </body>
</html>