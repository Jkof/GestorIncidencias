/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import modelo.Incidencia;
import modelo.Tecnico;
import modelo.Usuario;

/**
 *
 * @author DAVID
 */
public class Consulta {
    
    private static final String INICIAR_SESION = "SELECT * FROM "
            + "usuario WHERE nombre= ? AND password= ?";
    private static final String INCIDENCIA_CLIENTE = "SELECT * FROM incidencia WHERE usuario=? ORDER BY idIncidencia DESC";
    private static final String INCIDENCIA_TECNICO = "SELECT * FROM "
            + "incidencia WHERE tecnico=? OR usuario=? ORDER BY idIncidencia DESC";
    private static final String LISTAR_INCIDENCIAS_PERSONALES_ABIERTAS = "SELECT"
            + " * FROM incidencia WHERE usuario = ? AND fechaCierre is NULL ORDER BY idIncidencia DESC";
    private static final String LISTAR_INCIDENCIAS_PERSONALES_CERRADAS = "SELECT"
            + " * FROM incidencia WHERE usuario = ? AND fechaCierre is NOT NULL ORDER BY idIncidencia DESC";
    private static final String LISTAR_INCIDENCIAS_ASIGNADAS = "SELECT * "
            + "FROM incidencia WHERE tecnico = ? AND resuelta = 0 AND fechaCierre is NULL ORDER BY idIncidencia DESC";
    private static final String LISTAR_INCIDENCIAS_CERRADAS = "SELECT"
            + " * FROM incidencia WHERE fechaCierre is NOT NULL ORDER BY idIncidencia DESC";
    private static final String LISTAR_TODAS_INCIDENCIAS = "SELECT * FROM incidencia ORDER BY idIncidencia DESC";
    private static final String LISTAR_INCIDENCIAS_ABIERTAS = "SELECT * FROM incidencia WHERE fechaCierre is NULL ORDER BY idIncidencia DESC";
    private static final String LISTAR_INCIDENCIAS_POR_USUARIO = "SELECT * FROM incidencia ORDER BY usuario";
    private static final String LISTAR_INCIDENCIAS_POR_TECNICO = "SELECT * FROM incidencia ORDER BY tecnico";
    private static final String INSERTAR_INCIDENCIA = "INSERT INTO incidencia VALUES(?,?,?,?,?,?,?,NULL,NULL,False,NULL)";
    private static final String NUMERO_INCIDENCIAS = "SELECT COUNT(*) FROM incidencia";
    private static final String INFO_INCIDENCIA = "SELECT * FROM incidencia WHERE idIncidencia=?";
    private static final String TECNICOS_INCIDENCIAS = "SELECT tecnico, COUNT(*) FROM incidencia WHERE tecnico is NOT NULL GROUP BY tecnico";
    private static final String ASIGNAR_INCIDENCIA = "UPDATE incidencia SET tecnico=? WHERE idIncidencia=?";
    private static final String SOLICITAR_CIERRE = "UPDATE incidencia SET resolucion=? WHERE idIncidencia=?";
    private static final String CERRAR_INCIDENCIA = "UPDATE incidencia SET fechaCierre=? WHERE idIncidencia=?";
    private static final String NUMERO_INCIDENCIAS_RESUELTAS = "SELECT COUNT(*) FROM incidencia WHERE resuelta=1";
    private static final String NUMERO_INCIDENCIAS_NO_RESUELTAS = "SELECT COUNT(*) FROM incidencia WHERE resuelta=0";
    private static final String NUMERO_INCIDENCIAS_NO_ASIGNADAS = "SELECT COUNT(*) FROM incidencia WHERE tecnico is NULL";
    private static final String NUMERO_INCIDENCIAS_HARDWARE = "SELECT COUNT(*) FROM incidencia WHERE categoria='hardware'";
    private static final String NUMERO_INCIDENCIAS_BASICO = "SELECT COUNT(*) FROM incidencia WHERE categoria='software básico'";
    private static final String NUMERO_INCIDENCIAS_APLICACIONES = "SELECT COUNT(*) FROM incidencia WHERE categoria='software de aplicaciones'";
    private static final String NUMERO_INCIDENCIAS_COMUNICACIONES = "SELECT COUNT(*) FROM incidencia WHERE categoria='problemas con las comunicaciones'";
    private static final String NUMERO_INCIDENCIAS_ALTA = "SELECT COUNT(*) FROM incidencia WHERE prioridad='Alta'";
    private static final String NUMERO_INCIDENCIAS_MEDIA = "SELECT COUNT(*) FROM incidencia WHERE prioridad='Media'";
    private static final String NUMERO_INCIDENCIAS_BAJA = "SELECT COUNT(*) FROM incidencia WHERE prioridad='Baja'";
    private static final String SOLICITAR_RESOLUCION = "UPDATE incidencia SET resolucion=?,resuelta=1 WHERE idIncidencia=?";
    private static final String TECNICOS_RESUELTAS = "SELECT tecnico, COUNT(*) FROM incidencia WHERE resuelta=1 GROUP BY tecnico";;
    private static final String TECNICOS_NO_RESUELTAS = "SELECT tecnico, COUNT(*) FROM incidencia WHERE resuelta=0 GROUP BY tecnico";;

