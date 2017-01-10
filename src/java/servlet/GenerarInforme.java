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
import modelo.Tecnico;

/**
 *
 * @author DAVID
 */
public class GenerarInforme extends HttpServlet {

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
        int[] valores = new int[11];
        //Incidencias totales, resueltas, no resueltas, no asignadas
        valores[0] = Consulta.numeroIncidencias();
        valores[1] = Consulta.numeroIncidenciasResueltas();
        valores[2] = Consulta.numeroIncidenciasNoResueltas();
        valores[3] = Consulta.numeroIncidenciasNoAsignadas();
        //Incidencias por tecnico(numero de incidencias por tecnico)
        HttpSession session;
        session = request.getSession();
        ArrayList<Tecnico> tecnicos = Consulta.infoTecnicoIncidencias();
        session.setAttribute("tecnicos", tecnicos);
        //Incidencias por tipo de incidencia
        valores[4] = Consulta.numeroIncidenciasHardware();
        valores[5] = Consulta.numeroIncidenciasSoftwareBasico();
        valores[6] = Consulta.numeroIncidenciasSoftwareAplicacion();
        valores[7] = Consulta.numeroIncidenciasComunicaciones();
        //Incidencias por prioridad
        valores[8] = Consulta.numeroIncidenciasAlta();
        valores[9] = Consulta.numeroIncidenciasMedia();
        valores[10] = Consulta.numeroIncidenciasBaja();
        
        session.setAttribute("informe", valores);
        String url = "/informe.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}
