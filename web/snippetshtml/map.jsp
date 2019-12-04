<%@page import="DB.PuntosDeVentaDB"%>
<%@page import="java.util.ArrayList"%>
<section class="spa-slide" id="tab-mapa">
    <h1 style="font-family: 'Alana', sans-serif;">MAP</h1>
    <div id ="wrapperbox3">

        <div class ="wrapper">
            <h2>DESCARGA NUESTRO MAPA</h2>


            <p>Consulta nuestro <strong>mapa</strong> personalizado para localizar puntos de venta cercanos a tu zona.</p>

            <div id="googleMap" style="width:100%;height:400px;margin-bottom: 50px; margin-top:50px;"></div>        
            <script>
                function myMap() {
                    var mapProp = {
                        center: new google.maps.LatLng(41.3850639, 2.1734035),
                        zoom: 8
                    };
                    infowindow = new google.maps.InfoWindow();
                    map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

                }
            </script>
            <script
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBqzb3Fe8_EANB2PvamCGP5xJVDCLupMP8&callback=myMap">
            </script>


            <script>
                <%
                    PuntosDeVentaDB pdv = new PuntosDeVentaDB();

                    ArrayList<String> arrayDirecciones = new ArrayList<String>();
                    arrayDirecciones = pdv.selectCampo("direccion");

                    ArrayList<String> arrayTitulo = new ArrayList<String>();
                    arrayTitulo = pdv.selectCampo("titulo");

                    ArrayList<String> arrayDesc = new ArrayList<String>();
                    arrayDesc = pdv.selectCampo("descripcion");

                    ArrayList<String> horasIniciales = new ArrayList<String>();
                    horasIniciales = pdv.selectCampo("horaInicio");

                    ArrayList<String> horasFinales = new ArrayList<String>();
                    horasFinales = pdv.selectCampo("horaFinal");

                    ArrayList<String> arrayFechaIni = new ArrayList<String>();
                    arrayFechaIni = pdv.selectCampo("fechaInicio");

                    ArrayList<String> arrayFechaFin = new ArrayList<String>();
                    arrayFechaFin = pdv.selectCampo("fechaFinal");
                %>
                // LLAMAMOS A LA FUNCION
                geocode();

                // CREADOR DE LOS MARCADORES Y POP UPS DEL MAPA 
                function placeMarker(loc, direccion, titulo, descripcion, horaIni, horaFin, fechaIni, fechaFin) {
                    const marker = new google.maps.Marker({
                        position: new google.maps.LatLng(loc.lat, loc.lng),
                        map: map,
                        title: 'algo',
                        icon: 'images/logomini.png',
                        animation: google.maps.Animation.DROP
                    });
                    google.maps.event.addListener(marker, 'click', function () {
                        infowindow.close(); // Close previously opened infowindow
                        var contenido =
                                '<div id="content">' +
                                '<div id="siteNotice">' +
                                '</div>' +
                                '<h1 id="firstHeading" class="firstHeading">' + titulo + '</h1>' +
                                '<div id="bodyContent">' +
                                '<p>' + descripcion + '</p>' +
                                '<p> DIRECCION:<strong> &nbsp;&nbsp;&nbsp;&nbsp;' + direccion + '</strong></p>' +
                                '<p> COMIENZA: <strong> &nbsp;&nbsp;&nbsp;&nbsp;' + fechaIni + "     " + horaIni + '</strong></p>' +
                                '<p> FINALIZA: <strong> &nbsp;&nbsp;&nbsp;&nbsp;' + fechaFin + "     " + horaFin + '</strong></p>' +
                                '</div>' +
                                '</div>';
                        infowindow.setContent(contenido);
                        infowindow.open(map, marker);
                    });
                }

                // FUNCION QUE AÑADIRA EL MARCADOR
                function geocode() {

                    var direcciones = [];
                    var titulos = [];
                    var descripciones = [];
                    var horasIniciales = [];
                    var horasFinales = [];
                    var fechasIniciales = [];
                    var fechasFinales = [];


                    // METEMOS LOS DATOS DEL ARRAY-LIST DE JAVA EN EL ARRAY DE JS  
                <%                    for (int i = 0; i < arrayDirecciones.size(); i++) {
                %>
                    direcciones[<%=i%>] = "<%=arrayDirecciones.get(i)%>";
                    titulos[<%=i%>] = "<%=arrayTitulo.get(i)%>";
                    descripciones[<%=i%>] = "<%=arrayDesc.get(i)%>";
                    horasIniciales[<%=i%>] = "<%=horasIniciales.get(i)%>";
                    horasFinales[<%=i%>] = "<%=horasFinales.get(i)%>";
                    fechasIniciales[<%=i%>] = "<%=arrayFechaIni.get(i)%>";
                    fechasFinales[<%=i%>] = "<%=arrayFechaFin.get(i)%>";
                <%
                    }
                %>

                    for (let index = 0; index < direcciones.length; index++) {

                        axios

                                .get("https://maps.googleapis.com/maps/api/geocode/json", {
                                    params: {
                                        address: direcciones[index],
                                        key: "AIzaSyBqzb3Fe8_EANB2PvamCGP5xJVDCLupMP8"
                                    }
                                })

                                .then(function (response) {

                                    var latlng = response.data.results[0].geometry.location;
                                    placeMarker(latlng, direcciones[index], titulos[index], descripciones[index],
                                            horasIniciales[index], horasFinales[index], fechasIniciales[index], fechasFinales[index]);
                                })

                                .catch(function (error) {
                                    console.log(error);
                                });


                    }
                }

            </script>

        </div>
    </div>
</section>