    /**
     * Comprueba que el usuario y password esten el la base de datos
     *
     * @param usuario el email del usuario
     * @param password la clave del usuario
     * @return true si el usuario se encuentra, false en caso contrario
     */
    public static Usuario iniciarSesion(String usuario, String password) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        Usuario sesion = null;
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(INICIAR_SESION);
            ps.setString(1, usuario);
            ps.setString(2, password);
            ResultSet resultado = ps.executeQuery();
            if(resultado.first()){
                String rol = resultado.getString(3);
                sesion = new Usuario(usuario,password,rol);
                return sesion;
            }
            else{
                return sesion;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }
    }
    public static ArrayList<Incidencia> incidenciaUsuario(String usuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Incidencia incidencia;
        
        ArrayList<Incidencia> incidencias = new ArrayList<>();
        try {
            ps = connection.prepareStatement(INCIDENCIA_CLIENTE);
            ps.setString(1, usuario);
            ResultSet resultado = ps.executeQuery();
            if(null != resultado){
                System.out.println("Hay datos");
                while(resultado.next()){
                  incidencia = new Incidencia(resultado.getString(2), 
                          resultado.getString(3), resultado.getString(4), 
                          resultado.getString(5), resultado.getString(6));  
                    
                  incidencia.setIdentificador(resultado.getString(1));
                  incidencia.setFechaInicio(resultado.getDate(7));
                  incidencia.setFechaFin(resultado.getDate(8));
                  incidencia.setTecnico(resultado.getString(9));
                  incidencia.setResuelta(resultado.getBoolean(10));
                  incidencia.setResolucion(resultado.getString(11));
            
                  incidencias.add(incidencia);
                }
                System.out.println(incidencias.size());
                
                return incidencias;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Incidencia> incidenciaAbiertaUsuario(String usuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Incidencia incidencia;
        
        ArrayList<Incidencia> incidenciasAbiertas = new ArrayList<>();
        try {
            ps = connection.prepareStatement(LISTAR_INCIDENCIAS_PERSONALES_ABIERTAS);
            ps.setString(1, usuario);
            ResultSet resultado = ps.executeQuery();
            if(null != resultado){
                System.out.println("Hay datos");
                while(resultado.next()){
                  incidencia = new Incidencia(resultado.getString(2), 
                          resultado.getString(3), resultado.getString(4), 
                          resultado.getString(5), resultado.getString(6));  
                    
                  incidencia.setIdentificador(resultado.getString(1));
                  incidencia.setFechaInicio(resultado.getDate(7));
                  incidencia.setFechaFin(resultado.getDate(8));
                  incidencia.setTecnico(resultado.getString(9));
                  incidencia.setResuelta(resultado.getBoolean(10));
                  incidencia.setResolucion(resultado.getString(11));
            
                  incidenciasAbiertas.add(incidencia);
                }
                System.out.println(incidenciasAbiertas.size());
                
                return incidenciasAbiertas;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Incidencia> incidenciaCerradaUsuario(String usuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Incidencia incidencia;
        
        ArrayList<Incidencia> incidenciasAbiertas = new ArrayList<>();
        try {
            ps = connection.prepareStatement(LISTAR_INCIDENCIAS_PERSONALES_CERRADAS);
            ps.setString(1, usuario);
            ResultSet resultado = ps.executeQuery();
            if(null != resultado){
                System.out.println("Hay datos");
                while(resultado.next()){
                  incidencia = new Incidencia(resultado.getString(2), 
                          resultado.getString(3), resultado.getString(4), 
                          resultado.getString(5), resultado.getString(6));  
                    
                  incidencia.setIdentificador(resultado.getString(1));
                  incidencia.setFechaInicio(resultado.getDate(7));
                  incidencia.setFechaFin(resultado.getDate(8));
                  incidencia.setTecnico(resultado.getString(9));
                  incidencia.setResuelta(resultado.getBoolean(10));
                  incidencia.setResolucion(resultado.getString(11));
            
                  incidenciasAbiertas.add(incidencia);
                }
                System.out.println(incidenciasAbiertas.size());
                
                return incidenciasAbiertas;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Incidencia> incidenciaTecnico(String usuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Incidencia incidencia;
        
        ArrayList<Incidencia> incidenciasAbiertas = new ArrayList<>();
        try {
            ps = connection.prepareStatement(INCIDENCIA_TECNICO);
            ps.setString(1, usuario);
            ps.setString(2,usuario);
            ResultSet resultado = ps.executeQuery();
            if(null != resultado){
                System.out.println("Hay datos");
                while(resultado.next()){
                  incidencia = new Incidencia(resultado.getString(2), 
                          resultado.getString(3), resultado.getString(4), 
                          resultado.getString(5), resultado.getString(6));  
                    
                  incidencia.setIdentificador(resultado.getString(1));
                  incidencia.setFechaInicio(resultado.getDate(7));
                  incidencia.setFechaFin(resultado.getDate(8));
                  incidencia.setTecnico(resultado.getString(9));
                  incidencia.setResuelta(resultado.getBoolean(10));
                  incidencia.setResolucion(resultado.getString(11));
            
                  incidenciasAbiertas.add(incidencia);
                }
                System.out.println(incidenciasAbiertas.size());
                
                return incidenciasAbiertas;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }    
    }
    
    public static ArrayList<Incidencia> incidenciaAsignadaTecnico(String usuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Incidencia incidencia;
        
        ArrayList<Incidencia> incidenciasAbiertas = new ArrayList<>();
        try {
            ps = connection.prepareStatement(LISTAR_INCIDENCIAS_ASIGNADAS);
            ps.setString(1, usuario);
            ResultSet resultado = ps.executeQuery();
            if(null != resultado){
                System.out.println("Hay datos");
                while(resultado.next()){
                  incidencia = new Incidencia(resultado.getString(2), 
                          resultado.getString(3), resultado.getString(4), 
                          resultado.getString(5), resultado.getString(6));  
                    
                  incidencia.setIdentificador(resultado.getString(1));
                  incidencia.setFechaInicio(resultado.getDate(7));
                  incidencia.setFechaFin(resultado.getDate(8));
                  incidencia.setTecnico(resultado.getString(9));
                  incidencia.setResuelta(resultado.getBoolean(10));
                  incidencia.setResolucion(resultado.getString(11));
            
                  incidenciasAbiertas.add(incidencia);
                }
                System.out.println(incidenciasAbiertas.size());
                
                return incidenciasAbiertas;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }    
    }
    
    public static ArrayList<Incidencia> incidenciaCerrada() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Incidencia incidencia;
        
        ArrayList<Incidencia> incidenciasAbiertas = new ArrayList<>();
        try {
            ps = connection.prepareStatement(LISTAR_INCIDENCIAS_CERRADAS);
            ResultSet resultado = ps.executeQuery();
            if(null != resultado){
                System.out.println("Hay datos");
                while(resultado.next()){
                  incidencia = new Incidencia(resultado.getString(2), 
                          resultado.getString(3), resultado.getString(4), 
                          resultado.getString(5), resultado.getString(6));  
                    
                  incidencia.setIdentificador(resultado.getString(1));
                  incidencia.setFechaInicio(resultado.getDate(7));
                  incidencia.setFechaFin(resultado.getDate(8));
                  incidencia.setTecnico(resultado.getString(9));
                  incidencia.setResuelta(resultado.getBoolean(10));
                  incidencia.setResolucion(resultado.getString(11));
            
                  incidenciasAbiertas.add(incidencia);
                }
                System.out.println(incidenciasAbiertas.size());
                
                return incidenciasAbiertas;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }    
    }

    public static ArrayList<Incidencia> incidenciaSupervisor() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Incidencia incidencia;
        
        ArrayList<Incidencia> incidenciasAbiertas = new ArrayList<>();
        try {
            ps = connection.prepareStatement(LISTAR_TODAS_INCIDENCIAS);
            ResultSet resultado = ps.executeQuery();
            if(null != resultado){
                System.out.println("Hay datos");
                while(resultado.next()){
                  incidencia = new Incidencia(resultado.getString(2), 
                          resultado.getString(3), resultado.getString(4), 
                          resultado.getString(5), resultado.getString(6));  
                    
                  incidencia.setIdentificador(resultado.getString(1));
                  incidencia.setFechaInicio(resultado.getDate(7));
                  incidencia.setFechaFin(resultado.getDate(8));
                  incidencia.setTecnico(resultado.getString(9));
                  incidencia.setResuelta(resultado.getBoolean(10));
                  incidencia.setResolucion(resultado.getString(11));
            
                  incidenciasAbiertas.add(incidencia);
                }
                System.out.println(incidenciasAbiertas.size());
                
                return incidenciasAbiertas;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }    
    }

    public static ArrayList<Incidencia> incidenciasAbiertas() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Incidencia incidencia;
        
        ArrayList<Incidencia> incidenciasAbiertas = new ArrayList<>();
        try {
            ps = connection.prepareStatement(LISTAR_INCIDENCIAS_ABIERTAS);
            ResultSet resultado = ps.executeQuery();
            if(null != resultado){
                System.out.println("Hay datos");
                while(resultado.next()){
                  incidencia = new Incidencia(resultado.getString(2), 
                          resultado.getString(3), resultado.getString(4), 
                          resultado.getString(5), resultado.getString(6));  
                    
                  incidencia.setIdentificador(resultado.getString(1));
                  incidencia.setFechaInicio(resultado.getDate(7));
                  incidencia.setFechaFin(resultado.getDate(8));
                  incidencia.setTecnico(resultado.getString(9));
                  incidencia.setResuelta(resultado.getBoolean(10));
                  incidencia.setResolucion(resultado.getString(11));
            
                  incidenciasAbiertas.add(incidencia);
                }
                System.out.println(incidenciasAbiertas.size());
                
                return incidenciasAbiertas;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }    
    }

    public static ArrayList<Incidencia> incidenciaPorTecnico() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Incidencia incidencia;
        
        ArrayList<Incidencia> incidenciasAbiertas = new ArrayList<>();
        try {
            ps = connection.prepareStatement(LISTAR_INCIDENCIAS_POR_TECNICO);
            ResultSet resultado = ps.executeQuery();
            if(null != resultado){
                System.out.println("Hay datos");
                while(resultado.next()){
                  incidencia = new Incidencia(resultado.getString(2), 
                          resultado.getString(3), resultado.getString(4), 
                          resultado.getString(5), resultado.getString(6));  
                    
                  incidencia.setIdentificador(resultado.getString(1));
                  incidencia.setFechaInicio(resultado.getDate(7));
                  incidencia.setFechaFin(resultado.getDate(8));
                  incidencia.setTecnico(resultado.getString(9));
                  incidencia.setResuelta(resultado.getBoolean(10));
                  incidencia.setResolucion(resultado.getString(11));
            
                  incidenciasAbiertas.add(incidencia);
                }
                System.out.println(incidenciasAbiertas.size());
                
                return incidenciasAbiertas;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }    
    }

    public static ArrayList<Incidencia> incidenciaPorUsuario() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Incidencia incidencia;
        
        ArrayList<Incidencia> incidenciasAbiertas = new ArrayList<>();
        try {
            ps = connection.prepareStatement(LISTAR_INCIDENCIAS_POR_USUARIO);
            ResultSet resultado = ps.executeQuery();
            if(null != resultado){
                System.out.println("Hay datos");
                while(resultado.next()){
                  incidencia = new Incidencia(resultado.getString(2), 
                          resultado.getString(3), resultado.getString(4), 
                          resultado.getString(5), resultado.getString(6));  
                    
                  incidencia.setIdentificador(resultado.getString(1));
                  incidencia.setFechaInicio(resultado.getDate(7));
                  incidencia.setFechaFin(resultado.getDate(8));
                  incidencia.setTecnico(resultado.getString(9));
                  incidencia.setResuelta(resultado.getBoolean(10));
                  incidencia.setResolucion(resultado.getString(11));
            
                  incidenciasAbiertas.add(incidencia);
                }
                System.out.println(incidenciasAbiertas.size());
                
                return incidenciasAbiertas;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }    
    }

    public static void insertarIncidencia(Incidencia incidencia) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            int numeroIncidencias;
            numeroIncidencias = resultado.getInt(1)+1;
            System.out.println(numeroIncidencias);
            //Insertamos un contenido
            
            //Creamos el ID
            String idIncidencia = "INC_";
            int year = Calendar.getInstance().get(Calendar.YEAR);
            idIncidencia = idIncidencia + year+"_";
            if(numeroIncidencias<10){
                idIncidencia = idIncidencia+"000"+numeroIncidencias;
            }
            else if(numeroIncidencias<100){
                idIncidencia = idIncidencia+"00"+numeroIncidencias;
            }
            else if(numeroIncidencias<1000){
                idIncidencia = idIncidencia+"0"+numeroIncidencias;
            }
            else{
                idIncidencia = idIncidencia+numeroIncidencias;
            }
            System.out.println(idIncidencia);
            incidencia.setIdentificador(idIncidencia);
            ps = connection.prepareStatement(INSERTAR_INCIDENCIA);
            ps.setString(1, incidencia.getIdentificador());
            ps.setString(2, incidencia.getDescripcion());
            ps.setString(3, incidencia.getInventarioAfectado());
            ps.setString(4, incidencia.getUsuario());
            ps.setString(5, incidencia.getPrioridad());
            ps.setString(6, incidencia.getCategoria());
            //Tratar la fecha
            java.sql.Date sqlDate = new java.sql.Date(incidencia.getFechaInicio().getTime());
            ps.setDate(7, sqlDate);
            int res1 = ps.executeUpdate();
            System.out.println("Insercion post en contenido: " + res1);
        } catch (SQLException e) {
        } finally {
            pool.freeConnection(connection);
        }
    }
    
    public static Incidencia infoIncidencia(String idIncidencia) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        Usuario sesion = null;
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(INFO_INCIDENCIA);
            ps.setString(1, idIncidencia);
            ResultSet resultado = ps.executeQuery();
            Incidencia incidencia;
            if(resultado.first()){
                incidencia = new Incidencia(resultado.getString(2), 
                          resultado.getString(3), resultado.getString(4), 
                          resultado.getString(5), resultado.getString(6));  
                    
                  incidencia.setIdentificador(resultado.getString(1));
                  incidencia.setFechaInicio(resultado.getDate(7));
                  incidencia.setFechaFin(resultado.getDate(8));
                  incidencia.setTecnico(resultado.getString(9));
                  incidencia.setResuelta(resultado.getBoolean(10));
                  incidencia.setResolucion(resultado.getString(11));
                  
                  System.out.println(incidencia.getIdentificador());
                  return incidencia;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Tecnico> infoTecnico() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Tecnico tecnico;
        
        ArrayList<Tecnico> tecnicos = new ArrayList<>();
        try {
            ps = connection.prepareStatement(TECNICOS_INCIDENCIAS);
            ResultSet resultado = ps.executeQuery();
            if(null != resultado){
                System.out.println("Hay datos");
                while(resultado.next()){
                  tecnico = new Tecnico(resultado.getString(1), 
                          resultado.getInt(2));  
                  tecnicos.add(tecnico);
                }
                System.out.println(tecnicos.size());
                
                return tecnicos;
            }
            else{
                return null;
            }
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static void actualizarTecnico(Incidencia incidencia) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(ASIGNAR_INCIDENCIA);
            //Creamos la incidencia
            ps.setString(1, incidencia.getTecnico());
            ps.setString(2, incidencia.getIdentificador());
            int res1 = ps.executeUpdate();
            System.out.println("Insercion post en contenido: " + res1);
        } catch (SQLException e) {
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static void solicitarCierre(Incidencia incidencia) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(SOLICITAR_CIERRE);
            //Creamos la incidencia
            ps.setString(1, incidencia.getResolucion());
            ps.setString(2, incidencia.getIdentificador());
            int res1 = ps.executeUpdate();
            System.out.println("Insercion post en contenido: " + res1);
        } catch (SQLException e) {
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static void cerrarIncidencia(Incidencia incidencia) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(CERRAR_INCIDENCIA);
            //Creamos la fecha
            java.util.Date utilDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            
            ps.setDate(1, sqlDate);
            ps.setString(2, incidencia.getIdentificador());
            int res1 = ps.executeUpdate();
            System.out.println("Insercion post en contenido: " + res1);
        } catch (SQLException e) {
        } finally {
            pool.freeConnection(connection);
        }
    }
    
    public static int numeroIncidencias() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        int numeroIncidencias;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            numeroIncidencias = resultado.getInt(1);
            return numeroIncidencias;
        } catch (SQLException e) {
            return 0;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static int numeroIncidenciasResueltas() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        int numeroIncidencias;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS_RESUELTAS);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            numeroIncidencias = resultado.getInt(1);
            return numeroIncidencias;
        } catch (SQLException e) {
            return 0;
        } finally {
            pool.freeConnection(connection);
        }    
    }

    public static int numeroIncidenciasNoResueltas() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        int numeroIncidencias;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS_NO_RESUELTAS);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            numeroIncidencias = resultado.getInt(1)+1;
            return numeroIncidencias;
        } catch (SQLException e) {
            return 0;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static int numeroIncidenciasNoAsignadas() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        int numeroIncidencias;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS_NO_ASIGNADAS);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            numeroIncidencias = resultado.getInt(1)+1;
            return numeroIncidencias;
        } catch (SQLException e) {
            return 0;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static int numeroIncidenciasHardware() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        int numeroIncidencias;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS_HARDWARE);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            numeroIncidencias = resultado.getInt(1)+1;
            return numeroIncidencias;
        } catch (SQLException e) {
            return 0;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static int numeroIncidenciasSoftwareBasico() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        int numeroIncidencias;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS_BASICO);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            numeroIncidencias = resultado.getInt(1)+1;
            return numeroIncidencias;
        } catch (SQLException e) {
            return 0;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static int numeroIncidenciasSoftwareAplicacion() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        int numeroIncidencias;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS_APLICACIONES);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            numeroIncidencias = resultado.getInt(1)+1;
            return numeroIncidencias;
        } catch (SQLException e) {
            return 0;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static int numeroIncidenciasComunicaciones() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        int numeroIncidencias;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS_COMUNICACIONES);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            numeroIncidencias = resultado.getInt(1)+1;
            return numeroIncidencias;
        } catch (SQLException e) {
            return 0;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static int numeroIncidenciasAlta() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        int numeroIncidencias;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS_ALTA);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            numeroIncidencias = resultado.getInt(1)+1;
            return numeroIncidencias;
        } catch (SQLException e) {
            return 0;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static int numeroIncidenciasMedia() {
    ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        int numeroIncidencias;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS_MEDIA);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            numeroIncidencias = resultado.getInt(1)+1;
            return numeroIncidencias;
        } catch (SQLException e) {
            return 0;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static int numeroIncidenciasBaja() {
    ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        int numeroIncidencias;
        try {
            ps = connection.prepareStatement(NUMERO_INCIDENCIAS_BAJA);
            ResultSet resultado = ps.executeQuery();
            if(!resultado.first()){
                System.out.println("No hay nada");
            }
            System.out.println(resultado.toString());
            numeroIncidencias = resultado.getInt(1)+1;
            return numeroIncidencias;
        } catch (SQLException e) {
            return 0;
        } finally {
            pool.freeConnection(connection);
        }
    }

    public static void solicitarResolucion(Incidencia incidencia) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(SOLICITAR_RESOLUCION);
            //Creamos la incidencia
            ps.setString(1, incidencia.getResolucion());
            ps.setString(2, incidencia.getIdentificador());
            int res1 = ps.executeUpdate();
            System.out.println("Insercion post en contenido: " + res1);
        } catch (SQLException e) {
        } finally {
            pool.freeConnection(connection);
        }    }

    public static ArrayList<Tecnico> infoTecnicoIncidencias() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        Tecnico tecnico;
        
        ArrayList<Tecnico> tecnicos = new ArrayList<>();
        try {
            ps = connection.prepareStatement(TECNICOS_RESUELTAS);
            ResultSet resultado = ps.executeQuery();
                System.out.println("Hay datos");
                while(resultado.next()){
                    tecnico = new Tecnico(resultado.getString(1), 
                          resultado.getInt(2));  
                    tecnicos.add(tecnico);
                }
                ps = connection.prepareStatement(TECNICOS_NO_RESUELTAS);
                ResultSet result = ps.executeQuery();
                System.out.println("Hay datos");
                int i = 0;
                while(result.next() && i<tecnicos.size()){
                    tecnicos.get(i).setNumeroNoResueltas(result.getInt(2));
                    i++;
                }
            System.out.println(tecnicos.size());
                
            return tecnicos;
        } catch (SQLException e) {
            return null;
        } finally {
            pool.freeConnection(connection);
        }
    }
}
