/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import Entidades.Producto;
import Entidades.PuntoDeVenta;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Usuario
 */
public class ProductoDB extends DBConnector{
    
    public ProductoDB() throws SQLException {
        super();
    }
    
    public void InsertarProducto(Producto producto, PuntoDeVenta punto) throws SQLException {

        String query = "INSERT INTO productos_puntos (`idpuntoDeVenta`,"
                + " `idProducto`"
                + ") VALUES ("
                + "'" + selectIdPuntoDeVenta(punto.getTitulo())+ "',"
                + "'" + selectIdProducto(producto.getNombre()) + "');";

        Statement st = conn.createStatement();
        st.executeUpdate(query);
        st.close();

    }
    public int selectIdPuntoDeVenta(String titulo) throws SQLException {

        String query = "SELECT idpuntoDeVenta FROM puntosdeventa  WHERE titulo LIKE '" + titulo + "';";
        Statement st = conn.createStatement();
        ResultSet result = st.executeQuery(query);  //////resultet.getstring()
        int idPuntoDeVenta = 1;

        while (result.next()) {
            idPuntoDeVenta = result.getInt("idpuntoDeVenta");
        }
        st.close();
        result.close();

        return idPuntoDeVenta;
    }
    public int selectIdProducto(String nombreProducto) throws SQLException {

        String query = "SELECT idProductos FROM productos  WHERE nombre LIKE '" + nombreProducto + "';";
        Statement st = conn.createStatement();
        ResultSet result = st.executeQuery(query);  //////resultet.getstring()
        int idProducto = 1;

        while (result.next()) {
            idProducto = result.getInt("idProductos");
        }
        st.close();
        result.close();

        return idProducto;
    }
}
