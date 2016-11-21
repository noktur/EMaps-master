<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterDueño.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.LugarModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">        
     
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJiCs0vB2sIBGKclrmhydA4I9uekWOIvk&libraries=places"></script>  
            
    </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <script type="text/javascript">


          //Declaramos las variables que vamos a user
          var map = null;
          var geocoder = null;
          var marker = null;
          var infoWindow = null;
          var address = null;
          var latLng = null;
          var country = null;

          jQuery(document).ready(function ()
          {
              //Asignamos al evento click del boton la funcion codeAddress
              //Inicializamos la función de google maps una vez el DOM este cargado
              initialize();

          });



          function initialize()
          {
              var latLng = new google.maps.LatLng(-34.397, -56.161792);

              //Definimos algunas opciones del mapa a crear
              var myOptions = {
                  center: latLng,//centro del mapa
                  zoom: 7,//zoom del mapa
                  mapTypeId: google.maps.MapTypeId.ROADMAP //tipo de mapa, carretera, híbrido,etc
              };
              //creamos el mapa con las opciones anteriores y le pasamos el elemento div
              map = new google.maps.Map(document.getElementById("mapa"), myOptions);

          }

          function ListarLugares()
          {
              var jsonlist = '<%= (Session["LugaresMapaJson"] == null ? null : (string)Session["LugaresMapaJson"])%>';
               var jsonconvertido = null;
               if (jsonlist != "") {
                   jsonconvertido = jQuery.parseJSON(jsonlist);

                   $.each(jsonconvertido, function (i, item) {

                       createMarker(item.Nombre, item.CoordenadaX, item.CoordenadaY)

                       infoWindow = new google.maps.InfoWindow();

                       google.maps.event.addListener(marker, 'click', function () { openInfoWindow(marker, name); });


                       marcadores.push(marker);
                       marker.setMap(map);

                   });

               }

               else
               {
                   alert("No Hay lugares en la Base de Datos");
               }

           }

           function createMarker(name, lat, lng) {
               var marker = new google.maps.Marker({
                   position: new google.maps.LatLng(lat, lng),
                   map: map,
                   draggable: false,
               });


           }

           function openInfoWindow(marker, content) {
               var markerLatLng = marker.getPosition();
               infoWindow.setContent([
               '<div >',
               'Las coordenadas del <b>',
               content,
               '</b> son:<br/>',
               markerLatLng.lat(),
               ', ',
               markerLatLng.lng(),
               '<br/>O puedes hacer click en cualquier otro lado para cerrarme.',
               '</div>'
               ].join(''));
               infoWindow.open(map, marker);
           }


           function closeInfoWindow() {
               infoWindow.close();
           }




          function IrController()
          {
              nombreCiudad = document.getElementById("seleccion").value();

              $.ajax({
                  url: "<%= Url.Action("CiudadObtenida", "Dueño")%>",
                  type: 'POST',
                  data: {
                      nombreCiudad: nombre,
                  },
                  contentType: 'application/json; charset=utf-8',
                  dataType: 'json',
                  success: function ()
                  {

                  }
              });
          }



           </script>
    <form id="form1" runat="server">
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
                    <% if(Session["ListaCiudad"] == null) 
                       { %>
                    <div class="row">
                         <div class="form-group">
                             
                         <select id="seleccion1" class="form-control" name="seleccion"> 
                           <option>No existen Ciudades</option>                                                                                       
                            </select>
                          </div>
                 </div>
                    <% 
                        } 
                        else 
                       { %>
                     <div class="row">
                         <div class="form-group">   
                             <% foreach(var item in Model.milistaCiudad ) { %>        
                        <select id="seleccion" class="form-control" name="seleccion"> 
                           <option value="<%= item.Nombre %>"><%= item.Nombre %></option>                                                                                       
                            </select>
                             <% } %>
                          </div>
                 </div>
                    <% } %>
                    

                    </div>
                    <div id="mapa" style="display:none" class="map min-height-500px">

                    </div>
                    <div id="contact" class="form-container">   
                        <% using (Html.BeginForm()) { %>     
                         <div class="row">
                                 
                                    <div class="form-group">
                                <input name="Direccion" id="Direccion" type="text" value="" placeholder="Ingrese la direccion deseada" class="form-control" />
                                        </div>
                                 </div>
                              <div class="col-sm-4">
                                    <div class="form-group">
                                <input name="Direccion" id="Nombre" type="text" value="" placeholder="Ingrese el nombre" class="form-control" />
                                        </div>
                                 </div>
                                 <div> 
                                    <p>Aqui arriba ingrese la direccion deseada y el sitema ubicara la direccion en el mapa y adjuntara las coordenadas a su lugar para poder ser ubicado por sus cliente.</p>
                                </div>
                             <div class="col-sm-12 text-center">
                                <button  class="btn btn-dark" type="button" id="cf-send1" name="buscar">Buscar</button>
                                </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <input name="Capacidad" id="Capacidad" type="number" disabled="disabled" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <input name="NombreCiudad" id="NombreCiudad" type="text" value="" placeholder="Ubicacion Ciudad" class="form-control hidden" />
                                    </div>                                     
                                </div>
                                <div class="col-sm-4" style="display:none">
                                    <div class="form-group">
                                        <input name="CoordenadaX" id="CoordenadaX" type="text" value="" placeholder="Coordenada X" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-4" style="display:none">
                                    <div class="form-group">
                                        <input name="CoordenadaX" id="CoordenadaY" type="text" value="" placeholder="Coordenada X" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea name="Descripcion" id="Descripcion" disabled="disabled" class="form-control" rows="3" placeholder="Agregue aqui la descripcion"></textarea>
                            </div>
                            <!-- /.row -->
                            <div class="form-group">
                                <button class="btn btn-primary" type="submit" id="cf-send" name="submit">Enviar</button>
                            </div>
                                 <% } %>
                         </div>
               
                    <!-- /.form-container -->
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
        <% if(Session["ListaLugares"] == null) { %>
        <section id="" class="content-block content-3-7" style=" display:none; background-color:#AED1DD   ">
            </section>
            <% }
               else
               { %>
            <section id="content-3-7" class="content-block content-3-7" style=" background-color:#AED1DD   ">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 text-center">
                        <h3 class="bg-clouds turquoise text-uppercase" style=" font-family:Satisfy ">Table Lugares</h3>                          
                    </div>
                </div>
                <div class="table-responsive">
                <table class="table"> 
                    <thead> 
                        <tr> 
                            <th>#</th> 
                            <th>Propietario</th> 
                            <th>Ciudad</th> 
                            <th>Descripcion</th> 
                            <th>Capacidad</th> 
                            <th>Direccion</th> 
                            <th>Action</th>
                        </tr>                         
                    </thead>  
                    <% using (Html.BeginForm()) { %>                   
                    <tbody> 
                        <% foreach( var item in Model.milistaLugar)
                           { %>
                        <tr> 
                            <td></td> 
                            <td><%= item.DueñoLugar.Nombre  %></td> 
                            <td><%= item.UbicacionLugar.Nombre %> <td> 
                            <td><%= item.Descripcion  %></td> 
                            <td><%= item.Capacidad  %></td> 
                            <td><%= item.Direccion  %></td> 
                            <td>
                                <button type="submit" class="btn btn-default" value="ENVIAR" name="ENVIAR" style="font-size:0.9em">SELECCIONAR</button>
                            </td>
                        </tr>
                           <% } %>
                    </tbody>
                 <% } %>
                </table>
                    </div>
            </div>
          
        </section>   
        <% } %> 
    </div>   
      </form>  
    
</asp:Content>
