<%-- 
    Document   : login
    Created on : 26-dic-2016, 12:24:07
    Author     : DAVID
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Acceso al Gestor de Incidencias</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="WEB-INF/jspf/includes.jspf" %>
    </head>
    <body class="body-login center-block">
        <!--Cabecera-->
        <div class="page-header col-md-6 col-md-offset-3">
            <h1>Gestor de incidencias</h1>
        </div>
        <div class="page-header col-md-6 col-md-offset-3">
            <h2>Iniciar sesión</h2>
        </div>
        <!--Iniciar sesion-->
        <div class="container well col-md-6 col-md-offset-3">
            <form role="form" action="login" method="post" id="login">
                <div class="form-group col-md-6 col-md-offset-3">
                    <label for="usuario">Usuario</label>
                    <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario">
                </div>
                <div class="form-group col-md-6 col-md-offset-3">
                    <label for="password">Contraseña</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña">
                </div>
                <button type="submit" class="btn btn-success btn-lg col-md-6 col-md-offset-3">Entrar</button>
            </form>
        </div>
    </body>
</html>
