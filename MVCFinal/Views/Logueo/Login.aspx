<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.LoginModel>" %>

<!DOCTYPE html>
<html class="js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths js-menubar" lang="es">
 <head runat="server">
    <meta name="viewport" content="width=device-width" />

  <title> Login | Ubicate ! </title>

  <!-- Stylesheets -->
    <link rel="stylesheet" href="../../Content/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="../../Content/css/bootstrap-extend.min.css"> 
    <link rel="stylesheet" href="../../Content/css/site.min.css">       
    <link rel="stylesheet" href="../../Content/css/font-awesome.min.css">        

  <!-- Plugins -->
  <link rel="stylesheet" href="../../Content/css/animsition.min.css">
  <link rel="stylesheet" href="../../Content/css/asScrollable.min.css">
  <link rel="stylesheet" href="../../Content/css/switchery.min.css">
  <link rel="stylesheet" href="../../Content/css/introjs.min.css">
  <link rel="stylesheet" href="../../Content/css/slidePanel.min.css">
  <link rel="stylesheet" href="../../Content/css/flag-icon.min.css">
  <link rel="stylesheet" href="../../Content/css/waves.min.css">

  <!-- Page -->
  <link rel="stylesheet" href="../../Content/css/login.css">

  <!-- Fonts -->
  <link rel="stylesheet" href="../../Content/css/material-design.min.css">
  <link rel="stylesheet" href="../../Content/css/brand-icons.min.css">
  <link rel="stylesheet" href="../../Content/css/css.css">


  <!--[if lt IE 9]>
    <script src="../../global/vendor/html5shiv/html5shiv.min.js"></script>
    <![endif]-->

  <!--[if lt IE 10]>
    <script src="../../global/vendor/media-match/media.match.min.js"></script>
    <script src="../../global/vendor/respond/respond.min.js"></script>
    <![endif]-->

  <!-- Scripts -->
  <script src="../../Content/js/modernizr.min.js"></script>
  <script src="../../Content/js/breakpoints.min.js"></script>
  <script>
      Breakpoints();
  </script>


  <!--[if lt IE 9]>
    <script src="../../global/vendor/html5shiv/html5shiv.min.js"></script>
    <![endif]-->

  <!--[if lt IE 10]>
    <script src="../../global/vendor/media-match/media.match.min.js"></script>
    <script src="../../global/vendor/respond/respond.min.js"></script>
    <![endif]-->

  <!-- Scripts -->
  <script src="../../Content/js/modernizr.min.js"></script>
  <script src="../../Content/js/breakpoints.min.js"></script>
  <script>
      Breakpoints();
  </script>
</head>
    <body class="page-login-v2 layout-full page-dark">

  <!-- Page -->
  <div class="page animsition" data-animsition-in="fade-in" data-animsition-out="fade-out" style="animation-duration: 800ms; opacity: 1;">
    <div class="page-content">
      <div class="page-brand-info">
        <div class="brand">
            <div class="brand visible-xs">
          <img class="brand-img" src="../../Content/js/logo@2x.png" alt="...">
          <h2 class="brand-text font-size-40">UBICATE!</h2>
        </div>
            </div>
        <p class="font-size-20">Abrite al mundo de Ubicate! y descubri la mejor manera de encontrar los eventos mas importantes y asistir a ellos.</p>
      </div>

      <div class="page-login-main">
        <div class="brand visible-xs">
          <img class=" brand-img " src="../../Content/Portada/logo-blue@2x.png" alt="...">
          <h3 class="brand-text font-size-40">UBICATE!</h3>
        </div>
        <h3 class="font-size-24">Sign In</h3>
        <p>Ubicate! le da la bienvenida registrate gratis ahora.</p>

        <form autocomplete="off" runat="server">

            

             <% using (Html.BeginForm())
                       { %> 

          <div class="form-material form-group">
            <input type="text" required="required" class="form-control" id="inputUser" autocomplete="off" placeholder="User" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar un nombre de usuario')" name="Usuario" >        
          </div>
          <div class="form-group form-material">
          <input  type="password" required="required"  pattern=".{7,}"
        title="La contraseña debe contener mas de 7 caracteres" autocomplete="off" placeholder="Password" id="inputPassword" class="form-control"  name="Password">
          </div>
          <div class="form-group clearfix">
            <div class="checkbox-custom checkbox-inline checkbox-primary pull-left">
              <input type="checkbox" id="remember" name="checkbox">
              <label for="inputCheckbox">Remember me</label>
            </div>
            <a class="pull-right" href="#">Forgot password?</a>
          </div>


            <% 
                if( Session["ErrorUsu"] != null )
               { %>
            
            <% } else { %>
            <label>El usuario y password no existen</label>
            <% } %>
          <input type="submit" class="btn btn-primary btn-block waves-effect waves-light" value="SIGN IN" name="action"/>

            <% } %>
        </form>


        

        <p>No account? <a href="../Registro/">Sign Up</a></p>

        <footer class="page-copyright">
          <p> UBICATE !</p>
          <p> 2017. All RIGHT RESERVED.</p>
          <div class="social">
            <a class="btn btn-icon btn-round social-twitter" href="javascript:void(0)">
              <i class="icon bd-twitter" aria-hidden="true"></i>
            </a>
            <a class="btn btn-icon btn-round social-facebook" href="javascript:void(0)">
              <i class="icon bd-facebook" aria-hidden="true"></i>
            </a>
            <a class="btn btn-icon btn-round social-google-plus" href="javascript:void(0)">
              <i class="icon bd-google-plus" aria-hidden="true"></i>
            </a>
          </div>
        </footer>
      </div>

    </div>
  </div>
  <!-- End Page -->


      <!-- Core  -->
  <script src="../../Content/js/jquery.min.js"></script>
  <script src="../../Content/js/bootstrap.min.js"></script>
  <script src="../../Content/js/animsition.min.js"></script>
  <script src="../../Content/js/jquery-asScroll.min.js"></script>
  <script src="../../Content/js/jquery.mousewheel.min.js"></script>
  <script src="../../Content/js/jquery.asScrollable.all.min.js"></script>
  <script src=".../../Content/js/jquery-asHoverScroll.min.js"></script>
  <script src="../../Content/js/waves.min.js"></script>

  <!-- Plugins -->
  <script src="../../Content/js/switchery.min.js"></script>
  <script src="../../Content/js/intro.min.js"></script>
  <script src="../../Content/js/screenfull.min.js"></script>
  <script src="../../Content/js/jquery-slidePanel.min.js"></script>

  <!-- Scripts -->
  <script src="../../Content/js/core.min.js"></script>
  <script src="../../Content/js/site.min.js"></script>

  <script src="../../Content/js/menu.min.js"></script>
  <script src="../../Content/js/menubar.min.js"></script>
  <script src="../../Content/js/sidebar.min.js"></script>

  <script src="../../Content/js/config-colors.min.js"></script>
  <script src="../../Content/js/config-tour.min.js"></script>
   <script src="../../Content/js/material.min.js"></script>
        <script src="../../Content/js/animate-list.min.js"></script>

  <script src="../../Content/js/asscrollable.min.js"></script>
  <script src="../../Content/js/animsition.min(2).js"></script>
  <script src="../../Content/js/slidepanel.min.js"></script>
  <script src="../../Content/js/tabs.min.js"></script>

</body>
</html>
