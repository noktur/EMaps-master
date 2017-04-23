<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>
<html>
   <head>
       <title> Ubicate ! | Landing Page</title>
        <meta name="keywords" content="" /> 
        <meta name="description" content="" /> 
        <meta charset="UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        
        <!-- Google Fonts  -->
		<link href="../../Content/Portada/css.css" rel="stylesheet" type="text/css"> <!-- Body font -->
		<link href="../../Content/Portada/css(1).css" rel="stylesheet" type="text/css"> <!-- Navbar font -->

		<!-- Libs and Plugins CSS -->
		<link rel="stylesheet" href="../../Content/Portada/bootstrap.min.css">
		<link rel="stylesheet" href="../../Content/Portada/animate.min.css">
		<link rel="stylesheet" href="../../Content/Portada/font-awesome.min.css"> <!-- Font Icons -->
		<link rel="stylesheet" href="../../Content/Portada/owl.carousel.css">
		<link rel="stylesheet" href="../../Content/Portada/owl.theme.css">
       		<link rel="stylesheet" href="../../Content/Portada/cool-gray.css">
       <link rel="stylesheet" href="../../Content/Portada/Carousel.css">


		<!-- Theme CSS -->
        <link rel="stylesheet" href="../../Content/Portada/reset.css">
		<link rel="stylesheet" href="../../Content/Portada/style.css">
		<link rel="stylesheet" href="../../Content/Portada/mobile.css">

		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
               <script src="../../Content/Portada/jquery-1.11.1.min.js"></script>

       <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJiCs0vB2sIBGKclrmhydA4I9uekWOIvk&libraries=places"></script>


       <script type="text/javascript"> 

           function initMap() {
               var customMapType = new google.maps.StyledMapType([
                   {
                       stylers: [
                         { hue: '#890000' },
                         { visibility: 'simplified' },
                         { gamma: 0.5 },
                         { weight: 0.5 }
                       ]
                   },
                   {
                       elementType: 'labels',
                       stylers: [{ visibility: 'off' }]
                   },
                   {
                       featureType: 'water',
                       stylers: [{ color: '#0B0B61' }]
                   }
               ], {
                   name: 'Custom Style'
               });
               var customMapTypeId = 'custom_style';

               var map = new google.maps.Map(document.getElementById('map'), {
                   zoom: 12,
                   center: { lat: 40.674, lng: -73.946 },  // Brooklyn.
                   mapTypeControlOptions: {
                       mapTypeIds: [google.maps.MapTypeId.ROADMAP, customMapTypeId]
                   }
               });

               map.mapTypes.set(customMapTypeId, customMapType);
               map.setMapTypeId(customMapTypeId);
           }


           jQuery(document).ready(function () {

               initMap();

           });
       </script>

	</head>

    <body data-spy="scroll" data-target="#main-navbar">
        <div class="body">
        
            <!--========== BEGIN HEADER ==========-->
            <header id="header" class="header-main">

                <!-- Begin Navbar -->
                <nav id="main-navbar" class="navbar navbar-default navbar-fixed-top navbar-shrink" role="navigation"> 
                
                    <!-- Classes: navbar-default, navbar-inverse, navbar-fixed-top, navbar-fixed-bottom, navbar-transparent. Note: If you use non-transparent navbar, set "height: 98px;" to #header -->

                  <div class="container">

                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>
                      <a class="navbar-brand page-scroll" href="Principal.aspx">Ubicate! </a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a class="page-scroll" href="#text-carousel-intro-section">Home</a></li>
                            <li ><a class="page-scroll" href="#about-section">  About</a></li>
                            <li ><a class="page-scroll" href="#services-section">Services</a></li>
                            <li ><a class="page-scroll" href="#portfolio-section">Works</a></li>
                            <li><a class="page-scroll" href="#team-section">Team</a></li>                            
                            <li><a class="page-scroll" href="#prices-section">Prices</a></li>
                            <li><a class="page-scroll" href="#contact-section">Contact</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                  </div><!-- /.container -->
                </nav>
                <!-- End Navbar -->

            </header>
            <!-- ========= END HEADER =========-->
            
            
            
            
        	<!-- Begin text carousel intro section -->
                <div class="carousel slide" id="img-carousel" style="background: url('../../Content/Portada/img/frellancers.jpg');" data-ride="carousel">
  <!-- Indicators-->
  <ol class="carousel-indicators">
    <li class="active" data-target="#img-carousel" data-slide-to="0"></li>
    <li data-target="#img-carousel" data-slide-to="1" class=""></li>
    <li data-target="#img-carousel" data-slide-to="2" class=""></li>
  </ol>
  <!-- Wrapper for slides-->
  <div class="carousel-inner" role="listbox">
    <div class="item next left">
      <div class="carousel-caption">
        <h2 class="animated fadeInDown">BIENVENIDO A UBICATREX</h2>
        <p class="animated fadeInUp">LA OPORTUNIDAD DE DESCUBRIR Y ORGANIZAR SUS EVENTOS</p>
          <div class="col-md-3 col-md-offset-3">
        <p class="animated fadeInUp"><a class="btn btn-default btn-rounded btn-large" href="../Registro/Register">Registrese!</a> </p>
              </div>
           <div class="col-md-3">
         <p class="animated fadeInRight"> <a class="btn btn-info blue btn-rounded btn-large" href="../Logueo/Login">Ingrese Aqui!</a></p> 
     </div>
                </div>
    </div>
    <div class="item">
      <div class="carousel-caption">
        <h2 class="animated bounceInDown">Accesible desde cualquier dispositivo</h2> 
         <p class="animated bounceInUp">Este sitio web esta diseñado bajo el standard de responsive design lo que permite que pueda ser accesible desde cualquier tamaño de pantalla. Este diseño esta basado en el boostrap framework.</p> 
         <p class="animated bounceInUp"><a class="btn btn-default btn-rounded" href="#" role="button">Leer mas</a></p> 
      </div>
    </div>
    <div class="item active left">
      <div class="carousel-caption">
        <h2 class="animated fadeInDown">Organizado y detallado</h2>
        <p class="animated fadeInDown">Una Oportunidad para tener un registro detallado de sus lugares, eventos y clientes todo en un mismo lugar.</p>
        <p class="animated fadeInRight"><a class="btn btn-danger btn-rounded btn-large" href="#">Leer mas!</a></p>
      </div>
    </div>
      </div>
  <!-- Controls--><a class="left carousel-control" href="#img-carousel" role="button" data-slide="prev"><i class="fa fa-chevron-left" aria-hidden="true"></i><span class="sr-only">Previous</span></a><a class="right carousel-control" href="#img-carousel" role="button" data-slide="next"><i class="fa fa-chevron-right" aria-hidden="true"></i><span class="sr-only">Next</span></a>
