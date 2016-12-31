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

        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://code.jquery.com/jquery.js"></script>
        <!-- Include all compiled plugins (below), or include individual files 
        as needed -->
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/npm.js"></script>

        <script type="text/javascript">
            $(document).ready(
                    function () {
                        $('.dropdown-toggle').dropdown();
                    });
            );
        </script>
        
        <title>Formulario</title>
    </head>
    <body class="body-login center-block">
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
                    <select class="form-control">
                        <option selected>cualquiera</option>
                        <option>Alta</option>
                        <option>Media</option>
                        <option>Baja</option>
                    </select>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="categoria">Categoría:</label>
                    <select class="form-control">
                        <option selected>cualquiera</option>
                        <option>Hardware</option>
                        <option>Problemas con las comunicaciones</option>
                        <option>Software básico</option>
                        <option>Software de aplicaciones</option>
                    </select>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label class="control-label" for="descripcion">Descripción:</label>
                    <textarea class="form-control" rows="5"></textarea>
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <br><br>
                    <button type="submit" class="btn btn-success btn-lg col-lg-offset-0">Entrar</button>
                    <button type="submit" class="btn btn-success btn-lg col-lg-offset-3">Cancelar</button>
                </div>
            </form>
        </div>
    </body>
</html>
