<%-- 
    Document   : login
    Created on : 28-dic-2016
    Author     : SILVIA
--%>


<%@include file="WEB-INF/jspf/includes.jspf" %>

<div id="box" class="container">
  
  <div class="page-header col-md-6 col-md-offset-3">
            <h1>Gestor de incidencias</h1>
  </div>
  <div class="container well col-md-6 col-md-offset-3">
    <form class="form-signin" action="" method="POST">
        <div class="page-header col-md-6 col-md-offset-3">
            <h2>Iniciar sesión</h2>
        </div>
        
        <div class="  col-md-6 col-md-offset-3">
            <input type="text" name="inputUsername" class="form-control" placeholder="Usuario" maxlength="20" required autofocus>
        </div>
        <div class=" col-md-6 col-md-offset-3">
            <input type="password" name="inputPassword" class="form-control" placeholder="Contraseña" required>
        </div>
    
        <div class=" col-md-6 col-md-offset-3">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
        </div>
    </div>
          <% if (request.getAttribute("error") != null) { %>
      <p class="text-danger"><%= request.getAttribute("error") %></p>
    <% } %>
    
    
  </form>

</div> <!-- /container -->

