<%-- 
    Document   : mostrarEventos
    Created on : 29-nov-2019, 12:56:25
    Author     : Usuario
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.PuntoDeVenta"%>
<%@page import="DB.PuntosDeVentaDB"%>

<% String paginaDeFiltro = request.getParameter("paginaDeFiltro");
    request.setAttribute("paginaDeFiltro", paginaDeFiltro);%>
<div class="grid">
    <form action="?fc=${paginaDeFiltro}" method="post" style="align-content: baseline;align-items:baseline; width:100%">
        <label style="font-size: 18px; font-family: 'Alata', sans-serif; color: #545400; margin-bottom: 3%">Filtra por municipio:</label>
        <select name="oMunicipios" id="oMunicipios" onchange="submit()">
            <option>Municipios</option>
            <option value="Municipio">Todos</option>
            <option value="Barcelona">Barcelona</option>
            <option value="Aiguafreda">Aiguafreda</option>
            <option value="Albons">Albons</option>
            <option value="Riudecanyes">Riudecanyes</option>
        </select>

    </form>


    <%

        PuntosDeVentaDB pdv = new PuntosDeVentaDB();
        ArrayList<PuntoDeVenta> puntosDeVenta = new ArrayList<PuntoDeVenta>();
        puntosDeVenta = pdv.mostrarPuntosDeVenta();

        String oMunicipios = null;
        if (request.getParameter("oMunicipios") != null) {
            oMunicipios = request.getParameter("oMunicipios");
            if (oMunicipios.equals("Municipio")) {
                
                puntosDeVenta = pdv.mostrarPuntosDeVenta();
            } else {
                oMunicipios = request.getParameter("oMunicipios");
                puntosDeVenta = pdv.mostrarPuntosDeVenta(oMunicipios);
            }

        }
        request.setAttribute("puntosDeVenta", puntosDeVenta);

    %>

    <div class="grid">

        <c:forEach items="${puntosDeVenta}" var="punto">
            <div class="cell">
                <figure class="card">
                    <figcaption>

                        <div class="date"><span class="day"><fmt:formatDate pattern = "dd" value = "${punto.getFechaInicio()}" /></span><span class="month"><fmt:formatDate dateStyle="medium" pattern = "MMM" value = "${punto.getFechaInicio()}"/></span></div>
                        <h3><c:out value="${punto.getTitulo()}" /></h3>
                        <p>
                            <c:out value="${punto.getDescripcion()}" />
                        </p>
                        <div class="municipio"><p>Municipio: <c:out value="${punto.getNomMunicipio()}"/></p></div>
                        <div class="tipo"><p>Ubicación: <c:out value="${punto.getDireccion()}" /></p></div>
                        <div style="margin-bottom:20px" class="ubicacion">
                            <p style="margin-bottom:0;">Productos: </p>
                            <c:forEach items="${punto.getProductosDePuntos()}" var="producto">
                                <p style="display: inline">
                                    <c:out value="${producto.getNombre()}" />,
                                </p>
                            </c:forEach>
                        </div>



                        <div class="productos"><p>Organizado por: <c:out value="${punto.getNombreProductor()} ${punto.getApellidoProductor()}" /></p></div>
                    </figcaption>
                    <footer>
                        <div class="views"><i class="ion-eye"></i>2,907</div>
                        <div class="love"><i class="ion-heart"></i>623</div>
                        <div class="comments"><i class="ion-chatboxes"></i>23</div>
                    </footer><a href="#"></a>
                </figure></div>
            </c:forEach>

    </div>
