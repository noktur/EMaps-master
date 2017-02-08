<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.EventoModel>" %>

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
                                        <td></td>
                                        <td class="hidden"><%= item.IdEvento %></td>
                                        <td><%= item.NombreEvento %></td> 
                                        <td><%= item.CategoriaEvento %></td> 
                                        <td><%= item.FechaInicio %></td> 
                                        <td><%= item.FechaFin %></td> 
                                        <td><%= item.Descripcion %></td> 
                                        <td><%= item.UnOrganizador.NombreUsuario %></td> 
                                        <td>
                                            <%= Html.ActionLink("Seleccionar", "SeleccionarEvento", "Admin", new { IdEvento = item.IdEvento}, new { @class="btn btn-default btn-sm" })%>
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
                        <p class="white">A continuacion se desplegara el evento seleccionado.</p>
                        <div class="col-md-offset-0 text-center col-md-6">
                            <div class="form-group"> 
                                <% using(Html.BeginForm()) { %>
                                <p>Descripcion Evento: </p>
                                <input type="text" class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red" placeholder="<%=Model.Descripcion %>"/>
                                <p>Nombre Evento: </p>                           
                                <input type="text" class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red" placeholder="<%=Model.NombreEvento %>">
                                <p>Fecha Inicio: </p>
                                <input type="text" class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red" placeholder="<%= Model.FechaInicio %>"/>
                                <p>Fecha Fin: </p>
                                <input type="text" class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red" placeholder="<%= Model.FechaFin %>"/>
                                <p>Categoria: </p>
                                <input type="text" class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red" placeholder="<%= Model.ClasificacionEvento %>">
                                <p>Organizador: </p>
                                <input type="text" class="form-control-static offwhite text-uppercase" style="border-bottom:5px groove red" placeholder="<%= Model.OrganizadorEvento.Nombre %>"/>
                           <% } %>
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