</div>

			<!-- End text carousel intro section -->
                
                
              
              
              
            <!-- Begin Services -->
            <section id="services-section" class="page text-center">
                <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInDown animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDown;">
                            <h2>Services</h2>
                            <div class="devider"></div>
                            <p class="subtitle">what we really know how</p>
                        </div>
                    </div>
                </div>
                <!-- End page header-->
            
                <!-- Begin roatet box-2 -->
                <div class="rotate-box-2-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 col-sm-6">
                                <a  class="rotate-box-2 square-icon text-center wow zoomIn animated" data-wow-delay="0" style="visibility: visible; animation-name: zoomIn;">
                                    <span class="rotate-box-icon"><i class="fa fa-mobile"></i></span>
                                    <div class="rotate-box-info">
                                        <h4>App Development</h4>
                                        <p>Lorem ipsum dolor sit amet set, consectetur utes anet adipisicing elit, sed do eiusmod tempor incidist.</p>
                                    </div>
                                </a>
                            </div>
            
                            <div class="col-md-3 col-sm-6">
                                <a  class="rotate-box-2 square-icon text-center wow zoomIn animated" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: zoomIn;">
                                    <span class="rotate-box-icon"><i class="fa fa-pie-chart"></i></span>
                                    <div class="rotate-box-info">
                                        <h4>Ui Design</h4>
                                        <p>Lorem ipsum dolor sit amet set, consectetur utes anet adipisicing elit, sed do eiusmod tempor incidist.</p>
                                    </div>
                                </a>
                            </div>
            
                            <div class="col-md-3 col-sm-6">
                                <a class="rotate-box-2 square-icon text-center wow zoomIn animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: zoomIn;">
                                    <span class="rotate-box-icon"><i class="fa fa-cloud"></i></span>
                                    <div class="rotate-box-info">
                                        <h4>Web Services</h4>
                                        <p>Lorem ipsum dolor sit amet set, consectetur utes anet adipisicing elit, sed do eiusmod tempor incidist.</p>
                                    </div>
                                </a>
                            </div>
                             
                            <div class="col-md-3 col-sm-6">
                                <a  class="rotate-box-2 square-icon text-center wow zoomIn animated" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: zoomIn;">
                                    <span class="rotate-box-icon"><i class="fa fa-pencil"></i></span>
                                    <div class="rotate-box-info">
                                        <h4>Programming Integrate</h4>
                                        <p>Lorem ipsum dolor sit amet set, consectetur utes anet adipisicing elit, sed do eiusmod tempor incidist.</p>
                                    </div>
                                </a>
                            </div>
                            
                        </div> <!-- /.row -->
                    </div> <!-- /.container -->
                    
                    <div class="container">
                        <!-- Cta Button -->
                        <div class="extra-space-l"></div>
                        <div class="text-center">
                    		<a class="btn btn-default btn-lg-xl"  role="button">Large Button</a>
                        </div>
                    </div> <!-- /.container -->                       
                </div>
                <!-- End rotate-box-2 -->
            </section>
            <!-- End Services -->
              
              
              

                
                
            <!-- Begin Portfolio -->
            <section id="portfolio-section" class="page bg-style1">
            	<div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="portfolio">
                                <!-- Begin page header-->
                                <div class="page-header-wrapper">
                                    <div class="container">
                                        <div class="page-header text-center wow fadeInDown animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDown;">
                                            <h2>Events Right Now !</h2>
                                            <div class="devider"></div>
                                            <p class="subtitle">Find a place to go</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- End page header-->
                                <div class="portfoloi_content_area">
                                    <div class="portfolio_menu" id="filters">
                                        <ul>
                                            <li class="active_prot_menu"><a href="#porfolio_menu" data-filter="*">all</a></li>
                                            <li><a href="#porfolio_menu" data-filter=".websites"></a></li>
                                            <li><a href="#porfolio_menu" data-filter=".webDesign">web design</a></li>
                                            <li><a href="#porfolio_menu" data-filter=".appsDevelopment">apps development</a></li>
                                            <li><a href="#porfolio_menu" data-filter=".GraphicDesign">graphic design</a></li>
                                            <li><a href="#porfolio_menu" data-filter=".responsive">responsive</a></li>
                                        </ul>
                                    </div>
                                    <div class="portfolio_content">
                                        <div class="row" id="portfolio" style="position: relative; height: 1176px;">
                                            <div class="col-xs-12 col-sm-4 appsDevelopment" style="position: absolute; left: 0px; top: 0px;">
                                                <div class="portfolio_single_content">
                                                    <img src="../../Content/Portada/p1.jpg" alt="title">
                                                    <div>
                                                        <a href="../../Content/Portada/#">Skull Awesome</a>
                                                        <span>Subtitle</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4 GraphicDesign" style="position: absolute; left: 390px; top: 0px;">
                                                <div class="portfolio_single_content">
                                                    <img src="../../Content/Portada/p2.jpg" alt="title">
                                                    <div>
                                                        <a href="#">Photo Frame</a>
                                                        <span>Subtitle</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4 responsive" style="position: absolute; left: 780px; top: 0px;">
                                                <div class="portfolio_single_content">
                                                    <img src="../../Content/Portada/p3.jpg" alt="title">
                                                    <div>
                                                        <a href="#">Hand Shots</a>
                                                        <span>Subtitle</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4 webDesign websites" style="position: absolute; left: 0px; top: 392px;">
                                                <div class="portfolio_single_content">
                                                    <img src="../../Content/Portada/p4.jpg" alt="title">
                                                    <div>
                                                        <a href="#">Night Abstract</a>
                                                        <span>Subtitle</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4 appsDevelopment websites" style="position: absolute; left: 390px; top: 392px;">
                                                <div class="portfolio_single_content">
                                                    <img src="../../Content/Portada/p5.jpg" alt="title">
                                                    <div>
                                                        <a href="#">Joy of Independence</a>
                                                        <span>Subtitle</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4 GraphicDesign" style="position: absolute; left: 780px; top: 392px;">
                                                <div class="portfolio_single_content">
                                                    <img src="../../Content/Portada/p6.jpg" alt="title">
                                                    <div>
                                                        <a href="#">Night Crawlers</a>
                                                        <span>Subtitle</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4 responsive" style="position: absolute; left: 0px; top: 784px;">
                                                <div class="portfolio_single_content">
                                                    <img src="../../Content/Portada/p7.jpg" alt="title">
                                                    <div>
                                                        <a href="#">Last Motel</a>
                                                        <span>Subtitle</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4 GraphicDesign" style="position: absolute; left: 390px; top: 784px;">
                                                <div class="portfolio_single_content">
                                                    <img src="../../Content/Portada/p8.jpg" alt="title">
                                                    <div>
                                                        <a href="#">Dirk Road</a>
                                                        <span>Subtitle</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4 websites" style="position: absolute; left: 780px; top: 784px;">
                                                <div class="portfolio_single_content">
                                                    <img src="../../Content/Portada/p9.jpg" alt="title">
                                                    <div>
                                                        <a href="#">Old is Gold</a>
                                                        <span>Subtitle</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End portfolio -->
            
                    
            <!-- Begin prices section -->
			<section id="prices-section" class="page">

                <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInDown animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDown;">
                            <h2>Localizacion</h2>
                            <div class="devider"></div>
                            <p class="subtitle">Search a event</p>
                        </div>
                    </div>
                </div>
                <!-- End page header-->

				<div class="extra-space-l"></div>

				<!-- Begin prices -->
				<div class="prices">
					
                    <div id="map" class=" col-sm-12 col-md-12 wow flipInY animated" data-wow-delay="0.3s" style=" height:568px;visibility: visible; animation-delay: 0.3s; animation-name: flipInY;">
																	
							</div>
				</div>
				<!-- End prices -->
				<div class="extra-space-l"></div>
			</section>
            
			<!-- End prices section -->
                
                
                
                
            <!-- Begin social section -->
			<section id="social-section">
            
                 <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInDown animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDown;">
                            <h2>Join Us</h2>
                            <div class="devider"></div>
                            <p class="subtitle">Follow us on social networks</p>
                        </div>
                    </div>
                </div>
                <!-- End page header-->
                
                <div class="container">
                	<ul class="social-list">
                		<li> <a href="#" class="rotate-box-1 square-icon text-center wow zoomIn animated" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: zoomIn;"><span class="rotate-box-icon"><i class="fa fa-facebook"></i></span></a></li>
                		<li> <a href="#" class="rotate-box-1 square-icon text-center wow zoomIn animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: zoomIn;"><span class="rotate-box-icon"><i class="fa fa-twitter"></i></span></a></li>
                		<li> <a href="#" class="rotate-box-1 square-icon text-center wow zoomIn animated" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: zoomIn;"><span class="rotate-box-icon"><i class="fa fa-google-plus"></i></span></a></li>
                		<li> <a href="#" class="rotate-box-1 square-icon text-center wow zoomIn animated" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: zoomIn;"><span class="rotate-box-icon"><i class="fa fa-tumblr"></i></span></a></li>
                		<li> <a href="#" class="rotate-box-1 square-icon text-center wow zoomIn animated" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; animation-name: zoomIn;"><span class="rotate-box-icon"><i class="fa fa-dribbble"></i></span></a></li>                      
                    </ul>
                </div>
                
            </section>
            <!-- End social section -->
                
                
                
                
            <!-- Begin contact section -->
			<section id="contact-section" class="page text-white parallax" data-stellar-background-ratio="0.5"; background-position: 0px 416.5px;">
           
                 <div class="cover"></div>
            
                 <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInDown animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDown;">
                            <h2>Contacts</h2>
                            <div class="devider"></div>
                            <p class="subtitle">All to contact us</p>
                        </div>
                    </div>
                </div>
                <!-- End page header-->
                
                <div class="contact wow bounceInRight animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInRight;">
                    <div class="container">
                    	<div class="row">
                        
                            <div class="col-sm-6">
                                <div class="contact-info">
                                    <h4>Nuestra direccion</h4>
                                    <ul class="contact-address">
			                            <li><i class="fa fa-map-marker fa-lg"></i>Montevideo, Uruguay</li>
			                            <li><i class="fa fa-phone"></i>&nbsp; 1 -234 -456 -7890</li>
			                            <li><i class="fa fa-envelope"></i> Ubicate@yourmail.com</li>
			                            <li><i class="fa fa-skype"></i> Ubicate!</li>
			                        </ul>
                                </div>
                            </div>
                        
                        	<div class="col-sm-6">
                                <div class="contact-form">
                                	<h4>Write to us</h4>
                                    <form role="form">
                                        <div class="form-group">
                                            <input type="text" class="form-control input-lg" placeholder="Your Name" required="">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control input-lg" placeholder="E-mail" required="">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control input-lg" placeholder="Subject" required="">
                                        </div>
                                        <div class="form-group">
                                            <textarea class="form-control input-lg" rows="5" placeholder="Message" required=""></textarea>
                                        </div>
                                        <button type="submit" class="btn wow bounceInRight animated" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; animation-name: bounceInRight;">Send</button>
                                    </form>
                                </div>	
                            </div>
                                                                                
                        </div> <!-- /.row -->
                    </div> <!-- /.container -->
               </div>
               
            </section>
            <!-- End contact section -->
                
                

                
            <!-- Begin footer -->
            <footer class="text-off-white">
            
                <div class="footer-top">
                	<div class="container">
                    	<div class="row wow bounceInLeft animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInLeft;">
                        
                        	<div class="col-sm-6 col-md-4">
                                <h4>Subscribe</h4>
                            	<div id="footer_signup">
                                    <div id="email">
                                        <form id="subscribe" method="POST">
                                            <input type="text" placeholder="Enter email address" name="email" id="address" data-validate="validate(required, email)">
                                            <button type="submit">Submit</button>
                                            <span id="result" class="section-description"></span>
                                        </form> 
                                    </div>
                                </div> 
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p> 
                            </div>

                            <div class="col-sm-12 col-md-4">
                                <h4>Recent Tweets</h4>
                                <div class="single-tweet">
                                    <div class="tweet-content"><span>@Ubicate!</span> Excepteur sint occaecat cupidatat non proident</div>
                                    <div class="tweet-date">1 Hour ago</div>
                                </div>
                                <div class="single-tweet">
                                    <div class="tweet-content"><span>@Ubicate!</span> Excepteur sint occaecat cupidatat non proident uku shumaru</div>
                                    <div class="tweet-date">1 Hour ago</div>
                                </div>
                            </div>
                            
                        </div> <!-- /.row -->
                    </div> <!-- /.container -->
                </div>
                
                <div class="footer">
                    <div class="container text-center wow fadeIn animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeIn;">
                        <p class="copyright">Copyright  2017 - Developed <i class="fa fa-pencil-square-o " style="color:greenyellow;"></i> by Matias Melfi, Martin Jacques, German Hernandez </p>
                    </div>
                </div>
 
            </footer>
            <!-- End footer -->

            <a class="scrolltotop" style="display: block;"><i class="fa fa-arrow-up"></i></a> <!-- Scroll to top button -->
                                              
        </div><!-- body ends -->
        
        
        
        
        <!-- Plugins JS -->

		<script src="../../Content/Portada/bootstrap.min.js"></script>
         <script src="../../Content/Portada/owl.carousel.min.js"></script>
             
		<script src="../../Content/Portada/jquery.stellar.min.js"></script>
		<script src="../../Content/Portada/wow.min.js"></script>
        <script src="../../Content/Portada/waypoints.min.js"></script>
		<script src="../../Content/Portada/isotope.pkgd.min.js"></script>
		<script src="../../Content/Portada/classie.js"></script>
		<script src="../../Content/Portada/jquery.easing.min.js"></script>
		<script src="../../Content/Portada/jquery.counterup.min.js"></script>
		<script src="../../Content/Portada/smoothscroll.js"></script>
        <script src="../../Content/Portada/styleswitch.js"></script>
           <script src="../../Content/Portada/theme.js"></script>
            

        <div style="clear: both;"></div></body></html>