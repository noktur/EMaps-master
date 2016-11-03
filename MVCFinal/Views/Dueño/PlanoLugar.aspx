<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterDueño.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script type="text/javascript">


         //Declaramos las variables que vamos a user
         var map = null;

         jQuery(document).ready(function () {
             //Asignamos al evento click del boton la funcion codeAddress
             //Inicializamos la función de google maps una vez el DOM este cargado
             initialize();

         });

         function initialize() {



             var latLng = new google.maps.LatLng(-34.397, -56.161792);

             //Definimos algunas opciones del mapa a crear
             var myOptions = {
                 center: latLng,//centro del mapa
                 zoom: 7,//zoom del mapa
                 mapTypeId: google.maps.MapTypeId.ROADMAP //tipo de mapa, carretera, híbrido,etc
             };
             //creamos el mapa con las opciones anteriores y le pasamos el elemento div
             map = new google.maps.Map(document.getElementById("map"), myOptions);

         }

           </script>

<section id="content-3-7" class="content-block content-3-7">
    <div id="map" class="map min-height-500px">

    </div>
    <div class="row">
        <div class="col-md-12">
            <p class="text-center" style=" font-family:Satisfy;font-size:1.3em ">LISTA DE AREAS DE PLANO</p>
            <table class="table" data-pg-collapsed=""> 
                <thead> 
                    <tr> 
                        <th>#</th> 
                        <th>First Name</th> 
                        <th>Last Name</th> 
                        <th>Username</th> 
                    </tr>                     
                </thead>                 
                <tbody> 
                    <tr> 
                        <td>1</td> 
                        <td>Mark</td> 
                        <td>Otto</td> 
                        <td>@mdo</td> 
                    </tr>                     
                    <tr> 
                        <td>2</td> 
                        <td>Jacob</td> 
                        <td>Thornton</td> 
                        <td>@fat</td> 
                    </tr>                     
                    <tr> 
                        <td>3</td> 
                        <td>Larry</td> 
                        <td>the Bird</td> 
                        <td>@twitter</td> 
                    </tr>                     
                </tbody>
            </table>
        </div>
    </div>
</section>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJiCs0vB2sIBGKclrmhydA4I9uekWOIvk&libraries=places"></script>  
    
</asp:Content>
