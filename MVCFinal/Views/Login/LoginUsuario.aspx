<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.LoginModel>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
     <meta charset="utf-8">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Login Page |   E-Maps </title>

    <!-- Bootstrap CSS -->    
    <link href="../../Content/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="../../Content/css/bootstrap.css" rel="stylesheet">
    <!-- font icon -->
     <link href="../../Content/css/elegant-icons-style.css" rel="stylesheet"> 
   <link href="../../Content/css/font-awesome.css" rel="stylesheet">
    <!-- Custom styles -->
   <link href="../../Content/css/Login.css" rel="stylesheet"> 

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>


  <body class="login-img3-body">

    <div class="container">
        
      <form runat="server"  class="login-form">     
           <% using (Html.BeginForm())
                       { %>   
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <input type="text" class="form-control" placeholder="Username" name="Usuario"  autofocus>
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" class="form-control" placeholder="Password" name="Password">
            </div>

            <input class="btn btn-primary btn-lg btn-block" type="submit" name="action"  value="Login" formmethod="post" >
            <input class="btn btn-info btn-lg btn-block" type="submit" name="action" value="Signup" formmethod="post">
        </div>
            <% } %>
      </form>
      
    </div>


  </body>
</html>
