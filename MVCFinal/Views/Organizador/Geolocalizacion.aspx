<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterOrganizador.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <section id="content-3-7" class="content-block content-3-7 pad-bottom0">
                <div class="container">
                    <div class="col-sm-12">
                        <div class="underlined-title">
                            <h1 style="font-size:1.5em;font-family:Constantia;">EN ESTA PAGINA BRINDAMOS UN SISTEMA DE LOCALIZACION INTEGRAL QUE PERMITE REALIZAR SUS SOLICITUDES EN TIEMPO REAL</h1>
                            <hr>
                            <h2>Busquedas por solicitud</h2>
                        </div>
                    </div>
                </div>
            </section>
            <section class="content-block content-1-8 pad0">
                <div class="container">
                    <ul class="nav nav-tabs text-center" role="tablist" id="myTab">
                        <li class="active">
                            <a href="#tab1" role="tab" data-toggle="tab">Lugares Cercanos Ubicacion actual</a>
                        </li>
                        <li>
                            <a href="#tab2" role="tab" data-toggle="tab">Distancia entre dos lugares</a>
                        </li>
                        <li>
                            <a href="#tab3" role="tab" data-toggle="tab">filtrar por tipo de transporte</a>
                        </li>
                        <li>
                            <a href="#tab4" role="tab" data-toggle="tab">recorrido hacia un punto</a>
                        </li>
                    </ul>
                    <div class="tab-content" data-pg-collapsed>
                        <div class="tab-pane fade in active pad-bottom0" id="tab1">
                            <div class="row">
                                <!-- /.col -->
                                <!-- /.col -->
                                <div class="col-md-10 col-md-offset-1" data-pg-collapsed>
                                    <div class="map min-height-500px"></div>                                                                          
                                </div>
                            </div>
                            <!-- /.row -->
                        </div>
                        <div class="tab-pane fade pad-bottom0" id="tab2">
                            <div class="row">
                                <!-- /.col -->
                                <div class="col-md-4 col-md-offset-2" data-pg-collapsed>
                                    <div class="form-group" data-pg-collapsed> 
                                        <label class="control-label text-uppercase" for="formInput89" style="font-size:0.9em;font-family:Constantia;">ELIGE UN LUGAR</label>                                         

                                        <select id="formInput89" class="form-control"> 
                                            <option>1</option>                                             

                                            <option>2</option>                                             

                                            <option>3</option>                                             
                                        </select>
                                    </div>                                                                          
                                </div>
                                <div class="col-md-4" data-pg-collapsed>
                                    <div class="form-group" data-pg-collapsed> 
                                        <label class="control-label text-uppercase" for="formInput173" style="font-size:0.9em;font-family:Constantia;">ELIGE OTRO LUGAR</label>                                         

                                        <select id="formInput173" class="form-control"> 
                                            <option>1</option>                                             

                                            <option>2</option>                                             

                                            <option>3</option>                                             
                                        </select>
                                    </div>                                                                          
                                </div>
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="map min-height-500px"></div>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /#tab1 -->
                        <!-- /#tab2 -->
                        <div class="tab-pane fade pad-bottom0" id="tab3">
                            <div class="row">
                                <div class="col-md-6" data-pg-collapsed>
                                    <div id="contact" class="form-container" data-pg-collapsed>
                                        <fieldset>
                                            <div id="message"></div>
                                            <form method="post" action="js/contact-form.php" name="contactform" id="contactform">
                                                <div class="form-group"> 
                                                    <label class="control-label text-uppercase" for="formInput212" style="font-size:0.9em;font-family:Constantia;">ELIGE UN TRANSPORTE</label>                                                     

                                                    <select id="formInput212" class="form-control"> 
                                                        <option value="DRIVING">Driving</option>
                                                        <option value="WALKING">Walking</option>
                                                        <option value="BICYCLING">Bicycling</option>
                                                        <option value="TRANSIT">Transit</option>                                                         
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <button class="btn btn-primary" type="submit" id="cf-submit" name="submit">Send</button>
                                                </div>
                                            </form>
                                        </fieldset>
                                    </div>
                                    <!-- /.form-container -->
                                </div>
                                <div class="col-md-6">
                                    <div class="map min-height-500px"></div>
                                </div>
                                <!-- /.col -->
                                <!-- /.col -->
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /#tab3 -->
                        <div class="tab-pane fade pad-bottom0" id="tab4">
                            <div class="row">
                                <div class="text-center col-md-8" data-pg-collapsed>
                                    <div class="map min-height-500px"></div>
                                </div>
                                <!-- /.col -->
                                <div data-pg-collapsed class="col-md-4">                                      
</div>
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
