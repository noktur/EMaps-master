<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterAdmin.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.EventoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formulario" runat="server">
        <% if (Model != null) { %>
   <section class="content-block contact-1 bg-deepocean margin-bottom0 pad-bottom0" data-pg-collapsed>
            <div class="container text-center">
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="underlined-title offwhite text-uppercase">
                        <h1 class="white">Aqui podra gestionar los eventos del sistema</h1>
                        <hr>
                        <h2>tabla &nbsp;detallada de eventos</h2>
                    </div>
                    <div class="col-md-offset-1 col-md-pull-1 col-md-12 white"> 

                        <div class="table-responsive">
                            <table class="table white"> 
                                <thead> 
                                    <tr> 
                                        <th>#</th> 
                                        <th>Nombre Evento</th> 
                                        <th>Categoria</th> 
                                        <th>FechaInicio</th> 
                                        <th>FechaFin</th>
                                        <th> Descripcion</th>
                                        <th>Organizador</th>
                                        <th>Action</th>
                                    </tr>                                     
                                </thead> 
                                <% using (Html.BeginForm()) { %>                                
                                <tbody> 
                                      <% 
                             
                            foreach(var item in Model.milista)
                            { %> 
                                    <tr class="pad0 pad-bottom0 margin-top0 margin-bottom0"> 
                                        <td><%= item.NombreEvento %></td> 
                                        <td><%= item.CategoriaEvento %></td> 
                                        <td><%= item.FechaInicio %></td> 
                                        <td><%= item.FechaFin %></td> 
                                        <td><%= item.Descripcion %></td> 
                                        <td><%= item.OrganizadorEvento %></td> 
                                        <td>
                                            <button type="submit" class="btn btn-default btn-sm" value="ENVIAR" name="ENVIAR">SELECCIONAR</button>
                                        </td>
                                    </tr>
                                    <% } %>                                     
                                                                     
                                </tbody>
                                <% } %>
                            </table>
                        </div>
                    </div>
                    <!-- /.form-container -->
                </div>
                <!-- /.col-sm-10 -->
            </div>
            <!-- /.container -->
        </section>
        <% } %>
    <% if(Session["EventoSeleccionado"]== null) { %>
        <section style="display:none" class="content-block-nopad content-3-10 bg-tamarind">
            </section>
            <% } else {  %>        
           <section id="content-3-10" class="content-block-nopad content-3-10 bg-tamarind">
            <div class="image-container col-xs-12 pull-left col-sm-6">
                <div class="background-image-holder">
                </div>
                </div>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 content col-sm-offset-6 col-sm-8">
                        <h3 class="offwhite text-uppercase" style=" font-family:Grand Hote;">Aqui se detallara la informacion sobre el evento</h3>
                        <p class="white">A continuacion se desplegar el evento seleccionado para que usted pueda administrarlo en caso de cancelacion, expiracion o modificacion expresa del usuario.</p>
                        <div class="col-md-offset-0 text-center col-md-6">
                            <div class="form-group"> 
                                <p class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red"><%= Model.NombreEvento %></p>
                                <p class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red"><%= Model.Descripcion %></p>
                                <p class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red"><%= Model.FechaInicio %></p>
                                <p class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red"><%= Model.FechaFin %></p>
                                <p class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red"><%= Model.ClasificacionEvento %></p>
                                <p class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red"><%= Model.OrganizadorEvento.Nombre %></p>
                                <button type="button" class="btn btn-danger"> Eliminar</button>
                                <button type="button" class="btn btn-warning" style="margin-left:5px;">Modificar</button>
                            </div>                             
                        </div>
                    </div>
                </div>
                <!-- /.row-->
            </div>
            <!-- /.container -->
        </section>
    <% } %>
    </form>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
