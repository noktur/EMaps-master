<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterAdmin.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.FeebackAdminModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="content-3-4" class="content-block content-3-4 bg-deepocean white">
            <div class="container">
                <div class="row">
                    <% if (Session["ControlAdminListaFeedback"] != null) { %>
                    <div class="col-md-7">
                        <div class="table-responsive bg-offwhite deepocean" style=" border-top-left-radius:15px;border-top-right-radius:15px;border-bottom-left-radius:15px;border-bottom-right-radius:25px ">
                            <table class="table bg-transparent margin-top0 margin-bottom0"> 
                                <thead> 
                                    <tr> 
                                        <th>#</th> 
                                        <th>First Name</th> 
                                        <th>Last Name</th> 
                                        <th>Username</th> 
                                        <th>Action</th>
                                    </tr>                                     
                                </thead>                                 
                                <tbody> 
                                    <% foreach(var item in Model.listaFeedback) { %>
                                    <tr> 
                                        <td></td> 
                                        <td class="hidden"><%= item.IdFeedbackEvento %></td> 
                                        <td><%= item.NombreFeedback %></td> 
                                        <td><%= item.Mensaje %></td> 
                                        <td><%= item.UsuarioFeedback %></td> 
                                        <td><%= item.EventoFeedback.NombreEvento %></td> 
                                        <td><%= item.FechaRealizado  %></td> 
                                        <td>
                                            <%= Html.ActionLink("Elegir", "ElegirFeedback", "Admin", new { IdFeedback = item.IdFeedbackEvento }, new { @class="btn btn-default btn-sm"})%>
                                        </td>
                                    </tr>   
                                    <% } %>                           
                                </tbody>
                            </table>
                        </div>
                        <h2 class="text-uppercase" style=" font-family:Grand Hote;font-size:1.6em;">seleccione un feedback y sera desplegado por categoria</h2>
                    </div>
                    <% } %>
                    <% if(Session["FeedbackSeleccionado"] != null) { %>
                    <div class="col-md-4 col-md-offset-1">
                        <div class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a class="panel-toggle" data-toggle="collapse" data-parent=".panel-group" href="#content1"><span>Dettalle usuario solicutud</span></a></h4>
                                </div>
                                <!-- /.panel-heading -->
                                <div id="content1" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="form-group"> 
                                            <p class="form-control-static text-uppercase black" style="border-bottom:5px groove "><%= Model.FeedbackSeleccionado.UsuarioFeedback.Nombre %></p>
                                            <p class="form-control-static text-uppercase black" style="border-bottom:5px groove; "><%= Model.FeedbackSeleccionado.UsuarioFeedback.NombreUsuario %></p>
                                            <p class="form-control-static text-uppercase black" style="border-bottom:5px groove"><%= Model.FeedbackSeleccionado.UsuarioFeedback.Contraseña %></p>
                                            <p class="form-control-static text-uppercase black" style="border-bottom:5px groove"><%= Model.FeedbackSeleccionado.UsuarioFeedback.CI %></p>
                                            <p class="form-control-static text-uppercase black" style="border-bottom:5px groove "><%= Model.FeedbackSeleccionado.UsuarioFeedback.Email %></p>
                                        </div>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.content -->
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a class="panel-toggle collapsed" data-toggle="collapse" data-parent=".panel-group" href="#content2"><span>detalle lugar solicitud</span></a></h4>
                                </div>
                                <!-- /.panel-heading -->
                                <div id="content2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="form-group"> 
                                            <p class="form-control-static black text-uppercase" style=" opacity:0.5 "><%= Model.FeedbackSeleccionado.EventoFeedback.UnLugar.Nombre %></p>
                                            <p class="form-control-static text-uppercase black" style=" opacity:0.5"><%= Model.FeedbackSeleccionado.EventoFeedback.UnLugar.Direccion %></p>
                                            <p class="form-control-static text-uppercase black" style=" opacity:0.5 "><%= Model.FeedbackSeleccionado.EventoFeedback.UnLugar.Descripcion %></p>
                                            <p class="form-control-static text-uppercase black" style="opacity:0.5 "><%= Model.FeedbackSeleccionado.EventoFeedback.UnLugar.UbicacionLugar.Nombre %></p>
                                            <p class="form-control-static text-uppercase black" style=" opacity:0.5 "><%= Model.FeedbackSeleccionado.EventoFeedback.UnLugar.DueñoLugar.Nombre %></p>
                                        </div>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.content -->
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a class="panel-toggle collapsed" data-toggle="collapse" data-parent=".panel-group" href="#content3"><span>detalle evento solicitud</span></a></h4>
                                </div>
                                <!-- /.panel-heading -->
                                <div id="content3" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="form-group"> 
                                            <p class="form-control-static text-uppercase marina"><%= Model.FeedbackSeleccionado.EventoFeedback.NombreEvento %></p>
                                            <p class="form-control-static text-uppercase marina"><%= Model.FeedbackSeleccionado.EventoFeedback.Descripcion %></p>
                                            <p class="form-control-static text-uppercase  marina"><%= Model.FeedbackSeleccionado.EventoFeedback.FechaInicio %></p>
                                            <p class="form-control-static text-uppercase marina"><%= Model.FeedbackSeleccionado.EventoFeedback.FechaFin %></p>
                                            <p class="form-control-static text-uppercase marina"><%= Model.FeedbackSeleccionado.EventoFeedback.CategoriaEvento.NombreCategoria %></p>
                                        </div>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.content -->
                            </div>
                            <% if(Session["ComentariosMensajeSelect"] != null) { %>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a class="panel-toggle collapsed" data-toggle="collapse" data-parent=".panel-group" href="#content3"><span>detalle Comentarios</span></a></h4>
                                </div>
                                <!-- /.panel-heading -->
                                <div id="content4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="form-group"> 
                                            <% foreach(var item in Model.listaComentariosFeedback) 
                                               { %>
                                            <p class="form-control-static text-uppercase marina">El Asunto de el comentarios es <%= item.AsuntoComentario %></p>
                                            <p class="form-control-static text-uppercase marina">Su comentario es <%= item.Comentario %></p>
                                            <p class="form-control-static text-uppercase  marina">Fue realizado por el usuario <%= item.UsuarioComentario.Nombre%></p>
                                            <p class="form-control-static text-uppercase marina">En la Fecha <%= item.FechaRealizado %></p>
                                       <% } %>
                                             </div>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.content -->
                            </div>
                            <% } %>
                        </div>
                        <!-- /.accordion -->
                    </div>
                    <% } %>
                    <!-- /.column -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 