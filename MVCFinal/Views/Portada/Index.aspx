<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.LoginModel>" %>

<!DOCTYPE html> 
<html lang="en"> 
    <head> 
        <title>Landing Page - Ubicatrex</title>         
        <meta name="keywords" content="" /> 
        <meta name="description" content="" /> 
        <meta charset="UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <!--<link rel="shortcut icon" href="PUT YOUR FAVICON HERE">-->         
        <!-- Google Web Font Embed -->         
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'> 
        <!-- Bootstrap core CSS -->         
        <link href="../../Content/css/demos/bootstrap.css" rel='stylesheet' type='text/css'> 
        <!-- Custom styles for this template -->         
        <link href="../../Content/js/colorbox/colorbox.css" rel='stylesheet' type='text/css'> 
        <link href="../../Content/css/templatemo_style.css" rel='stylesheet' type='text/css'>
        <link href="../../Content/css/font-awesome.css" rel='stylesheet' type='text/css'> 
        <link href="../../Content/css/elegant-icons-style.css" rel='stylesheet' type='text/css'> 
        
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->         
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->         
    </head>     
    <body> 
        <nav class="navbar navbar-inverse">                   
                  
    <div class="container">
        <div class="navbar-header">

            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class=" navbar-brand" href="#"><img height="40" width="40" src="../../Content/images/pgblocks-logo-white.png" /></a>
                        
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <form id="form1" runat="server" class="navbar-form navbar-right">
                  <% using (Html.BeginForm())
                       { %>   
                <div class="form-group" style="padding-left:10px">
              <span class="form-group-addon"><i class="icon_profile" style="color:white"></i></span>
              <input type="text"  class="form-control" placeholder="Username" name="Usuario" >
            </div>
            <div class="form-group" style="padding-left:10px">
                <span class="form-group-addon"><i class="icon_key_alt" style="color:white"></i></span>
                <input type="password"  class="form-control" placeholder="Password" name="Password">
            </div>
                <div class="form-group" style="padding-top:17px; padding-left:10px">
                <input type="submit" class="btn btn-success" value="SIGN IN" name="action">
               <a style="margin-left:10px" href="../RegistroA/RegistroAdmin.aspx"> <input class=" btn btn-orange" type="button"  name="action" value="SIGNUP"></a>
                    </div>
                <% } %>
            </form>
        </div>
        <!--/.navbar-collapse -->
    </div>
