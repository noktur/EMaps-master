﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.LugarModel>" %>

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

                 select.options[0] = new Option("Seleccione una Ciudad");
                 for (var i = 1; i < jsonconvertido.length; i++)
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
                
                
             var jsonlist = '<%= (Session["LugarJson"] == null ? null : (string)Session["LugarJson"])%>';

             var item = null;
             if (jsonlist != 'null')
             {

                 item = jQuery.parseJSON(jsonlist);

                 var latLng = new google.maps.LatLng(item.CoordenadaX,item.CoordenadaY);

                 //Definimos algunas opciones del mapa a crear
                 var myOptions = {
                     center: latLng,//centro del mapa
                     zoom: 4,//zoom del mapa
                     mapTypeId: google.maps.MapTypeId.ROADMAP //tipo de mapa, carretera, híbrido,etc
                 };
                 //creamos el mapa con las opciones anteriores y le pasamos el elemento div
                 map = new google.maps.Map(document.getElementById("mapa"), myOptions);


                 var posi = new google.maps.LatLng(item.CoordenadaX, item.CoordenadaY);


                 var marker = new google.maps.Marker
                ({
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

                 jQuery('#CoordenadaX').val(item.CoordenadaX);
                 jQuery('#CoordenadaY').val(item.CoordenadaY);
                 jQuery('#Descripcion').val(item.Descripcion);
                 jQuery('#Nombre').val(item.Nombre);
                 jQuery('#NombreCiudad').val(item.NombreCiudad);
                 var span = document.getElementById("span");
                 span.style.display = '';
                 span.style.visibility = 'none';
                 var btn = document.getElementById("btnBuscar");
                 btn.style.display = '';
                 btn.style.visibility = 'none';
                 jQuery('#Direccion').val(item.Direccion);
                 jQuery('#Direccion1').val(item.Direccion);
                 CargarSelect();



             }
             else
             {

                 CargarSelect();
                 initialize();
             }


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


         function showPicture(input)
         {
             //$("#OriginalPreviewFondo2").attr('style', 'display:none;');
             $("#preview").attr('style', '');
             ImageFondo2Aux = input;
         }

         function showerrorfondo(response)
         {
             document.getElementById('lblRespuestaFondo').innerHTML = response['message'];
         }

         function obtenerImagenFondo()
         {
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
                    <div style="height:450px; width:100%;" class="templatemo-contact-map" id="mapa">
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
                                <span id="span"  class="input-group-btn"><button id="btnBuscar" class="btn btn-danger" onclick="BuscarDireccion()"  type="button">Buscar</button></span>
                                   </div>
                            </div>

                           </div>
                          
                        <div>
                         <% using (Html.BeginForm("GuardarLugar","Dueño", FormMethod.Post, new { enctype = "multipart/form-data" }))                           
                           { %>          
                             <form id="form1" runat="server">          
                        <div class="form-group">
                               <input name="Direccion" id="Direccion" type="text" class="form-control hidden" /> 
                          </div>

                        <div class="form-group">
                               <input name="NombreCiudad" id="NombreCiudad" type="text"  class="form-control hidden" /> 
                          </div>
                        <div class="form-group">
                                        <input name="Nombre" required="required" id="Nombre" type="text" pattern="[a-z]{1,15}"
        title="el nombre del lugar solo puede contener letras" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar un nombre')" placeholder="Ingrese el nombre ......" class="form-control"/>     
                                </div>  
                             <div class="form-group">
                                <textarea name="Descripcion" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar una descripcion)" id="Descripcion" class="form-control" rows="3" placeholder="Agregue aqui la descripcion....."></textarea>
                            </div>                   
                                 <div class="form-group hidden">
                                        <input name="CoordenadaX" id="CoordenadaX" type="text" value="" placeholder="Coordenada X..." class="form-control no-shadow" />
                                     </div>
                                     <div class="form-group hidden">
                                        <input name="CoordenadaY" id="CoordenadaY" type="text" value="" placeholder="Coordenada Y..." class="form-control no-shadow" />
                                    
                                     </div> 
                                     <div class="form-group">                   
                                         <input type="file" id="image" name="image" accept="image/gif, image/jpeg, image/png" class="form-control"/>
                                     </div> 
                              <div class="form-group">        
                               <button type="submit" class="btn btn-danger white" value="Guardar"/>
                                </div> 
                                  </form>      
                        <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                                        </section>
                     <div class="pull-right" style="padding-right:100px;">
      <a href="../Dueño/GalleryLugar" type="button" class="btn btn-lg bg-cyan-a100 btn-floating" title="Agregar Imagenes"><i   class="fa fa-image"></i></a>
        <a href="#" type="button" class="btn btn-lg bg-cyan-a100 btn-floating" title="Dibujar Plano"><i class="fa fa-building"></i></a>
       </div>
        </div>                     
       
       
    
</asp:Content>
