<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.PlanoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section id="content-3-7" style="background-color:whitesmoke" class="content-block content-3-7">
    <div class="container">
        <div class="col-md-12" style="background-color:whitesmoke">
    <div id="mapa" class="map min-height-500px">
        </div>
        </div>
    </div>
</section>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJiCs0vB2sIBGKclrmhydA4I9uekWOIvk&libraries=drawing"></script>



     <script type="text/javascript">


         //Declaramos las variables que vamos a user
         var map;
         var geocoder = null;
         var marker = null;
         var infoWindow = null;
         var address = null;
         var latLng = null;
         var country = null;
         var punto = [];
         var Ids = [];

         jQuery(document).ready(function () {
             //Asignamos al evento click del boton la funcion codeAddress
             //Inicializamos la función de google maps una vez el DOM este cargado
             initMap();

         });

         function CoordMapType(tileSize) {
             this.tileSize = tileSize;
         }

         CoordMapType.prototype.maxZoom = 19;
         CoordMapType.prototype.name = 'coordinate';

         CoordMapType.prototype.getTile = function (coord, zoom, ownerDocument) {



             var div = ownerDocument.createElement('div');
             div.innerHTML = coord;
             div.style.width = this.tileSize.width + 'px';
             div.style.height = this.tileSize.height + 'px';
             div.style.fontSize = '10';
             div.style.borderStyle = 'solid';
             div.style.borderWidth = '1px';
             div.style.borderColor = '#AAAAAA';
             return div;
         };

         var minZoomLevel = 1;


         function initMap() {
             var map = new google.maps.Map(document.getElementById('mapa'),
                  {
                      
                      zoom: 10,
                      center: { lat: 0, lng: 0 },
                      streetViewControl: false,
                      mapTypeId: 'coordinate',
                      mapTypeControlOptions: {
                          mapTypeIds: ['coordinate', google.maps.MapTypeId.ROADMAP],
                          style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
                      }
                  });


             var strictBounds = new google.maps.LatLngBounds(
                     new google.maps.LatLng(-5, 5),
                     new google.maps.LatLng(5, -5)
                   );

             google.maps.event.addListener(map, 'dragend', function () {
                 if (strictBounds.contains(map.getCenter())) return;

                 // We're out of bounds - Move the map back within the bounds

                 var c = map.getCenter(),
                     x = c.lng(),
                     y = c.lat(),
                     maxX = strictBounds.getNorthEast().lng(),
                     maxY = strictBounds.getNorthEast().lat(),
                     minX = strictBounds.getSouthWest().lng(),
                     minY = strictBounds.getSouthWest().lat();

                 if (x < minX) x = minX;
                 if (x > maxX) x = maxX;
                 if (y < minY) y = minY;
                 if (y > maxY) y = maxY;

                 map.setCenter(new google.maps.LatLng(y, x));
             });

             // limitamos el nivel de zoom
             google.maps.event.addListener(map, 'zoom_changed', function () {
                 if (map.getZoom() < minZoomLevel) map.setZoom(minZoomLevel);
             });




             map.addListener('maptypeid_changed', function () {
                 var showStreetViewControl = map.getMapTypeId() !== 'coordinate';
                 map.setOptions({
                     streetViewControl: showStreetViewControl
                 });
             });

             // Now attach the coordinate map type to the map's registry.
             map.mapTypes.set('coordinate',
                              new CoordMapType(new google.maps.Size(256, 256)));


             var drawingManager = new google.maps.drawing.DrawingManager({
                 drawingMode: google.maps.drawing.OverlayType.POLYGON,
                 drawingControl: true,
                 drawingControlOptions: {
                     position: google.maps.ControlPosition.TOP_CENTER,
                     drawingModes: [
                       google.maps.drawing.OverlayType.MARKER,
                       google.maps.drawing.OverlayType.CIRCLE,
                       google.maps.drawing.OverlayType.POLYGON,
                       google.maps.drawing.OverlayType.RECTANGLE
                     ]
                 },

                 markerOptions: { icon: 'images/beachflag.png' },
                 polygonOptions: {
                     fillColor: 'blue',
                     fillOpacity: 2,
                     strokeWeight: 5,
                     clickable: true,
                     editable: true,
                     zIndex: 1
                 }

             });
             drawingManager.setMap(map);

             google.maps.event.addListener(drawingManager, 'overlaycomplete', function (event) {

                 if (event.type == google.maps.drawing.OverlayType.POLYGON) {

                    
                     var bounds = new google.maps.LatLngBounds();
                     
                     var vertices = event.overlay.getPath();

                     
                     // iterar sobre los vertices del poligono.
                     for (var i = 0; i < vertices.getLength() ; i++) {

                         xy = vertices.getAt(i);



                         var muestra = 'Coordenada' + i + xy.lat() + ',' + xy.lng();
                         


                         punto.push({IdPunto:i,CoordenadaX:xy.lat(),CoordenadaY:xy.lng()});
                         
                     }

                     vertices.forEach(function (element, index) {
                         bounds.extend(element)
                     }

                     
                    )
                     
                     var center = bounds.getCenter();
                     
                     var contentString =
                         '<div class="content">' +
                        '<div class="col-md-12">' +
                     '<div class="form-group">' +
                     '<input class="form-control" placeholder="Ingrese nombre" id="NombreArea" autocomplete="off" name="NombreArea" type="text"/> ' +
                     '</div>' +
                     '<div class="form-group">' +
                     '<textarea name="Descripcion" id="Descripcion" class="form-control" rows="3" placeholder="Descripcion"></textarea> ' +
                     '</div>' +
                     '<div class="form-group">' +
                     '<input class="form-control" id="Capacidad" name="Capacidad" type="number"/> ' +
                     '</div>' +
                     '<div class="form-group text-center">' +
                     '<input type="button" id="BtnArea" name="BtnArea" value="Guardar" onclick="RecuperarArea()"  class="btn btn-danger"/> ' +
                     '</div>' +
                     '</div>' +
                     '</div>';
                        

                     var infowindow = new google.maps.InfoWindow({
                         content: contentString
                     });

                     var marker = new google.maps.Marker({
                         position: center,
                         map: map,
                         title: 'Area de Lugar'
                     });
                     marker.addListener('click', function () {
                         infowindow.open(map, marker);
                     });

                 }
             });
             
         }



         function RecuperarArea()
         {

             nombreArea = $('#NombreArea').val();
             descripcion = $('#Descripcion').val();
             capacidad = $('#Capacidad').val();

             var punto1 = punto;


             
             dat = { nombreArea: nombreArea, descripcion: descripcion, capacidad: capacidad,PuntosArea: punto1};

            var json=JSON.stringify(dat);

             $.ajax({
                 url: '/Dueño/RecuperarArea',
                 type: 'POST',
                 dataType: 'json',
                 data: "json=" + json,
                 traditional: true,
                 success: function (data)
                 {

                 }
             });
         }



        function initialize()
         {

             geocoder = new google.maps.Geocoder();

             var Mapa;
             Mapa = '<%=Session["MapaJson"]%>';
            var MapaJson = null;

            if (Mapa != null) 
            {
                MapaJson = jQuery.parseJSON(Mapa);

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

                 $.each(jsonconvertido, function (i, item)
                 {
                     var puntos=[] ;
                     var dibujo ;

                     for (i = 0; i < item.Areas.getLength() ; i++)
                     {
                         for (i = 0; i < item.Areas[i].PuntosArea.getLength() ; i++)
                         {

                             puntos.push([{ lat: item[i].CoordenadaX, lng: item[i].CoordenadaY }]);
                             // Construct the polygon.

                             dibujo.push(new google.maps.Polygon({
                                 paths: puntos,
                                 strokeColor: '#FF0000',
                                 strokeOpacity: 0.8,
                                 strokeWeight: 2,
                                 fillColor: '#FF0000',
                                 fillOpacity: 0.35
                             }));
                         }
                     }
                    
                     dibujo.setMap(map);



                 });

             }
             else {
                 alert("No Hay areas en la Base de Datos");
             }

         }


           </script>
    
</asp:Content>
