﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterDueño.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.LugarModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">        
     
       <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJiCs0vB2sIBGKclrmhydA4I9uekWOIvk&libraries=places"></script> 
    
    
     <script type="text/javascript">


         //Declaramos las variables que vamos a usar
         var map = null; 
         var geocoder = null;
         var marker = null;
         var infoWindow;
         var address;
         var latLng = null;
         var marcadoresBD = [];
         var posi;
         var country = null;
         var Ciudad;
         


        
         function CargarSelect()
         {
             var ciudades = '<%= Session["CiudadesJson"]%>';

             var jsonconvertido = null;
             if (ciudades != "")
             {


                 jsonconvertido = jQuery.parseJSON(ciudades);

                 var select = document.getElementById("seleccion");

                 select.options[i] = new Option("Seleccione una Ciudad");
                 for (var i = 0; i < jsonconvertido.length; i++)
                 {
                     
                     select.options[i] = new Option(jsonconvertido[i].Nombre,jsonconvertido[i].Nombre);
                 }


             }
         }



         
         function BuscarDireccion()
         {
             // Obtenemos la dirección y la asignamos a una variable
             var direccion = $('#Direccion1').val();

             // Creamos el Objeto Geocoder
             geocoder = new google.maps.Geocoder();
             // Hacemos la petición indicando la dirección e invocamos la función
             // geocodeResult enviando todo el resultado obtenido
             geocoder.geocode({ 'address': direccion }, geocodeResult1);

         };

         function geocodeResult1(results, status) {


             // Verificamos el estatus
             if (status == 'OK') {
                 // Si hay resultados encontrados, centramos y repintamos el mapa
                 // esto para eliminar cualquier pin antes puesto
                 var mapOptions = {
                     center: results[0].geometry.location,
                     mapTypeId: google.maps.MapTypeId.ROADMAP,

                 };


                 map = new google.maps.Map($("#mapa").get(0), mapOptions);
                 // fitBounds acercará el mapa con el zoom adecuado de acuerdo a lo buscado
                 map.fitBounds(results[0].geometry.viewport);
                 // Dibujamos un marcador con la ubicación del primer resultado obtenido
                 var markerOptions = {
                     position: results[0].geometry.location,
                 }
                 marker = new google.maps.Marker(markerOptions);
                 marker.setMap(map);


                 updatePosition(marker.getPosition());

                 jQuery('#Direccion').val(results[0].address_components[0].short_name);

                 

             } else {
                 // En caso de no haber resultados o que haya ocurrido un error
                 // lanzamos un mensaje con el error
                 alert("Geocoding no tuvo éxito debido a: " + status);
             }
         }





         jQuery(document).ready(function () {
             //Asignamos al evento click del boton la funcion codeAddress
             //Inicializamos la función de google maps una vez el DOM este cargado
             
             
                 CargarSelect();             
                 initialize();


         });

         


         function RecuperarCiudad(cc)
         {
             var geocoder = null;
             geocoder= new google.maps.Geocoder();

            
            
             Ciudad = cc;
            var CiudadJson = null;

            if (Ciudad != null) 
            {
                CiudadJson = jQuery.parseJSON(Ciudad);

                jQuery('#NombreCiudad').val(CiudadJson.Nombre);


                var ciudad = CiudadJson.Nombre;

                // Creamos el Objeto Geocoder
                geocoder = new google.maps.Geocoder();
                // Hacemos la petición indicando la dirección e invocamos la función
                // geocodeResult enviando todo el resultado obtenido
                geocoder.geocode({ 'address': ciudad }, geocodeResult2);


                function geocodeResult2(results, status)
                {

                    // Verificamos el estatus
                    if (status == 'OK') {
                        // Si hay resultados encontrados, centramos y repintamos el mapa
                        // esto para eliminar cualquier pin antes puesto
                        var cityB = new google.maps.LatLngBounds(results[0].geometry.viewport.getSouthWest(),
                            results[0].geometry.viewport.getNorthEast());

                        // fitBounds acercará el mapa con el zoom adecuado de acuerdo a lo buscado
                        // Dibujamos un marcador con la ubicación del primer resultado obtenido
                        var centro = results[0].geometry.location;


                        var options = {
                            bounds: cityB,
                            types: ['geocode'],
                            componentRestrictions: { country: CiudadJson.UnPais.CodPais },
                            center: centro,
                        };



                        var input = document.getElementById('Direccion1');

                        var autocomplete = new google.maps.places.Autocomplete(input, options);

                    } else {
                        // En caso de no haber resultados o que haya ocurrido un error
                        // lanzamos un mensaje con el error
                        alert("Geocoding no tuvo éxito debido a: " + status);
                    }
                }

        

            }
            else
            {
                alert("No existe la ciudad")
            }
         }

         function initialize()
         {


             var latLng = new google.maps.LatLng(-34.397, -56.161792);

             //Definimos algunas opciones del mapa a crear
             var myOptions = {
                 center: latLng,//centro del mapa
                 zoom: 4,//zoom del mapa
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

                      var posi = new google.maps.LatLng(item.CoordenadaX, item.CoordenadaY);


                      var marker = new google.maps.Marker({
                          map: map,
                          titulo: item.Nombre,
                          position: posi,
                          draggable: false

                      });

                      marcadoresBD.push(marker);


                      google.maps.event.addListener(map, 'click', function () {
                          closeInfoWindow();

                      });


                      google.maps.event.addListener(marker, 'click', function () {
                          openInfoWindow(marker, item.Nombre);
                      });

                  });

              }

              else {
                  alert("No Hay lugares en la Base de Datos");
              }

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




          $('#seleccion').on('change', function ()
          {

              var nombreCiudad = document.getElementById("seleccion");

              var valor = nombreCiudad.options[nombreCiudad.selectedIndex].value;


              var array = { nombre: valor };

              $.ajax({
                  url: '/Dueño/CiudadObtenida',
                  type: 'POST',       
                  dataType: 'json',
                  data: array,
                  traditional:true,
                  success: function (data) 
                  {

                      RecuperarCiudad(data);

                  }
              });
          });


         function updatePosition(latLng) {

             jQuery('#CoordenadaX').val(latLng.lat());
             jQuery('#CoordenadaY').val(latLng.lng());
         }


         function showPicture(input) {
             //$("#OriginalPreviewFondo2").attr('style', 'display:none;');
             $("#preview").attr('style', '');
             ImageFondo2Aux = input;
         }

         function showerrorfondo(response) {
             document.getElementById('lblRespuestaFondo').innerHTML = response['message'];
         }

         function obtenerImagenFondo() {
             var data = new FormData();
             var files = $("#uploadFondoInput").get(0).files;
             if (files.length > 0) {
                 data.append("Images", files[0]);
             }
             $.ajax({
                 contentType: false,
                 processData: false,
                 dataType: "json",
                 accept: "json",
                 type: "POST",
                 url: "<%=Url.Action("GuardarImagenFondo")%>",
                 data: data,
                 success: function (json) {
                     showerrorfondo(json)
                 },
                 error: function (response) {
                     showerrorfondo(response)
                 }
             });

         }

           </script> 
            
    </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <form id="form1" runat="server"> 
    <div data-spy="scroll" data-target="nav"> 
        
        <section class="content-block contact-1" style="padding-bottom:5px;background-color: whitesmoke; ">
            
            <div class="container text-center">
                    <div class="underlined-title">
                        <h1>Get in Touch</h1>
                        <hr>
                        <h2>aqui usted puede administrar sus lugares<br></h2>
                    </div>
                    <div class="row">
                         <p>Dentro de esta pagina usted podra ver el registro de sus lugares alquilados, reservados, crear un nuevo lugar, subir una galeria de imagenes&nbsp;a su edificio &nbsp;y adjuntar el plano de su sitio</p>
                      </div>  
                <div class="col-md-12">
                    <div class="col-md-8">
                    <div id="mapa" class="map min-height-300px">
                     </div>                  
                    </div>
                    <div class="col-md-4 right">
                        <div id="Esconder">               
                         <div class="form-group">  
                                                                        
                        <select id="seleccion"  class="form-control" name="seleccion">
                                                       
                            <option value="0">Seleccione una ciudad</option>                                                                                      
                            </select>
                             
                          </div>
                        <div class="form-group" id="DivDireccion">
                            <p>Aqui podra ingresar la direccion a buscar en la ciudad correspondiente </p>
                             <div id="elementosBuscar" class="input-group">
                                <input type="text" class="form-control" name="Direccion1" id="Direccion1"  />
                                <span class="input-group-btn"><button class="btn btn-danger" onclick="BuscarDireccion()"  type="button">Buscar</button></span>
                                   </div>
                            </div>

                           </div>


                        <% using (Html.BeginForm()) { %>                  
                            
                        <div class="form-group">
                               <input name="Direccion" id="Direccion" type="text" class="form-control hidden" /> 
                          </div>

                        <div class="form-group">
                               <input name="NombreCiudad" id="NombreCiudad" type="text"  class="form-control hidden" /> 
                          </div>
                        <div class="form-group">
                                        <input name="Nombre" id="Nombre" type="text" placeholder="Ingrese el nombre ......" class="form-control"/>     
                                      
                                </div>  
                            <div class="form-group">
                                        <input name="Capacidad" id="Capacidad" min="0" type="number" class="form-control"/>     
                                      
                                </div>   
                             <div class="form-group">
                                <textarea name="Descripcion" id="Descripcion" class="form-control" rows="3" placeholder="Agregue aqui la descripcion....."></textarea>
                            </div>
                                
                                 <div class="form-group hidden">
                                        <input name="CoordenadaX" id="CoordenadaX" type="text" value="" placeholder="Coordenada X..." class="form-control no-shadow" />
                                     </div>
                                     <div class="form-group hidden">
                                        <input name="CoordenadaY" id="CoordenadaY" type="text" value="" placeholder="Coordenada Y..." class="form-control no-shadow" />
                                    
                                     </div> 
                         <div class="col-md-12 text-center">          
                <input class="btn btn-lg btn-green" style="" type="submit" value="Guardar lugar" name="action"/>
                  </div> 


                        <% } %>

                        
                            </div>
                     
                </div>


                </div>
           
                    <!-- /.form-container -->
                <!-- /.col-sm-10 -->
        
            <!-- /.container -->
        </section>
      
           <section id="content-3-4" class="content-block content-3-4" style="padding-top:15px; padding-bottom:0px; background-color: whitesmoke; ">
    <div class="container" style="background-color: whitesmoke;">
        <% if(Session["Fotos"] == null) { %>
        <div class="col-md-12"  style="background-color: whitesmoke;">
                <div class="col-md-7" style="background-color: whitesmoke;">
                <% using (Html.BeginForm("AgregarFoto", "Dueño", FormMethod.Post, new { enctype = "multipart/form-data" })) 
                    {  %>
                <div class="thumbnail" style="border:none;background-color: whitesmoke;">
                    <div class="caption"> 
                    <h3>Agregue fotos a su lugar</h3> 
                        <div class="input-group"> 
                                <span class="input-group-addon"><i class="fa fa-file-image-o"></i></span> 
                                <input type="file" id="image1" name="image1" accept="image/gif, image/jpeg, image/png" class="form-control"> 
                         
                        </div>
                        <p>Aqui podra agregar cada una de sus fotos del lugar de manera de brindar un mayor servicio a sus clientes.</p>
                        <button type="submit" class="btn btn-primary" name="submit1">Agregar foto</button>
                    </div>                                          
                </div> 
                    <% } %>                            
            </div>
            </div>
        <% } else { %>
         <div class=" col-md-7" style="background-color: whitesmoke;">
                <div id="Carousel-FotosLugar" style="height:380px;" class="carousel slide" data-ride="carousel" data-pg-collapsed> 
                    <!-- Indicators -->                     
                    <ol class="carousel-indicators"> 
                        <%  List<EntidadesCompartidas.FotosLugar> foto=(List<EntidadesCompartidas.FotosLugar>)Session["Fotos"];
                            for(int i=0;i<foto.Count;i++) 
                            { 
                                %>
                     <% if(i == 0)
                        { %>
                                <li data-target="#Carousel-FotosLugar" data-slide-to="0" class="active"></li>   
                       <% }
                      else { %>                 
                                <li data-target="#Carousel-FotosLugar" data-slide-to="<%= i %>"></li> 
                         <% } %>                  
                        <% } %>                        
                    </ol>                     
                    <!-- Wrapper for slides -->                     
                    <div class="carousel-inner" style="height:380px;"> 
                      <%  List<EntidadesCompartidas.FotosLugar> foto1=(List<EntidadesCompartidas.FotosLugar>)Session["Fotos"];
                            for(int i=0;i<foto1.Count;i++) 
                            { %>
                        <% if(i==0) { %>
                        <div class="item active"> 
                            <img width="635" height="200"  src="data:image;base64,<%=System.Convert.ToBase64String(foto1[0].Imagen)%>"  /> 
                            <div class="carousel-caption"> 
                                <h3><%= foto1[0].NombreFoto  %></h3> 
                            </div>                             
                        </div>
                        <% } else { %> 
                              <div class="item"> 
                            <img width="635"  src="data:image;base64,<%=System.Convert.ToBase64String(foto1.ElementAt(i).Imagen)%>" /> 
                            <div class="carousel-caption"> 
                                <h3><%= foto1.ElementAt(1).NombreFoto  %></h3> 
                            </div>                             
                        </div>
                        <% } %>
                        <% } %>                                         
                    </div>                     
                    <!-- Controls -->                     
                    <a class="left carousel-control" href="#Carousel-FotosLugar" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> 
                    <a class="right carousel-control" href="#Carousel-FotosLugar" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> 
                </div> 
                             
            </div>
              
            <div class="col-md-4" style="border:solid whitesmoke 2px">
                <% using (Html.BeginForm("AgregarFoto", "Dueño", FormMethod.Post, new { enctype = "multipart/form-data" })) 
                    {  %>
                <div class="thumbnail" style="border:none">
                    <div class="caption"> 
                        <h3>Agregue fotos a su lugar</h3> 
                        <div class="input-group"> 
                                <span class="input-group-addon"><i class="fa fa-file-image-o"></i></span> 
                                <input type="file" id="image2" required="required"   name="image1" accept="image/gif, image/jpeg, image/png" class="form-control"> 
                            </div>
                        <p>Aqui podra agregar cada una de sus fotos del lugar de manera de brindar un mayor servicio a sus clientes.</p>
                        <button type="submit" class="btn btn-primary" name="submit1">Agregar foto</button>
                    </div>                                          
                </div>  
                <% } %>               
            </div>
        <% } %> 
            <!-- /.column -->
        </div>
        <!-- /.row -->
    <!-- /.container -->
</section>                        
             

 <section id="content-2-10" class="content-3-4 content-block" style="padding-bottom:20px;">
            <div class="container">
                <div class="col-md-12" style="border:solid whitesmoke 2px">
                 <% using (Html.BeginForm("SubirPlano", "Dueño", FormMethod.Post, new { enctype = "multipart/form-data" })) 
                    {  %>
                <div class="col-md-8">
                    <h3><input type="file" id="image" name="image" accept="image/gif, image/jpeg, image/png" class="form-control"/></h3>
                    <h2 style=" font-size:1.5em;font-family:Roboto" class="deepocean text-center text-uppercase">Aqui puede subir el plano de su lugar si lo desea</h2>
                </div>
                <div class="col-md-3">
                    <button class="btn btn-primary btn-lg" style="background-color:blue;" type="submit" id="cf-submit" name="submit">Subir Plano</button>
                </div>
                <% } %>
            </div>
                </div>
        </section>
</div>  
       </form> 
       
    
</asp:Content>
