<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterCliente.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">

     <section id="content-3-7" class="content-block content-3-7 bg-river pad-bottom10 pad20" data-pg-collapsed>
            <div class="container pad-bottom0 pad0 margin-top0">
                <div class="col-sm-12">
                    <div class="underlined-title">
                        <h1 class="orange text-left" style="font-size:3.5em;font-family:grand hote;">&nbsp;Detalle evento</h1>
                        <hr class="text-left bg-black">
                    </div>
                </div>
            </div>
        </section>
        <div id="map2" class="map min-height-500px"></div>
        <section class="content-block content-1-8">
            <div class="container">
                <ul class="nav nav-tabs text-center" role="tablist" id="myTab" style="border-bottom: 3px groove gray;">
                    <li class="active">
                        <a href="#tab1" role="tab" data-toggle="tab">Contacto</a>
                    </li>
                    <li >
                        <a href="#tab2" role="tab" data-toggle="tab">Reservacion</a>
                    </li>
                    <li >
                        <a href="#tab3" role="tab" data-toggle="tab">Localizacion</a>
                    </li>
                    <li>
                        <a href="#tab4" role="tab" data-toggle="tab">Informacion interna evento</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!-- /#tab1 -->
                    <div class="tab-pane fade in active" id="tab1" style="border-bottom:5px groove gray" data-pg-collapsed>
                        <div class="row">
                            <div class="col-md-offset-1 col-md-10">
                                <div class="underlined-title pad-bottom10">
                                    <h1 class="text-left orange" style="font-size:3.5em;font-family:grand hote;">Contact</h1>
                                    <hr class="text-left">
                                    <h2 class="text-left">realize un comentario o &nbsp;duda sobre un evento al instante</h2>
                                </div>
                                <p class="orange margin-top0 margin-bottom45 pad0" style="font-size:0.9em;font-family:constantia;">Aqui usted podra agregar los datos y el mensaje que desee solicitar sobre un evento el cual sera enviado al instante para su rapida respuesta.</p>
                                <div id="contact1" class="form-container">
                                    <div id="message1"></div>
                                    <form method="post" action="js/contact-form.php" name="contactform" id="contactform1">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group" style="border-top:2px groove gray;border-bottom:2px groove gray">
                                                    <input name="name" id="name1" type="text" value="" placeholder="Name" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group" style="border-top:2px groove gray;border-bottom:2px groove gray">
                                                    <input name="email" id="email1" type="text" value="" placeholder="Email" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group" style="border-top:2px groove gray;border-bottom:2px groove gray">
                                                    <input name="phone" id="phone1" type="text" value="" placeholder="Phone" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                        <div class="form-group">
                                            <textarea name="comments" id="comments1" class="form-control" rows="3" placeholder="Message"></textarea>
                                            <p class="small text-muted"><span class="guardsman">* All fields are required.</span> Once we receive your message we will respond as soon as possible.</p>
                                        </div>
                                        <div class="form-group text-center">
                                            <button class="btn btn-info" type="submit" id="cf-submit1" name="submit">Enviar</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- /.form-container -->
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab2" style="border-bottom:5px groove gray" data-pg-collapsed>
                        <div class="row">
                            <div class="col-md-offset-1 col-md-10">
                                <div class="underlined-title pad-bottom10">
                                    <h1 class="text-left orange" style="font-size:3.5em;font-family:grand hote;">Reservacion </h1>
                                    <hr class="text-left">
                                    <h2 class="text-left">realize la reservacion del evento elegido al instante</h2>
                                </div>
                                <p class="orange" style="font-size:0.9em;font-family:constantia;">Aqui podra agregar los datos pertinentes a la reservacion de una asisitencia a dicho evento </p>
                                <div id="contact" class="form-container">
                                    <div id="message"></div>
                                    <form method="post" action="js/contact-form.php" name="contactform" id="contactform">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group" style="border-top:2px groove gray;border-bottom:2px groove gray">
                                                    <input name="name" id="name" type="text" value="" placeholder="Name" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group" style="border-top:2px groove gray;border-bottom:2px groove gray">
                                                    <input name="email" id="email" type="text" value="" placeholder="Email" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group" style="border-top:2px groove gray;border-bottom:2px groove gray">
                                                    <input name="phone" id="phone" type="text" value="" placeholder="Phone" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                        <div class="form-group">
                                            <textarea name="comments" id="comments" class="form-control" rows="3" placeholder="Message"></textarea>
                                            <p class="small text-muted"><span class="guardsman">* All fields are required.</span> Once we receive your message we will respond as soon as possible.</p>
                                        </div>
                                        <div class="form-group text-center">
                                            <button class="btn btn-info" type="submit" id="cf-submit" name="submit">Enviar</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- /.form-container -->
                            </div>
                        </div>
                        <div class="row">
                            <!-- /.col -->
                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="map min-height-500px"></div>
                            </div>
                        </div>
                        <!-- /.row -->
                        <!-- /.row -->
                    </div>
                    <!-- /#tab2 -->
                    <div class="tab-pane fade" id="tab3" style="border-bottom:5px groove gray" data-pg-collapsed>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-0">
                                <div class="underlined-title pad-bottom10">
                                    <h1 class="text-left orange" style="font-size:3.5em;font-family:grand hote;">Localizacion</h1>
                                    <hr class="text-left">
                                    <h2 class="text-left">aqui usted podra localizar el evento segun distintos filtros que desee</h2>
                                </div>
                                <p class="orange" style="font-size:0.9em;font-family:constantia;">&nbsp;Aqui podra elegir como deseea llegar a dicho evento </p>
                                <div id="contact2" class="form-container">
                                    <div id="message2"></div>
                                    <form method="post" action="js/contact-form.php" name="contactform" id="contactform2">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <select class="form-control"> 
                                                        <option>Bycicle</option>                                                         
                                                        <option>Car</option>                                                         
                                                        <option>Walking</option>                                                         
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <button type="button" class="btn margin-top0 margin-bottom0 pad-bottom10 pad5 btn-warning">Localizar</button>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                    </form>
                                </div>
                                <div class="col-md-8">
                                    <div class="map min-height-500px"></div>                                     
                                </div>
                                <div class="col-md-4">
                                    <h3 class="orange" style="font-size:1.6em;font-family: Montserrat;">Detalle de localizacion</h3> 
                                </div>
                                <!-- /.form-container -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /#tab3 -->
                    <div class="tab-pane fade" id="tab4">
                        <div class="row">
                            <div class="col-md-12 col-md-offset-0">
                                <section class="content-block team-1 team-1-2">
                                    <div class="container">
                                        <div class="underlined-title">
                                            <h1 class="orange text-left" style="font-size:3.5em;font-family:grand hote;">Informacion Evento</h1>
                                            <hr>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 team-member-wrap" data-pg-collapsed>
                                                <div class="team-member" data-pg-collapsed>
                                                    <div class="team-details">
                                                        <h4 class="member-name">Nombre Evento</h4>
                                                        <p class="position">Diraccion&nbsp;</p>
                                                        <p>Descripcion Evento: </p>
                                                        <ul class="social social-dark" data-pg-collapsed="">
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-facebook"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-twitter"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-google-plus"></i></a>
                                                            </li>
                                                        </ul>
                                                        <!-- /.social -->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 team-member-wrap">
                                                <div class="team-member">
                                                    <div class="team-details">
                                                        <h4 class="member-name">Lugar Realizado</h4>
                                                        <p class="position">Ciudad , Pais</p>
                                                        <p>Descripcion Lugar: </p>
                                                        <ul class="social social-dark">
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-twitter"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-google-plus"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-facebook-f"></i></a>
                                                            </li>
                                                        </ul>
                                                        <!-- /.social -->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 team-member-wrap" data-pg-collapsed>
                                                <div class="team-member">
                                                    <div class="team-details">
                                                        <h4 class="member-name">Organizador</h4>
                                                        <p class="position">Email:&nbsp;</p>
                                                        <p>Fecha Nacimiento:</p>
                                                        <ul class="social social-dark" data-pg-collapsed="">
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-facebook"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-google-plus"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-twitter"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"></a>
                                                            </li>
                                                        </ul>
                                                        <!-- /.social -->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 team-member-wrap" data-pg-collapsed>
                                                <div class="team-member" data-pg-collapsed>
                                                    <div class="team-details">
                                                        <h4 class="member-name">Duracion</h4>
                                                        <p class="position">Fecha Inicio: </p>
                                                        <p>Fecha Fin:</p>
                                                        <ul class="social social-dark">
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-facebook"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-twitter"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><i class="fa fa-2x fa-google-plus"></i></a>
                                                            </li>
                                                        </ul>
                                                        <!-- /.social -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                    </div>
                                    <!-- /.container -->
                                </section>
                            </div>
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
