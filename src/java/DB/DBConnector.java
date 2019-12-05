/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import Entidades.Productor;

/**
 *
 * @author joans
 */
public class DBConnector {
    
    protected Connection conn;
    // Librería de MySQL
    public String driver = "com.mysql.cj.jdbc.Driver";

    // Nombre de la base de datos
    public String database = "fmm_db";

    // Host
    public String hostname = "node27226-farmersmmarket.es-1.axarnet.cloud";

    // Puerto
    public String port = "3306";

    // Ruta de nuestra base de datos (desactivamos el uso de SSL con "?useSSL=false")
    public String url = "jdbc:mysql://" + hostname + ":" + port + "/" + database + "?useSSL=false&serverTimezone=UTC";

    // Nombre de usuario
    public String username = "root";

    // Clave de usuario
    public String password = "MCAyxb59661";

    public DBConnector() throws SQLException {
        try {
            Class.forName(driver);

        } catch (Exception e) {
            e.printStackTrace();
        }
        conn = DriverManager.getConnection(url, username, password);
    }
    
    public void close() throws SQLException{
        conn.close();
    }
    
    
}
