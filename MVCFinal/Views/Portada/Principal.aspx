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
                
                
                
                
            <!-- Begin about section -->
			<section id="about-section" class="page bg-style1">
                <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInUp animated" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
                            <h2>About</h2>
                            <div class="devider"></div>
                            <p class="subtitle">little information</p>
                        </div>
                    </div>
                </div>
                <!-- End page header-->

                <!-- Begin rotate box-1 -->
                <div class="rotate-box-1-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 col-sm-6">
                                <a class="rotate-box-1 square-icon wow zoomIn animated" data-wow-delay="0" style="visibility: visible; animation-name: zoomIn;">
                                    <span class="rotate-box-icon"><i class="fa fa-users"></i></span>
                                    <div class="rotate-box-info">
                                        <h4>Who We Are?</h4>
                                        <p>Lorem ipsum dolor sit amet set, consectetur utes anet adipisicing elit, sed do eiusmod tempor incidist.</p>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-3 col-sm-6">
                                <a  class="rotate-box-1 square-icon wow zoomIn animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: zoomIn;">
                                    <span class="rotate-box-icon"><i class="fa fa-heart"></i></span>
                                    <div class="rotate-box-info">
                                        <h4>Why We Do It?</h4>
                                        <p>Lorem ipsum dolor sit amet set, consectetur utes anet adipisicing elit, sed do eiusmod tempor incidist.</p>
                                    </div>
                                </a>
                            </div>
                            
                            <div class="col-md-3 col-sm-6">
                                <a  class="rotate-box-1 square-icon wow zoomIn animated" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: zoomIn;">
                                    <span class="rotate-box-icon"><i class="fa fa-clock-o"></i></span>
                                    <div class="rotate-box-info">
                                        <h4>Since When?</h4>
                                        <p>Lorem ipsum dolor sit amet set, consectetur utes anet adipisicing elit, sed do eiusmod tempor incidist.</p>
                                    </div>
                                </a>
                            </div>
                            
                        </div> <!-- /.row -->
                    </div> <!-- /.container -->
                </div>
                <!-- End rotate box-1 -->
                
                <div class="extra-space-l"></div>
                
                <!-- Begin page header--> 
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInUp animated" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
                            <h4>Our Skills</h4>

                            <div class="col-md-3 col-sm-6">
                                <a  class="rotate-box-1 square-icon wow zoomIn animated" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: zoomIn;">
                                    <span class="rotate-box-icon"><i class="fa fa-diamond"></i></span>
                                    <div class="rotate-box-info">
                                        <h4>What We Do?</h4>
                                        <p>Lorem ipsum dolor sit amet set, consectetur utes anet adipisicing elit, sed do eiusmod tempor incidist.</p>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- End page header-->
                
                <!-- Begin Our Skills -->
                <div class="our-skills">
                	<div class="container">
                    	<div class="row">
                        
                        	<div class="col-sm-6">
                                <div class="skill-bar wow slideInLeft animated" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: slideInLeft;">
                                    <div class="progress-lebel">
                                        <h6>Photoshop &amp; Illustrator</h6>
                                    </div>
                                    <div class="progress">
                                      <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
                                      </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                                <div class="skill-bar wow slideInRight animated" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: slideInRight;">
                                    <div class="progress-lebel">
                                        <h6>WordPress</h6>
                                    </div>
                                    <div class="progress">
                                      <div class="progress-bar" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;">
                                      </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                                <div class="skill-bar wow slideInLeft animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: slideInLeft;">
                                    <div class="progress-lebel">
                                        <h6>Html &amp; Css</h6>
                                    </div>
                                    <div class="progress">
                                      <div class="progress-bar" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width: 95%;">
                                      </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                                <div class="skill-bar wow slideInRight animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: slideInRight;">
                                    <div class="progress-lebel">
                                        <h6>Javascript</h6>
                                    </div>
                                    <div class="progress">
                                      <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;">
                                      </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div> <!-- /.row -->
                    </div> <!-- /.container -->
                </div>
                <!-- End Our Skill -->
          </section>
          <!-- End about section -->

              
              
              
          <!-- Begin cta -->
          <section id="cta-section">
          	<div class="cta">
            	<div class="container">
                	<div class="row">
                    
                    	<div class="col-md-9">
                        	<h1>Download Our Pdf</h1>
                            <p>Inspired by nature, follow technology, appreciate the classics. You can build modern &amp; professional websites with Unika. The possibilities are just endless.</p>
                        </div>
                        
                        <div class="col-md-3">
                        	<div class="cta-btn wow bounceInRight animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInRight;">
                        <a class="btn btn-default btn-lg" role="button">Download</a>
                        	</div>
                        </div>
                        
                    </div> <!-- /.row -->
                </div> <!-- /.container -->
            </div>
          </section>
          <!-- End cta -->

              
              
              
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
                                        <h4>Cloud Hosting</h4>
                                        <p>Lorem ipsum dolor sit amet set, consectetur utes anet adipisicing elit, sed do eiusmod tempor incidist.</p>
                                    </div>
                                </a>
                            </div>
                            
                            <div class="col-md-3 col-sm-6">
                                <a  class="rotate-box-2 square-icon text-center wow zoomIn animated" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: zoomIn;">
                                    <span class="rotate-box-icon"><i class="fa fa-pencil"></i></span>
                                    <div class="rotate-box-info">
                                        <h4>Coding Pen</h4>
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
              
              
              
              
            <!-- Begin testimonials -->
            <section id="testimonial-section">
                <div id="testimonial-trigger" class="testimonial text-white parallax" data-stellar-background-ratio="0.5" style=" background-position: 0px -1682px; background: url('../../Content/Portada/testimonial-bg.jpg');">
                    <div class="cover"></div>
                    <!-- Begin page header-->
                    <div class="page-header-wrapper">
                        <div class="container">
                            <div class="page-header text-center wow fadeInDown animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDown;">
                                <h2>Reviews</h2>
                                <div class="devider"></div>
                                <p class="subtitle">What people say about us</p>
                            </div>
                        </div>
                    </div>
                    <!-- End page header-->
                    <div class="container">
                        <div class="testimonial-inner center-block text-center">
                            <div id="owl-testimonial" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
                                <div class="owl-wrapper-outer autoHeight" style="height: 85px;"><div class="owl-wrapper" style="width: 4800px; left: 0px; display: block;"><div class="owl-item" style="width: 800px;"><div class="item">
                                    <blockquote>
                                        <p>"This was my first experience with that team and outperformed my expectation! They know there stuff and I highly recommend them! A+++".</p>
                                        <footer><cite title="Source Title">Daryl Hodgeman</cite></footer>
                                    </blockquote>
                                </div></div><div class="owl-item" style="width: 800px;"><div class="item">
                                    <blockquote>
                                        <p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua."</p>
                                        <footer><cite title="Source Title">John Doe</cite></footer>
                                    </blockquote>
                                </div></div><div class="owl-item" style="width: 800px;"><div class="item">
                                    <blockquote>
                                        <p>"Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                                        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                                        proident, sunt in culpa qui officia deserunt mollit".</p>
                                        <footer><cite title="Source Title">John Doe</cite></footer>
                                    </blockquote>
                                </div></div></div></div>
                                
                                
                            <div class="owl-controls clickable"><div class="owl-pagination"><div class="owl-page active"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div></div></div></div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End testimonials -->
                

                
                
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
                                            <h2>Our Works</h2>
                                            <div class="devider"></div>
                                            <p class="subtitle">What we are proud of</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- End page header-->
                                <div class="portfoloi_content_area">
                                    <div class="portfolio_menu" id="filters">
                                        <ul>
                                            <li class="active_prot_menu"><a href="#porfolio_menu" data-filter="*">all</a></li>
                                            <li><a href="#porfolio_menu" data-filter=".websites">websites</a></li>
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
            
                
                
                
            <!-- Begin counter up -->
            <section id="counter-section">                					
				<div id="counter-up-trigger" class="counter-up text-white parallax" data-stellar-background-ratio="0.5" style="background-position: 0px -878.5px; background: url('../../Content/Portada/counter-bg.jpg');">
					<div class="cover"></div>
                    <!-- Begin page header-->
                    <div class="page-header-wrapper">
                        <div class="container">
                            <div class="page-header text-center wow fadeInDown animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDown;">
                                <h2>Some Fun Facts</h2>
                                <div class="devider"></div>
                                <p class="subtitle">Before anyone is not told</p>
                            </div>
                        </div>
                    </div>
                    <!-- End page header-->
					<div class="container">

						<div class="row">

							<div class="fact text-center col-md-3 col-sm-6">
								<div class="fact-inner">
									<i class="fa fa-users fa-3x"></i>
                                    <div class="extra-space-l"></div>
									<span class="counter">6666</span>
									<p class="lead">Clients Worked With</p>
								</div>
							</div>

							<div class="fact text-center col-md-3 col-sm-6">
								<div class="fact-inner">
									<i class="fa fa-leaf fa-3x"></i>
                                    <div class="extra-space-l"></div>
									<span class="counter">800</span>
									<p class="lead">Completed Projects</p>
								</div>
							</div>

							<div class="fact text-center col-md-3 col-sm-6">
								<div class="fact-inner">
									<i class="fa fa-trophy fa-3x"></i>
                                    <div class="extra-space-l"></div>
									<span class="counter">55</span>
									<p class="lead">Winning Awards</p>
								</div>
							</div>

							<div class="fact last text-center col-md-3 col-sm-6">
								<div class="fact-inner">
									<i class="fa fa-coffee fa-3x"></i>
                                    <div class="extra-space-l"></div>
									<span class="counter">1100</span>
									<p class="lead">Cups of coffee drinking</p>
								</div>
							</div>

						</div> <!-- /.row -->
					</div> <!-- /.container -->
				</div>
            </section>
			<!-- End counter up -->
                
                
                
                
            <!-- Begin team-->
            <section id="team-section" class="page">
                <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInDown animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDown;">
                            <h2>Our Team</h2>
                            <div class="devider"></div>
                            <p class="subtitle">Meat our experts</p>
                        </div>
                    </div>
                </div>
                <!-- End page header-->
                <div class="container">
                    <div class="row">
                        <div class="team-items">
                            <div class="col-md-2">
                                <div class="team-container wow bounceIn animated" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: bounceIn;">
                                    <div class="team-item">
                                        <div class="team-triangle">
                                            <div class="content">
                                                <img src="../../Content/Portada/1.jpg" alt="title">
                                                <div class="team-hover text-center">
                                                    <i class="fa fa-male"></i>
                                                    <p>John Doe</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="team-container wow bounceIn animated" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: bounceIn;">
                                    <div class="team-item">
                                        <div class="team-triangle">
                                            <div class="content">
                                                <img src="../../Content/Portada/2.jpg" alt="title">
                                                <div class="team-hover text-center">
                                                    <i class="fa fa-female"></i>
                                                    <p>Jane Doe</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="team-container wow bounceIn animated" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: bounceIn;">
                                    <div class="team-item">
                                        <div class="team-triangle">
                                            <div class="content">
                                                <img src="../../Content/Portada/5.jpg" alt="title">
                                                <div class="team-hover text-center">
                                                    <i class="fa fa-male"></i>
                                                    <p>John Doe</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="team-container wow bounceIn animated" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: bounceIn;">
                                    <div class="team-item">
                                        <div class="team-triangle">
                                            <div class="content">
                                                <img src="../../Content/Portada/6.jpg" alt="title">
                                                <div class="team-hover text-center">
                                                    <i class="fa fa-male"></i>
                                                    <p>John Doe</p>
                                                </div>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="team-container wow bounceIn animated" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; animation-name: bounceIn;">
                                    <div class="team-item">
                                        <div class="team-triangle">
                                            <div class="content">
                                                <img src="../../Content/Portada/7.jpg" alt="title">
                                                <div class="team-hover text-center">
                                                    <i class="fa fa-female"></i>
                                                    <p>Jane Doe</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>  
                    </div>
                </div>

            </section>
            <!-- End team-->
           
            <!-- Begin partners -->
            <section id="partners-section">
                <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInDown animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDown;">
                            <h2>Our Partners</h2>
                            <div class="devider"></div>
                            <p class="subtitle">Those who trust us</p>
                        </div>
                    </div>
                </div>
                <!-- End page header-->
                <div class="container">
                    <div id="owl-partners" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
                        <div class="owl-wrapper-outer"><div class="owl-wrapper" style="width: 3990px; left: 0px; display: block; transition: all 1000ms ease; transform: translate3d(0px, 0px, 0px);"><div class="owl-item" style="width: 285px;">
                          <img src="../../Content/Portada/1.png" alt="img"></div><div class="owl-item" style="width: 285px;">
                              <img src="../../Content/Portada/2.png" alt="img"></div><div class="owl-item" style="width: 285px;">
                                  <img src="../../Content/Portada/3.png" alt="img"></div><div class="owl-item" style="width: 285px;">
                                      <img src="../../Content/Portada/4.png" alt="img"></div><div class="owl-item" style="width: 285px;">
                                          <img src="../../Content/Portada/5.png" alt="img"></div><div class="owl-item" style="width: 285px;">
                                              <img src="../../Content/Portada/6.png" alt="img"></div><div class="owl-item" style="width: 285px;">
                                                  <img src="../../Content/Portada/7.png" alt="img"></div></div></div>
                        
                        
                        
                        
                        
                        
                    </div>
                </div>
            </section>
            <!-- End partners -->
                
                
                
                
            <!-- Begin prices section -->
			<section id="prices-section" class="page">

                <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInDown animated" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInDown;">
                            <h2>Prices</h2>
                            <div class="devider"></div>
                            <p class="subtitle">That how much</p>
                        </div>
                    </div>
                </div>
                <!-- End page header-->

				<div class="extra-space-l"></div>

				<!-- Begin prices -->
				<div class="prices">
					<div class="container">
						<div class="row">
							
							<div class="price-box col-sm-6 col-md-3 wow flipInY animated" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: flipInY;">
								<div class="panel panel-default">
									<div class="panel-heading text-center">
										<i class="fa fa-plug fa-2x"></i>
										<h3>Basic</h3>
									</div>
									<div class="panel-body text-center">
										<p class="lead"><strong>$49</strong></p>
									</div>
									<ul class="list-group text-center">
										<li class="list-group-item">Personal Use</li>
										<li class="list-group-item">3 projects</li>
										<li class="list-group-item">1 GB Disk</li>
										<li class="list-group-item">Custom Domain</li>
										<li class="list-group-item">24/7 Support</li>
									</ul>
									<div class="panel-footer text-center">
										<a class="btn btn-default">Order Now!</a>
									</div>
								</div>										
							</div>

							<div class="price-box col-sm-6 col-md-3 wow flipInY animated" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: flipInY;">
								<div class="panel panel-default">
									<div class="panel-heading text-center">
										<i class="fa fa-cog fa-2x"></i>
										<h3>Advanced</h3>
									</div>
									<div class="panel-body text-center">
										<p class="lead"><strong>$99</strong></p>
									</div>
									<ul class="list-group text-center">
										<li class="list-group-item">Personal Use</li>
										<li class="list-group-item">5 projects</li>
										<li class="list-group-item">5 GB Disk</li>
										<li class="list-group-item">Custom Domain</li>
										<li class="list-group-item">24/7 Support</li>
									</ul>
									<div class="panel-footer text-center">
										<a class="btn btn-default">Order Now!</a>
									</div>
								</div>										
							</div>
							
							<div class="price-box col-sm-6 price-box-featured col-md-3 wow flipInY animated" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: flipInY;">
								<div class="panel panel-default">
									<div class="panel-heading text-center">
										<i class="fa fa-star fa-2x"></i>
										<h3>Professional</h3>
									</div>
									<div class="panel-body text-center">
										<p class="lead"><strong>$149</strong></p>
									</div>
									<ul class="list-group text-center">
										<li class="list-group-item">Personal Use</li>
										<li class="list-group-item">20 Projects</li>
										<li class="list-group-item">20 GB Disk</li>
										<li class="list-group-item">Custom Domain</li>
										<li class="list-group-item">24/7 Support</li>
									</ul>
									<div class="panel-footer text-center">
										<a class="btn btn-default">Order Now!</a>
									</div>
									<div class="price-box-ribbon"><strong>Popular</strong></div>
								</div>										
							</div>
							
							<div class="price-box col-sm-6 col-md-3 wow flipInY animated" data-wow-delay="0.9s" style="visibility: visible; animation-delay: 0.9s; animation-name: flipInY;">
								<div class="panel panel-default">
									<div class="panel-heading text-center">
										<i class="fa fa-plus fa-2x"></i>
										<h3>Ultimate</h3>
									</div>
									<div class="panel-body text-center">
										<p class="lead"><strong>$199</strong></p>
									</div>
									<ul class="list-group text-center">
										<li class="list-group-item">Multi Use</li>
										<li class="list-group-item">Unlimited Projects</li>
										<li class="list-group-item">99 GB Disk</li>
										<li class="list-group-item">Custom Domain</li>
										<li class="list-group-item">24/7 Support</li>
									</ul>
									<div class="panel-footer text-center">
										<a class="btn btn-default" href="#">Order Now!</a>
									</div>
								</div>										
							</div>
							
						</div> <!-- /.row -->
					</div> <!-- /.container -->
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
                		<li> <a href="#" class="rotate-box-1 square-icon text-center wow zoomIn animated" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: zoomIn;"><span class="rotate-box-icon"><i class="fa fa-pinterest-p"></i></span></a></li>
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
        <script src="../../Content/Portada/jquery-1.11.1.min.js"></script>
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