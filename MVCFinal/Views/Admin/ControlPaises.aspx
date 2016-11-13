<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterAdmin.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.PaisModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formulario" runat="server">
      
    <section class="content-block content-2-3 bg-deepocean" style="border-bottom-right-radius:55px;border-bottom-left-radius:55px">
            <div class="container">
                <div class="col-sm-7 pull-left">
                    <h2 class="text-uppercase" style=" font-family:Satisfy ; font-size:1.5em;">Aqui podra gestionar las ubicaciones internas de su sistema</h2>
                </div>
                <div class="col-sm-4 pull-right">

                     <% using(Html.BeginForm())
                       { %>    
                                            
                        <input type="text" class="form-control" autocomplete="off" id="NombrePais1" name="NombrePais1" />
                       <% }   %>

                        <input class="btn btn-primary" onclick="Buscar()" value="Buscar" type="button" />
                    
                    <!-- /.input-group -->
                </div>
            </div>
            <!-- /.container -->
        </section>
        <div id="mapa" class="map min-height-500px"></div>
        <section id="content-2-6" class="content-block content-2-6 margin-top0 margin-bottom0 pad0 pad-bottom0 bg-offwhite">
             <div class="container text-center margin-top0 pad-bottom0 margin-bottom0 pad0 black">
                 <% using (Html.BeginForm())
                       { %>  
                 <input type="text" class="form-control hidden" autocomplete="off" id="NombrePais" name="NombrePais" />
                   <input type="text" class="form-control hidden "  autocomplete="off" id="CoordenadaX" name="CoordenadaX"  />
                    <input type="text" class="form-control hidden"  autocomplete="off" id="CoordenadaY" name="CoordenadaY" />
                    <input type="text" class="form-control hidden" autocomplete="off" id="CodPais" name="CodPais" />
                
                    <p class="form-control-static black pad-bottom0 margin-bottom0" style=" font-family:'Baskerville Old Face' ; font-size:1.2em;">Luego de encontrado el pais puede enviar los datos a almacenar y enlazar esos datos con una ciudad .</p>
                
                    <input class="btn btn-outline btn-outline-xs outline-light black bg-sunflower" value="Enviar Datos" name="action" type="submit" />
                     <% }  %>
                
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
                            <td><%=item.CodPais%></td> 
                            <td><%= item.Nombre%></td> 
                            <td><%= item.CoordenadaX%></td> 
                            <td><%= item.CoordenadaY%></td>                          
                            <td>       
                             <%= Html.ActionLink("ModificarCiudad", "ControlPaises", "Admin", new { NombrePais = item.Nombre }, new { @class = "btn btn-default btn-sm" })%>                
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
        var marker;
        var nuevosmarcadores = [];
        var marcadoresBD = [];
        var infoWindow = null;
        var address;

        function limpiar_marcadores(lista) {
            for (i in lista) {
                lista[i].setMap(null);
            }
        }



        jQuery(document).ready(function ()
        {
            //Asignamos al evento click del boton la funcion codeAddress
            //Inicializamos la función de google maps una vez el DOM este cargado
            initialize();


            var input = document.getElementById('NombrePais1');

            autocomplete = new google.maps.places.Autocomplete(input);
        });
        





        function initialize() {


            geocoder = new google.maps.Geocoder();


            var latLng = new google.maps.LatLng(-34.397, -56.161792);

            //Definimos algunas opciones del mapa a crear
            var myOptions = {
                center: latLng,//centro del mapa
                zoom: 5,//zoom del mapa
                mapTypeId: google.maps.MapTypeId.ROADMAP //tipo de mapa, carretera, híbrido,etc
            };
            //creamos el mapa con las opciones anteriores y le pasamos el elemento div
            map = new google.maps.Map(document.getElementById("mapa"), myOptions);

        }





        function closeInfoWindow() {
            infoWindow.close();
        }

        function Listar() {
            var jsonlist = '<%= (string)Session["ListaPaises"]%>';
            var jsonconvertido;
            if (jsonlist != undefined) {
                jsonconvertido = jQuery.parseJSON(jsonlist);

                $.each(Model.milista, function (i, item) {



                    var posi = new google.maps.LatLng(item.CoordenadaX, item.CoordenadaY);

                    marker = new google.maps.Marker({
                        map: map,
                        titulo: item.NombrePais,
                        position: posi,
                        draggable: false

                    });

                    marcadoresBD.push(marker);

                    infoWindow = new google.maps.InfoWindow();

                    google.maps.event.addListener(map, 'click', function () {
                        closeInfoWindow();
                    });

                    google.maps.event.addListener(marker, 'click', function () {
                        openInfoWindow(marker, item.NombrePais);

                    });

                });

            }
            else {
                alert("No se encontraron paises en la bd");
            }

        }

        function Buscar()
        {
            // Obtenemos la dirección y la asignamos a una variable
            address = $('#NombrePais1').val();


            // Creamos el Objeto Geocoder
            geocoder = new google.maps.Geocoder();
            // Hacemos la petición indicando la dirección e invocamos la función
            // geocodeResult enviando todo el resultado obtenido
            geocoder.geocode({ 'address': address }, geocodeResult);
        };






        function geocodeResult(results, status) {
            // Verificamos el estatus
            if (status == 'OK') {
                // Si hay resultados encontrados, centramos y repintamos el mapa
                // esto para eliminar cualquier pin antes puesto
                var mapOptions = {
                    center: results[0].geometry.location,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map($("#mapa").get(0), mapOptions);
                // fitBounds acercará el mapa con el zoom adecuado de acuerdo a lo buscado
                map.fitBounds(results[0].geometry.viewport);
                // Dibujamos un marcador con la ubicación del primer resultado obtenido
                var markerOptions = { position: results[0].geometry.location }
                marker = new google.maps.Marker(markerOptions);
                marker.setMap(map);
                updatePosition(marker.getPosition());
                jQuery('#NombrePais').val(address);

                jQuery('#CodPais').val(results[0].address_components[0].short_name);

            }
            else {
                // En caso de no haber resultados o que haya ocurrido un error
                // lanzamos un mensaje con el error
                alert("Geocoding no tuvo éxito debido a: " + status);
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
            '<br/>Puedes hacer click en cualquier otro lado para cerrarme.',
            '</div>'
            ].join(''));
            infoWindow.open(map, marker);
        }


        //funcion que simplemente actualiza los campos del formulario
        function updatePosition(latLng) {

            jQuery('#CoordenadaX').val(latLng.lat());
            jQuery('#CoordenadaY').val(latLng.lng());
        }

        function closeInfoWindow() {
            infoWindow.close();
        }


        function Grabar(nombre)
        {

            $.ajax({
                url: '@Url.Action("Modificar", "Admin")',
                type: 'POST',
                data: { 
                    nombrePais: nombre,
                },
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function () {

                }
            });
        };


    </script>

</asp:Content>