</nav>   
    
        <div class="templatemo-top-menu"> 
            <div class="container"> 
                <!-- Static navbar -->                 
                <div class="navbar navbar-default" role="navigation"> 
                    <div class="container"> 
                        <div class="navbar-header"> 
                            <button type="button" id="toogle" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> 
                                <span class="sr-only">Toggle navigation</span> 
                                <span class="icon-bar"></span> 
                                <span class="icon-bar"></span> 
                                <span class="icon-bar"></span> 
                            </button>                             
                            <a href="#" class="navbar-brand">
                                <img src="../../Content/images/Logo.png" alt="Ubicatrex" title="Ubicatrex" />
                            </a>                             
                        </div>                         
                        <div class="navbar-collapse collapse" id="templatemo-nav-bar"> 
                            <ul class="nav navbar-nav navbar-right" style="margin-top: 40px;"> 
                                <li class="active">
                                    <a href="#templatemo-top">PRINCIPAL</a>
                                </li>                                 
                                <li>
                                    <a href="#templatemo-about">ACERCA DE</a>
                                </li>                                 
                                <li>
                                    <a href="#templatemo-portfolio">PORTFOLIO</a>
                                </li>                                 
                                <li>
                                    <a href="#templatemo-contact">CONTACTO</a>
                                </li>    
                                      
                                 
                                                  
                            </ul>                             
                        </div>
                        <!--/.nav-collapse -->                         
                    </div>
                    <!--/.container-fluid -->                     
                </div>
                <!--/.navbar -->                 
            </div>             

            <!-- /container -->             
        </div>         
        <div> 
  

            <!-- Carousel -->             
            <div id="templatemo-carousel" class="carousel slide" data-ride="carousel"> 
                <!-- Indicators -->                 
                <ol class="carousel-indicators"> 
                    <li data-target="#templatemo-carousel" data-slide-to="0" class="active"></li>                     
                    <li data-target="#templatemo-carousel" data-slide-to="1"></li>                     
                    <li data-target="#templatemo-carousel" data-slide-to="2"></li>                     
                </ol>                 
                <div class="carousel-inner"> 
                    <div class="item active"> 
                        <div class="container"> 
                            <div class="carousel-caption"> 
                                <h1>BIENVENIDO A UBICATREX</h1> 
                                <p>LA OPORTUNIDAD DE DESCUBRIR Y ORGANIZAR SUS EVENTOS</p> 
                                
                                <p><a class="btn btn-lg btn-green" role="button" style="margin: 20px;">Registrese</a> <a class="btn btn-lg btn-orange" href="#" role="button">Contactenos</a></p> 
                            </div>                             
                        </div>                         
                    </div>                     
                    <div class="item"> 
                        <div class="container"> 
                            <div class="carousel-caption"> 
                                <div class="col-sm-6 col-md-6"> 
                                    <h1>Organizado y detallado</h1> 
                                    <p> Una Oportunidad para tener un registro detallado de sus lugares, eventos y clientes todo en un mismo lugar.</p> 
                                </div>                                 
                                <div class="col-sm-6 col-md-6"> 
                                    <h1> Global Accesing </h1> 
                                    <p>Acceda desde cualquier lugar a su evento, gracias al poderoso sensor de ubicacion usted puede encontrar los eventos mas cerca de usted.</p> 
                                </div>                                 
                            </div>                             
                        </div>                         
                    </div>                     
                    <div class="item"> 
                        <div class="container"> 
                            <div class="carousel-caption"> 
                                <h1>Accesible desde cualquier dispositivo</h1> 
                                <p>Este sitio web esta diseñado bajo el standard de responsive design lo que permite que pueda ser accesible desde cualquier tamaño de pantalla. Este diseño esta basado en el boostrap framework.</p> 
                                <p><a class="btn btn-lg btn-orange" href="#" role="button">Leer mas</a></p> 
                            </div>                             
                        </div>                         
                    </div>                     
                </div>                 
                <a class="left carousel-control" href="#templatemo-carousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
                <a class="right carousel-control" href="#templatemo-carousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
            </div>             
        </div>         
        <div class="templatemo-welcome" id="templatemo-welcome"> 
            <div class="container"> 
                <div class="templatemo-slogan text-center"> 
                    <span class="txt_darkgrey">Welcome to </span>Ubicatrex
                    <p class="txt_slogan"><i> See or died. Nuestro eslogan representa que lo mas importante de cada accion que realizes en tu vida como en cualquier negocio debes estar conciente donde estas sino tienes rumbo no hay sentido </i></p> 
                </div>                 
            </div>             
        </div>         
        <div class="templatemo-service"> 
            <div class="container"> 
                <div class="row"> 
                    <div class="col-md-4"> 
                        <div class="templatemo-service-item"> 
                            <div>
                                <img src="images/leaf.png" alt="icon" /> 
                                <span class="templatemo-service-item-header"> 
                                NOMBRE DEL EVENTO</span> 
                            </div>                             
                            <p> 
                            DESCRIPCION EN PALABRAS DE DESCRIPCION DEL LUGAR , CIUDAD DONDE SE UBICA , EVENTO QUE SE REALIZA Y A QUE HORA Y DEMAS .</p> 
                            <div class="text-center"> 
                                <a href="#" class="templatemo-btn-read-more btn btn-orange">LEER MAS</a> 
                            </div>                             
                            <br class="clearfix" /> 
                        </div>                         
                        <div class="clearfix"></div>                         
                    </div>                     
                    <div class="col-md-4"> 
                        <div class="templatemo-service-item"> 
                            <div> 
                                <img src="images/mobile.png" alt="icon" /> 
                                <span class="templatemo-service-item-header">NOMBRE DEL EVENTO</span> 
                            </div>                             
                            <p> DESCRIPCION EN PALABRAS DE DESCRIPCION DEL LUGAR , CIUDAD DONDE SE UBICA , EVENTO QUE SE REALIZA Y A QUE HORA Y DEMAS.</p> 
                            <div class="text-center"> 
                                <a href="#" class="templatemo-btn-read-more btn btn-orange">LEER MAS</a> 
                            </div>                             
                            <br class="clearfix" /> 
                        </div>                         
                    </div>                     
                    <div class="col-md-4"> 
                        <div class="templatemo-service-item"> 
                            <div> 
                                <img src="images/battery.png" alt="icon" /> 
                                <span class="templatemo-service-item-header">NOMBRE DEL EVENTO</span> 
                            </div>                             
                            <p> DESCRIPCION EN PALABRAS DE DESCRIPCION DEL LUGAR , CIUDAD DONDE SE UBICA , EVENTO QUE SE REALIZA Y A QUE HORA Y DEMAS.</p> 
                            <div class="text-center"> 
                                <a href="#" class="templatemo-btn-read-more btn btn-orange">LEER MAS</a> 
                            </div>                             
                            <br class="clearfix" /> 
                        </div>                         
                        <br class="clearfix" /> 
                    </div>                     
                </div>                 
            </div>             
        </div>         
        <div id="templatemo-portfolio"> 
            <div class="container"> 
                <div class="row"> 
                    <div class="templatemo-line-header"> 
                        <div class="text-center"> 
                            <hr class="team_hr team_hr_left hr_gray" />
                            <span class="txt_darkgrey"> PORTFOLIO </span> 
                            <hr class="team_hr team_hr_right hr_gray" /> 
                        </div>                         
                    </div>                     
                    <div class="clearfix"></div>                     
                    <div class="templatemo-gallery-category" style="font-size:16px; margin-top:80px;"> 
                        <div class="text-center"> 
