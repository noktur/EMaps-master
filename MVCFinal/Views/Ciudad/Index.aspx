<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.CiudadModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    
		<meta charset='utf-8'/>
<style>

        #mapa
        {
            width:95%;
            height:100%;    
            overflow:hidden;
            float:right;
            padding-top:0.5%;       
        }
        .Info
        {
            height:100%;
            width:95%;
            float:right;
        }
        .Info2
        {
            height:100%;
            width:95%;
            float:right;
        }
  @media all and (max-width: 480px) {
   #Info {
    width: 95%;
    height:100%;
    float:right;
    
  }
}

        
        @media all and (max-width: 480px) {
   #Info2 {
    width: 95%;
    height:100%;
    float:right;
    
  }
}

         @media all and (max-width: 480px) {
   #mapa {
       padding-top:0.5%;
    width: 95%;
    height:100%;
    float:right;
  }
}




        @media all and (max-width: 780px) {
   #Info {
    width: 95%;
    height:100%;
    float:right;
    
  }
}

        
        @media all and (max-width: 780px) {
   #Info2 {
    width: 95%;
    height:100%;
    float:right;
    
  }
}

         @media all and (max-width: 780px) {
   #mapa {
       padding-top:0.5%;
    width: 95%;
    height:100%;
    float:right;
  }
}





    </style>
      <link rel="stylesheet" href="<%= Url.Content("~/Content/css/boostrap.css")%>" type="text/css"/>  
     <link rel="stylesheet" href="<%= Url.Content("~/Content/css/demo.css")%>" type="text/css"/>  
    <link rel="stylesheet" href="<%= Url.Content("~/Content/css/pcss3t.css")%>" type="text/css"/>   
        <script src="<%= Url.Content("~/Scripts/jquery-2.2.3.min.js")%>" type="text/javascript"></script>
     <script src="<%= Url.Content("~/Scripts/jquery-2.2.3.js")%>" type="text/javascript"></script>

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
            Pais='<%=Session["Pais"]%>';
            var PaisJson = null;

            if (Pais != null) 
            {
                PaisJson = jQuery.parseJSON(Pais);

                latLng = new google.maps.LatLng(PaisJson.CoordenadaX,PaisJson.CoordenadaY);
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
                    var CodPais = PaisJson.CodPais ;
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
             else 
                {
                    alert("No se encontro el pais en la Base de Datos");
                }

        }


        function createMarker(name, lat, lng)
        {
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
        function updatePosition(latLng)
        {

            jQuery('#CoordenadaX').val(latLng.lat());
            jQuery('#CoordenadaY').val(latLng.lng());
        }


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width: 100%; height: 710px; position: relative; overflow: hidden;" id="responsive_map">
    <div class="gm-style" style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;">
    <div id="mapa">
    </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="Info">
                 <form id="formulario" runat="server" >
                     <% using (Html.BeginForm())
                       { %>   
                     <fieldset>
                       Ciudad
                     <input class="form-control" id="NombreCiudad" name="NombreCiudad" type="text"   />
                       Coordenada X
                      <input class="form-control" id="CoordenadaX" readonly="readonly" autocomplete="off" name="CoordenadaX"  type="text"/>
                        Coordenada Y
                     <input class="form-control" id="CoordenadaY" style="margin-bottom:5px;" readonly="readonly" autocomplete="off" name="CoordenadaY" type="text"/> 
                        Pais
                   <input class="form-control" id="NombrePais" style="margin-bottom:5px;" readonly="readonly"  autocomplete="off" name="NombrePais" type="text"/>
                     <input style="margin-top:15px; margin-right:10px;" type="submit" value="Guardar" name="action" class="btn btn-success btn-sm" />      
                     <input runat="server" style="margin-top:15px;" type="button" value="Cancelar" name="action"  class="btn btn-danger btn-sm" />
                        
                         </fieldset>
                     <% } %>

                       <input style="margin-top:15px; margin-right:10px;" type="submit" onclick="BuscarCiudad()" value="Buscar" name="action" class="btn btn-success btn-sm" />             
                        </form>
            </div>
        </div>
    </div>
</asp:Content>
