<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterOrganizador.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <section class="content-block content-2-3 bg-deepocean">
                <div class="container">
                    <div class="col-sm-7 pull-left">
                        <h2 style="font-size:1.4em">AQUI PUEDES BUSCAR EL LUGAR QUE DESEES &nbsp;O SELECCIONAR &nbsp;UNO EN EL SIGUIENTE MAPA</h2>
                    </div>
                    <div class="col-sm-4 pull-right">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Find a place">
                            <span class="input-group-btn"><input  class="btn btn-primary" type="submit" value="Buscar"></span>
                        </div>
                        <!-- /.input-group -->
                    </div>
                </div>
                <!-- /.container -->
            </section>
            <div id="map" class="map min-height-500px" data-map-lat="56,00000" data-map-long="24,000000" data-map-zoom="2">

            </div>
            <section class="content-block contact-1 offwhite">
                <div class="container text-center">
                    <div class="col-sm-10 col-sm-offset-1">
                        <div class="underlined-title text-uppercase">
                            <h1 style="font-size:1.5em; font-family:Constantia;">AQUI EDITE LAS AREAS DE UN EVENTO</h1>
                            <hr>
                            <h2 style="font-size:1.0em;">A continuacion se desplegara un mapa con el plano del lugar seleccionado para que usted agregue a un lugar las areas deseadas de un evento a su plano</h2>
                        </div>
                        <div id="map1" class="map min-height-500px"></div>
                        <!-- /.form-container -->
                    </div>
                    <!-- /.col-sm-10 -->
                </div>
                <!-- /.container -->
            </section>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
