<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterDueño.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.PlanoModel>" %>

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

             geocoder = new google.maps.Geocoder();

             var Mapa;
             Mapa = '<%=Session["MapaJson"]%>';
            var MapaJson = null;

            if (Mapa != null) {
                MapaJson = jQuery.parseJSON(Mapa);

                // aqui haii que enlazar el plano al mapa de google mediante la imagen que trae la session

                latLng = new google.maps.LatLng(PaisJson.CoordenadaX, PaisJson.CoordenadaY);
                var myOptions =
                {

                    center: latLng,//centro del mapa
                    zoom: 7,//zoom del mapa
                    mapTypeId: google.maps.MapTypeId.ROADMAP //tipo de mapa, carretera, híbrido,etc
                };
                //creamos el mapa con las opciones anteriores y le pasamos el elemento div
                map = new google.maps.Map(document.getElementById("map"), myOptions);


            }
            else
            {
                alert("No se encontro el plano de el lugar en la Base de Datos");
            }

         }


         function ListarAreas()
         {
             var jsonlist = '<%= (Session["AreasMapaJson"] == null ? null : (string)Session["AreasMapaJson"])%>';
             var jsonconvertido = null;
             if (jsonlist != "") {
                 jsonconvertido = jQuery.parseJSON(jsonlist);

                 $.each(jsonconvertido, function (i, item) {

                     createMarker(item.NombreArea, item.PuntosArea.CoordenadaX, item.PuntosArea.CoordenadaY)

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


           </script>

<section id="content-3-7" class="content-block content-3-7">
    <div id="map" class="map min-height-500px">
    </div>
       <% if(Session["ListaAreaPlano"] != null) {  %>
    <div class="row">
        <div class="col-md-12">
            <p class="text-center" style=" font-family:Satisfy;font-size:1.3em ">LISTA DE AREAS DE PLANO</p>
            <div class="table-responsive">
               <% foreach ( var item in Model.ListaAreasPlano) { %>
            <table class="table" data-pg-collapsed=""> 
                <thead> 
                    <tr> 
                        <th>#</th> 
                        <th></th> 
                        <th>Coordenada X Area</th> 
                        <th>Coordenada Y Area </th> 
                    </tr>                     
                </thead>                 
                <tbody> 
                    <tr> 
                        <td></td> 
                        <td><%= item.NombreArea%></td> 
                        <td><%= item.PuntosArea.CoordenadaX %></td> 
                        <td><%= item.PuntosArea.CoordenadaY %></td> 
                    </tr>                                         
                </tbody>
            </table>
                <% } %>
                </div>
        </div>
    </div>
    <% } else { %>
    <div class="row" style="display:none">
        </div>
    <% } %>
</section>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJiCs0vB2sIBGKclrmhydA4I9uekWOIvk&libraries=places"></script>  
    
</asp:Content>
