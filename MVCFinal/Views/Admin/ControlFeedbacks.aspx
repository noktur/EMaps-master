<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterAdmin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="content-3-4" class="content-block content-3-4 bg-deepocean white">
            <div class="container">
                <div class="row">
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
                        <h2 class="text-uppercase" style=" font-family:Grand Hote;font-size:1.6em;">seleccione un feedback y sera desplegado por categoria</h2>
                    </div>
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
                                            <p class="form-control-static text-uppercase black" style="border-bottom:5px groove ">Nombre Completo</p>
                                            <p class="form-control-static text-uppercase black" style="border-bottom:5px groove; "> nombre usuario</p>
                                            <p class="form-control-static text-uppercase black" style="border-bottom:5px groove">password</p>
                                            <p class="form-control-static text-uppercase black" style="border-bottom:5px groove">Cedula</p>
                                            <p class="form-control-static text-uppercase black" style="border-bottom:5px groove ">Email</p>
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
                                            <p class="form-control-static black text-uppercase" style=" opacity:0.5 ">Nombre lugar</p>
                                            <p class="form-control-static text-uppercase black" style=" opacity:0.5">direccion</p>
                                            <p class="form-control-static text-uppercase black" style=" opacity:0.5 ">Descripcion</p>
                                            <p class="form-control-static text-uppercase black" style="opacity:0.5 ">Ciudad Ubicacion</p>
                                            <p class="form-control-static text-uppercase black" style=" opacity:0.5 ">Dueño Lugar</p>
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
                                            <p class="form-control-static text-uppercase marina">Nombre Evento</p>
                                            <p class="form-control-static text-uppercase marina">descripcion</p>
                                            <p class="form-control-static text-uppercase  marina">fecha inicio</p>
                                            <p class="form-control-static text-uppercase marina">fecha fin</p>
                                            <p class="form-control-static text-uppercase marina">categoria</p>
                                        </div>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.content -->
                            </div>
                        </div>
                        <!-- /.accordion -->
                    </div>
                    <!-- /.column -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 