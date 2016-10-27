//Declaramos las variables que vamos a user
var lat = null;
var lng = null;
var map = null;
var geocoder = null;
var marker = null;

jQuery(document).ready(function () {
    //Asignamos al evento click del boton la funcion codeAddress
    //Inicializamos la función de google maps una vez el DOM este cargado
    initialize();
});

function initialize() {

    geocoder = new google.maps.Geocoder();

    //Si hay valores creamos un objeto Latlng
    if (lat != '' && lng != '') {
        var latLng = new google.maps.LatLng(lat, lng);
    }
    else {
        var latLng = new google.maps.LatLng(-34.397, -56.161792);
    }
    //Definimos algunas opciones del mapa a crear
    var myOptions = {
        center: latLng,//centro del mapa
        zoom: 15,//zoom del mapa
        mapTypeId: google.maps.MapTypeId.ROADMAP //tipo de mapa, carretera, híbrido,etc
    };
    //creamos el mapa con las opciones anteriores y le pasamos el elemento div
    map = new google.maps.Map(document.getElementById("mapa"), myOptions);

    //creamos el marcador en el mapa
    marker = new google.maps.Marker({
        map: map,//el mapa creado en el paso anterior
        position: latLng,//objeto con latitud y longitud
        draggable: true //que el marcador se pueda arrastrar

    });

    google.maps.event.addListener(marker, 'dragend', function () {
        updatePosition(marker.getPosition());
    });
    //función que actualiza los input del formulario con las nuevas latitudes
    //Estos campos suelen ser hidden
    updatePosition(latLng);


}

//funcion que traduce la direccion en coordenadas
function codeAddress() {

    //obtengo la direccion del formulario
    var address = document.getElementById("direccion").value;
    //hago la llamada al geodecoder
    geocoder.geocode({ 'address': address }, function (results, status) {

        //si el estado de la llamado es OK
        if (status == google.maps.GeocoderStatus.OK) {
            //centro el mapa en las coordenadas obtenidas
            map.setCenter(results[0].geometry.location);
            //coloco el marcador en dichas coordenadas
            marker.setPosition(results[0].geometry.location);
            //actualizo el formulario      
            updatePosition(results[0].geometry.location);

            //Añado un listener para cuando el markador se termine de arrastrar
            //actualize el formulario con las nuevas coordenadas
            google.maps.event.addListener(marker, 'dragend', function () {
                updatePosition(marker.getPosition());
            });
        } else {
            //si no es OK devuelvo error
            alert("No podemos encontrar la direcci&oacute;n, error: " + status);
        }
    });
}

//funcion que simplemente actualiza los campos del formulario
function updatePosition(latLng) {

    jQuery('#CoordenadaX').val(latLng.lat());
    jQuery('#CoordenadaY').val(latLng.lng());

}

var markerlat = [];
var markerlong = [];

$(function () {
    $("#PuntoCreate").click(function () {
        var punto = getPunto();
        // poor man's validation
        if (punto == null) {
            //alert("Specify a point, please!");
            return;
        }
        // take the data and post it via json
        if (markerlat == undefined || markerlong == undefined) {
            markerlat = [];
            markerlong = [];
        }
        markerlat.push(punto.position.lat());
        markerlong.push(punto.position.lng());
    });
});
function getPunto() {
    var dir = $("#direccion").val();
    var lat = $("#lat").val();
    var lng = $("#lng").val();
    // poor man's validation
    return (lat == "") ? null : { dir: dir, lat: lat, lng: lng };
}

