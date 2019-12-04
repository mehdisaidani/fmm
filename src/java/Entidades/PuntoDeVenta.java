/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import DB.PuntosDeVentaDB;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

/**
 *
 * @author joans
 */
public class PuntoDeVenta {
    
    private int id, idProvincia, idComarca, idProductor, idMunicipio;
    private String titulo, direccion, descripcion, productos, nombreProductor, 
            apellidoProductor, nomMunicipio;
    private Date fechaInicio, fechaFinal;
    private String horaInicio, horaFinal;
    private ArrayList<Producto> productosss;

    public PuntoDeVenta() {
    }

    public PuntoDeVenta(String titulo, Date fechaInicio, Date fechaFinal, String horaInicio, String horaFinal, String descripcion, String direccion, String productos, String nombreProductor, String apellidoProductor, String nomMunicipio) {
        this.titulo = titulo;
        this.fechaInicio = fechaInicio;
        this.fechaFinal = fechaFinal;
        this.horaInicio = horaInicio;
        this.horaFinal = horaFinal;
        this.descripcion = descripcion;
        this.direccion = direccion;
        this.productos = productos;
        this.nombreProductor = nombreProductor;
        this.apellidoProductor = apellidoProductor;
        this.nomMunicipio = nomMunicipio;
    }
    
    public PuntoDeVenta(int idProvincia, int idComarca, String nomMunicipio, int idProductor,
            String titulo, Date fechaInicio, Date fechaFinal, String horaInicio, String horaFinal,String direccion, String descripcion) {
        this.idProvincia = idProvincia;
        this.idComarca = idComarca;
        this.idMunicipio = idMunicipio;
        this.nomMunicipio = nomMunicipio;
        this.idProductor = idProductor;
        this.titulo = titulo;
        this.fechaInicio = fechaInicio;
        this.fechaFinal = fechaFinal;
        this.horaInicio = horaInicio;
        this.horaFinal = horaFinal;
        this.direccion = direccion;
        this.descripcion = descripcion;
    }
    
    public PuntoDeVenta(String titulo, String descripcion, String nomMunicipio,String direccion, String productos, Date fechaInicio, String horaInicio, Date fechaFinal, String horaFinal, String nombreProductor) {
        this.nomMunicipio = nomMunicipio;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.direccion = direccion;
        this.productos = productos;
        this.fechaInicio = fechaInicio;
        this.horaInicio = horaInicio;
        this.fechaFinal = fechaFinal;
        this.horaFinal =  horaFinal;
        this.nombreProductor = nombreProductor;
    }

    public String getNombreProductor() {
        return nombreProductor;
    }

    public String getApellidoProductor() {
        return apellidoProductor;
    }

    public void setApellidoProductor(String apellidoProductor) {
        this.apellidoProductor = apellidoProductor;
    }
    
    public void setNombreProductor(String nombreProductor) {
        this.nombreProductor = nombreProductor;
    }
    
    public String getProductos() {
        return productos;
    }

    public void setProductos(String productos) {
        this.productos = productos;
    }
    
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public int getIdProvincia() {
        return idProvincia;
    }
    
    public int getIdComarca() {
        return idComarca;
    }

    public int getIdProductor() {
        return idProductor;
    }
    
    public int getIdMunicipio() {
        return idMunicipio;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFinal() {
        return fechaFinal;
    }

    public void setFechaFinal(Date fechaFinal) {
        this.fechaFinal = fechaFinal;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraFinal() {
        return horaFinal;
    }

    public void setHoraFinal(String horaFinal) {
        this.horaFinal = horaFinal;
    }

    public int getId() {
        return id;
    }
    
    public String getNomMunicipio() {
        return nomMunicipio;
    }

    public void setNomMunicipio(String nomMunicipio) {
        this.nomMunicipio = nomMunicipio;
    }
    
    public ArrayList<Producto> getProductosDePuntos() throws SQLException{
        PuntosDeVentaDB pdv = new PuntosDeVentaDB();
        productosss = pdv.mostrarProductos(titulo);
        return productosss;
    }
    
    
}
