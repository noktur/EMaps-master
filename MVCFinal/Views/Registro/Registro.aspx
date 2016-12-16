<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.RegistroCliente>" %>

<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title> Register Page | E-Maps </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="keywords" content="pinegrow, blocks, bootstrap" />
        <meta name="description" content="My new website" />
        <link rel="shortcut icon" href="ico/favicon.png"> 
        <!-- Core CSS -->         
        <link href="../../Content/css/bootstrap.min.css" rel="stylesheet"> 
        <link href="../../Content/css/font-awesome.css" rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,600,700" rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet">
        <!-- Style Library -->         
        <link href="../../Content/css/style-library-1.css" rel="stylesheet">
        <link href="../../Content/css/plugins.css" rel="stylesheet">
        <link href="../../Content/css/blocks.css" rel="stylesheet">
        <link href="../../Content/css/custom.css" rel="stylesheet">
    <script type="text/javascript" src="../../Content/js/vendor/jquery-1.11.1.min.js"></script>         
        <script type="text/javascript" src="../../Content/js/vendor/bootstrap.min.js"></script>         
        <script type="text/javascript" src="../../Content/js/plugins.js"></script>
        <script type="text/javascript" src="../../Content/js/bskit-scripts.js"></script>      
  </head>

  <body>
      <section id="promo-1" class="content-block promo-1 min-height-600px bg-offwhite">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <h2>Everything is awesome!</h2>
                <p>Suspendisse ac pretium sapien, placerat lacinia enim. Fusce eu elit quis lacus cursus mollis. In feugiat diam id sem consectetur, id accumsan risus venenatis.</p>
                <form id="form1" runat="server">
                    <% using(Html.BeginForm()) { %>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" name="Nombre" placeholder="Name" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" name="Usuario" placeholder="User" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="password" name="Password" placeholder="Password" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" name="Ci" placeholder="Writ identity" class="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="email" name="Email" placeholder="Email address" class="form-control" />
                    </div>
                      <div class="col-md-4">
                            <div class="form-group">
                                <input type="radio" name="radio" />Cliente
                                <i class="fa fa-info-circle"></i>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <input type="radio" name="radio1"  />Dueño
                                <i class="fa fa-info-circle"></i>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <input type="radio" name="radio2" />Organizador
                                <i class="fa fa-info-circle"></i>
                            </div>
                            </div>
                    <div class="col-md-12 text-center">
                    <input type="submit" name="action" value="Register Now!" class="btn btn-primary btn-block"/>
                        </div>
                    <% } %>
                </form>
            </div>
            <!-- /.col -->
            <div class="col-md-6 col-md-offset-1">
                <div class="video-wrapper">
                    <iframe width="560" height="315" src="" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
</section>  
    
  </body>
</html>
