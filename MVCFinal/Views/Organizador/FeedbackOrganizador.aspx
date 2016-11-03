<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterOrganizador.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section class="content-block content-1-8 pad-bottom0">
                <div class="container">
                    <ul class="nav nav-tabs text-center" role="tablist" id="myTab">
                        <li class="active">
                            <a href="#tab1" role="tab" data-toggle="tab">Listado feedbacks por lugar</a>
                        </li>
                        <li>
                            <a href="#tab2" role="tab" data-toggle="tab">Listado de &nbsp;feedback por cliente</a>
                        </li>
                        <li>
                            <a href="#tab4" role="tab" data-toggle="tab">Feedback Eventos</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1">
                            <div class="row">
                                <!-- /.col -->
                                <div class="col-md-5 col-md-offset-1 col-sm-6 bg-offwhite">
                                    <table class="table bg-offwhite"> 
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
                                            <tr> 
                                                <td>1</td> 
                                                <td>Mark</td> 
                                                <td>Otto</td> 
                                                <td>@mdo</td> 
                                                <td>
                                                    <button type="submit" class="btn btn-default btn-sm" value="ENVIAR" name="ENVIAR">ELEGIR</button>
                                                </td>
                                            </tr>
                                            <tr> 
                                                <td>2</td> 
                                                <td>Jacob</td> 
                                                <td>Thornton</td> 
                                                <td>@fat</td> 
                                                <td>
                                                    <button type="button" class="btn btn-default btn-sm">ELEGIR</button>
                                                </td>
                                            </tr>                                             
                                            <tr> 
                                                <td>3</td> 
                                                <td>Larry</td> 
                                                <td>the Bird</td> 
                                                <td>@twitter</td> 
                                                <td>
                                                    <button type="button" class="btn btn-default btn-sm">ELEGIR</button>
                                                </td>
                                            </tr>                                             
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-5 col-sm-6">
                                    <h3></h3>
                                    <select class="form-control"> 
                                        <option>1</option>                                         
                                        <option>2</option>                                         
                                        <option>3</option>                                         
                                    </select>
                                    <p style=" font-size:1.2em;font-family:open ">Aqui eliga el lugar deseado y el sistema filtrara dicha eleccion a la lista para ser mostrada luego.</p>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /#tab1 -->
                        <div class="tab-pane fade" id="tab2">
                            <div class="row">
                                <div class="col-sm-10 col-sm-offset-1 text-center" style="font-size:0.7em">
                                    <p>Aqui podra filtrar dicha lista por el cliente que realizo dicha solicitud.</p>
                                    <div class="col-sm-6 col-sm-offset-3">
                                        <select class="form-control lead"> 
                                            <option>1</option>                                             
                                            <option>2</option>                                             
                                            <option>3</option>                                             
                                        </select>
                                    </div>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-sm-8 col-sm-offset-2">
                                    <table class="table table-hover table-striped"> 
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
                                            <tr> 
                                                <td>1</td> 
                                                <td>Mark</td> 
                                                <td>Otto</td> 
                                                <td>@mdo</td> 
                                                <td>
                                                    <button type="submit" class="btn btn-default btn-sm" value="ENVIAR" name="ENVIAR">SELECCIONAR</button>
                                                </td>
                                            </tr>
                                            <tr> 
                                                <td>2</td> 
                                                <td>Jacob</td> 
                                                <td>Thornton</td> 
                                                <td>@fat</td> 
                                                <td>
                                                    <button type="button" class="btn btn-default btn-sm">Seleccionar</button>
                                                </td>
                                            </tr>                                             
                                            <tr> 
                                                <td>3</td> 
                                                <td>Larry</td> 
                                                <td>the Bird</td> 
                                                <td>@twitter</td> 
                                                <td>
                                                    <button type="button" class="btn btn-default btn-sm">Seleccionar</button>
                                                </td>
                                            </tr>                                             
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /#tab2 -->
                        <!-- /#tab3 -->
                        <div class="tab-pane fade" id="tab4">
                            <div class="row">
                                <p class="text-center" style="font-size:1.3em; font-family:open">
    LISTA FEEDBACK</p>
                                <div class="col-md-10 col-md-offset-1">
                                    <table class="table table-striped table-condensed table-hover" style=" font-family:Satisfy ; font-size:1.0em"> 
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
                                            <tr> 
                                                <td>1</td> 
                                                <td>Mark</td> 
                                                <td>Otto</td> 
                                                <td>@mdo</td> 
                                                <td>
                                                    <button type="submit" class="btn btn-default btn-sm" value="ENVIAR" name="ENVIAR" style="font-size:0.7em">SELECCIONAR</button>
                                                </td>
                                            </tr>
                                            <tr> 
                                                <td>2</td> 
                                                <td>Jacob</td> 
                                                <td>Thornton</td> 
                                                <td>@fat</td> 
                                                <td>
                                                    <button type="button" class="btn btn-default btn-sm" style="font-size:0.7em">Seleccionar</button>
                                                </td>
                                            </tr>                                             
                                            <tr> 
                                                <td>3</td> 
                                                <td>Larry</td> 
                                                <td>the Bird</td> 
                                                <td>@twitter</td> 
                                                <td>
                                                    <button type="button" class="btn btn-default btn-sm" style="font-size:0.7em">Seleccionar</button>
                                                </td>
                                            </tr>                                             
                                        </tbody>
                                    </table>                                     
                                </div>
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

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
