<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterCliente.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <form id="form1" runat="server">
    <section id="promo-3" class="content-block promo-3 bg-deepocean pad-bottom0 pad45 min-height-300px" data-pg-collapsed>
            <div class="container text-center white">
                <p class="white" style="font-size:4.2em;">UBICATREX</p>
                <h2 style="font-size:1.5em;font-family: calibri;">El software que le ayudara a encontrar cualquier evento</h2>
                <h3 class="offwhite" style="font-size:1.6em;font-family: Montserrat;">Debajo podra buscar un evento por distintos filtros que usted desee</h3>
            </div>
            <!-- /.container -->
        </section>
        <section class="content-block content-2-3 bg-pomegranate pad10 pad-bottom30" style="border-bottom-right-radius:100px;border-bottom-left-radius:100px" data-pg-collapsed>
            <div class="container pad0 pad-bottom0 margin-top0 margin-bottom0">
                <div class="white col-md-offset-0 col-md-12">
                    <h3 style="font-size:1.3em;font-family:constantia;" class="text-left">Marque la opcion por la cual desee filtrar su busqueda: </h3>
                    <div class="radio"> 
                        <label class="control-label" style="margin-left:15px;" data-pg-collapsed> 
                            <input type="radio" name="group" checked> Evento      
                        </label>                         
                        <label class="control-label" style="margin-left:15px;"> 
                            <input type="radio" name="group" checked>                Localizacion
                        </label>
                        <label class="control-label" style="margin-left:15px;"> 
                            <input type="radio" name="group" value="option1" checked>Categoria       
                        </label>
                    </div>                     
                </div>
                <div class="col-sm-4 col-sm-offset-0" style="margin-top:10px;" data-pg-collapsed>
                    <div class="input-group">
                        <select class="form-control"> 
                            <option>Evento 1</option>                             
                            <option>Evento 2</option>                             
                            <option>Evento 3</option>                             
                        </select>
                        <span class="input-group-btn"><button class="btn btn-primary" type="button">Buscar</button></span>
                    </div>
                    <!-- /.input-group -->
                </div>
                <div class="col-sm-4 hidden" style="margin-top:10px;" data-pg-collapsed>
                    <div class="input-group">
                        <select class="form-control" data-pg-collapsed> 
                            <option>1</option>                             
                            <option>2</option>                             
                            <option>3</option>                             
                        </select>
                        <span class="input-group-btn"><button class="btn btn-primary"  type="submit">send</button></span>
                    </div>
                    <!-- /.input-group -->
                </div>
                <div style="margin-top:10px;" class="col-sm-5 hidden" data-pg-collapsed>
                    <div class="input-group">
                        <select class="form-control"> 
                            <option>Evento 1</option>                             
                            <option>Evento 2</option>                             
                            <option>Evento 3</option>                             
                        </select>
                        <input type="text" id="CoordenadaActualX" class="form-control hidden">
                        <input type="text" id="CoordenadaActualY" class="form-control hidden">
                        <input type="text" id="CoordenadaEventoX" class="form-control hidden">
                        <input type="text" id="CoordenadaEventoY" class="form-control hidden">
                        <span class="input-group-btn"><button class="btn btn-primary" type="submit">localizar</button></span>
                       
                    </div>
                    <!-- /.input-group -->
                    
                </div>
            </div>
            <!-- /.container -->
        </section>
        <div class="map min-height-500px"></div>
        <section id="content-1-9" class="content-1-9 content-block" data-pg-collapsed>
            <div class="container">
                <div class="underlined-title">
                    <h1 class="moonlight text-center">Information event</h1>
                    <hr>
                    <h2>Aqui se desplegara la informacion relevante sobre el evento</h2>
                </div>
                <div class="row">
                    <div class="col-md-4 col-sm-12 col-xs-12 pad25" data-pg-collapsed>
                        <div class="col-xs-2">
                            <span class="fa fa-clock-o"></span>
                        </div>
                        <div class="col-xs-10">
                            <h4>Fecha Evento</h4>
                            <p>Retro chillwave YOLO four loko photo booth. Brooklyn kale chips, seitan hella 3 wolf moon slow-carb paleo.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 pad25" data-pg-collapsed>
                        <div class="col-xs-2">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="col-xs-10">
                            <h4>Organizador</h4>
                            <p>Retro chillwave YOLO four loko photo booth. Brooklyn kale chips, seitan hella 3 wolf moon slow-carb paleo.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 pad25" data-pg-collapsed>
                        <div class="col-xs-2">
                            <span class="fa fa-comments-o"></span>
                        </div>
                        <div class="col-xs-10">
                            <h4>Categoria</h4>
                            <p>Retro chillwave YOLO four loko photo booth. Brooklyn kale chips, seitan hella 3 wolf moon slow-carb paleo.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 pad25" data-pg-collapsed>
                        <div class="col-xs-2">
                            <span class="fa fa-search"></span>
                        </div>
                        <div class="col-xs-10">
                            <h4>Lugar realizacion</h4>
                            <p>Retro chillwave YOLO four loko photo booth. Brooklyn kale chips, seitan hella 3 wolf moon slow-carb paleo.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 pad25" data-pg-collapsed>
                        <div class="col-xs-2">
                            <span class="fa fa-ticket"></span>
                        </div>
                        <div class="col-xs-10">
                            <h4>Precio entradas</h4>
                            <p>Retro chillwave YOLO four loko photo booth. Brooklyn kale chips, seitan hella 3 wolf moon slow-carb paleo.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 pad25" data-pg-collapsed>
                        <div class="col-xs-2">
                            <span class="fa fa-leanpub"></span>
                        </div>
                        <div class="col-xs-10">
                            <h4>Areas internas</h4>
                            <p>Retro chillwave YOLO four loko photo booth. Brooklyn kale chips, seitan hella 3 wolf moon slow-carb paleo.</p>
                        </div>
                    </div>
                    <div class="col-md-2 col-md-offset-5">
                        <button type="button" class="btn btn-warning btn-lg">More Info</button>                                                  
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>
    </form>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
