<%-- 
    Document   : vistaTecnico
    Created on : 29-dic-2016, 12:41:16
    Author     : DAVID
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Incidencia"%>
<%@page import="modelo.Usuario"%>
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
        <%
            Usuario userHost = (Usuario) session.getAttribute("usuario");
        %>
        <p class="text-right">Iniciada sesión como: <%= userHost.getUsuario() + " (" + userHost.getRol()+ ")"%></p>
        
        <br>
        
        <center>
        <div class="btn-group" role="group" action="TecNavbar">
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='InicioTecnico';">
                <span class="glyphicon glyphicon-home"></span>
                <p>Inicio<br><br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='NuevaIncidencia';">
                <span class="glyphicon glyphicon-file"></span>
                <p>Nueva<br>Incidencia</p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='IncidenciasAsignadasTecnico';">
                <span class="glyphicon glyphicon-folder-open"></span>
                <p>Incidencias Asignadas<br>Abiertas</p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='IncidenciasCerradasTecnico';">
                    <span class="glyphicon glyphicon-lock"></span>
                    <p>Incidencias<br>Cerradas</p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='IncidenciasClienteAbiertas';">
                <span class="glyphicon glyphicon-folder-open"></span>
                <p>Incidencias Personales<br>Abiertas</p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='IncidenciasClienteCerradas';">
                    <span class="glyphicon glyphicon-lock"></span>
                    <p>Incidencias Personales<br>Cerradas</p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='CerrarSesion';">
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
        
        <%
            ArrayList<Incidencia> incidencias = (ArrayList) session.getAttribute("incidencias");
            
            int maxPaginas = (int)Math.ceil(incidencias.size()/10.0);
            
            int j, k, pagina;
            
            if(request.getParameter("pagina") == null)
                pagina = 1;
            else if(request.getParameter("pagina") != null 
                    && Integer.parseInt(request.getParameter("pagina")) >= 1 
                    && Integer.parseInt(request.getParameter("pagina")) <= maxPaginas)
                pagina = Integer.parseInt(request.getParameter("pagina"));
            else if( Integer.parseInt(request.getParameter("pagina")) < 1 )
                pagina = 1;
            else if( Integer.parseInt(request.getParameter("pagina")) > maxPaginas )
                pagina = maxPaginas;
            else
                pagina = 1;
        %>
        <table class="table table-bordered">
            <tr class="text-center">
                <td>Id</td>
                <td>Prioridad</td>
                <td>Estado</td>
                <td>Fecha de publicación</td>
                <td>Fecha de cierre</td>
                <td>Resumen</td>
            </tr>
            <%  if(incidencias.size()<10){
                    j = 0;}
                else{
                    j = pagina*10-10;}
            
                if( (incidencias.size() - j) < 10 ){
                    k = incidencias.size()-j;}
                else{
                    k = 10;}
            
            for(int i = j; i<(j+k); i++){%>
            <%if(incidencias.get(i).getPrioridad().equalsIgnoreCase("Alta")){%>    
            <tr class="text-center danger">
            <%}%>
            <%if(incidencias.get(i).getPrioridad().equalsIgnoreCase("Media")){%>    
            <tr class="text-center warning">
            <%}%>
            <%if(incidencias.get(i).getPrioridad().equalsIgnoreCase("Baja")){%>    
            <tr class="text-center success">
            <%}%>
                <form method="POST" action="Detalle">
                    <td><button type="submit" class="btn btn-link" name="idIncidencia" value="<%=incidencias.get(i).getIdentificador()%>"><%=incidencias.get(i).getIdentificador()%></button></td>
                </form>
                <td><%=incidencias.get(i).getPrioridad()%></td>
                <%if(incidencias.get(i).isResuelta()){%>    
                    <td>Resuelta</td>
                <%}else if(incidencias.get(i).getTecnico()==null||incidencias.get(i).getUsuario().equalsIgnoreCase(userHost.getUsuario())){%>    
                    <td>Sin resolver</td>
                <%}else if(!incidencias.get(i).isResuelta() && incidencias.get(i).getTecnico().equalsIgnoreCase(userHost.getUsuario()) && incidencias.get(i).getFechaFin()==null){%>    
                    <td><a href="">Resolver</a></td>
                <%}else{%>
                    <td>Sin resolver</td>
                <%}%>
                <td><%=incidencias.get(i).getFechaInicio()%></td>
                <%if(incidencias.get(i).getFechaFin() != null){%>    
                    <td><%=incidencias.get(i).getFechaFin()%></td>
                <%}else if(incidencias.get(i).getTecnico()== null&&incidencias.get(i).getUsuario().equalsIgnoreCase(userHost.getUsuario())&&incidencias.get(i).getResolucion()!=null){%>    
                    <td>Pendiente de cierre</td>
                <%}else if(incidencias.get(i).getTecnico()== null&&incidencias.get(i).getUsuario().equalsIgnoreCase(userHost.getUsuario())){%>    
                    <form method="POST" action="SolicitarCierre">
                    <td><button type="submit" class="btn btn-link" name="idIncidencia" value="<%=incidencias.get(i).getIdentificador()%>">Solicitar cierre</button></td>
                    </form>
                <%}else if(incidencias.get(i).getTecnico()== null&&incidencias.get(i).getUsuario().equalsIgnoreCase(userHost.getUsuario())&&incidencias.get(i).getResolucion()!=null){%>    
                    <td>Pendiente de cierre</td>
                <%}else if(incidencias.get(i).getTecnico().equalsIgnoreCase(userHost.getUsuario())&&incidencias.get(i).getUsuario().equalsIgnoreCase(userHost.getUsuario())){%>    
                    <form method="POST" action="SolicitarCierre">
                    <td><button type="submit" class="btn btn-link" name="idIncidencia" value="<%=incidencias.get(i).getIdentificador()%>">Solicitar cierre</button></td>
                    </form>
                <%}else{%>
                    <td>Cerrada</td>
                <%}%>
                <td><%=incidencias.get(i).getDescripcion()%></td>
            </tr>
            <%}%>
        </table>
        
        <center>
            <form method="POST" action="vistaTecnico.jsp">
                <div class="btn-group" role="group" action="ClientNavbar">
                    <button type="submit" name="pagina" class="btn btn-default btn-xs" value="1"><<</button>
                    <button type="submit" name="pagina" class="btn btn-default btn-xs" value="<%=(pagina-1)%>"><</button>
                    <%for(int i = 1; i <= maxPaginas; i++){
                        if(i == pagina){%>
                            <button type="submit" class="btn btn-info btn-xs "><%=i%></button>
                        <%}else{%>
                            <button type="submit" name="pagina" value="<%=i%>" class="btn btn-default btn-xs"><%=i%></button>
                    <%}}%>
                    <button type="submit" name="pagina" class="btn btn-default btn-xs" value="<%=(pagina+1)%>">></button>
                    <button type="submit" name="pagina" class="btn btn-default btn-xs" value="<%=maxPaginas%>">>></button>
                </div>
            </form>
        </center>
        
        <br>
            
    </body>
</html>
