<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterOrganizador.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <section class="content-block gallery-1 gallery-1-2 margin-top0 margin-bottom0 pad-bottom0 pad0">
                <div class="container">
                    <div class="underlined-title">
                        <h1 class="text-uppercase">UNA SELECCION DE LOS MEJORES LUGARES</h1>
                        <hr>
                        <h2>Hand-picked just for you</h2>
                    </div>
                    <ul class="filter">
                        <li class="active">
                            <a href="#" data-filter="*">Lugares para alquilar</a>
                        </li>
                    </ul>
                    <!-- /.gallery-filter -->
                    <div class="row">
                        <div class="col-md-3"> 
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
                                    <h3>Thumbnail label</h3> 
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> 
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> </p> 
                                </div>                                 
                            </div>                             
                        </div>
                        <!-- /.isotope-gallery-container -->
                        <div class="col-md-3"> 
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
                                    <h3>Thumbnail label</h3> 
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> 
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> </p> 
                                </div>                                 
                            </div>                             
                        </div>
                        <!-- /.isotope-gallery-container -->
                        <div class="col-md-3"> 
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
                                    <h3>Thumbnail label</h3> 
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> 
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> </p> 
                                </div>                                 
                            </div>                             
                        </div>
                        <!-- /.isotope-gallery-container -->
                        <div class="col-md-3"> 
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
                        <div class="col-md-3"> 
                            <div class="thumbnail">
                                <div id="carousel7" class="carousel slide" data-ride="carousel"> 
                                    <!-- Indicators -->                                     
                                    <ol class="carousel-indicators"> 
                                        <li data-target="#carousel7" data-slide-to="0" class="active"></li>                                         
                                        <li data-target="#carousel7" data-slide-to="1"></li>                                         
                                        <li data-target="#carousel7" data-slide-to="2"></li>                                         
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
                                            <img src="alt=""../../imagenes de prueba/img8.jpg" /> 
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
                                    <a class="left carousel-control" href="#carousel7" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> 
                                    <a class="right carousel-control" href="#carousel7" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> 
                                </div>                                 
                                <div class="caption"> 
                                    <h3>Thumbnail label</h3> 
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> 
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> </p> 
                                </div>                                 
                            </div>                             
                        </div>
                        <!-- /.isotope-gallery-container -->
                        <div class="col-md-3"> 
                            <div class="thumbnail">
                                <div id="carousel4" class="carousel slide" data-ride="carousel"> 
                                    <!-- Indicators -->                                     
                                    <ol class="carousel-indicators"> 
                                        <li data-target="#carousel4" data-slide-to="0" class="active"></li>                                         
                                        <li data-target="#carousel4" data-slide-to="1"></li>                                         
                                        <li data-target="#carousel4" data-slide-to="2"></li>                                         
                                    </ol>                                     
                                    <!-- Wrapper for slides -->                                     
                                    <div class="carousel-inner"> 
                                        <div class="item active"> 
                                            <img src="../../imagenes de prueba/img3.jpg" alt="" /> 
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
                                            <img src="../../imagenes de prueba/img6.jpg" alt="" /> 
                                            <div class="carousel-caption"> 
                                                <h3>Slide 3 title</h3> 
                                                <p>Slide 3 description.</p> 
                                            </div>                                             
                                        </div>                                         
                                    </div>                                     
                                    <!-- Controls -->                                     
                                    <a class="left carousel-control" href="#carousel4" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> 
                                    <a class="right carousel-control" href="#carousel4" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> 
                                </div>                                 
                                <div class="caption"> 
                                    <h3>Thumbnail label</h3> 
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> 
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> </p> 
                                </div>                                 
                            </div>                             
                        </div>
                        <!-- /.isotope-gallery-container -->
                        <div class="col-md-3"> 
                            <div class="thumbnail">
                                <div id="carousel3" class="carousel slide" data-ride="carousel"> 
                                    <!-- Indicators -->                                     
                                    <ol class="carousel-indicators"> 
                                        <li data-target="#carousel3" data-slide-to="0" class="active"></li>                                         
                                        <li data-target="#carousel3" data-slide-to="1"></li>                                         
                                        <li data-target="#carousel3" data-slide-to="2"></li>                                         
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
                                            <img src="../../imagenes de prueba/img7.jpg" alt="" /> 
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
                                    <a class="left carousel-control" href="#carousel3" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> 
                                    <a class="right carousel-control" href="#carousel3" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> 
                                </div>                                 
                                <div class="caption"> 
                                    <h3>Thumbnail label</h3> 
                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> 
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> </p> 
                                </div>                                 
                            </div>                             
                        </div>
                        <!-- /.isotope-gallery-container -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container -->
            </section>
            <div class="content-block contact-3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <h2 class="text-uppercase" style="font-size:1.6em;font-family:Lora;">Aqui puedes llenar los datos para el alquiler de el lugar elegido</h2>
                            <p>A continuacion podras ver un mapa de donde esta ubicado el lugar elegido.</p>
                            <img class="img-responsive map-img" src="http://placehold.it/600x300">
                        </div>
                        <div id="contact" class="form-container">
                            <fieldset>
                                <div id="message"></div>
                                <form id="Form1">
                                    <div class="form-group">
                                        <div class='input-group date margin-bottom25' id='datetimepicker6'>
                                            <input type='datetime-local' class="form-control">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                        </div>
                                        <div class="form-group">
                                            <div class='input-group date' id='datetimepicker7'>
                                                <input type='datetime-local' class="form-control" />
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="email" id="email" type="text" value="" class="form-control" placeholder="Fecha Reservacion" readonly="readonly" />
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-primary" type="submit" id="cf-submit" name="submit">Send</button>
                                    </div>
                                </form>
                            </fieldset>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container -->
            </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
