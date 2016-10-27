<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    	<meta charset='utf-8'/>
<style>

        #mapa
        {
            width:100%;
            height:100%;    
            overflow:hidden;       
        }
        #imagenMapa
        {
            height:100%;
            width:100%;

        }


         @media all and (max-width: 780px) 
         {
   #mapa {
    width: 100%;
    height:100%;
  }
}

             @media all and (max-width: 780px) {
   #ImagenMapa {
    width: 100%;
    height:100%;
    
  }
}


    </style>
      <link rel="stylesheet" href="<%= Url.Content("~/Content/css/boostrap.css")%>" type="text/css"/>  
     <link rel="stylesheet" href="<%= Url.Content("~/Content/css/demo.css")%>" type="text/css"/>  
    <link rel="stylesheet" href="<%= Url.Content("~/Content/css/pcss3t.css")%>" type="text/css"/>   
        <script src="<%= Url.Content("~/Scripts/jquery-2.2.3.min.js")%>" type="text/javascript"></script>
     <script src="<%= Url.Content("~/Scripts/jquery-2.2.3.js")%>" type="text/javascript"></script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJiCs0vB2sIBGKclrmhydA4I9uekWOIvk&libraries=drawing"></script>
    
    <script type="text/javascript">
        var map;//declaro global para que lo vean todas funcionas


       
        




        jQuery(document).ready(function () {
            //Asignamos al evento click del boton la funcion codeAddress
            //Inicializamos la función de google maps una vez el DOM este cargado
            initMap();
        });

        function CoordMapType(tileSize) {
            this.tileSize = tileSize;
        }

        CoordMapType.prototype.maxZoom = 19;
        CoordMapType.prototype.name = 'Lugar';

        CoordMapType.prototype.getTile = function (coord, zoom, ownerDocument) {
            var div = ownerDocument.createElement('div');
            div.innerHTML = coord;
            div.style.width = this.tileSize.width + 'px';
            div.style.height = this.tileSize.height + 'px';
            div.style.fontSize = '10';
            div.style.borderStyle = 'solid';
            div.style.borderWidth = '1px';
            div.style.borderColor = '#AAAAAA';
            div.style.backgroundColor = '#E5E3DF';
            return div;
        };

        var minZoomLevel = 1;


        function initMap() {
            var map = new google.maps.Map(document.getElementById('mapa'), {
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
                     new google.maps.LatLng(-20, 20),
                     new google.maps.LatLng(20, -20)
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
                drawingMode: google.maps.drawing.OverlayType.MARKER,
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
                    editable: false,
                    zIndex: 1
                }

            });
            drawingManager.setMap(map);

            google.maps.event.addListener(drawingManager, 'overlaycomplete', function (event) {

                if (event.type == google.maps.drawing.OverlayType.POLYGON)
                {


                    var vertices= event.overlay.getPath();
                    var xy;
                    var lat;
                    var lng;

                    // iterar sobre los vertices del poligono.
                    for (var i = 0; i < vertices.getLength(); i++)
                    {

                        xy = vertices.getAt(i);

                        var muestra = 'Coordenada' + i + xy.lat() + ',' + xy.lng();
                        lat = xy.lat();
                        lng = xy.lng;


                        
                    }


                    var contentString = '<div id="content">' +
          '<div id="Poligon">' +
                    '<p> Ingrese el nombre del Area </p>' +
                    '<input class="form-control" id="NombreArea" autocomplete="off" name="NombreArea" type="text"/> ' +
                    '</div>' +
                    '<div id="bodyContent">' +
                    '<input runat="server" style="margin-top:15px;" type="button" value="Registrar datos" name="action"  class="btn btn-danger btn-sm" />'
                    '</div>' +
                    '</div>';

                        var infowindow = new google.maps.InfoWindow({
                            content: contentString
                        });

                        var marker = new google.maps.Marker({
                            position: xy,
                            map: map,
                            title: 'Area de Lugar'
                        });
                        marker.addListener('click', function () {
                            infowindow.open(map, marker);
                        });

                    }
            });

        }
        </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%; height: 710px; position: relative; overflow: hidden;" id="responsive_map">
    <div class="gm-style" style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;">
    <div id="mapa">
    </div>
        </div>
        </div>
</asp:Content>


