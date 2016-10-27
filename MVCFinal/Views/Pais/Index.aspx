<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.PaisModel>" %>


<asp:Content ID="indexTitle" ContentPlaceHolderID="head" runat="server">

  
    
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
      <link rel="stylesheet" href="<%= Url.Content("~/Content/css/bootstrap.css")%>" type="text/css"/>  
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
        var nuevosmarcadores = [];
        var marcadoresBD=[];
        var infoWindow=null;
        var address = null;

        function limpiar_marcadores(lista)
        {
            for(i in lista)
            {
                lista[i].setMap(null);
            }
        }



        jQuery(document).ready(function () {
            //Asignamos al evento click del boton la funcion codeAddress
            //Inicializamos la función de google maps una vez el DOM este cargado
            initialize();
            Listar();

                 autocomplete = new google.maps.places.Autocomplete(
                 /** @type {!HTMLInputElement} */
                (
    document.getElementById('NombrePais')), {
        types: ['(regions)']
            }
        
    );

        });




        function initialize()
        {
            

            geocoder = new google.maps.Geocoder();


            var latLng = new google.maps.LatLng(-34.397, -56.161792);

            //Definimos algunas opciones del mapa a crear
            var myOptions = {
                center: latLng,//centro del mapa
                zoom: 7,//zoom del mapa
                mapTypeId: google.maps.MapTypeId.ROADMAP //tipo de mapa, carretera, híbrido,etc
            };
            //creamos el mapa con las opciones anteriores y le pasamos el elemento div
            map = new google.maps.Map(document.getElementById("mapa"), myOptions);

            }
           
       



        function closeInfoWindow() {
            infoWindow.close();
        }

        function Listar()
        {
            var jsonlist ='<%= (string)Session["datos"]%>';
            var jsonconvertido;
            if(jsonlist != undefined)
            {
                jsonconvertido = jQuery.parseJSON(jsonlist);


                $.each(jsonconvertido, function (i, item)
                {
                    
                    

                    var posi = new google.maps.LatLng(item.CoordenadaX,item.CoordenadaY);
                    
                     marker = new google.maps.Marker({
                        map:map,
                        titulo:item.NombrePais,
                        position:posi,
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
          else
            {
            alert("No se encontraron paises en la bd");
            }   
                                     
        }

        function Buscar() 
        {
            // Obtenemos la dirección y la asignamos a una variable
            address = $('#NombrePais').val();

              
            // Creamos el Objeto Geocoder
             geocoder = new google.maps.Geocoder();
            // Hacemos la petición indicando la dirección e invocamos la función
            // geocodeResult enviando todo el resultado obtenido
            geocoder.geocode({ 'address': address}, geocodeResult);
        };
 





        function geocodeResult(results, status)
        {
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
            else
            {
                // En caso de no haber resultados o que haya ocurrido un error
                // lanzamos un mensaje con el error
                alert("Geocoding no tuvo éxito debido a: " + status);
            }
        }


        
        function openInfoWindow(marker, content)
        {
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
        function updatePosition(latLng)
        {

            jQuery('#CoordenadaX').val(latLng.lat());
            jQuery('#CoordenadaY').val(latLng.lng());
        }

        function closeInfoWindow() {
            infoWindow.close();
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
    <div id="row" class="row">
        <div class="col-md-12">  
     <div class="Info"> 
         <form id="formulario" runat="server" >
                <% using (Html.BeginForm())
                       { %> 
                     <fieldset>
                          Pais
                     <input " class="form-control"  id="NombrePais" name="NombrePais" placeholder="Nombre" type="text"   />

                       Coordenada X
                      <input class="form-control" id="CoordenadaX" autocomplete="off" readonly="readonly" name="CoordenadaX"  type="text"/>
                        Coordenada Y
                     <input class="form-control" id="CoordenadaY" style="margin-bottom:5px;"readonly="readonly"    autocomplete="off" name="CoordenadaY" type="text"/> 
                        Codigo Pais
                         <input class="form-control" id="CodPais" readonly="readonly" name="CodPais"  type="text"/>
                         <input style="margin-top:15px; margin-right:10px;" type="submit" value="Guardar" name="action"  class="btn btn-success btn-sm" />      
                        
                     <input runat="server" style="margin-top:15px;" type="submit" value="Cancelar" name="action"  class="btn btn-danger btn-sm" />

                           </fieldset>
                         
              <% } %>

                                   <input type="submit" onclick="Buscar()" value="Buscar" name="action" class="btn btn-success btn-sm" />
             </form>
                </div>          
            </div>
         </div>    
</asp:Content>

