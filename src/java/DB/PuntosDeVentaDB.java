/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import Entidades.Producto;
import Entidades.PuntoDeVenta;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class PuntosDeVentaDB extends DBConnector {

    public PuntosDeVentaDB() throws SQLException {
        super();
    }

    public ArrayList<PuntoDeVenta> mostrarPuntosDeVenta() throws SQLException {
        ArrayList<PuntoDeVenta> puntosDeVenta = new ArrayList<PuntoDeVenta>();
        try {
            String consulta = "SELECT m.*, prod.*, p.* FROM puntosdeventa p JOIN productores prod ON p.idProductor = prod.idProductor JOIN municipios m ON m.idMunicipio = p.idMunicipio";

            Statement statement = this.conn.createStatement();
            ResultSet result = statement.executeQuery(consulta);
            while (result.next()) {
                PuntoDeVenta punto1 = new PuntoDeVenta(result.getString("p.titulo"), result.getDate("p.fechaInicio"), result.getDate("p.fechaFinal"), result.getString("p.horaInicio"), result.getString("p.horaFinal"), result.getString("p.descripcion"), result.getString("p.direccion"), result.getString("p.productos"), result.getString("prod.nombre"), result.getString("prod.apellidos"), result.getString("m.Nombre"));
                puntosDeVenta.add(punto1);
            }
            statement.close();
            result.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return puntosDeVenta;
    }
    public ArrayList<Producto> mostrarProductos(String titulo) throws SQLException {
        ArrayList<Producto> productos = new ArrayList<Producto>();
        try {
            String consulta = "SELECT p.Nombre FROM productos p JOIN productos_puntos pp ON p.idProductos = pp.idProducto JOIN puntosdeventa puntos ON puntos.idpuntoDeVenta = pp.idpuntoDeVenta WHERE puntos.titulo LIKE '"+titulo+"'";

            Statement statement = this.conn.createStatement();
            ResultSet result = statement.executeQuery(consulta);
            while (result.next()) {
                Producto producto = new Producto(result.getString("p.Nombre"));
                productos.add(producto);
            }
            statement.close();
            result.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return productos;
    }
    
    public ArrayList<PuntoDeVenta> mostrarPuntosDeVenta(String municipio) throws SQLException {
        ArrayList<PuntoDeVenta> puntosDeVenta = new ArrayList<PuntoDeVenta>();
        try {
            String consulta = "SELECT m.*, prod.*, p.* FROM puntosdeventa p JOIN productores prod ON p.idProductor = prod.idProductor JOIN municipios m ON m.idMunicipio = p.idMunicipio WHERE m.Nombre='"+municipio+"'";

            Statement statement = this.conn.createStatement();
            ResultSet result = statement.executeQuery(consulta);
            while (result.next()) {
                PuntoDeVenta punto1 = new PuntoDeVenta(result.getString("p.titulo"), result.getDate("p.fechaInicio"), result.getDate("p.fechaFinal"), result.getString("p.horaInicio"), result.getString("p.horaFinal"), result.getString("p.descripcion"), result.getString("p.direccion"), result.getString("p.productos"), result.getString("prod.nombre"), result.getString("prod.apellidos"), result.getString("m.Nombre"));
                puntosDeVenta.add(punto1);
            }
            statement.close();
            result.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return puntosDeVenta;
    }

    // Crea el siguiente evento
    public void crearPuntoDeVenta(PuntoDeVenta puntodeventa) throws SQLException {

        String query = "INSERT INTO puntosdeventa (`titulo`, `idProvincia`,"
                + " `idComarca`, `idProductor`, `fechaInicio`, `horaInicio`, "
                + "`fechaFinal`, `horaFinal`, "
                + "`productos`, `idMunicipio`, "
                + "`direccion`, `descripcion`"
                + ") VALUES ("
                + "'" + puntodeventa.getTitulo() + "',"
                + "'" + selectIdProvincia(puntodeventa.getNomMunicipio()) + "',"
                + "'" + selectIdComarca(puntodeventa.getNomMunicipio()) + "',"
                //+ "'" + puntodeventa.getIdProductor() + "',"
                + "'" + idProductor(puntodeventa.getNombreProductor()) + "',"
                + "'" + puntodeventa.getFechaInicio() + "',"
                + "'" + puntodeventa.getHoraInicio() + "',"
                + "'" + puntodeventa.getFechaFinal() + "',"
                + "'" + puntodeventa.getHoraFinal() + "',"
                + "'" + puntodeventa.getProductos() + "',"
                + "'" + selectIdMunicipio(puntodeventa.getNomMunicipio()) + "',"
                + "'" + puntodeventa.getDireccion() + "',"
                + "'" + puntodeventa.getDescripcion() + "');";

        Statement st = conn.createStatement();
        st.executeUpdate(query);
        st.close();

    }

    public int selectIdMunicipio(String nombre) throws SQLException {

        String query = "SELECT idmunicipio FROM municipios  WHERE nombre LIKE '" + nombre + "';";
        Statement st = conn.createStatement();
        ResultSet result = st.executeQuery(query);  //////resultet.getstring()
        int idMunicipio = 1;

        while (result.next()) {
            idMunicipio = result.getInt("idmunicipio");
        }
        st.close();
        result.close();

        return idMunicipio;
    }

    public int selectIdComarca(String nombre) throws SQLException {

        int id = selectIdMunicipio(nombre);
        String query = "SELECT comarcas.idcomarca FROM comarcas JOIN municipios "
                + "ON comarcas.idcomarca = municipios.idcomarca Where "
                + "municipios.idmunicipio = " + id + ";";
        Statement st = conn.createStatement();
        ResultSet result = st.executeQuery(query);
        int idComarca = 2;
        while (result.next()) {
            idComarca = result.getInt("idcomarca");
        }
        st.close();
        result.close();
        
        return idComarca;
    }

    public int selectIdProvincia(String nombre) throws SQLException {

        int id = selectIdComarca(nombre);

        String query = "SELECT provincias.idprovincia FROM provincias JOIN comarcas "
                + "ON provincias.idprovincia = comarcas.idprovincia Where "
                + "comarcas.idcomarca = " + id + ";";

        Statement st = conn.createStatement();
        ResultSet result = st.executeQuery(query);
        int idProvincia = 3;
        while (result.next()) {
            idProvincia = result.getInt("idprovincia");
        }
        st.close();
        result.close();
        
        return idProvincia;
    }
    
    public int idProductor(String usuario) throws SQLException {

        String query = "SELECT idProductor FROM productores  WHERE usuario LIKE '" + usuario + "' OR email LIKE '" + usuario + "';";
        Statement st = conn.createStatement();
        ResultSet result = st.executeQuery(query);  //////resultet.getstring()
        int idProductor = 1;

        while (result.next()) {
            idProductor = result.getInt("idProductor");
        }
        st.close();
        result.close();

        return idProductor;
    }
    public ArrayList<String> selectDirecciones() throws SQLException {

        ArrayList<String> direcciones = new ArrayList<String>();

        String query = "SELECT direccion FROM puntosdeventa";

        Statement statement = this.conn.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            direcciones.add(resultSet.getString("direccion"));
        }
        statement.close();
        resultSet.close();

        return direcciones;
    }
     public ArrayList<String> selectCampo(String campo) throws SQLException {

        ArrayList<String> campos = new ArrayList<>();

        String query = "SELECT " + campo + " FROM puntosdeventa";

        Statement statement = this.conn.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            switch (campo) {
                case "fechaFinal":
                case "fechaInicio":
                    {
                        Date date = (resultSet.getDate(campo));
                        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                        String strDate = dateFormat.format(date);
                        campos.add(strDate);
                        break;
                    }
                case "horaInicio":
                case "horaFinal":
                    {
                        Date date = (resultSet.getDate(campo));
                        DateFormat hourFormat = new SimpleDateFormat("HH:mm");
                        String strDate = hourFormat.format(date);
                        campos.add(strDate);
                        break;
                    }
                default:
                    campos.add(resultSet.getString(campo));
                    break;
            }

        }
        statement.close();
        resultSet.close();

        return campos;
    }

}
