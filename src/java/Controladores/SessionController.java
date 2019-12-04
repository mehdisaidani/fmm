/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import DB.ProductorDB;
import Entidades.Productor;
import java.io.IOException;
import java.sql.SQLException;
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
public class SessionController extends HttpServlet {

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
        String funcion = request.getParameter("fc");

        switch (funcion) {
            case "login":
                String producerUserName = request.getParameter("producerUserName"),
                 producerPassword = request.getParameter("producerPassword");
                System.out.println("El usuario es: " + producerUserName);
                System.out.println("La password es: " + producerPassword);
                try {
                    ProductorDB db = new ProductorDB();

                    // Leer BD
                    //
                    RequestDispatcher requestDispatcher = null;
                    if (db.doesProducerExist(producerUserName) && db.isPasswordOK(producerUserName, producerPassword)) {
                        Productor productor = db.selectProducer(producerUserName);
                        String nombreProductor = productor.getNombre();
                        request.setAttribute("producer", productor);
                        request.setAttribute("nameProducer", nombreProductor);
                        requestDispatcher = request.getRequestDispatcher("admin.jsp");

                        
                        Cookie ck = new Cookie("productor", producerUserName);//creating cookie object  
                        Cookie ck1 = new Cookie("nombreProductor", nombreProductor);//creating cookie object  
                        response.addCookie(ck);//adding cookie in the response  
                        response.addCookie(ck1);//adding cookie in the response
                        

                    } else {
                        request.setAttribute("producerUserName", producerUserName);
                        requestDispatcher = request.getRequestDispatcher("loginError.jsp");
                    }

                    requestDispatcher.forward(request, response);
                    db.close();
                } catch (IOException | SQLException | ServletException e) {
                    e.printStackTrace();
                }
                break;
            case "register":
                try {

                    // Conexion BD
                    ProductorDB db = new ProductorDB();

                    // CONSEGUIR PARAMETROS FORMULARIO
                    String user = request.getParameter("user");
                    String password = request.getParameter("password");
                    String nombre = request.getParameter("nombre");
                    String apellidos = request.getParameter("apellidos");
                    String email = request.getParameter("email");
                    int number = Integer.parseInt(request.getParameter("number"));

                    // CREACION OBJETO PRODUCTOR
                    Productor productor = new Productor(number, user, password, nombre, apellidos, email);

                    // DEFINIR PAGINA SEGUN USERNAME
                    String pagina = "";
                    if (db.doesProducerExist(productor.getUsuario(), productor.getEmail())) {
                        //HACER UN ALERT PARA QUE DIGA QUE EL USUARIO YA EXISTE.
                        System.out.println("The username or email alredy exists!");
                        pagina = "registerError.jsp";
                    } else {
                        // ALTA EN BD DEL PRODUCTOR
                        db.signUP(productor);
                        String nombreProductor = productor.getNombre();
                        request.setAttribute("nameProducer", nombreProductor);
                        pagina = "admin.jsp";
                    }

                    // CONECTOR CON JSP DETERMINADO
                    request.setAttribute("producer", productor);
                    RequestDispatcher rd = request.getRequestDispatcher(pagina);
                    rd.forward(request, response);
                    db.close();

                } catch (IOException | SQLException | ServletException e) {
                    e.printStackTrace();
                }

                break;

            case "logout":
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
                break;
            case "filtroIndex":
                
                Cookie ck[] = request.getCookies();
                String nombreProductor = "";
                for (int i = 0; i < ck.length; i++) {
                    if (ck[i].getName().equals("nombreProductor")) {
                        nombreProductor = ck[i].getValue();
                        System.out.println("Cookie: " + ck[i]);
                    }
                }
                
                request.setAttribute("nameProducer", nombreProductor);
                RequestDispatcher red = request.getRequestDispatcher("index1.jsp");
                red.forward(request, response);
                break;

            case "filtroAdmin":
                
                Cookie ck1[] = request.getCookies();
                String nombreProductor1 = "";
                for (int i = 0; i < ck1.length; i++) {
                    if (ck1[i].getName().equals("nombreProductor")) {
                        nombreProductor1 = ck1[i].getValue();
                        System.out.println("Cookie: " + ck1[i]);
                    }
                }
                
                request.setAttribute("nameProducer", nombreProductor1);
                RequestDispatcher redi = request.getRequestDispatcher("admin.jsp");
                redi.forward(request, response);
                break;

            default:
                break;
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
