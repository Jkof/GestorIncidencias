<%@page import="modelo.Tecnico"%>
<%@page import="java.util.ArrayList"%>
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
    <body class="body-login center-block">
        <div class="container well col-md-6 col-md-offset-3">
            <%
                ArrayList<Tecnico> tecnicos = (ArrayList) session.getAttribute("tecnicos");
            %>
            <label class="control-label" for="asignar">Técnicos:</label>
            <table class="table table-bordered">
                <tr class="text-center">
                    <td>Nombre</td>
                    <td>Número de incidencia</td>
                </tr>
                <%for(int i = 0; i<tecnicos.size(); i++){%>
                <tr class="text-center">
                    <form method="POST" action="AsignarTecnico">
                    <td><button type="submit" class="btn btn-link" name="nombreTecnico" value="<%=tecnicos.get(i).getNombre()%>"><%=tecnicos.get(i).getNombre()%></button></td>
                    </form>
                    <td><%=tecnicos.get(i).getNombre()%></td>
                    <td><%=tecnicos.get(i).getNumeroIncidencias()%></td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
