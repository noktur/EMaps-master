<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.PaisModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formulario" runat="server">
        
               <div class="col-md-4">
                            <% using(Html.BeginForm()) { %>
                   <div  class="input-group bg-white" style="padding-bottom:10px;padding-top:10px;">
                                <input type="text" class="form-control" required="required" placeholder="Search Country......" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar un nombre de ciudad)" name="NombrePais1" id="NombrePais1"  />
                                <span class="input-group-btn"><button class="btn btn-info" onclick="Buscar()"  type="button"><i class="fa fa-search"></i></button></span>
                                   </div>

                   <div id="form" style="display:none;">
                            <div class="form-group">
                                <input type="text" class="form-control hidden" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar un nombre de pais)"   name="NombrePais" id="NombrePais" placeholder="Nombre Pais..." />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar un codigo de pais)" readonly="readonly" name="CodPais" id="CodPais" placeholder="Codigo Pais..."  />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control "  readonly="readonly" name="CoordenadaX" id="CoordenadaX" placeholder="CoordenadaX..."  />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" readonly="readonly" name="CoordenadaY" id="CoordenadaY" placeholder="CoordenadaY..." />
                            </div>
                        <div class="form-group">
                            <button type="submit" id="Guardar" class="btn btn-primary bg-red-500 white"  name="action" value="Enviar Datos">Guardar </button>
                        </div>
                        <div class="form-group">
                            <button type="submit" id="Eliminar" class="btn btn-primary bg-blue-500 white" name="action" value="Eliminar">Eliminar </button>
                            </div>
                         </div>
                     <% } %>   	
                    </div>
           <div class="col-md-8">
                        <div style="height:450px; width:100%;" class="templatemo-contact-map" id="mapa">
                            
                      </div>
                        </div>
         


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
        var infoWindow;
        var address;
        var posi;
        var botonEliminar;
        var botonGuardar;





        jQuery(document).ready(function ()
        {
            //Asignamos al evento click del boton la funcion codeAddress
            //Inicializamos la función de google maps una vez el DOM este cargado
           

            var input = document.getElementById('NombrePais1');

            autocomplete = new google.maps.places.Autocomplete(input);
            initialize();
            Listar();
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

        function Listar() {
            var jsonlist = '<%= (Session["ListaPaises"] == null ? null : (string)Session["ListaPaises"])%>';
            var jsonconvertido;
            if (jsonlist != undefined) {
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

                        botonGuardar = document.getElementById("Guardar");
                        botonGuardar.style.display = 'none';
                        botonGuardar.style.visibility = 'visible';
                        botonEliminar = document.getElementById("Eliminar");
                        botonEliminar.style.display = 'none';
                        var inputNombrePais1 = document.getElementById("form");
                        inputNombrePais1.style.display = 'block';
                        var inputNombrePais = document.getElementById("NombrePais");
                        inputNombrePais.style.display = 'none';
                        jQuery('#NombrePais').val('');
                        jQuery('#CoordenadaX').val('');
                        jQuery('#CoordenadaY').val('');
                        jQuery('#CodPais').val('');

                    });

                    google.maps.event.addListener(marker, 'click', function ()
                    {
                        openInfoWindow(marker, item.Nombre);
                        jQuery('#NombrePais').val(item.Nombre);
                        jQuery('#CoordenadaX').val(item.CoordenadaX);
                        jQuery('#CoordenadaY').val(item.CoordenadaY);
                        jQuery('#CodPais').val(item.CodPais);

                        var form = document.getElementById("form");
                        form.style.display = 'block';
                        form.style.visibility = 'visible';

                        botonGuardar = document.getElementById("Guardar");
                        botonGuardar.style.display = 'none';
                        botonEliminar=document.getElementById("Eliminar");
                        botonEliminar.style.display='block';
                        botonEliminar.style.visibility='visible';
                        var inputNombrePais = document.getElementById("NombrePais");
                        inputNombrePais.style.visibility = 'visible';
                        closeInfoWindow();
                        
                    }
                    

                    );
                    

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


                var inputNombrePais = document.getElementById("form");
                inputNombrePais.style.display = 'block';
                inputNombrePais.style.visibility = 'visible';

                jQuery('#NombrePais').val(address);

                jQuery('#CodPais').val(results[0].address_components[0].short_name);

                botonGuardar=document.getElementById("Guardar");
                botonGuardar.style.display='';
                botonGuardar.style.visibility = 'visible';

                botonEliminar = document.getElementById("Eliminar");
                botonEliminar.style.display = 'none';

            }
            else {
                // En caso de no haber resultados o que haya ocurrido un error
                // lanzamos un mensaje con el error
                alert("Geocoding no tuvo éxito debido a: " + status);
            }
        }



        function openInfoWindow(marker, content) {
            infoWindow = new google.maps.InfoWindow();
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


    </script>

</asp:Content>
