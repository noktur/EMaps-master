<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterOrganizador.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.EventoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formulario" runat="server">
        <section class="content-block content-1-8 pad-bottom15 pad45">
                <div class="container">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10">
                            <div class="underlined-title pad-bottom10">
                                <h1 class="text-left orange" style="font-size:3.5em;font-family:grand hote;">Publicacion evento</h1>
                                <hr class="text-left">
                                <h2 class="text-left">realize la publicacion sobre un evento al instante</h2>
                            </div>
                            <p class="orange margin-top0 margin-bottom45 pad0" style="font-size:0.9em;font-family:constantia;">Aqui usted podra agregar los datos pertinentes a la publicacion de un evento</p>
                            <div id="contact1" class="form-container">
                                <% using (Html.BeginForm()) { %>
                                <div id="message1"></div>
                                    <div class="row">
                                        <%  if (Session["ListaAlquiler"] == null)  
                                            { %>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                        
                                                <select class="form-control"> 
                                                    <option>No existen Alqulieres</option>                                                                                                         
                                                </select>
                                            </div>
                                        </div>
                                        <% }
                                           else { %>
                                          <div class="col-sm-4">
                                            <div class="form-group">
                                                <% foreach(var item in Model.listalugaresAlquilados) {  %>
                                                <select class="form-control"> 
                                                    <option value="<%=item.IdAlquiler %>"><%= item.LugarAlquiler %></option>                                                                                                         
                                                </select>
                                                <% } %>
                                            </div>
                                        </div>
                                        <%  } %>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input name="FechaInicio" id="FechaInicio" type="datetime-local" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                               <input name="FechaFin" id="FechaFin" type="datetime-local"  class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.row -->
                                    <div class="form-group text-center">
                                        <input class="btn btn-warning" type="submit" id="cf-submit2" value="Comprobar disponibilidad" name="ComprobarDisponibilidad" />
                                    </div>
                                    <div class="text-center col-md-4" style="padding-left:0px;">
                                        <%  if(Session["ListaCategorias"]== null) { %>
                                        <div class="form-group"> 
                                            <label class="control-label pull-left orange" for="formInput132" style=" font-family:Constantia; font-size:0.9em;">Elige un&nbsp; categoria</label>                                             
                                            <select class="form-control"> 
                                                <option>No existen Categorias </option>                                                                                                
                                            </select>
                                        </div>     
                                        <% } else { %>   
                                        <div class="form-group"> 
                                            <label class="control-label pull-left orange" for="formInput132" style=" font-family:Constantia; font-size:0.9em;">Elige un&nbsp; categoria</label>                                             
                                            <% foreach(var item in Model.listaCategorias) { %>
                                             <select class="form-control"> 
                                                <option value="<%= item.NombreCategoria %>"><%= item.NombreCategoria %></option>                                                                                                
                                            </select>
                                            <% } %>
                                        </div> 
                                        <% } %>                                 
                                    </div>
                                    <div class="form-group">
                                        <textarea name="Descripcion" id="Descripcion" rows="3" class="form-control" placeholder="Descripcion"></textarea>
                                    </div>
                                    <div class="form-group text-center">
                                        <input  class="btn btn-info" type="submit" id="cf-submit1" name="Publicar Evento" value="Publicar Evento" />
                                    </div>
                                <% } %>
                            </div>
                            <!-- /.form-container -->
                        </div>
                    </div>
                </div>
            </section>
        </form> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
