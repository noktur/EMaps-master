<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterAdmin.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.AdminModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">

<section class="content-block contact-1 pad0 pad-bottom0 margin-top0 margin-bottom0 bg-deepocean offwhite">
            <div class="container text-center">
                <div class="col-sm-8 col-md-9 col-md-offset-1 pad-bottom25">
                    <div class="tab-pane fade in active pad-bottom0 pad0">
                        <h3 class="text-left">Edit Profile Settings</h3>
                    </div>
                    <p class="offwhite text-left margin-top20 pad-bottom20">En este modulo usted podra modificar los datos de su perfil en caso que lo solicite.</p>
                    <form id="formulario" runat="server"> 
                        <%  if(Session["Admin"] != null) { %>
                        <% using (Html.BeginForm()) 
                           { %>
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">Cedula Identidad</label>
                            <div class="col-md-7">
                                <input type="text" name="Ci" id="Ci" placeholder="<%= Model.Ci %>" value="<%= Model.Ci  %>"  class="form-control" disabled="disabled">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">Nombre Completo</label>
                            <div class="col-md-7">
                                <input type="text" name="Nombre" id="Nombre" placeholder="<%= Model.Nombre %>" value="<%= Model.Nombre %>" class="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">Contraseña</label>
                            <div class="col-md-7">
                                <input type="text" name="Password" id="Password" placeholder="<%= Model.Password %>" value="<%= Model.Password %>" class="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">Email Address</label>
                            <div class="col-md-7">
                                <input type="text" name="Email" id="Email" placeholder="<%= Model.Email %>" value="<%= Model.Email %>" class="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">User Login</label>
                            <div class="col-md-7">
                                <input type="text" name="Usuario" id="Usuario" placeholder="<%= Model.Usuario %>" value="<%= Model.Usuario %>"  class ="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <div class="col-md-7 col-md-push-3">
                                <input type="submit" class="btn btn-primary" value="Save Changes"/>
                                &nbsp;
                                <input type="submit" class="btn btn-default" value="Cancel"/>
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <% } %>
                        <% } %>
                    </form>                  
                </div>
                </div>
                <!-- /.container -->
        </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
