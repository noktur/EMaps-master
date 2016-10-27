<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.RegistroAdmin>" %>

<!DOCTYPE html>

<html >
  <head>
    <meta charset="UTF-8">
    <title> Register Page | E-Maps </title>
  </head>

  <body>

    <form runat="server" class="">
   <% using (Html.BeginForm())
                       { %>   
  <fieldset>
    
  	<legend class="legend">Marmota</legend>

       <div class="input">
    	<input type="text" placeholder="Nombre" name="Nombre" required />
      <span><i class="fa fa-info"></i></span>
    </div>

       <div class="input">
    	<input type="text" placeholder="Descripcion" name="Descripcion" required />
      <span><i class="fa fa-info"></i></span>
    </div>

     <div class="input">
    	<input type="text" placeholder="Fecha" name="Fecha" required />
      
    </div>
 
    <div class="input">
    	<input type="password" placeholder="Password" name="Password" required />
    </div>
    
    <input type="submit" class="submit" name="action" formmethod="post" style="color:blue; font-size:5px" value="Crear" >
    
  </fieldset>
 
  
        <% } %>
</form>

  </body>
</html>