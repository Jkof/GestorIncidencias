<%-- 
    Document   : vistaTecnico
    Created on : 29-dic-2016, 12:41:16
    Author     : DAVID
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/includes.jspf"%>
        <script type="text/javascript">
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        });
        </script>
        
        <title>Tecnico</title>
    </head>
    <body>
        
        <br>
        
        <p class="text-right">Iniciada sesión como: Nombre del técnico (Técnico)</p>
        
        <br>
        
        <center>
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-default btn-lg">
                <span class="glyphicon glyphicon-home"></span>
                <p>Inicio<br><br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg">
                <span class="glyphicon glyphicon-file"></span>
                <p>Nueva<br>Incidencia</p>
            </button>
            <button type="button" class="btn btn-default btn-lg">
                <span class="glyphicon glyphicon-folder-open"></span>
                <p>Incidencias Asignadas<br>Abiertas</p>
            </button>
            <button type="button" class="btn btn-default btn-lg">
                    <span class="glyphicon glyphicon-lock"></span>
                    <p>Incidencias<br>Cerradas</p>
            </button>
            <button type="button" class="btn btn-default btn-lg">
                    <span class="glyphicon glyphicon-remove-sign"></span>
                    <p>Cerrar Sesión<br><br></p>
            </button>
        </div>
        </center>
    
        <br><br>
    
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <center>
                        <div class="col-sm-3">
                            <br>Palabras Clave<br><br>
                            <input type="text" class="form-control">
                        </div>
                        <div class="col-sm-3">
                            <br>Estado<br><br>
                            <select class="form-control" style="width: 130px;">
                                <option selected>cualquiera</option>
                                <option>Por Cerrar</option>
                                <option>Por Resolver</option>
                                <option>Resuelta</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <br>Prioridad<br><br>
                            <select class="form-control" style="width: 130px;">
                                <option selected>cualquiera</option>
                                <option>Alta</option>
                                <option>Media</option>
                                <option>Baja</option>
                            </select>
                        </div>
                            <div class="col-sm-1"><br><br><br><button type="button" class="btn btn-default btn-sm">Buscar</button></div>
                            <div class="col-sm-1"><br><br><br><button type="button" class="btn btn-default btn-sm">Limpiar</button></div>
                        </center>
                    </div>
                    <br>
                </div>
            </div>
        </div>
        <div class="col-md-2"></div>
        
        <br><br><br><br><br><br><br><br><br>
        
        <table class="table table-bordered">
            <tr class="text-center">
                <td>Id</td>
                <td>Prioridad</td>
                <td>Estado</td>
                <td>Fecha de publicación</td>
                <td>Fecha de cierre</td>
                <td>Resumen</td>
            </tr>
            <tr class="text-center danger">
                <td>1</td>
                <td>Alta</td>
                <td><a href="#">Solicitar Cierre</a></td>
                <td>30/11/2016</td>
                <td>Por Cerrar</td>
                <td>Texto en el que va el resumen</td>
            </tr>
            <tr class="text-center success">
                <td>2</td>
                <td>Baja</td>
                <td><a href="#">Solicitar Cierre</a></td>
                <td>12/11/2016</td>
                <td>Por Resolver</td>
                <td>Texto en el que va el resumen</td>
            </tr>
            <tr class="text-center warning">
                <td>3</td>
                <td>Media</td>
                <td>Resuelta</td>
                <td>03/11/2016</td>
                <td>18/11/2016</td>
                <td>Texto en el que va el resumen</td>
            </tr>
            <tr class="text-center">
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr class="text-center">
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr class="text-center">
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr class="text-center">
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        
        <div class="panel panel-default" style="background-color: lightgray;">
            <center>
            <button type="button" class="btn btn-default btn-xs"><<</button>
            <button type="button" class="btn btn-default btn-xs"><</button>
            <input type="text" class="text-center" style="width: 25px;" maxlength="2">
            <button type="button" class="btn btn-default btn-xs">></button>
            <button type="button" class="btn btn-default btn-xs">>></button>
            </center>
        </div>
        
    </body>
</html>