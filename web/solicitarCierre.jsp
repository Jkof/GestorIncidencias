<%-- 
    Document   : solicitarCierre
    Created on : 09-ene-2017, 12:00:03
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/includes.jspf"%>
        <title>Solicitar Cierre</title>
    </head>
    <body class="body-login center-block">
        <div class="page-header col-md-8 col-md-offset-3">
            <h2>Solicitud de cierre</h2>
        </div>
        <div class="container well col-md-6 col-md-offset-3">
            
        <div class="container">
        <form role="form" action="SolicitudCierre" method="post" id="solicitudCierre">
            <div class="form-group col-md-6">
                <label class="control-label">Mensaje de notificación de cierre:</label>
                <textarea class="form-control" name="notificacionCierre" rows="4"></textarea>
                <div class="col-md-12"><hr></div>
                <button type="submit" class="btn btn-success btn-lg col-md-4">Enviar</button>  
        </form>
        </div>
            </div>
        </div>
        
    </body>
</html>

