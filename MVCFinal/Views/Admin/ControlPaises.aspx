<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterAdmin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content-block content-2-3 bg-deepocean" style="border-bottom-right-radius:55px;border-bottom-left-radius:55px">
            <div class="container">
                <div class="col-sm-7 pull-left">
                    <h2 class="text-uppercase" style=" font-family:Satisfy ; font-size:1.5em;">Aqui podra gestionar las ubicaciones internas de su sistema</h2>
                </div>
                <div class="col-sm-4 pull-right">
                    <div class="input-group">
                        <input type="email" class="form-control" placeholder="Ingrese el pais">
                        <span class="input-group-btn"><a class="btn btn-primary" type="button">Buscar</a></span>
                    </div>
                    <!-- /.input-group -->
                </div>
            </div>
            <!-- /.container -->
        </section>
        <div class="map min-height-500px"></div>
        <section id="content-2-6" class="content-block content-2-6 margin-top0 pad0 pad-bottom0 bg-tan">
            <div class="container text-center margin-top0 pad-bottom0 margin-bottom0 pad0 black">
                <form role="form" class="black"> 
                    <input type="email" class="form-control hidden" id="exampleInputEmail1" placeholder="Enter email">
                    <input type="password" class="form-control hidden" id="exampleInputPassword1" placeholder="Password">
                    <p class="form-control-static black pad-bottom0 margin-bottom0" style=" font-family:Satisfy ; font-size:1.5em;">Luego de encontrado el pais puede enviar los datos a almacenar y enlazar esos datos con una ciudad .</p>
                    <a href="#" class="btn btn-outline btn-outline-xl outline-light black bg-sunflower">Enviar Datos</a>
                </form>
            </div>
            <!-- /.container -->
        </section>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
