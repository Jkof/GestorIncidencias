/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import database.Consulta;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Incidencia;
import modelo.Usuario;

/**
 * Servlet invocado para hacer el login del usuario
 *
 * @author DavidRobles
 */
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Procesa la peticion realizada
     *
     * @param request objeto Request de la peticion
     * @param response objeto Response de la peticion
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/index.jsp";
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        if (null != Consulta.iniciarSesion(usuario, password)) {
            HttpSession session;
            session = request.getSession();
            ArrayList<Incidencia> incidencias;
            Usuario user = Consulta.iniciarSesion(usuario,password);
            session.setAttribute("usuario", user);
            if(user.getRol().equalsIgnoreCase("Cliente")){
                incidencias = Consulta.incidenciaUsuario(usuario);
                session.setAttribute("incidencias", incidencias);
                url = "/vistaCliente.jsp";
            }
            if(user.getRol().equalsIgnoreCase("Tecnico")){
                incidencias = Consulta.incidenciaTecnico(usuario);
                session.setAttribute("incidencias", incidencias);
                url = "/vistaTecnico.jsp";
            }
            
            if(user.getRol().equalsIgnoreCase("Supervisor")){
                incidencias = Consulta.incidenciaSupervisor();
                session.setAttribute("incidencias", incidencias);
                url = "/vistasupervisor.jsp";
            }
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
    }

}
