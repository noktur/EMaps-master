<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">        
     
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJiCs0vB2sIBGKclrmhydA4I9uekWOIvk&libraries=places"></script>  
            
    </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <script type="text/javascript">


          //Declaramos las variables que vamos a user
          var map = null;

          jQuery(document).ready(function ()
          {
              //Asignamos al evento click del boton la funcion codeAddress
              //Inicializamos la función de google maps una vez el DOM este cargado
              initialize();

          });

          function initialize() {



              var latLng = new google.maps.LatLng(-34.397, -56.161792);

              //Definimos algunas opciones del mapa a crear
              var myOptions = {
                  center: latLng,//centro del mapa
                  zoom: 7,//zoom del mapa
                  mapTypeId: google.maps.MapTypeId.ROADMAP //tipo de mapa, carretera, híbrido,etc
              };
              //creamos el mapa con las opciones anteriores y le pasamos el elemento div
              map = new google.maps.Map(document.getElementById("map"), myOptions);

          }

           </script>
    <div data-spy="scroll" data-target="nav">
        <section class="content-block contact-1">
            <div class="container text-center">
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="underlined-title">
                        <h1>Get in Touch</h1>
                        <hr>
                        <h2>aqui usted puede administrar sus lugares<br></h2>
                    </div>
                    <p>Dentro de esta pagina usted podra ver el registro de sus lugares alquilados, reservados, crear un nuevo lugar, subir una galeria de imagenes&nbsp;a su edificio &nbsp;y adjuntar el plano de su sitio,<br></p>
                    <div id="map" class="map min-height-500px" style=" width: 980px;
    height:100%;" ></div>
                    <div id="contact" class="form-container">
                        <div id="message"></div>
                        <form id="form1">
                            <div class="form-group">
                                <input name="Direccion" id="Direccion" type="text" value="" placeholder="Ingrese la direccion deseada" class="form-control" />
                                <div> 
                                    <p>Aqui arriba ingrese la direccion deseada y el sitema ubicara la direccion en el mapa y adjuntara las coordenadas a su lugar para poder ser ubicado por sus cliente.</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <input name="Nombre" id="Nombre" type="text" value="" placeholder="Nombre" class="form-control" />
                                    </div>                                     
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <input name="Capacidad" id="Capacidad" type="text" value="" placeholder="Capacidad" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <input name="phone" id="phone" type="text" value="" placeholder="Direccion" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <input name="UbicacionCiudad" id="UbicacionCiudad" type="text" value="" placeholder="Ubicacion Ciudad" class="form-control" />
                                    </div>                                     
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <input name="CoordenadaX" visible="false" id="CoordenadaX" type="text" value="" placeholder="Coordenada X" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea name="Descripcion" id="Descripcion" class="form-control" rows="3" placeholder="Agregue aqui la descripcion"></textarea>
                                <p class="small text-muted"><span class="guardsman">* All fields are required.</span> Once we receive your message we will respond as soon as possible.</p>
                            </div>
                            <!-- /.row -->
                            <div class="form-group">
                                <button class="btn btn-primary" type="submit" id="cf-send" name="submit">Send</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.form-container -->
                </div>
                <!-- /.col-sm-10 -->
            </div>
            <!-- /.container -->
        </section>
        <section id="content-2-10" class="content-2-10 content-block">
            <div class="container bg-white border-box">
                <div class="col-md-8 col-xs-12 pull-left">
                    <h3><input type="file" class="form-control"></h3>
                    <h2 style=" font-size:1.5em;font-family:Roboto" class="deepocean text-center text-uppercase">Aqui puede subir el plano de su lugar si lo desea</h2>
                </div>
                <div class="col-md-3 col-xs-12 pull-right">
                    <button class="btn btn-primary btn-lg" style="background-color:blue;" type="submit" id="cf-submit" name="submit">Subir Plano</button>
                </div>
            </div>
        </section>
        <section id="content-3-7" class="content-block content-3-7" style=" background-color:#AED1DD   ">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 text-center">
                        <h3 class="bg-clouds turquoise text-uppercase" style=" font-family:Satisfy ">Table Lugares</h3>                          
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
                                <button type="submit" class="btn btn-default" value="ENVIAR" name="ENVIAR" style="font-size:0.9em">SELECCIONAR</button>
                            </td>
                        </tr>
                        <tr> 
                            <td>2</td> 
                            <td>Jacob</td> 
                            <td>Thornton</td> 
                            <td>@fat</td> 
                            <td>
                                <button type="button" class="btn btn-default" style="font-size:0.9em">Seleccionar</button>
                            </td>
                        </tr>                         
                        <tr> 
                            <td>3</td> 
                            <td>Larry</td> 
                            <td>the Bird</td> 
                            <td>@twitter</td> 
                            <td>
                                <button type="button" class="btn btn-default" style="font-size:0.9em">Seleccionar</button>
                            </td>
                        </tr>                         
                    </tbody>
                </table>
            </div>
        </section> 
    </div>     
</asp:Content>
