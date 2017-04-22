<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class=" content-block pricing-table-1 pricing-table-1-2" >
        <form id="form1" runat="server">
            <% using (Html.BeginForm()) {  %>
    <div class="container">
        <div class="underlined-title">
            <h2>CHOOSE UPGRADE PLAN FOR YOUR SPECIFIC NEEDS</h2>
            <hr>
        </div>
        <div class="row"> 
            <div class="col-sm-4 price-block">
                <!-- Ribbon -->
                <h3 class="lead white">Organizador</h3>
                <div class="price pastel-red">
                    <div class="price-figure">
                        <h4>Upgrade tips</h4>
                    </div>
                </div>
                <ul class="features margin-bottom0" >
                    <li>Crear Eventos</li>
                    <li>Control de asistencia a eventos</li>
                    <li>Reservar lugares</li>
                    <li>&nbsp;Vender Entradas&nbsp;</li>
                    <li class="margin-bottom0">&nbsp;Control feedback</li>
                    <li class="margin-bottom0">Crear mapa del evento</li>
                    <li class="margin-bottom0">Control de &nbsp;Eventos</li>
                </ul>
                <input class="btn btn-block margin-top0 pad0 btn-success" type="submit" style="height:60px;" value="Upgrade" name="action" />
            </div>
            <div class="col-sm-4 price-block">
                <h3 class="lead white">Dueño</h3>
                <div class="price pastel-green bg-sienna-hover">
                    <div class="price-figure">
                        <h4>upgrade tips</h4>
                    </div>
                </div>
                <ul class="features">
                    <li>Alquilar lugares</li>
                    <li>Administrar sus lugares</li>
                    <li>Galeria del lugar&nbsp;</li>
                    <li>Generar areas de un lugar</li>
                    <li class="margin-bottom0">&nbsp;Administrar plano lugar</li>
                    <li class="margin-bottom0">Control Feedback</li>
                    <li class="margin-bottom0">Control Alquileres</li>
                </ul>
                <input class="btn btn-block margin-top0 pad0 btn-success" type="submit" style="height:60px;" value="Upgrade" name="action2" />
            </div>             
            <div class="col-sm-4 price-block">
                <h3 class="lead white">cliente</h3>
                <div class="price pastel-blue">
                    <div class="price-figure">
                        <h4>Upgrade tips</h4>
                    </div>
                </div>
                <ul class="features">
                    <li>Asistir a eventos</li>
                    <li>Mapa de Eventos</li>
                    <li>Descripcion eventos</li>
                    <li>Ubicacion remota</li>
                    <li class="margin-bottom0">Filtros de Localizacion a eventos</li>
                    <li class="margin-bottom0">Control de Asistencias</li>
                    <li class="margin-bottom0">Control gastos</li>
                </ul>
                
            </div>
        </div>
        <!-- /.row -->
    </div>
            <% } %>
    <!-- /.container -->
        </form>
</section>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="../../Content/css/blocks.css"> 
    <link rel="stylesheet" href="../../Content/css/style-library-1.css"> 
    <link rel="stylesheet" href="../../Content/css/custom.css"> 
    <link rel="stylesheet" href="../../Content/css/demo.css"> 

</asp:Content>
