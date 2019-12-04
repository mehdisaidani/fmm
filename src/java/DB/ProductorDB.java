/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import Entidades.Productor;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Usuario
 */
public class ProductorDB extends DBConnector {

    // Ejecuta el Constructor del padre
    public ProductorDB() throws SQLException {
        super();
    }

    // Da de alta al usuario
    public void signUP(Productor productor) throws SQLException {

        String query = "INSERT INTO productores (`usuario`,`password`, `nombre`, `apellidos`, `email`, `numTelefono`) VALUES ("
                + "'" + productor.getUsuario()      + "',"
                + "'" + productor.getPassword()     + "',"
                + "'" + productor.getNombre()       + "',"
                + "'" + productor.getApellidos()    + "',"
                + "'" + productor.getEmail()        + "',"
                + "'" + productor.getNumTelefono()  + "');";

        Statement st = conn.createStatement();
        st.executeUpdate(query);
        st.close();

    }

    public boolean doesProducerExist(String producerUserName) throws SQLException {

        boolean exist = false;
        String checkNameQuery = "SELECT * FROM fmm_db.productores\n"
                + "WHERE usuario LIKE '" + producerUserName + "' OR email LIKE '" + producerUserName + "';";

        Statement statement = this.conn.createStatement();
        ResultSet resultSet = statement.executeQuery(checkNameQuery);
        while (resultSet.next()) {
            exist = true;
        }
        statement.close();
        resultSet.close();

        return exist;

    }
    
    // METODO PARA COMPROBAR QUE NO SE REPITA EL USUARIO O EL EMAIL
    public boolean doesProducerExist(String producerUserName, String producerEmail) throws SQLException {

        boolean exist = false;
        String checkNameQuery = "SELECT * FROM fmm_db.productores\n"
                + "WHERE usuario LIKE '" + producerUserName + "' OR email LIKE '" + producerEmail + "';";

        Statement statement = this.conn.createStatement();
        ResultSet resultSet = statement.executeQuery(checkNameQuery);
        while (resultSet.next()) {
            exist = true;
        }
        statement.close();
        resultSet.close();

        return exist;

    }
    
    
    public boolean isPasswordOK(String producerUserName, String producerPassword) throws SQLException {

        boolean isPasswordOK = false;

        String checkPasswordQuery = "SELECT password FROM productores "
                + "WHERE usuario LIKE '" + producerUserName + "' OR email LIKE '" + producerUserName + "';";

        Statement statement = this.conn.createStatement();
        ResultSet resultSet = statement.executeQuery(checkPasswordQuery);

        while (resultSet.next()) {
            if (producerPassword.equals(resultSet.getString("password"))) {
                isPasswordOK = true;
            }
        }
        statement.close();
        resultSet.close();

        return isPasswordOK;
    }

    public Productor selectProducer(String producerUserName) throws SQLException {
        Productor productor = new Productor();

        String query = "SELECT nombre,\n"
                + "    apellidos,\n"
                + "    usuario,\n"
                + "    password,\n"
                + "    email,\n"
                + "    numTelefono\n"
                + "    FROM productores WHERE usuario LIKE '" + producerUserName + "' "
                + "    OR email LIKE '" + producerUserName + "';";

        Statement statement = this.conn.createStatement();
        ResultSet result = statement.executeQuery(query);

        while (result.next()) {
            productor.setNombre(result.getString("nombre"));
            productor.setApellidos(result.getString("apellidos"));
            productor.setUsuario(result.getString("usuario"));
            productor.setPassword(result.getString("password"));
            productor.setEmail(result.getString("email"));
            productor.setNumTelefono(result.getInt("numTelefono"));

        }
        statement.close();
        result.close();

        return productor;
    }

}
