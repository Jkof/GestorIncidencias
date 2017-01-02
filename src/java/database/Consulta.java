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
import modelo.Usuario;

/**
 *
 * @author DAVID
 */
public class Consulta {
    
    private static final String INICIAR_SESION = "SELECT * FROM "
            + "usuario WHERE nombre= ? AND password= ?";
    
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
}
