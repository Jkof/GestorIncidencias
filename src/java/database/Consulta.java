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

/**
 *
 * @author DAVID
 */
public class Consulta {
    
    private static final String INICIAR_SESION = "SELECT email, password FROM "
            + "usuario WHERE email= ? AND password= ?";
    
     /**
     * Comprueba que el usuario y password esten el la base de datos
     *
     * @param usuario el email del usuario
     * @param password la clave del usuario
     * @return true si el usuario se encuentra, false en caso contrario
     */
    public static boolean iniciarSesion(String usuario, String password) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(INICIAR_SESION);
            ps.setString(1, usuario);
            ps.setString(2, password);
            ResultSet sesion = ps.executeQuery();
            return sesion.first();
        } catch (SQLException e) {
            return false;
        } finally {
            pool.freeConnection(connection);
        }
    }
}
