<%-- 
    Document   : vistaFormulario
    Created on : 28-dic-2016, 12:07:08
    Author     : mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

        <%@include file="WEB-INF/jspf/includes.jspf" %>

        <script type="text/javascript">
            $(document).ready(
                    function () {
                        $('.dropdown-toggle').dropdown();
                    });
            );
        </script>
        
        <title>Nueva incidencia</title>
    </head>
    <body class="body-login center-block">
        <!--Cabecera-->
        <div class="page-header col-md-6 col-md-offset-3">
            <h2>Nueva incidencia</h2>
        </div>
        <div class="container well col-md-6 col-md-offset-3">
            <form role="form" action="Formulario" method="post" id="formulario">
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="inventario">Inventario afectado:</label>
                    <input type="text" class="form-control" id="inventario" name="inventario" placeholder="Identificador del inventario.">
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="fecha">¿Cuando ocurrió?</label>
                    <input class="form-control" id="fecha" name="fecha" placeholder="dd/mm/yyyy" type="text"/>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="prioridad">Prioridad:</label>
                    <select class="form-control" name="prioridad">
                        <option selected>cualquiera</option>
                        <option>Alta</option>
                        <option>Media</option>
                        <option>Baja</option>
                    </select>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="categoria">Categoría:</label>
                    <select class="form-control" name="categoria">
                        <option selected>cualquiera</option>
                        <option>Hardware</option>
                        <option>Problemas con las comunicaciones</option>
                        <option>Software basico</option>
                        <option>Software de aplicaciones</option>
                    </select>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="descripcion">Descripción:</label>
                    <textarea class="form-control" name="descripcion" rows="4"></textarea>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <button type="submit" class="btn btn-success btn-lg col-md-4">Enviar</button>
                    <button type="submit" class="btn btn-success btn-lg col-md-offset-3">Cancelar</button>
                </div>
            </form>
        </div>
    </body>
</html>
