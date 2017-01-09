/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author DAVID
 */
public class Cancelar extends HttpServlet {

            /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String url;
            HttpSession session;
            session = request.getSession();
            Usuario user = (Usuario)session.getAttribute("usuario");
            if(user.getRol().equalsIgnoreCase("Cliente")){
                url = "/vistaCliente.jsp";
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
            }
            if(user.getRol().equalsIgnoreCase("Supervisor")){
                url = "/vistasupervisor.jsp";
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
            }
            else{
                url = "/vistaTecnico.jsp";
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
            }
    }

}