</div>                         
                    </div>                     
                </div>                 

                <!-- /.row -->                 
                <div class="clearfix"></div>                 
                <div class="text-center"> 
                    <ul class="templatemo-project-gallery">
                        <li class="col-lg-2 col-md-2 col-sm-2  gallery gallery-graphic"> 
                            <a class="colorbox" href="images/full-gallery-image-1.jpg" data-group="gallery-graphic"> 
                                <div class="templatemo-project-box"> 
                                    <img src="images/gallery-image-1.jpg" class="img-responsive" alt="gallery" /> 
                                    <div class="project-overlay"> 
                                        <h5>Graphic</h5> 
                                        <hr /> 
                                        <h4>TEA POT</h4> 
                                    </div>                                     
                                </div>                                 
                            </a>                             
                        </li>                             
                        <li class="col-lg-2 col-md-2 col-sm-2  gallery gallery-creative"> 
                            <a class="colorbox" href="images/full-gallery-image-2.jpg" data-group="gallery-creative"> 
                                <div class="templatemo-project-box"> 
                                    <img src="images/gallery-image-2.jpg" class="img-responsive" alt="gallery" /> 
                                    <div class="project-overlay"> 
                                        <h5>Creative</h5> 
                                        <hr /> 
                                        <h4>BREAKFAST</h4> 
                                    </div>                                     
                                </div>                                 
                            </a>                             
                        </li>                         
                        <li class="col-lg-2 col-md-2 col-sm-2  gallery gallery-inspiration"> 
                            <a class="colorbox" href="images/full-gallery-image-3.jpg" data-group="gallery-inspiration"> 
                                <div class="templatemo-project-box"> 
                                    <img src="../../Content/images/gallery-image-3.jpg" class="img-responsive" alt="gallery" /> 
                                    <div class="project-overlay"> 
                                        <h5>Inspiration</h5> 
                                        <hr /> 
                                        <h4>GREEN COLORS</h4> 
                                    </div>                                     
                                </div>                                 
                            </a>                             
                        </li>                         
                        <li class="col-lg-2 col-md-2 col-sm-2  gallery gallery-design"> 
                            <a class="colorbox" href="images/full-gallery-image-4.jpg" data-group="gallery-design"> 
                                <div class="templatemo-project-box"> 
                                    <img src="images/gallery-image-4.jpg" class="img-responsive" alt="gallery" /> 
                                    <div class="project-overlay"> 
                                        <h5>Web Design</h5> 
                                        <hr /> 
                                        <h4>CAMERA</h4> 
                                    </div>                                     
                                </div>                                 
                            </a>                             
                        </li>                         
                        <li class="col-lg-2 col-md-2 col-sm-2  gallery gallery-inspiration"> 
                            <a class="colorbox" href="images/full-gallery-image-5.jpg" data-group="gallery-inspiration"> 
                                <div class="templatemo-project-box"> 
                                    <img src="images/gallery-image-5.jpg" class="img-responsive" alt="gallery" /> 
                                    <div class="project-overlay"> 
                                        <h5>Inspiration</h5> 
                                        <hr /> 
                                        <h4>PLANT</h4> 
                                    </div>                                     
                                </div>                                 
                            </a>                             
                        </li>                         
                        <li class="col-lg-2 col-md-2 col-sm-2  gallery gallery-inspiration"> 
                            <a class="colorbox" href="images/full-gallery-image-6.jpg" data-group="gallery-inspiration"> 
                                <div class="templatemo-project-box"> 
                                    <img src="images/gallery-image-6.jpg" class="img-responsive" alt="gallery" /> 
                                    <div class="project-overlay"> 
                                        <h5>Inspiration</h5> 
                                        <hr /> 
                                        <h4>CABLE TRAIN</h4> 
                                    </div>                                     
                                </div>                                 
                            </a>                             
                        </li>                         
                        <li class="col-lg-2 col-md-2 col-sm-2 gallery gallery-design"> 
                            <a class="colorbox" href="images/full-gallery-image-7.jpg" data-group="gallery-design"> 
                                <div class="templatemo-project-box"> 
                                    <img src="images/gallery-image-7.jpg" class="img-responsive" alt="gallery" /> 
                                    <div class="project-overlay"> 
                                        <h5>Web Design</h5> 
                                        <hr /> 
                                        <h4>CITY</h4> 
                                    </div>                                     
                                </div>                                 
                            </a>                             
                        </li>                         
                        <li class="col-lg-2 col-md-2 col-sm-2 gallery gallery-creative"> 
                            <a class="colorbox" href="images/full-gallery-image-8.jpg" data-group="gallery-creative"> 
                                <div class="templatemo-project-box"> 
                                    <img src="images/gallery-image-8.jpg" class="img-responsive" alt="gallery" /> 
                                    <div class="project-overlay"> 
                                        <h5>Creative</h5> 
                                        <hr /> 
                                        <h4>BIRDS</h4> 
                                    </div>                                     
                                </div>                                 
                            </a>                             
                        </li>                         
                        <li class="col-lg-2 col-md-2 col-sm-2 gallery gallery-graphic"> 
                            <a class="colorbox" href="images/full-gallery-image-9.jpg" data-group="gallery-graphic"> 
                                <div class="templatemo-project-box"> 
                                    <img src="images/gallery-image-9.jpg" class="img-responsive" alt="gallery" /> 
                                    <div class="project-overlay"> 
                                        <h5>Graphic</h5> 
                                        <hr /> 
                                        <h4>NATURE</h4> 
                                    </div>                                     
                                </div>                                 
                            </a>                             
                        </li>                         
                        <li class="col-lg-2 col-md-2 col-sm-2 gallery gallery-inspiration"> 
                            <a class="colorbox" href="images/full-gallery-image-10.jpg" data-group="gallery-inspiration"> 
                                <div class="templatemo-project-box"> 
                                    <img src="images/gallery-image-10.jpg" class="img-responsive" alt="gallery" /> 
                                    <div class="project-overlay"> 
                                        <h5>Inspiration</h5> 
                                        <hr /> 
                                        <h4>DOGGY</h4> 
                                    </div>                                     
                                </div>                                 
                            </a>                             
                        </li>                         
                    </ul>
                    <!-- /.gallery -->                     
                </div>                 
                <div class="clearfix"></div>                 
                <div class="row text-center"> 
                    <a class="btn_loadmore btn btn-lg btn-orange" href="#" role="button">LOAD MORE</a> 
                </div>                 
            </div>
            <!-- /.container -->             
        </div>         

        <!-- /.templatemo-portfolio -->         
        <div id="templatemo-blog"> 
            <div class="container"> 
                <div class="row"> 
                    <div class="templatemo-line-header" style="margin-top: 0px;"> 
                        <div class="text-center"> 
                            <hr class="team_hr team_hr_left hr_gray" />
                            <span class="span_blog txt_darkgrey">FEEDBACK</span> 
                            <hr class="team_hr team_hr_right hr_gray" /> 
                        </div>                         
                    </div>                     
                    <br class="clearfix" /> 
                </div>                 
                AQUI VAN FEEDBACK DE ALGUNOS USUARIOS     
                <div class="blog_box"> 
                    <div class="col-sm-5 col-md-6 blog_post"> 
                        <ul class="list-inline"> 
                            <li class="col-md-4"> 
                                <a href="#"> 
                                    <img class="img-responsive" src="images/blog-image-1.jpg" alt="gallery 1" /> 
                                </a>                                 
                            </li>                             
                            <li class="col-md-8"> 
                                <div class="pull-left"> 
                                    <span class="blog_header">GRAPHIC DESIGN</span>
                                    <br /> 
                                    <span>Posted by : <a class="link_orange" href="#"><span class="txt_orange">Tracy</span></a></span> 
                                </div>                                 
                                <div class="pull-right"> 
                                    <a class="btn btn-orange" href="#" role="button">21 February 2084</a> 
                                </div>                                 
                                <div class="clearfix"> </div>                                 
                                <p class="blog_text"> 
                                    Aliquam quis rutrum risus, ut condimentum ipsum. Nullam aliquet libero augue, eget auctor felis vulputate id. Proin a enim eu libero ornare malesuada. Sed iaculis fringilla lacinia. Sed laoreet lectus vitae [...]
