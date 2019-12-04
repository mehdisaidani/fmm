<%-- 
    Document   : admin
    Created on : 26-nov-2019, 13:07:50
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Farmers Meet Market">
        <meta name="keywords" content="local, agricultura, comercio, Barcelona, ecologica">
        <title>Farmers Meet Market</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">			
        <link rel="stylesheet" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/148866/reset.css"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/header.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        

        <meta name="theme-color" content="#ffffff">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
        
    </head>


    <body>
        <header role="banner">
            <div id="cd-logo"><a href="#0"><img src="images/logo.png" alt="Logo"></a></div>
            <div class="btn-group">
                <button type="button" id="btn-admin" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Hola, ${nameProducer}
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <button class="dropdown-item" id="crear-evento" type="button">Crear Evento</button>
                    <button class="dropdown-item" type="button">Editar Eventos</button>
                    <a href="SessionController?fc=logout" class="dropdown-item">Salir</a >
                </div>
            </div>
        </header>
        <div class="cd-user-modal1"> <!-- CREATE EVENT -->
            <div class="cd-user-modal-container1">    
                <form class="cd-form" action="PuntosDeVentaController" method = "post">
                    <p class="fieldset">
                        <label for="titulo-evento">Titulo:</label>
                        <input type="text" class="form-control" name="titulo-evento" id="titulo-evento" placeholder="Titulo" required>
                        <span class="cd-error-message">Introduce un titulo:</span>
                    </p>
                    <p class="fieldset">
                        <label for="descripcion-evento">Descripción:</label>
                        <textarea class="form-control" name="descripcion-evento" id="descripcion-evento" rows="3" required></textarea>
                    </p>
                    <p class="fieldset">
                        <label for="municipio-evento">Municipio:</label>
                        <input type="text" class="form-control" name="municipio-evento" id="municipio-evento" placeholder="Municipio" required>
                    </p>
                    <p class="fieldset">
                        <label for="direccion-evento">Dirección:</label>
                        <input type="text" class="form-control" name="direccion-evento" id="direccion-evento" placeholder="Avenida Meridiana, 6, 08036" required>
                    </p>
                    <p class="fieldset">
                        <label for="fecha-inicio">Fecha inicio:</label>
                        <input type="text" name="fecha-inicio" class="form-control" id="fecha-inicio" placeholder="dd-mm-yyyy" required>
                    </p>
                    <p class="fieldset">
                        <label for="hora-inicio">Hora inicio:</label>
                        <input type="text" class="form-control" name="hora-inicio" id="hora-inicio" placeholder="hh:mm" required>
                    </p>

                    <p class="fieldset">
                        <label for="fecha-final">Fecha final:</label>
                        <input type="text" name="fecha-final" class="form-control" id="fecha-final" placeholder="dd-mm-yyyy" required>
                    </p>
                    <p class="fieldset">
                        <label for="hora-final">Hora final:</label>
                        <input type="text" class="form-control" name="hora-final" id="hora-final" placeholder="hh:mm" required>
                    </p>
                    <label for="productos">Productos:</label>
                    <div id="scroll" class="fieldset">
                        <div class="verdruas">
                            <h3>Verduras</h3><br>

                            <div id="verduras" class="scroll2">
                                <input class="opcionProductos" type="checkbox" name="Patata" value="Patata"> Patata<br>
                                <input class="opcionProductos" type="checkbox" name="Cebolla" value="Cebolla"> Cebolla<br>
                                <input class="opcionProductos" type="checkbox" name="Berenjena" value="Berenjena"> Berenjena<br>
                                <input class="opcionProductos" type="checkbox" name="Zanahoria" value="Zanahoria"> Zanahoria<br>
                                <input class="opcionProductos" type="checkbox" name="Calabacin" value="Calabacin"> Calabacin<br>
                            </div>
                        </div>
                        <div class="frutas">
                            <h3>Frutas</h3><br>
                            <div id="frutas" class="scroll2">
                                <input class="opcionProductos" type="checkbox" name="Sandia" value="Sandia"> Sandia<br>
                                <input class="opcionProductos" type="checkbox" name="Mandarina" value="Mandarina"> Mandarina<br>
                                <input class="opcionProductos" type="checkbox" name="Platano" value="Platano"> Platano<br>
                                <input class="opcionProductos" type="checkbox" name="Aguacate" value="Aguacate"> Aguacate<br>
                                <input class="opcionProductos" type="checkbox" name="Naranja" value="Naranja"> Naranja<br>
                            </div>
                        </div>
                    </div>

                    <p class="fieldset">
                        <button class="full-width" type="submit" value="Crear" style="color:#FFF;">Crear Punto de Venta</button>
                    </p>
                </form>

            </div>				
        </div> <!-- crear evento -->
        <div class="slideshow-container">
            <img src="images/gardening.jpg" alt="agricultura">     
        </div>

        <jsp:include flush="true" page="snippetshtml/nav.jsp"></jsp:include>
            <br>
            <br>

            <main class="spa-main">
                <section class="spa-slide" id="tab-inicio">
                    <h1 style="font-family: 'Alana', sans-serif;">QUIEN SOMOS</h1>   
                    <div id ="wrapperbox">
                        <div class ="wrapper">

                            <h2>FARMERS MEET MARKET</h2>

                            <p><span class="green">Farmers Meet Market</span> es una red virtual que facilita la participación de todos en la escena del comercio local y ecológico de Barcelona. Es una comunidad que ofrece a los productores miembros y a los visitantes un encuentro con la agricultura de la zona de forma gratuita.</p>

                            <p>Somos más que un lugar de información. Nuestro directorio de eventos, diseñado para resaltar lo que los hace especiales, funciona junto con un mapa que muestra la ubicación de cada uno de ellos y el fácil acceso para que los visitantes puedan usarlo "on the go".</p>

                            <p><span class="green">Nuestra misión es facilitar una plataforma para fortalecer la visibilidad y la participación de la audiencia para este tipo de eventos así como también promover el comercio justo y el acceso a comida ecológica.</span></p>

                            <p>Junto contigo, apoyamos y alentamos este sector tan imprescindible en nuestra alimentación.</p>

                        </div>
                    </div>   
                </section>
                <br>
                <section class="spa-slide" id="tab-venta">
                    <h1 style="font-family: 'Alana', sans-serif;">PUNTOS DE VENTA</h1>
                    <div id ="wrapperbox2">
                        <div class ="wrapper">
                            <h2>EVENTOS</h2>

                        <jsp:include flush="true" page="mostrarEventos.jsp"><jsp:param name="paginaDeFiltro" value="filtroAdmin"/></jsp:include>	

                        </div>

                    </div>
                </section>
                <br>

            <jsp:include flush="true" page="snippetshtml/map.jsp"></jsp:include>

            <jsp:include flush="true" page="snippetshtml/footer.jsp"></jsp:include>

        </main>
        <script src="js/bootstrap.js"></script>
    </body>
</html>


