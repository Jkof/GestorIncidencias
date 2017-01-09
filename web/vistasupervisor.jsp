<%-- 
    Document   : vistaSupervisor
    Created on : 29-dic-2016, 13:27:26
    Author     : DAVID
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Incidencia"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <%@include file="WEB-INF/jspf/includes.jspf"%>
        <script type="text/javascript">
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        });
        </script>
        
        <title>Supervisor</title>
    </head>
    <body>
        <br>
        <%
            Usuario userHost = (Usuario) session.getAttribute("usuario");
        %>
        <p class="text-right">Iniciada sesión como: <%= userHost.getUsuario() + " (" + userHost.getRol()+ ")"%></p>
        <br>
        
        <center>
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='InicioSupervisor';">
                <br>
                <span class="glyphicon glyphicon-home"></span>
                <p>Inicio<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='GenerarInforme';">
                <br>
                <span class="glyphicon glyphicon-home"></span>
                <p>Generar Informes<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='IncidenciasAbiertas';">
                <br>
                <span class="glyphicon glyphicon-folder-open"></span>
                <p>Incidencias Abiertas<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='IncidenciasCerradas';">
                <br>
                <span class="glyphicon glyphicon-lock"></span>
                <p>Incidencias Cerradas<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='IncidenciaPorUsuario';">
                <br>
                <span class="glyphicon glyphicon-user"></span>
                <p>Listado por Clientes<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='IncidenciaPorTecnico';">
                <br>
                <span class="glyphicon glyphicon-wrench"></span>
                <p>Listado por Técnicos<br></p>
            </button>
            <button type="button" class="btn btn-default btn-lg" onclick="location.href='CerrarSesion';">
                <br>
                <span class="glyphicon glyphicon-remove-sign"></span>
                <p>Cerrar Sesión<br></p>
            </button>
        </div>
        </center>
    
        <br><br>
    
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-body">
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
                <td>Usuario</td>
                <td>Técnico</td>
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
                <td><%=incidencias.get(i).getUsuario()%></td>
                <%if(incidencias.get(i).getTecnico() == null){%>
                <form method="POST" action="ListaTecnicos">
                    <td><button type="submit" class="btn btn-link" name="idIncidencia" value="<%=incidencias.get(i).getIdentificador()%>">Asignar Tecnico</button></td>
                </form>
                <%}else{%>    
                    <td><%=incidencias.get(i).getTecnico()%></td>
                <%}%>
                <%if(incidencias.get(i).isResuelta()){%>    
                    <td>Resuelta</td>
                <%}else{%>    
                    <td>Sin resolver</td>
                <%}%>
                <td><%=incidencias.get(i).getFechaInicio()%></td>
                <%if(incidencias.get(i).getFechaFin() != null){%>    
                    <td><%=incidencias.get(i).getFechaFin()%></td>
                    <%}else if(incidencias.get(i).getFechaFin() == null && incidencias.get(i).getResolucion()!=null){%>    
                    <form method="POST" action="Cerrar">
                    <td><button type="submit" class="btn btn-link" name="idIncidencia" value="<%=incidencias.get(i).getIdentificador()%>">Pendiente de cierre</button></td>
                    </form>
                <%}else{%>    
                    <form method="POST" action="Cerrar">
                    <td><button type="submit" class="btn btn-link" name="idIncidencia" value="<%=incidencias.get(i).getIdentificador()%>">Cerrar</button></td>
                </form>
                <%}%>
                <td><%=incidencias.get(i).getDescripcion()%></td>
            </tr>
            <%}%>
        </table>
        
        <center>
            <form method="POST" action="vistasupervisor.jsp">
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
                </div>
            </div>
        </div>
        
        
            
    </body>
</html>