</p> 
                            </li>                             
                        </ul>                         
                    </div>                     

                    <!-- /.blog_post 1 -->                     
                    <div class="col-sm-5 col-md-6 blog_post"> 
                        <ul class="list-inline"> 
                            <li class="col-md-4">
                                <a href="#"> 
                                    <img class="img-responsive" src="images/blog-image-2.jpg" alt="gallery 2" />
                                </a>                                 
                            </li>                             
                            <li class="col-md-8"> 
                                <div class="pull-left"> 
                                    <span class="blog_header">WEBSITE TEMPLATE</span>
                                    <br /> 
                                    <span>Posted by : <a class="link_orange" href="#"><span class="txt_orange">Mary</span></a></span> 
                                </div>                                 
                                <div class="pull-right"> 
                                    <a class="btn btn-orange" href="#" role="button">18 February 2084</a> 
                                </div>                                 
                                <div class="clearfix"> </div>                                 
                                <p class="blog_text"> 
                                        Morbi imperdiet ipsum sit amet dui pharetra, vulputate porta neque tristique. Quisque id turpis tristique, venenatis erat sit amet, venenatis turpis. Ut tellus ipsum, posuere bibendum [...]
</p> 
                            </li>                             
                        </ul>                         
                    </div>
                    <!-- /.blog_post 2 -->                     
                    <div class="templatemo_clear"></div>                     
                    <div class="col-sm-5 col-md-6 blog_post"> 
                        <ul class="list-inline"> 
                            <li class="col-md-4">
                                <a href="#"> 
                                    <img class="img-responsive" src="images/blog-image-2.jpg" alt="gallery 3" />
                                </a>                                 
                            </li>                             
                            <li class="col-md-8"> 
                                <div class="pull-left"> 
                                    <span class="blog_header">WEB DEVELOPMENT</span>
                                    <br /> 
                                    <span>Posted by : <a class="link_orange" href="#"><span class="txt_orange">Julia</span></a></span> 
                                </div>                                 
                                <div class="pull-right"> 
                                    <a class="btn btn-orange" href="#" role="button">14 February 2084</a> 
                                </div>                                 
                                <div class="clearfix"> </div>                                 
                                <p class="blog_text"> 
                                        Fusce molestie tellus risus, id commodo turpis convallis id. Morbi mattis sapien sapien, vitae lacinia ante interdum sit amet. Praesent eget varius diam, ac tempor est. Mauris at scelerisque magna [...]
