<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.FeebackAdminModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                    <% if (Session["ControlAdminListaFeedback"] != null) { %>
                    
    <div class="page-aside">
      <div class="page-aside-switch">
        <i class="icon md-chevron-left" aria-hidden="true"></i>
        <i class="icon md-chevron-right" aria-hidden="true"></i>
      </div>
      <div class="page-aside-inner">

        <div class="app-message-list scrollable is-enabled scrollable-vertical" data-plugin="pageAsideScroll" style="position: relative;">
          <div data-role="container" class="scrollable-container" style="height: 201px; width: 276px;">
            <div data-role="content" class="scrollable-content" style="width: 259px;">
              <ul class="list-group">
                    <% foreach(var group in Model.listaFeedback.GroupBy((item => item.EventoFeedback)) { %>
                <li class="list-group-item">
                  <div class="media">
                    <div class="media-left">
                         <%= Html.ActionLink("", "ElegirFeedback", "Admin", new { IdEvento = group.Key.IdEvento }, new { @class="btn btn-round red-400"})%>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading"><%= group.Key.NombreEvento %></h4>
                      <span class="media-time"><%= group.Key.FechaInicio %></span>
                    </div>
                    <div class="media-right">
                      <span class="badge badge-danger"><%= group.Key.UnOrganizador.NombreUsuario %></span>
                    </div>
                  </div>
                </li>
                 
              </ul>
            </div>
          </div>
        <div class="scrollable-bar scrollable-bar-vertical scrollable-bar-hide" draggable="false"><div class="scrollable-bar-handle" style="height: 47.2509px;"></div></div></div>
      </div>
    </div>
     <% } %>
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
 