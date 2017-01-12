<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterOrganizador.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <form id="Form1">
     <div class="container bg-offwhite margin-top0 margin-bottom0 pad-bottom0" style="width:100%">
          
                <div class="row  bg-offwhite">
                    <div class="col-md-4 margin-top5 pad-bottom0 margin-bottom0">
                        <h2 class="text-uppercase" style="font-size:1.1em;font-family:Lora;">Aqui puedes filtrar los datos para la busqueda</h2>
                        <div id="contact" class="form-container margin-top0 pad-bottom0 pad0 margin-bottom0;height:100%">
                            <fieldset class="margin-top0 pad-bottom0 pad5 margin-bottom5">
                             <% using(Html.BeginForm()) { %>
                                    <div class="form-group">
                                        <label class="control-label" style="padding-left:5px;">Check in</label>
                                        <div class='input-group date margin-bottom25' id='Fecha1'>
                                            <input type="text" id="FechaInicio" name="FechaInicio" class="form-control" />
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" style="padding-left:5px;">Check Out</label>
                                            <div class='input-group date' id='Fecha2'>
                                                <input type="text" id="FechaFin" name="FechaFin" class="form-control" />
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group hidden">
                                       <input name="FechaReservacion" id="FechaReservacion" type="text" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <input class="btn btn-primary" type="submit" id="Filtrar" name="action" value="Filtrar Busqueda">
                                    </div>
                                <% } %>
                            </fieldset>
                        </div>                         
                        <!-- /.isotope-gallery-container -->                         
                    </div>
                    <div class="col-md-8" style="margin-left:0px;margin-right:0px;">
                        <div id="map" class="map min-height-500px"></div>
                    </div>
                </div>
                <!-- /.container -->
            </div>
            <section class="content-block gallery-1 gallery-1-2 margin-top0 pad0 bg-clouds pad-bottom15">
                <div class="container" style="width:90%">
                    <div class="underlined-title">
                        <hr>
                        <h2>Gallery Place</h2>
                    </div>
                    <!-- /.gallery-filter -->
                    <div class="row">
                        <div class="col-md-3 bg-offwhite"> 
                            <div class="thumbnail">
                                <div id="carousel1" class="carousel slide" data-ride="carousel"> 
                                    <!-- Indicators -->                                     
                                    <ol class="carousel-indicators"> 
                                        <li data-target="#carousel1" data-slide-to="0" class="active"></li>                                         
                                        <li data-target="#carousel1" data-slide-to="1"></li>                                         
                                        <li data-target="#carousel1" data-slide-to="2"></li>                                         
                                    </ol>                                     
                                    <!-- Wrapper for slides -->                                     
                                    <div class="carousel-inner"> 
                                        <div class="item active"> 
                                            <img src="../../imagenes de prueba/img4.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 1 title</h3> 
                                                <p>Slide 1 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                        <div class="item"> 
                                            <img src="../../imagenes de prueba/img1.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 2 title</h3> 
                                                <p>Slide 2 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                        <div class="item"> 
                                            <img src="../../imagenes de prueba/img7.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 3 title</h3> 
                                                <p>Slide 3 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                    </div>                                     
                                    <!-- Controls -->                                     
                                    <a class="left carousel-control" href="#carousel1" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> 
                                    <a class="right carousel-control" href="#carousel1" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> 
                                </div>                                 
                                <div class="caption"> 
                                    <h3>Area 1</h3> 
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> 
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> </p> 
                                </div>                                 
                            </div>                             
                        </div>
                        <!-- /.isotope-gallery-container -->
                        <div class="col-md-3 bg-offwhite"> 
                            <div class="thumbnail">
                                <div id="carousel2" class="carousel slide" data-ride="carousel"> 
                                    <!-- Indicators -->                                     
                                    <ol class="carousel-indicators"> 
                                        <li data-target="#carousel2" data-slide-to="0" class="active"></li>                                         
                                        <li data-target="#carousel2" data-slide-to="1"></li>                                         
                                        <li data-target="#carousel2" data-slide-to="2"></li>                                         
                                    </ol>                                     
                                    <!-- Wrapper for slides -->                                     
                                    <div class="carousel-inner"> 
                                        <div class="item active"> 
                                            <img src="../../imagenes de prueba/img2.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 1 title</h3> 
                                                <p>Slide 1 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                        <div class="item"> 
                                            <img src="../../imagenes de prueba/img4.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 2 title</h3> 
                                                <p>Slide 2 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                        <div class="item"> 
                                            <img src="../../imagenes de prueba/img6.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 3 title</h3> 
                                                <p>Slide 3 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                    </div>                                     
                                    <!-- Controls -->                                     
                                    <a class="left carousel-control" href="#carousel2" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> 
                                    <a class="right carousel-control" href="#carousel2" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> 
                                </div>                                 
                                <div class="caption"> 
                                    <h3>Area 2</h3> 
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> 
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> </p> 
                                </div>                                 
                            </div>                             
                        </div>
                        <div class="col-md-3 bg-offwhite"> 
                            <div class="thumbnail"> 
                                <div id="carousel5" class="carousel slide" data-ride="carousel"> 
                                    <!-- Indicators -->                                     
                                    <ol class="carousel-indicators"> 
                                        <li data-target="#carousel5" data-slide-to="0" class="active"></li>                                         
                                        <li data-target="#carousel5" data-slide-to="1"></li>                                         
                                        <li data-target="#carousel5" data-slide-to="2"></li>                                         
                                    </ol>                                     
                                    <!-- Wrapper for slides -->                                     
                                    <div class="carousel-inner"> 
                                        <div class="item active"> 
                                            <img src="../../imagenes de prueba/img1.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 1 title</h3> 
                                                <p>Slide 1 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                        <div class="item"> 
                                            <img src="../../imagenes de prueba/img2.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 2 title</h3> 
                                                <p>Slide 2 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                        <div class="item"> 
                                            <img src="../../imagenes de prueba/img5.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 3 title</h3> 
                                                <p>Slide 3 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                    </div>                                     
                                    <!-- Controls -->                                     
                                    <a class="left carousel-control" href="#carousel5" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> 
                                    <a class="right carousel-control" href="#carousel5" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> 
                                </div>
                                <div class="caption"> 
                                    <h3>Area 3</h3> 
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> 
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> </p> 
                                </div>                                 
                            </div>                             
                        </div>
                        <div class="col-md-3 bg-offwhite"> 
                            <div class="thumbnail">
                                <div id="carousel6" class="carousel slide" data-ride="carousel"> 
                                    <!-- Indicators -->                                     
                                    <ol class="carousel-indicators"> 
                                        <li data-target="#carousel6" data-slide-to="0" class="active"></li>                                         
                                        <li data-target="#carousel6" data-slide-to="1"></li>                                         
                                        <li data-target="#carousel6" data-slide-to="2"></li>                                         
                                    </ol>                                     
                                    <!-- Wrapper for slides -->                                     
                                    <div class="carousel-inner"> 
                                        <div class="item active"> 
                                            <img src="../../imagenes de prueba/img5.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 1 title</h3> 
                                                <p>Slide 1 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                        <div class="item"> 
                                            <img src="../../imagenes de prueba/img8.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 2 title</h3> 
                                                <p>Slide 2 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                        <div class="item"> 
                                            <img src="../../imagenes de prueba/img2.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 3 title</h3> 
                                                <p>Slide 3 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                    </div>                                     
                                    <!-- Controls -->                                     
                                    <a class="left carousel-control" href="#carousel6" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> 
                                    <a class="right carousel-control" href="#carousel6" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> 
                                </div>                                 
                                <div class="caption"> 
                                    <h3>Thumbnail label</h3> 
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> 
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> </p> 
                                </div>                                 
                            </div>                             
                        </div>
                        <!-- /.isotope-gallery-container -->
                        <!-- /.isotope-gallery-container -->
                        <!-- /.isotope-gallery-container -->
                        <!-- /.isotope-gallery-container -->
                        <!-- /.isotope-gallery-container -->
                        <!-- /.isotope-gallery-container -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container -->
            </section>
            </form>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
