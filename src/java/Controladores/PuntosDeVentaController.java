/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DB.ProductoDB;
import DB.PuntosDeVentaDB;
import Entidades.Producto;
import Entidades.PuntoDeVenta;
import java.util.Date;
//import java.util.Time;
//import java.text.DateFormat;
//import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.util.HashSet;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */
public class PuntosDeVentaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Conexion BD
            PuntosDeVentaDB puntodeventadb = new PuntosDeVentaDB();

            // CONSEGUIR PARAMETROS FORMULARIO
            String titulo = request.getParameter("titulo-evento");
            String descripcion = request.getParameter("descripcion-evento");
            String municipio = request.getParameter("municipio-evento");
            String direccion = request.getParameter("direccion-evento");
            String productos = request.getParameter("productos-evento");
            String fechaInicio = request.getParameter("fecha-inicio");
            String horaInicio = request.getParameter("hora-inicio");
            String fechaFinal = request.getParameter("fecha-final");
            String horaFinal = request.getParameter("hora-final");

            Date fInicio = new SimpleDateFormat("dd-MM-yyyy").parse(fechaInicio);
            Date fFinal = new SimpleDateFormat("dd-MM-yyyy").parse(fechaFinal);
            
            horaInicio += ":00";
            horaFinal += ":00";
            

            java.sql.Date fechaInicio1 = new java.sql.Date(fInicio.getTime());
            java.sql.Date fechaFinal1 = new java.sql.Date(fFinal.getTime());

            Cookie ck[] = request.getCookies();
            String usuarioProductor = "";
            String nombreProductor = "";

            for (int i = 0; i < ck.length; i++) {
                if (ck[i].getName().equals("productor")) {
                    usuarioProductor = ck[i].getValue();
                } else if (ck[i].getName().equals("nombreProductor")) {
                    nombreProductor = ck[i].getValue();
                }
            }

            PuntosDeVentaDB pdv = new PuntosDeVentaDB();
            ProductoDB prod = new ProductoDB();

            //SimpleDateFormat formatfecha = new SimpleDateFormat("aaaa-MM-dd");
            //Date fInicio = (Date) formatfecha.parse(fechaInicio);
            //SimpleDateFormat formathora = new SimpleDateFormat("hh:mm:ss");
            //Time tInicio = (Time) formathora.parse(horaInicio);
            //Date fInicio= new SimpleDateFormat("yyyy-MM-dd").parse(fechaInicio);
            //Date tInicio= new SimpleDateFormat("hh:mm:ss").parse(horaInicio);
            //Date dInicio= SimpleDateFormat.parse(fechaInicio);
            // CREACION OBJETO PRODUCTOR
            //  PuntoDeVenta puntodeventa = new PuntoDeVenta(titulo, descripcion, municipio, direccion, productos, fInicio, tInicio);
            PuntoDeVenta puntodeventa = new PuntoDeVenta(titulo, descripcion, municipio, direccion, productos, fechaInicio1, horaInicio, fechaFinal1, horaFinal, usuarioProductor);
            puntodeventadb.crearPuntoDeVenta(puntodeventa);

            String productoAñadido = null;
            System.out.println(productoAñadido);
            String arrayProductos[] = {"Patata", "Cebolla", "Berenjena", "Zanahoria", "Calabacin", "Sandia", "Mandarina", "Platano", "Aguacate", "Naranja"};
            for (int i = 0; i < arrayProductos.length; i++) {
                if (request.getParameter(arrayProductos[i]) != null) {
                    productoAñadido = request.getParameter(arrayProductos[i]);
                    Producto producto = new Producto(productoAñadido);
                    prod.InsertarProducto(producto, puntodeventa);

                }

            }

           
            request.setAttribute("nameProducer", nombreProductor);
            System.out.println(nombreProductor);
            RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
            rd.forward(request, response);
            puntodeventadb.close();

        } catch (IOException | SQLException | ParseException | ServletException ex) {
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
