<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.FeedbackOrganizadorModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formulario" runat="server">
<section class="content-block content-1-8 pad-bottom0">
                <div class="container">
                    <ul class="nav nav-tabs text-center" role="tablist" id="myTab">
                        <li class="active">
                            <a href="#tab1" role="tab" data-toggle="tab">Listado feedbacks por lugar</a>
                        </li>
                        <li>
                            <a href="#tab4" role="tab" data-toggle="tab">Feedback Eventos</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1">
                            <div class="row">
                                <% if(Session["ListaLugaresAlquilados"] != null) { %>
                                 <div class="col-md-5 col-sm-6">
                                    <p style=" font-size:1.2em;font-family:open ">Aqui eliga el lugar deseado y el sistema filtrara dicha eleccion a la lista para ser mostrada luego.</p>
                                    <% foreach(var item in Model.listalugaresAlquilados) { %>
                                     <select class="form-control"> 
                                        <option value="<%= item.LugarAlquiler.Nombre %>"><%= item.LugarAlquiler.Nombre %>,<%= item.LugarAlquiler.Descripcion %></option>                                                                                 
                                    </select>
                                     <% } %>       
                                </div>
                                <% } %>
                                <!-- /.col -->
                                 <% if(Session["ListaFeedbackPorLugarOrganizador"] != null) { %>
                                <div class="col-md-5 col-md-offset-1 col-sm-6 bg-offwhite">
                                    <div class="table-responsive">
                                    <table class="table bg-offwhite"> 
                                        <thead> 
                                            <tr> 
                                                <th>#</th> 
                                                <th>Asunto</th> 
                                                <th>Mensaje</th> 
                                                <th>Fecha Realizado</th> 
                                                <th>Evento</th>
                                                <th>Usuario</th>
                                                <th>Action</th>
                                            </tr>                                             
                                        </thead>                                         
                                        <tbody> 
                                            <% foreach(var item in Model.listaFeedbackEventoPorLugar) { %>
                                            <tr> 
                                                <td></td> 
                                                <td><%= item.NombreFeedback %></td> 
                                                <td><%= item.Mensaje %></td> 
                                                <td><%= item.FechaRealizado %></td>
                                                <td><%= item.EventoFeedback.NombreEvento %></td>
                                                <td><%= item.UsuarioFeedback.Nombre %></td> 
                                                <td>
                                                    <button type="submit" class="btn btn-default btn-sm" value="ENVIAR" name="ENVIAR">ELEGIR</button>
                                                </td>
                                            </tr>  
                                            <% } %>                                       
                                        </tbody>
                                    </table>
                                        </div>
                                </div>
                                <% } %>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /#tab1 -->
                        <!-- /#tab2 -->
                        <!-- /#tab3 -->
                        <div class="tab-pane fade" id="tab4">
                            <div class="row">
                                <p class="text-center" style="font-size:1.3em; font-family:open">
    LISTA FEEDBACK</p>
                                 <% if(Session["FeedbackEventoGeneralOrganizador"] != null) { %>
                                <div class="col-md-10 col-md-offset-1">
                                   <div class="table-responsive">
                                     <table class="table table-striped table-condensed table-hover" style=" font-family:Satisfy ; font-size:1.0em"> 
                                        <thead> 
                                            <tr> 
                                                <th>#</th> 
                                                <th>Asunto</th> 
                                                <th>Mensaje</th> 
                                                <th>Fecha Realizado</th> 
                                                <th>Evento</th>
                                                <th>Usuario</th> 
                                                <th>Action</th>
                                            </tr>                                             
                                        </thead>                                         
                                        <tbody> 
                                            <% foreach(var item in Model.listaFeedbackEventoGeneral) { %>
                                            <tr> 
                                                <td></td> 
                                                <td><%= item.NombreFeedback %></td> 
                                                <td><%= item.Mensaje %></td> 
                                                <td><%= item.FechaRealizado %></td> 
                                                <td><%= item.EventoFeedback.NombreEvento %></td> 
                                                <td><%= item.UsuarioFeedback.Nombre %></td> 
                                                <td>
                                                    <button type="submit" class="btn btn-default btn-sm" value="ENVIAR" name="ENVIAR" style="font-size:0.7em">SELECCIONAR</button>
                                                </td>
                                            </tr>      
                                            <% } %>                                                                              
                                        </tbody>
                                    </table> 
                                       </div>                                    
                                </div>
                                <% } %>
                                <div class="col-md-3 margin-top15">
                                    <h3 style="font-size:1.2em; font-family:open">AQUI RESPONDA EL FEEDBACK ELEGIDO</h3> 
                                    <p>A la derecha usted podra responder el feedback que solicito un organizador.</p>
                                </div>
                                <div class="col-md-8 margin-top15">
                                    <div id="contact" class="form-container">
                                        <fieldset class="bg-offwhite">
                                            <div id="message1"></div>
                                            <div class="form-group">
                                                <input name="name" id="name1" type="text" value="" placeholder="Name" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <input name="email" id="email1" type="text" value="" placeholder="Email" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <input name="phone" id="phone1" type="text" value="" placeholder="Phone" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <textarea name="comments" id="comments1" class="form-control" rows="3" placeholder="Message"></textarea>
                                                <div class="editContent">
                                                    <p class="small text-muted"><span class="guardsman">* All fields are required.</span> Once we receive your message we will respond as soon as possible.</p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-primary" type="submit" id="cf-submit1" name="submit">Send</button>
                                            </div>
                                        </fieldset>
                                    </div>                                     
                                </div>
                                <!-- /.col -->
                                <!-- /.col -->
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
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
