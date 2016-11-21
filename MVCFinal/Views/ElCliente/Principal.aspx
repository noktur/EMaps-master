<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterCliente.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.PrincipalClienteModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <form id="form1" runat="server">
    <section id="promo-3" class="content-block promo-3 bg-deepocean pad-bottom0 pad45 min-height-300px" data-pg-collapsed>
            <div class="container text-center white">
                <p class="white" style="font-size:4.2em;">UBICATREX</p>
                <h2 style="font-size:1.5em;font-family: calibri;">El software que le ayudara a encontrar cualquier evento</h2>
                <h3 class="offwhite" style="font-size:1.6em;font-family: Montserrat;">Debajo podra buscar un evento por distintos filtros que usted desee</h3>
            </div>
            <!-- /.container -->
        </section>
        <section class="content-block content-2-3 bg-pomegranate pad10 pad-bottom30" style="border-bottom-right-radius:100px;border-bottom-left-radius:100px" data-pg-collapsed>
            <div class="container pad0 pad-bottom0 margin-top0 margin-bottom0">
                <div class="white col-md-offset-0 col-md-12">
                    <h3 style="font-size:1.3em;font-family:constantia;" class="text-left">Marque la opcion por la cual desee filtrar su busqueda: </h3>
                    
                    <%-- Aqui debajo ira unos radios button que se van a llenar con las session traidas desde el controller los 
                        cuales permitiran filtrar los eventos por la eleccion elegida, al seleccionar una de las opciones se desplegara 
                        el div correspondiente que realiza dicha accion   --%>
                    
                    <div class="radio"> 
                        <label class="control-label" style="margin-left:15px;" data-pg-collapsed> 
                            <input id="radio1" onclick="ObtenerSeleccion()" type="radio" name="group" checked>Evento      
                        </label>                         
                        <label class="control-label" style="margin-left:15px;"> 
                            <input id="radio2" onclick="ObtenerSeleccion()" type="radio" name="group" checked>Localizacion
                        </label>
                        <label class="control-label" style="margin-left:15px;"> 
                            <input id="radio3" onclick="ObtenerSeleccion()" type="radio" name="group" checked>Categoria       
                        </label>
                    </div>                     
                </div>
                <% if(Session["ListaEventoPrincipal"] == null) { %>
                <div class="col-sm-4 col-sm-offset-0" style="margin-top:10px; display:none" data-pg-collapsed>
                    <div class="input-group">
                        <select class="form-control"> 
                            <option>Evento 1</option>                                                          
                        </select>
                        <span class="input-group-btn"><input class="btn btn-primary" type="submit" value="Busqueda"/></span>
                    <!-- /.input-group -->
                </div>
                    </div>
                <% } else { %>
                <div class="col-sm-4 col-sm-offset-0" style="margin-top:10px; display:none" data-pg-collapsed>
                    <div class="input-group">
                        <% foreach(var item in Model.listaEventos) { %>
                        <select class="form-control"> 
                            <option value="<%=item.IdEvento %>"><%= item.NombreEvento %>,<%= item.Descripcion %>,<%= item.UnLugar.Direccion %></option>                                                          
                        </select>
                        <% } %>
                        <span class="input-group-btn"><input class="btn btn-primary" type="submit" value="Busqueda"/></span>
                    <!-- /.input-group -->
                </div>
                    </div>
                <% } %>
                <% if(Session["ListaCategoriasPrincipal"]== null) { %>
                <div class="col-sm-4 hidden" style="margin-top:10px; display:none" data-pg-collapsed>
                    <div class="input-group">
                        <select class="form-control" data-pg-collapsed> 
                            <option>1</option>                                                         
                        </select>
                        <span class="input-group-btn"><input class="btn btn-primary"  type="submit" value="Filtrar Eventos"/></span>
                    </div>
                    <!-- /.input-group -->
                </div>
                <% } else { %>
                 <div class="col-sm-4 hidden" style="margin-top:10px; display:none" data-pg-collapsed>
                    <div class="input-group">
                        <% foreach(var item in Model.listaCategorias) { %>
                        <select class="form-control" data-pg-collapsed> 
                            <option value="<%= item.NombreCategoria %>"><%= item.NombreCategoria%>,<%= item.Descripcion %></option>                                                         
                        </select>
                        <% } %>
                        <span class="input-group-btn"><input class="btn btn-primary"  type="submit" value="Filtrar Eventos"/></span>
                    </div>
                    <!-- /.input-group -->
                </div>
                <% } %>
                <div style="margin-top:10px;" class="col-sm-5 hidden" data-pg-collapsed>
                    <div class="input-group">
                        <select class="form-control"> 
                            <%-- ver mas tarde opciones de maneras de transporte para filtro  --%>
                            <option></option>                                                    
                        </select>
                        <input type="text" id="CoordenadaActualX" class="form-control hidden">
                        <input type="text" id="CoordenadaActualY" class="form-control hidden">
                        <input type="text" id="CoordenadaEventoX" class="form-control hidden">
                        <input type="text" id="CoordenadaEventoY" class="form-control hidden">
                        <span class="input-group-btn"><input class="btn btn-primary" type="submit" value="Localizar"/></span>
                       
                    </div>
                    <!-- /.input-group -->
                    
                    </div>
            </div>
            <!-- /.container -->
        </section>
        <div class="map min-height-500px"></div>

      <%--Aqui debajo ira la informacion desplegada del evento seleccionado en el mapa el cual se desplegara el div luego de elegido 
     el evento por defecto este div se encuentra en display:none porque no tiene sentido mostrar un div con informacion vacia--%>
        <% if(Session["EventoSelect"]== null) { %>
        <section style="display:none " id="content-1-8" class="content-1-9 content-block" data-pg-collapsed>
            </section>
        <% } else { %>
        <section style="display:none " id="content-1-9" class="content-1-9 content-block" data-pg-collapsed>
            <div class="container">
                <div class="underlined-title">
                    <h1 class="moonlight text-center">Information event</h1>
                    <hr>
                    <h2>Aqui se desplegara la informacion relevante sobre el evento</h2>
                </div>
                <div class="row">
                    <div class="col-md-4 col-sm-12 col-xs-12 pad25" data-pg-collapsed>
                        <div class="col-xs-2">
                            <span class="fa fa-clock-o"></span>
                        </div>
                        <div class="col-xs-10">
                            <h4>Informacion Evento</h4>
                            <a>La fecha en la cual se realiza el evento es <%= Model.unEvento.FechaInicio%> al <%=Model.unEvento.FechaFin  %> y esta enmarcado en el ambito de <%=Model.unEvento.ClasificacionEvento %> </a>
                            <p>Se puede describir como un evento <%= Model.unEvento.Descripcion %>.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 pad25" data-pg-collapsed>
                        <div class="col-xs-2">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="col-xs-10">
                            <h4>Organizador</h4>
                            <p>El encargado de realizar este evento es <%= Model.unEvento.OrganizadorEvento.Nombre %> y usted se puede comunicar mediante el email <%= Model.unEvento.OrganizadorEvento.Email %> .</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 pad25" data-pg-collapsed>
                        <div class="col-xs-2">
                            <span class="fa fa-search"></span>
                        </div>
                        <div class="col-xs-10">
                            <h4>Lugar realizacion</h4>
                            <p>El lugar bajo el cual se realiza este evento es <%= Model.unEvento.UnLugar.Nombre %>, 
                                se encuentra en <%= Model.unEvento.UnLugar.Direccion %>, posee una capacidad para <%= Model.unEvento.UnLugar.Capacidad %> personas y se caracteriza
                                por ser un lugar que se describe como <%= Model.unEvento.UnLugar.Descripcion %>  .</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 pad25" data-pg-collapsed>
                        <div class="col-xs-2">
                            <span class="fa fa-ticket"></span>
                        </div>
                        <div class="col-xs-10">
                            <h4>Precio entradas</h4>
                            <p>El precio el cual tiene la entrada a este evento es de $<%=Model.unEvento.PrecioEntradas %>.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 pad25" data-pg-collapsed>
                        <div class="col-xs-2">
                            <span class="fa fa-leanpub"></span>
                        </div>
                        <div class="col-xs-10">
                            <% if( Session["ListaAreasEventoP"] != null { %>
                            <h4>Areas internas</h4>
                            <% foreach(var item in Model.listaAreasEvento) { %>
                            <p>El nombre del area es <%= item.NombreArea %> </p>
                       <% } %>
                             <% } %>
                        </div>
                    </div>
                    <div class="col-md-2 col-md-offset-5">
                        <input type="submit" class="btn btn-warning btn-lg" value="More Info" />                                              
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>
          <% } %>
    </form>
  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
