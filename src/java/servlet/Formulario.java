/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import database.Consulta;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class Formulario extends HttpServlet {

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
        
        String url = "/formulario.jsp";
        String inventario = request.getParameter("inventario");
        String fecha = request.getParameter("fecha");
        String prioridad = request.getParameter("prioridad");
        String categoria = request.getParameter("categoria");
        String descripcion = request.getParameter("descripcion");
        System.out.println(inventario+fecha+prioridad+categoria+descripcion);
        HttpSession sesion= (HttpSession) request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        
        Date date = null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        try {
            date = dateFormat.parse(fecha);
            
            System.out.println(dateFormat.format(date));
        } catch (ParseException ex) {
            Logger.getLogger(Formulario.class.getName()).log(Level.SEVERE, null, ex);
        }
        dateFormat.applyPattern("yyyy/MM/dd");
        String fechaFormateada = dateFormat.format(date);
        System.out.println(fecha);
        try {
            date = dateFormat.parse(fechaFormateada);
            
            System.out.println(dateFormat.format(date));
        } catch (ParseException ex) {
            Logger.getLogger(Formulario.class.getName()).log(Level.SEVERE, null, ex);
        }
        Incidencia incidencia = new Incidencia(descripcion, inventario, usuario.getUsuario(), prioridad, categoria);
        System.out.println(incidencia.toString());
        incidencia.setFechaInicio(date);
        sesion.setAttribute("incidencia", incidencia);
        System.out.println(incidencia.getFechaInicio());
        Consulta.insertarIncidencia(incidencia);
        if(usuario.getRol().equalsIgnoreCase("Cliente")){
            url = "/vistaCliente.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        else if(usuario.getRol().equalsIgnoreCase("Tecnico")){
            url = "/vistaTecnico.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        else{
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
    }
}
