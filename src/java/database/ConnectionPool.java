package database;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.InitialContext;

/**
 * Piscina de conexiones utilizada para la conexion a la base de datos
 *
 * @author yo
 */
public class ConnectionPool {

    private static ConnectionPool pool = null;
    private static DataSource dataSource = null;
    private static final String RUTA_BD = "java:/comp/env/jdbc/none";

    private ConnectionPool() {
        try {
            InitialContext ic = new InitialContext();
            dataSource = (DataSource) ic.lookup(RUTA_BD);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ConnectionPool getInstance() {
        if (pool == null) {
            pool = new ConnectionPool();
        }
        return pool;
    }

    public Connection getConnection() {
        try {
            return dataSource.getConnection();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return null;
        }
    }

    public void freeConnection(Connection c) {
        try {
            c.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}