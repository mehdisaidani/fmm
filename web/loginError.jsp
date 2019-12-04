<%-- 
    Document   : loginError
    Created on : 29-nov-2019, 13:11:30
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
        <link rel="stylesheet" href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/148866/reset.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/header.js"></script>

        <meta name="theme-color" content="#ffffff">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
    </head>

    <body>
        <header role="banner">
            <div id="cd-logo"><a href="index.jsp"><img src="images/logo.png" alt="Logo"></a></div>

            <nav class="main-nav">
                <ul>
                    <li><a class="cd-signin" href="#0" style="text-decoration: none;">Login</a></li>
                    <li><a class="cd-signup" href="#0" style="text-decoration: none;">Registrarse</a></li>
                </ul>
            </nav>
        </header>

        <div class="cd-user-modal"> 
            <div class="cd-user-modal-container"> 
                <ul class="cd-switcher">
                    <li><a href="#0">LOGIN</a></li>
                    <li><a href="#0">REGISTRARSE</a></li>
                </ul>
                <div id="cd-login"> <!-- LOGIN -->
                    <form class="cd-form" action="SessionController?fc=login" method="POST">
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signin-email">Usuario/E-mail</label>
                            <input class="full-width has-padding has-border" id="signin-email" name="producerUserName" placeholder="E-mail" required>
                            <span class="cd-error-message">Error message here!</span>
                        </p>

                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signin-password">Password</label>
                            <input class="full-width has-padding has-border" id="signin-password" name="producerPassword" type="text"  placeholder="Password" required>
                            <a href="#0" class="hide-password">Hide</a>
                            <span class="cd-error-message">Error message here!</span>
                        </p>

                        <p class="fieldset">
                            <input type="checkbox" id="remember-me" checked>
                            <label for="remember-me">Recordar</label>
                        </p>

                        <p class="fieldset">
                            <button class="full-width" type="submit" value="Login" style="color:#FFF;">Login</button>
                        </p>
                    </form>

                    <p class="cd-form-bottom-message"><a href="#0">Has olvidado tu password?</a></p>

                </div> <!-- cd-login -->

                <div id="cd-signup"> <!-- sign up form -->
                    <form class="cd-form" action="SessionController?fc=register" method="POST">
                        <p class="fieldset">
                            <label class="image-replace cd-username" for="signup-username">Usuario</label>
                            <input class="full-width has-padding has-border" id="signup-username" name="user" type="text" placeholder="Usuario" required>
                            <span class="cd-error-message">Error!</span>
                        </p>

                        <p class="fieldset">
                            <label class="image-replace cd-username" for="signup-name">Nombre</label>
                            <input class="full-width has-padding has-border" id="signup-name" name="nombre" type="text" placeholder="Nombre" required>
                            <span class="cd-error-message">Error!</span>
                        </p>

                        <p class="fieldset">
                            <label class="image-replace cd-username" for="signup-lastname">Apellido</label>
                            <input class="full-width has-padding has-border" id="signup-lastname" name="apellidos" type="text" placeholder="Apellido" required>
                            <span class="cd-error-message">Error!</span>
                        </p>

                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signup-email">E-mail</label>
                            <input class="full-width has-padding has-border" id="signup-email" name="email" type="email" placeholder="E-mail" required>
                            <span class="cd-error-message">Error!</span>
                        </p>

                        <p class="fieldset">
                            <input class="full-width has-padding has-border" id="signup-phone" name="number" type="tel" placeholder="Telefono" required>
                            <span class="cd-error-message">Error!</span>
                        </p>

                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signup-password">Password</label>
                            <input class="full-width has-padding has-border" id="signup-password" name="password" type="text" placeholder="Password" required>
                            <a href="#0" class="hide-password">Hide</a>
                            <span class="cd-error-message">Error!</span>
                        </p>

                        <p class="fieldset">
                            <input type="checkbox" id="accept-terms" required>
                            <label for="accept-terms">Acepto los <a href="#0">Terminos</a></label>
                        </p>
                        <p class="fieldset">
                            <input type="checkbox" id="accept-dataprotection" required>
                            <label for="accept-terms">Normativa y preotección de <a href="#0">Datos</a></label>
                        </p>


                        <p class="fieldset">
                            <button class="full-width" type="submit" value="Register" style="color:#FFF;">Crear cuenta</button>
                        </p>
                    </form>

                </div> <!-- cd-signup -->

                <div id="cd-reset-password"> <!-- reset password form -->
                    <p class="cd-form-message">Has olvidado tu password? Por favor introduce tu email.</p>

                    <form class="cd-form">
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="reset-email">E-mail</label>
                            <input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
                            <span class="cd-error-message">Error!</span>
                        </p>
                        <p class="fieldset">
                            <button class="full-width" type="submit" value="Reset password" style="color:#FFF;">Reestablecer contraseña</button>
                        </p>
                    </form>

                    <p class="cd-form-bottom-message"><a href="#0">Vuelve a Login</a></p>
                </div> <!-- cd-reset-password -->
                <a href="#0" class="cd-close-form">Cerrar</a>
            </div> <!-- cd-user-modal-container -->
        </div>

            <script type="text/javascript">
                $(window).on('load',function(){
                    $('#myModal').modal('show');
                });
            </script>

        <!-- Modal / Ventana / Overlay en HTML -->
        <div id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">ERROR</h4>
                    </div>
                    <div class="modal-body">
                        <p>El Usuario o Email es incorrecto</p>
                    </div>
                    <div class="modal-footer">
                        <a href="index.jsp" class="buttonModal">Inténtalo de nuevo</a >
                    </div>
                </div>
            </div>
        </div>
        
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

                            <p><span class="green">Farmers Meet Market</span> es una red virtual sin ánimo de lucro que facilita la participación de todos en la escena del comercio local y ecológico de Barcelona. Es una comunidad que ofrece a los productores miembros y a los visitantes un encuentro con la agricultura de la zona de forma gratuita.</p>

                            <p>Somos más que un lugar de información. Nuestro directorio de eventos, diseñado para resaltar lo que los hace especiales, funciona junto con el mapa descargable gratuito que muestra la ubicación de cada uno de ellos y el fácil acceso para que los visitantes puedan usarlo "on the go".</p>

                            <p><span class="green">Nuestra misión es facilitar una plataforma para fortalecer la visibilidad y la participación de la audiencia para agricultores y promover el comercio justo y acceso a comida ecológica.</span></p>

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

                            <div class="grid">		

                                <div class="cell">
                                    <figure class="card">
                                        <figcaption>
                                            <div class="date"><span class="day">28</span><span class="month">Oct</span></div>
                                            <h3>The World Ended Yesterday</h3>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                            </p>
                                            <div class="tipo"><p>Ubicación:</p></div>
                                            <div class="ubicacion"><p>Productos:</p></div>
                                            <div class="productos"><p>Organizado por:</p></div>
                                        </figcaption>
                                        <footer>
                                            <div class="views"><i class="ion-eye"></i>2,907</div>
                                            <div class="love"><i class="ion-heart"></i>623</div>
                                            <div class="comments"><i class="ion-chatboxes"></i>23</div>
                                        </footer><a href="#"></a>
                                    </figure></div>


                                <div class="cell">
                                    <figure class="card">
                                        <figcaption>
                                            <div class="date"><span class="day">28</span><span class="month">Oct</span></div>
                                            <h3>The World Ended Yesterday</h3>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                            </p>
                                            <div class="tipo"><p>Ubicación:</p></div>
                                            <div class="ubicacion"><p>Productos:</p></div>
                                            <div class="productos"><p>Organizado por:</p></div>
                                        </figcaption>
                                        <footer>
                                            <div class="views"><i class="ion-eye"></i>2,907</div>
                                            <div class="love"><i class="ion-heart"></i>623</div>
                                            <div class="comments"><i class="ion-chatboxes"></i>23</div>
                                        </footer><a href="#"></a>
                                    </figure></div>


                                <div class="cell">
                                    <figure class="card">
                                        <figcaption>
                                            <div class="date"><span class="day">28</span><span class="month">Oct</span></div>
                                            <h3>The World Ended Yesterday</h3>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                            </p>
                                            <div class="tipo"><p>Ubicación:</p></div>
                                            <div class="ubicacion"><p>Productos:</p></div>
                                            <div class="productos"><p>Organizado por:</p></div>
                                        </figcaption>
                                        <footer>
                                            <div class="views"><i class="ion-eye"></i>2,907</div>
                                            <div class="love"><i class="ion-heart"></i>623</div>
                                            <div class="comments"><i class="ion-chatboxes"></i>23</div>
                                        </footer><a href="#"></a>
                                    </figure></div>


                                <div class="cell">
                                    <figure class="card">
                                        <figcaption>
                                            <div class="date"><span class="day">28</span><span class="month">Oct</span></div>
                                            <h3>The World Ended Yesterday</h3>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                            </p>
                                            <div class="tipo"><p>Ubicación:</p></div>
                                            <div class="ubicacion"><p>Productos:</p></div>
                                            <div class="productos"><p>Organizado por:</p></div>
                                        </figcaption>
                                        <footer>
                                            <div class="views"><i class="ion-eye"></i>2,907</div>
                                            <div class="love"><i class="ion-heart"></i>623</div>
                                            <div class="comments"><i class="ion-chatboxes"></i>23</div>
                                        </footer>
                                    </figure></div>

                            </div>	

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

