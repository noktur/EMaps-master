<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterDueño.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section id="content-3-2" class="content-block-nopad content-3-2" data-pg-collapsed>
            <div class="overlay overlay-orange">
                <div class="container text-center">
                    <h2>Trust in a team that's with you all the way</h2>
                    <h1>AQUI USTED PODRA ORGANIZAR SUS FEEDBACK , STEP BY STEP</h1>
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
                        <a href="#tab1" role="tab" data-toggle="tab">Listado feedbacks por lugar</a>
                    </li>
                    <li>
                        <a href="#tab2" role="tab" data-toggle="tab">Listado de &nbsp;feedback por cliente</a>
                    </li>
                    <li>
                        <a href="#tab3" role="tab" data-toggle="tab">Respuestas a feedback</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab1">
                        <div class="row">
                            <!-- /.col -->
                            <div class="col-md-5 col-md-offset-1 col-sm-6 bg-offwhite">
                                <table class="table bg-offwhite" data-pg-collapsed> 
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
                                <select class="form-control" data-pg-collapsed=""> 
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
                                    <select class="form-control lead" data-pg-collapsed> 
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
                            <div class="col-sm-6 col-sm-offset-3">
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
                    <div class="tab-pane fade" id="tab3">
                        <div class="row">
                            <div class="col-md-4 col-md-push-3 col-md-offset-1 col-sm-6">
</div>
                            <p class="text-center" style="font-size:1.3em; font-family:open">
    LISTA FEEDBACK</p>
                            <table class="table table-striped table-condensed" style=" font-family:Satisfy ; font-size:1.0em" data-pg-collapsed> 
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
                            <div class="col-md-4">
                                <h3 style="font-size:1.2em; font-family:open">AQUI RESPONDA EL FEEDBACK ELEGIDO</h3> 
                                <p>A la derecha usted podra responder el feedback que solicito un organizador.</p>
                            </div>
                            <div data-pg-collapsed class="col-md-8">
                                <div id="contact" class="form-container">
                                    <fieldset>
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
                                                <textarea name="comments" id="comments1" class="form-control" rows="3" placeholder="Message" ></textarea>
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
                    <!-- /#tab3 -->
                    <!-- /#tab4 -->
                </div>
                <!-- /.tab-content -->
            </div>
            <!-- /.container -->
        </section>
        <section id="content-3-7" class="content-block content-3-7" style=" background-color:#AED1DD   " data-pg-collapsed>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 text-center">
                        <h3 class="bg-clouds turquoise text-uppercase" style=" font-family:Satisfy ">Table Feedback</h3> 
                    </div>
                </div>
                <table class="table"> 
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
        </section>
        <div class="content-block contact-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div id="contact1" class="form-container">
                            <fieldset>
                                <div id="message"></div>
                                <form method="post" action="js/contact-form.php" name="contactform" id="contactform">
                                    <div class="form-group">
                                        <input name="name" id="name" type="text" value="" placeholder="Name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <input name="email" id="email" type="text" value="" placeholder="Email" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <input name="phone" id="phone" type="text" value="" placeholder="Phone" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <textarea name="comments" id="comments" class="form-control" rows="3" placeholder="Message"></textarea>
                                        <div class="editContent">
                                            <p class="small text-muted"><span class="guardsman">* All fields are required.</span> Once we receive your message we will respond as soon as possible.</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-primary" type="submit" id="cf-submit" name="submit">Send</button>
                                    </div>
                                </form>
                            </fieldset>
                        </div>
                        <!-- /.form-container -->
                    </div>
                    <div class="col-md-6" style="font-size:0.9em">
                        <h2 style=" font-family:Satisfy ; font-size:1.6em">Busque aqui el feedback al cual quiere responder&nbsp;</h2>
                        <p>We are easy to find in the heart of London's business district, just a short walk from several Tube Stations.</p>
                        <div class="table-responsive">
                            <table class="table table-striped" style="font-size:1.0em"> 
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
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </div>
</asp:Content>
