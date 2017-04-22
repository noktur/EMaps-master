<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="content-2-2" class="content-block content-2-2 pad0 pad-bottom15" >
    <div class="container">
        <div id="map" style="height:360px;width:100%;"
        <div class="col-md-4 black">
            <h3 class="black" style="font-family:Advent Pro;font-size:1.6em;">Nombre Lugar</h3> 
        </div>
        <div class="col-md-7 black">
            <h3 class="black" style="font-family:Advent Pro;font-size:1.6em;">Descripcion</h3> 
        </div>
        <!--// END Row -->
    </div>
</section>

    <section id="content-2-9" class="content-2-9" >

        <% if(Session["ListaAreasLugar"] != null) { 
               List<EntidadesCompartidas.Area> a=(List<EntidadesCompartidas.Area>)Session["ListaAreasLugar"]; %>
        
    <div class="project-wrapper">
        <% foreach(var item in a) { %>
        <div class="col-md-3 col-sm-6 project">
            <div class="background-image-holder">
                <img class="background-image" alt="Background Image" src="<%= item.ToString()  %>">
            </div>
            <div class="hover-state">
                <div class="align-vertical">
                    <h3><%= item.NombreArea  %></h3>
                    <p>Esta area <%= item.Descripcion %> y su capacidad es de <%= item.Capacidad %>.</p>
                    <a href="#" class="btn btn-outline outline-light">Buy Area</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
        <% } %>
    <!-- /.project-wrapper -->
</section>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    		<link rel="stylesheet" href="../../Content/css/blocks.css">



    <script type="text/javascript">



        jQuery(document).ready(function () {
           

            initialize();
           


        });



        function initialize() {

            geocoder = new google.maps.Geocoder();

            var Lugar;
            Lugar = '<%=(Session["LugarActual"] == null ? null : (string)Session["LugarActual"])%>';
            var LugarJson = null;

            if (Lugar != null) {
                LugarJson = jQuery.parseJSON(Lugar);

                latLng = new google.maps.LatLng(PaisJson.CoordenadaX, PaisJson.CoordenadaY);
                var myOptions =
                {

                    center: latLng,//centro del mapa
                    zoom: 7,//zoom del mapa
                    mapTypeId: google.maps.MapTypeId.ROADMAP //tipo de mapa, carretera, híbrido,etc
                };
                //creamos el mapa con las opciones anteriores y le pasamos el elemento div
                map = new google.maps.Map(document.getElementById("mapa"), myOptions);


            }
            else {
                alert("No se encontro la ciudad en la Base de Datos");
            }

        }

    </script>

</asp:Content>
