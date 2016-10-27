<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.RegistroOrganizador>" %>

<!DOCTYPE html>

<html >
  <head>
    <meta charset="UTF-8">
    <title> Register Page | E-Maps </title>
    <script src="../../Scripts/modernizr-2.6.2.js" type="text/javascript"></script>

    <link rel='stylesheet prefetch' href="../../Content/css/font-awesome.css">

        <link rel="stylesheet" href="../../Content/css/Register.css">
      <link rel="stylesheet" href="../../Content/css/resetRegister.css">
  </head>

  <body>

    <form runat="server" class="login">
   <% using (Html.BeginForm())
                       { %>   
  <fieldset>
    
  	<legend class="legend">Register</legend>

       <div class="input">
    	<input type="text" placeholder="Ci" name="Ci" required />
      <span><i class="fa fa-check"></i></span>
    </div>

       <div class="input">
    	<input type="text" placeholder="User" name="Usuario" required />
      <span><i class="fa fa-user"></i></span>
    </div>

     <div class="input">
    	<input type="text" placeholder="Nombre" name="Nombre" required />
      <span><i class="fa fa-info"></i></span>
    </div>
    
    <div class="input">
    	<input type="email" placeholder="Email" name="Email" required />
      <span><i class="fa fa-envelope-o"></i></span>
    </div>
    
    <div class="input">
    	<input type="password" placeholder="Password" name="Password" required />
      <span><i class="fa fa-lock"></i></span>
    </div>
    
    <button type="submit" class="submit" style="background-image:none; color:blue; font-size:5px; " name="action" formmethod="post" value="Register" >
    <i class="fa fa-long-arrow-right"></i>
        </button>
  </fieldset>
 
  
        <% } %>
</form>
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>

        <script src="../../Scripts/Register.js"></script>

    
    
    
  </body>
</html>

