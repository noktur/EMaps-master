<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterAdmin.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.CiudadModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">

    <form id="form" runat="server">
  <section class="content-block content-2-3 bg-turquoise" style="border-bottom-right-radius:55px;border-bottom-left-radius:55px">
            <div class="container">
                
                <div class="col-sm-7 pull-left">
                    <h2 class="text-uppercase" style=" font-family:Satisfy ; font-size:1.3em;">Luego de que el sistema logro guardar el pais se recomienda enlazar la ciudad &nbsp;que desea agregar a el pais correspondiente</h2>
                </div>
                <div class="col-sm-4 pull-right">
                    <div class="input-group">
                        <% using (Html.BeginForm())
                       { %>   

                        <input type="text" class="form-control black" id="NombreCiudad1" name="NombreCiudad1" placeholder="Ingrese la ciudad">
                       <% } %> 
                        <span class="input-group-btn"><button class="btn bg-marina" onclick="BuscarCiudad()" type="button">Buscar</button></span>
                    </div>
                    <!-- /.input-group -->
                </div>
            </div>
            <!-- /.container -->
        </section>
        <div id="mapa" class="map min-height-500px"></div>
        <section id="content-2-6" class="content-block content-2-6 margin-top0 pad0 pad-bottom0 bg-turquoise">
            <div class="container text-center margin-top0 pad-bottom0 margin-bottom0 pad0 black">
                <% using (Html.BeginForm())
                       { %>  
                     <input type="text" class="form-control hidden" autocomplete="off" id="NombreCiudad" name="NombreCiudad" />
                    <input type="text" class="form-control hidden" id="NombrePais" name="NombrePais" >
                    <input type="text" class="form-control hidden" id="CoordenadaX" name="CoordenadaX" >
                    <input type="text" class="form-control hidden" id="CoordenadaY" name="CoordenadaY">
                    <p class="form-control-static pad-bottom0 margin-bottom0 white" style=" font-family:Satisfy ; font-size:1.5em;">Luego de encontrado el pais puede enviar los datos a almacenar y enlazar esos datos con una ciudad .</p>
                    <% } %>
                
                <button class="btn btn-outline btn-outline-xl outline-light black bg-tan" type="submit">Enviar Datos</button>
                
            </div>
           
           
            <!-- /.container -->
            
        </section>
         <%       if (Model == null) 
                 {     %>
        <section id="content-4-7" class="content-block content-3-7 " style="display:none" data-pg-collapsed>
        <div class="container" style="display:none">
            </div>
            </section>
            <% }
               else 
               {   %>
        <section id="content-3-7" class="content-block content-3-7 " data-pg-collapsed>
    <div class="container">
        <div class="col-sm-12">
            <div class="underlined-title" data-pg-collapsed>
                <h1 style=" font-family:Constantia; font-size:1.9em;">AQUI SE ENCUENTRAN LOS PAISES REGISTRADOS&nbsp;</h1>
                <hr>
                <h2>usted podra modificar o eliminar los datos de un pais seleccionando el correspondiente en la tabla que se encuentra debajo</h2>
            </div>
        </div>
        <div class="col-md-12 col-md-offset-0"> 
            <div class="table-responsive bg-offwhite deepocean" style=" border-top-left-radius:15px;border-top-right-radius:15px;border-bottom-left-radius:15px;border-bottom-right-radius:25px ">
                <table class="table margin-top0 margin-bottom0 bg-offwhite"> 
                    <thead> 
                        <tr> 
                            <th>#</th> 
                            <th>Codigo</th> 
                            <th>Nombre</th> 
                            <th>CoordenadaX</th> 
                            <th>CoordenadaY</th> 
                            <th> Modificar</th>
                            <th> Eliminar</th>
                        </tr>                         
                    </thead>   
                     <% using (Html.BeginForm())
                       { %>                    
                    <tbody> 
                       
                         <% 
                             
                            foreach(var item in Model.milista)
                            {%> 
                        <tr>                                    
                            <td></td>      
                            <td><%=item.UnPais.Nombre%></td> 
                            <td><%= item.Nombre%></td> 
                            <td><%= item.CoordenadaX%></td> 
                            <td><%= item.CoordenadaY%></td>                          
                            <td>       
                             <%= Html.ActionLink("ModificarCiudad", "ControlPaises", "Admin", new { NombreCiudad = item.Nombre }, new { @class = "btn btn-default btn-sm" })%>                
                            </td>                             
                            <td>                               
                            </td>                  
                        </tr> 
                         <% } %>                                 
                    </tbody>
                                 
                    <% } %>
                </table>
            </div>
        </div>
    </div>
            </section>
            <% } %>

        </form>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJiCs0vB2sIBGKclrmhydA4I9uekWOIvk&libraries=places"></script>
    
    
    <script type="text/javascript">

        //Declaramos las variables que vamos a user
        var map = null;
        var geocoder = null;
        var marker = null;
        var infoWindow = null;
        var address = null;
        var latLng = null;
        var country = null;
        var autocomplete;
        var countryRestrict;





        jQuery(document).ready(function () {
            //Asignamos al evento click del boton la funcion codeAddress
            //Inicializamos la función de google maps una vez el DOM este cargado
            initialize();
            Listar();


        });






        function initialize()
        {

            geocoder = new google.maps.Geocoder();

            var Pais;
            Pais = '<%=Session["Pais"]%>';
            var PaisJson = null;

            if (Pais != null)
            {
                PaisJson = jQuery.parseJSON(Pais);

                latLng = new google.maps.LatLng(PaisJson.CoordenadaX, PaisJson.CoordenadaY);
                var myOptions =
                {

                    center: latLng,//centro del mapa
                    zoom: 7,//zoom del mapa
                    mapTypeId: google.maps.MapTypeId.ROADMAP //tipo de mapa, carretera, híbrido,etc
                };
                //creamos el mapa con las opciones anteriores y le pasamos el elemento div
                map = new google.maps.Map(document.getElementById("mapa"), myOptions);


                jQuery('#NombrePais').val(PaisJson.NombrePais);


                var Pais = document.getElementById('NombrePais').value;
                var CodPais = PaisJson.CodPais;
                countryRestrict = { country: CodPais };
                autocomplete = new google.maps.places.Autocomplete(
         /** @type {!HTMLInputElement} */
                    (
             document.getElementById('NombreCiudad')), {
                 types: ['(cities)'],
                 componentRestrictions: countryRestrict
             }
                    );
                places = new google.maps.places.PlacesService(map);



            }
            else {
                alert("No se encontro la ciudad en la Base de Datos");
            }

        }


        function createMarker(name, lat, lng) {
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(lat, lng),
                map: map,
                draggable: false,
            });


        }


        function closeInfoWindow() {
            infoWindow.close();
        }



        function Listar() {
            var jsonlist = '<%= (Session["ListarCiudadesPais"] == null ? null : (string)Session["ListarCiudadesPais"])%>';
            var jsonconvertido = null;
            if (jsonlist != "") {
                jsonconvertido = jQuery.parseJSON(jsonlist);

                $.each(jsonconvertido, function (i, item) {

                    createMarker(item.NombreCiudad, item.CoordenadaX, item.CoordenadaY)

                    infoWindow = new google.maps.InfoWindow();

                    google.maps.event.addListener(marker, 'click', function () { openInfoWindow(marker, name); });


                    marcadores.push(marker);
                    marker.setMap(map);

                });

            }
            else {
                alert("No Hay Paises en la Base de Datos");
            }

        }


        function BuscarCiudad() {
            // Obtenemos la dirección y la asignamos a una variable
            address = $('#NombreCiudad').val();



            // Creamos el Objeto Geocoder
            geocoder = new google.maps.Geocoder();
            // Hacemos la petición indicando la dirección e invocamos la función
            // geocodeResult enviando todo el resultado obtenido
            geocoder.geocode({ 'address': address }, geocodeResult);
        };

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


        function geocodeResult(results, status) {


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

                var short_name = result[0].address_components.short_name;
                updatePosition(marker.getPosition());
                jQuery('#NombreCiudad').val(address);

            } else {
                // En caso de no haber resultados o que haya ocurrido un error
                // lanzamos un mensaje con el error
                alert("Geocoding no tuvo éxito debido a: " + status);
            }
        }





        //funcion que simplemente actualiza los campos del formulario
        function updatePosition(latLng) {

            jQuery('#CoordenadaX').val(latLng.lat());
            jQuery('#CoordenadaY').val(latLng.lng());
        }


    </script>

</asp:Content>