</p> 
                            </li>                             
                        </ul>                         
                    </div>
                    <!-- /.blog_post 3 -->                     
                    <div class="col-sm-5 col-md-6 blog_post"> 
                        <ul class="list-inline"> 
                            <li class="col-md-4"> 
                                <a href="#"> 
                                    <img class="img-responsive" src="images/blog-image-1.jpg" alt="gallery 4" /> 
                                </a>                                 
                            </li>                             
                            <li class="col-md-8"> 
                                <div class="pull-left"> 
                                    <span class="blog_header">NEW FLUID LAYOUT</span>
                                    <br /> 
                                    <span>Posted by : <a class="link_orange" href="#"><span class="txt_orange">Linda</span></a></span> 
                                </div>                                 
                                <div class="pull-right"> 
                                    <a class="btn btn-orange" href="#" role="button">11 February 2084</a> 
                                </div>                                 
                                <div class="clearfix"> </div>                                 
                                <p class="blog_text"> 
                                    In venenatis sodales purus a cursus. Ut consectetur, libero ac elementum tristique, enim ante aliquet mauris, scelerisque congue magna neque ac purus. Aliquam facilisis volutpat odio [...]
</p> 
                            </li>                             
                        </ul>                         
                    </div>                     

                    <!-- /.blog_post 4 -->                     
                </div>                 
            </div>             
        </div>         
        <div id="templatemo-contact"> 
            <div class="container"> 
                <div class="row"> 
                    <div class="templatemo-line-header head_contact"> 
                        <div class="text-center"> 
                            <hr class="team_hr team_hr_left hr_gray" />
                            <span class="txt_darkgrey">CONTACTO</span> 
                            <hr class="team_hr team_hr_right hr_gray" /> 
                        </div>                         
                    </div>                     
                    <div class="col-md-8"> 
                        <div class="templatemo-contact-map" id="map-canvas">AQUI VA A IR EL MAPA
