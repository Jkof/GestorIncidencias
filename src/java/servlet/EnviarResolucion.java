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
 *
 * @author DAVID
 */
public class EnviarResolucion extends HttpServlet {

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
        
        String url;
        String solicitudCierre = request.getParameter("notificacionCierre");
        HttpSession sesion= (HttpSession) request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        
        Incidencia incidencia = (Incidencia) sesion.getAttribute("incidencia");
        incidencia.setResolucion(solicitudCierre);
        //Actualizar solicitud en base de datos
        Consulta.solicitarResolucion(incidencia);
        url = "/vistaTecnico.jsp";
        ArrayList <Incidencia> incidencias;
        incidencias = Consulta.incidenciaTecnico(usuario.getUsuario());
        sesion.setAttribute("incidencias", incidencias);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}
