<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterDueño.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.FeedbackDueñoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">

        function SeleccionarLugar()
        {

            var NombreLugar = $("#select").val();

      $.ajax({
                url:'/Dueño/SeleccionarLugar',
                type:"post",
                data:NombreLugar,
                success: function(data)
                {

                }


            });
        }


        </script>



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formulario" runat="server">     
        <section id="content-3-2" class="content-block-nopad content-3-2" data-pg-collapsed>
            <div class="overlay overlay-orange">
                <div class="container text-center">
                    <h2>Trust in a team that's with you all the way</h2>
                    <h1>AQUI USTED PODRA ORGANIZAR SUS FEEDBACK , STEP BY STEP</h1>
                    <a href="FeedbackDueño.aspx"></a>
                    <div class="col-md-6 col-md-offset-3 text-center">
                        <div class="col-md-6">
</div>
                        <div class="col-md-6">
</div>
                    </div>
                </div>
                <!-- /.container -->
            </div>
        </section>
        <section class="content-block content-1-8">
            <div class="container">
                <ul class="nav nav-tabs text-center" role="tablist" id="myTab">
                    <li class="active">
                        <a href="#tab1" role="tab" data-toggle="tab">Listado mensajes por lugares</a>
                    </li>
                    <li>
                        <a href="#tab2" role="tab" data-toggle="tab">Responder Mensajes</a>
                    </li>
                </ul>
                <div class="tab-content">
                    
                    <div class="tab-pane fade in active" id="tab1">
                        <div class="row">
                            <!-- /.col -->
                            <% if(Session["ListaFeedbackPorLugar"] != null) { %>
                            <div class="col-md-5 col-md-offset-1 col-sm-6 bg-offwhite">
                                <div class="table-responsive">
                                <table class="table bg-offwhite" data-pg-collapsed> 
                                    <thead> 
                                        <tr> 
                                            <th>#</th> 
                                            <th>Titulo</th> 
                                            <th>Mensaje</th>
                                            <th>Lugar</th> 
                                            <th>Fecha Realizado</th> 
                                            <th>Usuario</th> 
                                            <th>Action</th>
                                        </tr>                                         
                                    </thead>                                     
                                    <tbody> 
                                        <% foreach(var item in Model.listaFeedbackSeleccionado) { %>
                                        <tr> 
                                            <td></td> 
                                            <td><%=item.NombreFeedback %></td> 
                                            <td><%=item.Mensaje %></td> 
                                            <td><%=item.LugarFeedback.Nombre %></td>
                                            <td><%=item.FechaRealizado %></td>
                                            <td><%=item.UsuarioFeedback %></td> 
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
                            <% if(Session["ListaLugaresPropios"] != null) { %>
                            <div class="col-md-5 col-sm-6">
                                <h3></h3>
                                <% foreach(var item in Model.listalugaresPropios) 
                                   { %>
                                <select id="select" onchange="SeleccionarLugar()" class="form-control" data-pg-collapsed=""> 
                                    <option value="<%= item.Nombre %>"><%= item.Nombre %>,<%= item.Descripcion %></option>                                                                        
                                </select>
                                <% } %>
                                <p style=" font-size:1.2em;font-family:open ">Aqui eliga el lugar deseado y el sistema filtrara dicha eleccion a la lista para ser mostrada luego.</p>
                            <% } %>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /#tab1 -->
                    <div class="tab-pane fade" id="tab2">
                        <div class="row">
                            
                            <div class="col-md-4 col-md-push-3 col-md-offset-1 col-sm-6">
</div>
                            <p class="text-center" style="font-size:1.3em; font-family:open">
    LISTA FEEDBACK</p>
                            <% if(Session["FeedbackLugarGeneral"] != null) { %>
                            <div class="table-responsive">
                            <table class="table table-striped table-condensed" style=" font-family:Satisfy ; font-size:1.0em" data-pg-collapsed> 
                                <thead> 
                                    <tr> 
                                        <th>#</th> 
                                        <th>Titulo</th> 
                                        <th>Mensaje</th> 
                                        <th>Lugar</th> 
                                        <th>Fecha Realizado</th>
                                        <th>Usuario</th>
                                    </tr>                                     
                                </thead>                                 
                                <tbody> 
                                    <% foreach(var item in Model.listaFeedbackGeneral) { %>
                                    <tr> 
                                        <td></td>
                                        <td><%= item.NombreFeedback %></td> 
                                        <td><%= item.Mensaje %></td> 
                                        <td><%= item.LugarFeedback.Nombre %></td> 
                                        <td><%= item.FechaRealizado %></td> 
                                        <td><%= item.UsuarioFeedback %></td> 
                                        <td>
                                            <button type="submit" class="btn btn-default btn-sm" value="ENVIAR" name="ENVIAR" style="font-size:0.7em">SELECCIONAR</button>
                                        </td>
                                    </tr> 
                                    <% } %>                                   
                                </tbody>
                            </table>
                                </div>
                            <% } %>
                            <div class="col-md-4">
                                <h3 style="font-size:1.2em; font-family:open">AQUI RESPONDA EL FEEDBACK ELEGIDO</h3> 
                                <p>A la derecha usted podra responder el feedback que solicito un organizador.</p>
                            </div>
                            <div data-pg-collapsed class="col-md-8">
                                <div id="contact" class="form-container">
                                    <% using (Html.BeginForm()) { %>
                                    <fieldset>
                                        
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
                                                <textarea name="comments" id="comments1" class="form-control" rows="3" placeholder="Message" ></textarea>
                                                <div class="editContent">
                                                    <p class="small text-muted"><span class="guardsman">* All fields are required.</span> Once we receive your message we will respond as soon as possible.</p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-primary" type="submit" id="cf-submit1" name="submit">Send</button>
                                            </div>
                                    </fieldset>
                                    <% } %>
                                </div>                                 
                            </div>
                            <!-- /.col -->
                            <!-- /.col -->
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /#tab3 -->
                    <!-- /#tab4 -->
                </div>
                <!-- /.tab-content -->
            </div>
            <!-- /.container -->
        </section>
    <% if(Session["MensajeSeleccionadoDueño"] != null) { %>
        <section id="content-3-7" class="content-block content-3-7" style=" background-color:#AED1DD   " data-pg-collapsed>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 text-center">
                        <h3 class="bg-clouds turquoise text-uppercase" style=" font-family:Satisfy ">Aqui se desplegara el mensaje seleccionado</h3> 
                    </div>
                </div>
                <div class="table-responsive">
                <table class="table"> 
                    <thead> 
                        <tr> 
                            <th>#</th> 
                            <th>Asunto</th> 
                            <th>Mensaje</th> 
                            <th>FechaRealizacion</th> 
                            <th>Usuario</th>
                            <th>Action</th>
                        </tr>                         
                    </thead>                     
                    <tbody> 
                        <% foreach(var item in Model.listaComentariosMensajeSeleccionado) {  %>
                        <tr> 
                            <td></td> 
                            <td><%= item.AsuntoComentario %></td> 
                            <td><%= item.Comentario %></td> 
                            <td><%= item.FechaRealizado %></td> 
                            <td><%= item.UsuarioComentario %></td> 
                            <td>
                                <button type="submit" class="btn btn-default btn-sm" value="ENVIAR" name="ENVIAR">SELECCIONAR</button>
                            </td>
                        </tr>    
                        <% } %>                 
                    </tbody>
                </table>
                    </div>
            </div>
        </section>
        <% } %>
        </form> 
    
</asp:Content>