</div>                         
                        <div class="clearfix"></div>                         
                    </div>                     
                    <div class="col-md-4 contact_right"> 
                        <p>Aqui puede dejar sus comentarios si lo desea.</p> 
                        <p><img src="images/location.png" alt="icon 1" />Montevideo</p> 
                        <p><img src="images/phone1.png" alt="icon 2" /> 598-080-0110</p> 
                        <p><img src="images/globe.png" alt="icon 3" /><a class="link_orange" href="#"><span class="txt_orange">www.Ubicatrex.com</span></a></p> 
                        <form class="form-horizontal" action="#"> 
                            <div class="form-group"> 
                                <input type="email" class="form-control" placeholder="Su Nombre..." maxlength="40" /> 
                            </div>                             
                            <div class="form-group"> 
                                <input type="email" class="form-control" placeholder="Su Email..." maxlength="40" /> 
                            </div>                             
                            <div class="form-group"> 
                                <textarea class="form-control" style="height: 130px;" placeholder="Escriba debajo su comentario..."></textarea>                                 
                            </div>                             
                            <button type="submit" class="btn btn-orange pull-right">Enviar</button>                             
                        </form>                         
                    </div>                     
                </div>
                <!-- /.row -->                 
            </div>
            <!-- /.container -->             
        </div>
        <!-- /#templatemo-contact -->         
        <div class="templatemo-tweets"> 
            <div class="container"> 
                <div class="row" style="margin-top:20px;"> 
                    <div class="col-md-2"> 
</div>                     
                    <div class="col-md-1"> 
                        <img src="images/quote.png" alt="icon" /> 
                    </div>                     
                    <div class="col-md-7 tweet_txt"> 
                        <span>En los momentos de crisis, sólo la imaginación es más importante que el conocimiento. Albert Einstein. Con un Ubicatrex descubriras eso. </span> 
                        <br /> 
                    </div>                     
                    <div class="col-md-2"> 
</div>                     
                </div>
                <!-- /.row -->                 
            </div>
            <!-- /.container -->             
        </div>         
        <div class="templatemo-footer"> 
            <div class="container"> 
                <div class="row"> 
                    <div class="text-center"> 
                        <div class="footer_container"> 
                            <ul class="list-inline"> 
                                <li> 
                                    <a href="#"> <span class="social-icon-fb"></span> </a> 
                                </li>                                 
                                <li> 
                                    <a href="#"> <span class="social-icon-rss"></span> </a> 
                                </li>                                 
                                <li> 
                                    <a href="#"> <span class="social-icon-twitter"></span> </a> 
                                </li>                                 
                                <li> 
                                    <a href="#"> <span class="social-icon-linkedin"></span> </a> 
                                </li>                                 
                                <li> 
                                    <a href="#"> <span class="social-icon-dribbble"></span> </a> 
                                </li>                                 
                            </ul>                             
                            <div class="height30"></div>                             
                            <a class="btn btn-lg btn-orange" href="#" role="button" id="btn-back-to-top">Back To Top</a> 
                            <div class="height30"></div>                             
                        </div>                         
                        <div class="footer_bottom_content"> 
                            <span id="footer-line">Copyright © 2017 Ubicatrex Maps</span>
                        </div>                         
                    </div>                     
                </div>                 
            </div>             
        </div>         
        <script src="../../Content/js/vendor/jquery-1.11.1.min.js" type="text/javascript"></script>         
        <script src="../../Content/js/vendor//bootstrap.min.js" type="text/javascript"></script>         
        <script src="../../Content/js/vendor//stickUp.min.js" type="text/javascript"></script>         
        <script src="../../Content/js/colorbox/jquery.colorbox-min.js" type="text/javascript"></script>         
        <script src="../../Content/js/vendor/templatemo_script.js" type="text/javascript"></script>   
        <link href="../../Content/js/vendor/templatemo_misc.css" rel="stylesheet" type="text/css">
        <link href="../../Content/js/vendor/animate.css" rel="stylesheet" type="text/css">        
        <!-- templatemo 395 urbanic -->         
    </body>     
</html>