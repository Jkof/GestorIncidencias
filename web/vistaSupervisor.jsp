<%-- 
    Document   : vistasup
    Created on : 26-dic-2016, 12:26:35
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
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        });
        </script>
        
        <title>Supervisor</title>
    </head>
    <body>
        <br>
        <p class="text-right">Iniciada sesión como: Nombre del supevisor (Supervisor)</p>
        <br>
        
        <center>
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-default btn-lg">
                <br>
                <span class="glyphicon glyphicon-home"></span>
                <p>Inicio<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg">
                <br>
                <span class="glyphicon glyphicon-home"></span>
                <p>Generar Informes<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg">
                <br>
                <span class="glyphicon glyphicon-folder-open"></span>
                <p>Incidencias Abiertas<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg">
                <br>
                <span class="glyphicon glyphicon-lock"></span>
                <p>Incidencias Cerradas<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg">
                <br>
                <span class="glyphicon glyphicon-user"></span>
                <p>Listado por Clientes<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg">
                <br>
                <span class="glyphicon glyphicon-wrench"></span>
                <p>Listado por Técnicos<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg">
                <br>
                <span class="glyphicon glyphicon-remove-sign"></span>
                <p>Cerrar Sesión<br></p>
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
                            <br>Técnico<br><br>
                            <select class="form-control" style="width: 130px;">
                                <option selected>cualquiera</option>
                                <option>Técnico 1</option>
                                <option>Técnico 2</option>
                                <option>Técnico 3</option>
                            </select>
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
