<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterAdmin.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.CiudadModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">

    <form id="form" runat="server">
   <div id="templatemo-contact" style="padding-bottom:30px">
            <div class="container">
                <div class="row">
                    <div class="templatemo-line-header head_contact">
                        <div class="text-center">
                            <hr class="team_hr team_hr_left hr_gray"/><span class="txt_darkgrey">CIUDADES</span>
                            <hr class="team_hr team_hr_right hr_gray"/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div style="height:378px; width:100%;" class="templatemo-contact-map" id="mapa">
                            
                      </div>
                        </div>  
                    <div class="col-md-4 contact_right">
                       
                        <p>Aqui puede buscar una ciudad para luego agregar.</p>
                            <% using(Html.BeginForm()) { %>
                            <div id="elementosBuscar" class="input-group">
                                <input type="text" class="form-control" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar un nombre de ciudad)" name="NombreCiudad1" id="NombreCiudad1"  />
                                <span class="input-group-btn"><button class="btn btn-info" onclick="BuscarCiudad()"  type="button">Buscar</button></span>
                                   </div>
                          <div class="form-group">
                                <input type="text" class="form-control" name="NombreCiudad" id="NombreCiudad" placeholder="Nombre Ciudad..." />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" readonly="readonly" name="NombrePais" id="NombrePais" placeholder="Nombre Pais..." />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" readonly="readonly" name="CoordenadaX" id="CoordenadaX" placeholder="CoordenadaX..."  />
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control" readonly="readonly" name="CoordenadaY" id="CoordenadaY" placeholder="CoordenadaY..." />
                            </div>
                            <input type="submit" id="Guardar" class="btn btn-orange pull-right" name="action" value="Guardar"/>
                        <input type="submit" id="Eliminar" class="btn btn-orange pull-right" name="action" value="Dar de Baja"/>
                     <% } %>   	
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->
            </div><!-- /#templatemo-contact -->
        

        </form>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJiCs0vB2sIBGKclrmhydA4I9uekWOIvk&libraries=places"></script>
    
    
    <script type="text/javascript">

        //Declaramos las variables que vamos a user
        var map = null;
        var geocoder = null;
        var marker = null;
        var infoWindow;
        var address;
        var latLng = null;
        var marcadoresBD = [];
        var country = null;
        var posi;
        var botonEliminar;
        var botonGuardar;
        var autocomplete;
        var countryRestrict;





        jQuery(document).ready(function () {
            //Asignamos al evento click del boton la funcion codeAddress
            //Inicializamos la función de google maps una vez el DOM este cargado

            botonEliminar = document.getElementById("Eliminar");
            botonEliminar.style.display = 'none';
            botonGuardar = document.getElementById("Guardar");
            botonGuardar.style.display = 'none';

            var inputNombreCiudad = document.getElementById("NombreCiudad");
            inputNombreCiudad.style.display = 'none';


            initialize();
            Listar();


        });






        function initialize()
        {

            geocoder = new google.maps.Geocoder();

            var Pais;
            Pais = '<%=(Session["Pais"] == null ? null : (string)Session["Pais"])%>';
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
             document.getElementById('NombreCiudad1')), {
                 types: ['(cities)'],
                 componentRestrictions: countryRestrict
             }
                    );


            }
            else {
                alert("No se encontro la ciudad en la Base de Datos");
            }

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
                    
                    var posi = new google.maps.LatLng(item.CoordenadaX, item.CoordenadaY);


                    var marker = new google.maps.Marker({
                        map: map,
                        titulo:item.Nombre,
                        position: posi,
                        draggable: false

                    });

                    marcadoresBD.push(marker);


                    google.maps.event.addListener(map, 'click', function () {
                        closeInfoWindow();

                        botonGuardar = document.getElementById("Guardar");
                        botonGuardar.style.display = '';
                        botonGuardar.style.visibility = 'visible';
                        botonEliminar = document.getElementById("Eliminar");
                        botonEliminar.style.display = 'none';
                        var inputCiudad1 = document.getElementById("elementosBuscar");
                        inputCiudad1.style.display = '';
                        inputCiudad1.style.visibility = 'visible';
                        var inputNombreCiudad = document.getElementById("NombreCiudad");
                        inputNombreCiudad.style.display = 'none';
                        jQuery('#NombreCiudad').val('');
                        jQuery('#NombrePais').val('');
                        jQuery('#CoordenadaX').val('');
                        jQuery('#CoordenadaY').val('');

                    });
                    
                    
                    google.maps.event.addListener(marker, 'click', function () {
                        openInfoWindow(marker, item.Nombre);

                        botonGuardar = document.getElementById("Guardar");
                        botonGuardar.style.display = 'none';
                        botonEliminar = document.getElementById("Eliminar");
                        botonEliminar.style.display = '';
                        botonEliminar.style.visibility = 'visible';
                        var inputNombreCiudad1 = document.getElementById("elementosBuscar");
                        inputNombreCiudad1.style.display = 'none';
                        var inputNombreCiudad = document.getElementById("NombreCiudad");
                        inputNombreCiudad.style.display = '';
                        inputNombreCiudad.style.visibility = 'visible';

                        jQuery('#NombreCiudad').val(item.Nombre);
                        jQuery('#NombrePais').val(item.UnPais.Nombre);
                        jQuery('#CoordenadaX').val(item.CoordenadaX);
                        jQuery('#CoordenadaY').val(item.CoordenadaY);


                    });



                });

            }
            else {
                alert("No Hay Paises en la Base de Datos");
            }

        }


        function BuscarCiudad() {
            // Obtenemos la dirección y la asignamos a una variable
            address = $('#NombreCiudad1').val();
            
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
            'Las coordenadas de la Ciudad de <b>',
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


                var inputNombrePais1 = document.getElementById("elementosBuscar");
                inputNombrePais1.style.display = 'none';

                var inputNombreCiudad = document.getElementById("NombreCiudad");
                inputNombreCiudad.style.display = '';
                inputNombreCiudad.style.visibility = 'visible';

                updatePosition(marker.getPosition());
               
                jQuery('#NombreCiudad').val(results[0].address_components[0].short_name);


                botonGuardar = document.getElementById("Guardar");
                botonGuardar.style.display = '';
                botonGuardar.style.visibility = 'visible';


            } else {
                // En caso de no haber resultados o que haya ocurrido un error
                // lanzamos un mensaje con el error
                alert("Geocoding no tuvo éxito debido a: " + status);
            }
        }





        //funcion que simplemente actualiza los campos del formulario
        function updatePosition(latLng)
        {

            jQuery('#CoordenadaX').val(latLng.lat());
            jQuery('#CoordenadaY').val(latLng.lng());
        }


    </script>

</asp:Content>
