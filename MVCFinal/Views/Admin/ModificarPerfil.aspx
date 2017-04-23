<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.AdminModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="../../Content/css/blocks.css">
    <link rel="stylesheet" href="../../Content/css/custom.css">
    <link rel="stylesheet" href="../../Content/css/component.css">
    <link rel="stylesheet" href="../../Content/css/style-library-1.css">

     <script type="text/javascript">

         jQuery(document).ready(function () {

             LLenarCampos();

         });


         function LLenarCampos() {
             var Admin;
             Admin = '<%=(Session["AdminJson"] == null ? null : (string)Session["AdminJson"])%>';
             var AdminJson = null;

             if (Admin != null) {
                 AdminJson = jQuery.parseJSON(Admin);

                 jQuery('#Ci').val(AdminJson.Ci);
                 jQuery('#Email').val(AdminJson.Email);
                 jQuery('#Nombre').val(AdminJson.Nombre);
                 jQuery('#Password').val(AdminJson.Password);
                 jQuery('#Usuario').val(AdminJson.Usuario);

             }
             else {
                 alert("No se encontro el admin")
             }

         }

</script>
</asp:Content>
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">

<section class="content-block contact-1 pad0 pad-bottom0 margin-top0 margin-bottom0  offwhite">
            <div class="container text-center">
                <div class="col-sm-8 col-md-9 col-md-offset-1 pad-bottom25">
                    <div class="tab-pane fade in active pad-bottom0 pad0">
                        <h3 class="text-left">Edit Profile Settings</h3>
                    </div>
                    <p class="offwhite text-left margin-top20 pad-bottom20">En este modulo usted podra modificar los datos de su perfil en caso que lo solicite.</p>
                    <form id="formulario" class=" form-horizontal" runat="server"> 
                        <% if(Session["Admin"] != null) { %>
                        <% using (Html.BeginForm()) 
                           { %>
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">Cedula Identidad</label>
                            <div class="col-md-7">
                                <input type="text" name="Ci" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar cedula)" id="Ci" placeholder="<%= Model.Ci %>"  class="form-control" readonly="readonly">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">Nombre Completo</label>
                            <div class="col-md-7">
                                <input type="text" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar su nombre')" name="Nombre" id="Nombre" placeholder="<%= Model.Nombre %>" class="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">Contraseña</label>
                            <div class="col-md-7">
                                <input type="password" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar su contraseña)" name="Password" id="Password" placeholder="<%= Model.Password %>"   class="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">Email Address</label>
                            <div class="col-md-7">
                                <input type="email" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar su email)" name="Email" id="Email" placeholder="<%= Model.Email %>" class="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">User Login</label>
                            <div class="col-md-7">
                                <input type="text" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar su nombre de usuario)" name="Usuario" id="Usuario" placeholder="<%= Model.Usuario %>"  class ="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <div class="col-md-7 col-md-push-3">
                                <input type="submit" class="btn btn-primary" name="action" value="Save Changes"/>
                                &nbsp;
                                <input type="submit" class="btn btn-default" value="Cancel"/>
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <% } %>
                        <% } else {  %>
                        <div id="message">
                            <h1>No se encontro la informacion del admin </h1>
                        </div>
                        <% } %>
                    </form>                  
                </div>
                </div>
                <!-- /.container -->
        </section>
</asp:Content>


   



