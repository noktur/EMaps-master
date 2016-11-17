<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterCliente.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.DetalleEventoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <form id="fomulario" runat="server">
    <section id="content-3-7" class="content-block content-3-7 bg-river pad-bottom10 pad20" data-pg-collapsed>
            <div class="container pad-bottom0 pad0 margin-top0">
                <div class="col-sm-12">
                    <div class="underlined-title">
                        <h1 class="orange text-left" style="font-size:3.5em;font-family:grand hote;">&nbsp;Detalle evento</h1>
                        <hr class="text-left bg-black">
                    </div>
                </div>
            </div>
        </section> 
        <%-- aqui ira el plano del evento con sus areas y demas   --%>

        <div id="PlanoEvento" class="map min-height-500px">

        </div>
        <section class="content-block content-1-8">
            <div class="container">
                <ul class="nav nav-tabs text-center" role="tablist" id="myTab" style="border-bottom: 3px groove gray;">
                    <li class="active">
                        <a href="#tab1" role="tab" data-toggle="tab">Contacto</a>
                    </li>
                    <li >
                        <a href="#tab2" role="tab" data-toggle="tab">Reservacion</a>
                    </li>
                    <li >
                        <a href="#tab3" role="tab" data-toggle="tab">Localizacion</a>
                    </li>
                    <li>
                        <a href="#tab4" role="tab" data-toggle="tab">Informacion interna evento</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!-- /#tab1 -->
                    <div class="tab-pane fade in active" id="tab1" style="border-bottom:5px groove gray" data-pg-collapsed>
                        <div class="row">
                            <div class="col-md-offset-1 col-md-10">
                                <div class="underlined-title pad-bottom10">
                                    <h1 class="text-left orange" style="font-size:3.5em;font-family:grand hote;">Contact</h1>
                                    <hr class="text-left">
                                    <h2 class="text-left">realize un comentario o &nbsp;duda sobre un evento al instante</h2>
                                </div>
                                <p class="orange margin-top0 margin-bottom45 pad0" style="font-size:0.9em;font-family:constantia;">Aqui usted podra agregar los datos y el mensaje que desee solicitar sobre un evento el cual sera enviado al instante para su rapida respuesta.</p>
                                <div id="contact1" class="form-container">
                                    <% using (Html.BeginForm()) { %>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group" style="border-top:2px groove gray;border-bottom:2px groove gray">
                                                    <input name="NombreFeeback" id="NombreFeeback" type="text"  placeholder="Ingrese el asunto" class="form-control">
                                                </div>
                                            </div>
                                            </div>
                                        <!-- /.row -->
                                        <div class="form-group">
                                            <textarea name="Mensaje" id="Mensaje" class="form-control" rows="3" placeholder="Ingrese el mensaje"></textarea>
                                        </div>
                                        <div class="form-group text-center">
                                            <input class="btn btn-info" type="submit" id="cf-submit1" name="submit" value="Enviar" />
                                        </div>
                                    <% } %>
                                </div>
                                <!-- /.form-container -->
                            </div>
                        </div>
                    </div>
                    <% if(Session["EventoElegido"] != null) {  %>
                    <div class="tab-pane fade" id="tab2" style="border-bottom:5px groove gray" data-pg-collapsed>
                        <div class="row">
                            <div class="col-md-offset-1 col-md-10">
                                <div class="underlined-title pad-bottom10">
                                    <h1 class="text-left orange" style="font-size:3.5em;font-family:grand hote;">Reservacion </h1>
                                    <hr class="text-left">
                                    <h2 class="text-left">realize la reservacion del evento elegido al instante</h2>
                                </div>
                                <p>El evento se realiza desde el <%= Model.EventoActual.FechaInicio %> al <%= Model.EventoActual.FechaFin %></p>
                                <p> Elige la fecha en la cual desee realizar su reserva </p>
                                <% using(Html.BeginForm()) { %>
                                <div id="contact" class="form-container">
                                     <div class="form-group ">
                                            <input class="form-control" type="text" id="FechaReserva" name="FechaReserva" />
                                        </div>
                                        <div class="form-group text-center">
                                            <input class="btn btn-info" type="submit" id="cf-submit" name="submit" value="Realizar Reservacion" />
                                        </div>
                                </div>
                                <% } %>
                                <!-- /.form-container -->
                            </div>
                        </div>
                        <div class="row">
                            <!-- /.col -->
                            <div class="col-sm-10 col-sm-offset-1">
                                <div id="map" class="map min-height-500px"></div>
                            </div>
                        </div>
                        <!-- /.row -->
                        <!-- /.row -->
                    </div>
                    <% } %>
                    <!-- /#tab2 -->
                    <div class="tab-pane fade" id="tab3" style="border-bottom:5px groove gray" data-pg-collapsed>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-0">
                                <div class="underlined-title pad-bottom10">
                                    <h1 class="text-left orange" style="font-size:3.5em;font-family:grand hote;">Localizacion</h1>
                                    <hr class="text-left">
                                    <h2 class="text-left">aqui usted podra localizar el evento segun distintos filtros que desee</h2>
                                </div>
                                <p class="orange" style="font-size:0.9em;font-family:constantia;">&nbsp;Aqui podra elegir como deseea llegar a dicho evento </p>
                                <div id="contact2" class="form-container">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <select class="form-control"> 
                                                        <option>Bycicle</option>                                                         
                                                        <option>Car</option>                                                         
                                                        <option>Walking</option>                                                         
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <button type="button" class="btn margin-top0 margin-bottom0 pad-bottom10 pad5 btn-warning">Localizar</button>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                </div>
                                <div class="col-md-8">
                                    <div class="map min-height-500px"></div>                                     
                                </div>
                                <div class="col-md-4">
                                    <h3 class="orange" style="font-size:1.6em;font-family: Montserrat;">Detalle de localizacion</h3> 
                                </div>
                                <!-- /.form-container -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /#tab3 -->
                    <% if(Session["EventoElegido"] != null) { %>
                    <div class="tab-pane fade" id="tab4">
                        <div class="row">
                            <div class="col-md-12 col-md-offset-0">
                                <section class="content-block team-1 team-1-2">
                                    <div class="container">
                                        <div class="underlined-title">
                                            <h1 class="orange text-left" style="font-size:3.5em;font-family:grand hote;">Informacion Evento</h1>
                                            <hr>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 team-member-wrap" data-pg-collapsed>
                                                <div class="team-member" data-pg-collapsed>
                                                    <div class="team-details">
                                                        <h4 class="member-name"><%= Model.EventoActual.NombreEvento %></h4>
                                                        <p class="position"><%= Model.EventoActual.UnLugar.Direccion %>&nbsp;</p>
                                                        <p><%= Model.EventoActual.Descripcion %>: </p>
                                                        <ul class="social social-dark" data-pg-collapsed="">
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-facebook"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-twitter"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-google-plus"></i></a>
                                                            </li>
                                                        </ul>
                                                        <!-- /.social -->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 team-member-wrap">
                                                <div class="team-member">
                                                    <div class="team-details">
                                                        <h4 class="member-name"><%= Model.EventoActual.UnLugar.Nombre %></h4>
                                                        <p class="position"><%= Model.EventoActual.UnLugar.UbicacionLugar.Nombre %> ,<%= Model.EventoActual.UnLugar.UbicacionLugar.UnPais.Nombre %> </p>
                                                        <p><%= Model.EventoActual.UnLugar.Descripcion %>: </p>
                                                        <ul class="social social-dark">
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-twitter"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-google-plus"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-facebook-f"></i></a>
                                                            </li>
                                                        </ul>
                                                        <!-- /.social -->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 team-member-wrap" data-pg-collapsed>
                                                <div class="team-member">
                                                    <div class="team-details">
                                                        <h4 class="member-name"><%= Model.EventoActual.OrganizadorEvento.Nombre %></h4>
                                                        <p class="position"><%= Model.EventoActual.OrganizadorEvento.Email %>:&nbsp;</p>
                                                        <ul class="social social-dark" data-pg-collapsed="">
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-facebook"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-google-plus"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-twitter"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"></a>
                                                            </li>
                                                        </ul>
                                                        <!-- /.social -->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 team-member-wrap" data-pg-collapsed>
                                                <div class="team-member" data-pg-collapsed>
                                                    <div class="team-details">
                                                        <h4 class="member-name">Duracion</h4>
                                                        <p class="position"><%= Model.EventoActual.FechaInicio %>: </p>
                                                        <p><%= Model.EventoActual.FechaFin %>:</p>
                                                        <ul class="social social-dark">
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-facebook"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-twitter"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-google-plus"></i></a>
                                                            </li>
                                                        </ul>
                                                        <!-- /.social -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                    </div>
                                    <!-- /.container -->
                                </section>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <% } %>
                    <!-- /#tab4 -->
                </div>
                <!-- /.tab-content -->
            </div>
            <!-- /.container -->
        </section>
    </form>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
