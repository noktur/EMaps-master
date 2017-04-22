<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Registro</title>

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
  <link rel="stylesheet" href="../../Content/css/register.css">

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

</head>
<body class="page-register-v2 layout-full page-dark">



  <!-- Page -->
  <div class="page animsition" data-animsition-in="fade-in" data-animsition-out="fade-out" style="animation-duration: 800ms; opacity: 1;">
    <div class="page-content">
      <div class="page-brand-info">
        <div class="brand">
          <img class="brand-img" src="../../Content/js/logo@2x.png" alt="...">
          <h2 class="brand-text font-size-40">Ubicate!</h2>
        </div>
        <p class="font-size-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua.</p>
      </div>

      <div class="page-register-main">
        <div class="brand visible-xs">
          <img class="brand-img" src="../../Content/js/logo-blue@2x.png" alt="...">
          <h3 class="brand-text font-size-40">Ubicate!</h3>
        </div>
        <h3 class="font-size-24">Sign Up</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>

        <form  runat="server">
            <% using (Html.BeginForm())
                       { %>
            <div class="form-material form-group">
              <label class=" floating-label-static" for="Nombre">Name</label>
             <input type="text" required="required" name="Nombre" id="Nombre" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar el nombre')" class="form-control empty" />
            </div>
            <div class="form-material form-group">
             <label class="floating-label-static" for="Email">Email</label>
            <input type="text" name="Email" required="required" id="Email" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar el correo electronico')" class="form-control empty" />
           </div>
         
          <div class="form-material form-group">
                 <label class="floating-label-static" for="Usuario">User</label>
                <input type="text" name="Usuario" id="Usuario" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar el usuario')" class="form-control empty" />
            </div>
        
            <div class="form-material form-group">
              <label class="floating-label-static" for="Password">Password</label>
              <input required="required" type="password" pattern=".{7,}"
        title="La contraseña debe contener mas de 7 caracteres " id="Password" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar una contraseña')" class="form-control empty" name="Password">
            </div>

         <div class="form-material form-group">
            <label class="floating-label-static" for="Ci">Writ Identity</label>
            <input type="text" required="required" name="Ci" oninput="setCustomValidity('')" id="Ci" oninvalid="setCustomValidity('Se requiere ingresar la cedula')"  class="form-control" />
            </div>    
                  
          <input type="submit" class="btn btn-primary btn-block waves-effect waves-light" value="Register Now!" name="action" />
            <% } %>
        </form>
          
        <p>Have account already? Please go to <a href="../../Content/Portada/login.jpg">Sign In</a></p>

        <footer class="page-copyright">
          <p>WEBSITE BY UBICATE!</p>
          <p> 2017. All RIGHT RESERVED.</p>
          <div class="social">
            <a class="btn btn-icon btn-round social-twitter  blue-100" href="javascript:void(0)">
              <i class="icon fa fa-twitter" aria-hidden="true"></i>
            </a>
            <a class="btn btn-icon btn-round social-facebook blue-400" href="javascript:void(0)">
              <i class="icon fa fa-facebook" aria-hidden="true"></i>
            </a>
            <a class="btn btn-icon btn-round social-google-plus  red-300" href="javascript:void(0)">
              <i class="icon fa fa-google-plus" aria-hidden="true"></i>
            </a>
          </div>
        </footer>
      </div>

    </div>
  </div>


    
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
  <script src="../../Content/js/ntro.min.js"></script>
  <script src="../../Content/js/screenfull.min.js"></script>
  <script src="../../Content/js/query-slidePanel.min.js"></script>

  <!-- Scripts -->
  <script src="../../Content/js/core.min.js"></script>
  <script src="../../Content/js/site.min.js"></script>

  <script src="../../Content/js/menu.min.js"></script>
  <script src="../../Content/js/menubar.min.js"></script>
  <script src="../../Content/js/sidebar.min.js"></script>

  <script src="../../Content/js/config-colors.min.js"></script>
  <script src="../../Content/js/config-tour.min.js"></script>

  <script src="../../Content/js/asscrollable.min.js"></script>
  <script src="../../Content/js/animsition.min.js(1)"></script>
  <script src="../../Content/js/slidepanel.min.js"></script>
  <script src="../../Content/js/switchery.min.js(1)"></script>
  <script src="../../Content/js/tabs.min.js"></script>


    </body>



</html>
