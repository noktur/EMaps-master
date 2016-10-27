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

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJiCs0vB2sIBGKclrmhydA4I9uekWOIvk"></script>
    
    <script type="text/javascript">
        function showPicture(input) {
            //$("#OriginalPreviewFondo2").attr('style', 'display:none;');
            $("#preview").attr('style', '');
            ImageFondo2Aux = input;
        }

        function showerrorfondo(response) {
            document.getElementById('lblRespuestaFondo').innerHTML = response['message'];
        }

        function obtenerImagenFondo() {
             var data = new FormData();
             var files = $("#uploadFondoInput").get(0).files;
             if (files.length > 0) {
                 data.append("Images", files[0]);
             }
             $.ajax({
                 contentType: false,
                 processData: false,
                 dataType: "json",
                 accept: "json",
                 type: "POST",
                 url: "<%=Url.Action("GuardarImagenFondo")%>",
                 data: data,
                 success: function (json) {
                     showerrorfondo(json)
                 },
                 error: function (response) {
                     showerrorfondo(response)
                 }
             });
          
         }
        </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
     <input type="file" id="upload" name="upload" accept="image/gif, image/jpeg, image/png" onchange="showPicture(input)"/>
    <img id="preview" src="" onload="initializeguillotineFondo2()" style="width: 300px; height: 300px"/>
    <label id="lblRespuestaFondo"></label>
</div>
</asp:Content>


