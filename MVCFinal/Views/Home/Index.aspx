<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>


<asp:Content ID="indexTitle" ContentPlaceHolderID="head" runat="server">

  
    
		<meta charset='utf-8'/>
<style>

        #mapa
        {
            width:100%;
            height:70%;
        }
        .Info
        {
            padding-top:2px;
            height:30%;
            width:100%;
            background-color:#E0F8F7;
        }
       
    @media only screen and (min-width: 481px) 
    {
        .responsive_map
        {
            width:100%;
            height:50px;
        }
    }



    </style>
      <link rel="stylesheet" href="<%= Url.Content("~/Content/css/demo.css")%>" type="text/css"/>   
    <link rel="stylesheet" href="<%= Url.Content("~/Content/css/pcss3t.css")%>" type="text/css"/>   
        <script src="<%= Url.Content("~/Scripts/jquery-2.2.3.min.js")%>" type="text/javascript"></script>
     <script src="<%= Url.Content("~/Scripts/jquery-2.2.3.js")%>" type="text/javascript"></script>
     <script src="https://maps.googleapis.com/maps/api/js"></script>
   
    
     <script src="<%= Url.Content("~/Scripts/MapComun.js")%>" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width: 100%; height: 710px; position: relative; background-color: rgb(229, 227, 223); overflow: hidden;" id="responsive_map">
    <div class="gm-style" style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;">
    <div id="mapa">
    </div>
        <div class="Info" >
            
            <div class="accordion" id="accordion2">
            <div class="accordion-group">
              <div class="accordion-heading">
                  <asp:Label ID="Label1" runat="server" Text="Definicion de Puntos" CssClass="spark-stat-label"></asp:Label>
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                    Agregar
                </a>
              </div>
              <div id="collapseOne" class="accordion-body collapse in">
                <div class="accordion-inner">
                    <form id="formulario" runat="server" >
                        <table>
                            <tbody><tr>
                                <td style="padding-left:5px; padding-right:5px "> Coordenada X </td>
                                <td style="padding-left:5px; padding-right:5px "><input class="form-control" id="lat" readonly="readonly" disabled="disabled" autocomplete="off" name="lat"  type="text"/></td>
                                <td style="padding-left:5px; padding-right:5px ">Coordenada Y</td>
                                <td style="padding-left:5px; padding-right:5px "><input class="form-control" id="lng" readonly="readonly" disabled="disabled" autocomplete="off" name="lng" type="text"/> </td>
    
                                 <td style="padding-left:5px; padding-right:5px ">
                                    <input type="button" value="save" id="PuntosSave" class="btn btn-success btn-sm" /></td>
                                 <td style="padding-left:5px; padding-right:5px ">
                                    <input type="button" value="save" id="GuardarPuntos" class="btn btn-success btn-sm" /></td>
                                <td style="padding-left:5px; padding-right:5px ">
                              
                                          <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger btn-sm" /></td>
                            </tr>
                                
                        </tbody></table>
                        </form>
                </div>
              </div>
            </div>
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                  Buscar
                </a>
              </div>
              <div id="collapseTwo" class="accordion-body collapse">
                <div class="accordion-inner">
                  ...
                </div>
              </div>
            </div>
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                  Eliminar
                </a>
              </div>
              <div id="collapseThree" class="accordion-body collapse">
                <div class="accordion-inner">
                  ...
                </div>
              </div>
            </div>
          </div>
        
        </div>
        </div>
        </div>
</asp:Content>

