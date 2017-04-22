<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <section id="content-3-4" class="content-block content-3-4" style="padding-top:15px; padding-bottom:0px; background-color: whitesmoke; ">
    <div class="container" style="background-color: whitesmoke;">
        <% if(Session["Fotos"] == null) { %>
        <div class="col-md-12"  style="background-color: whitesmoke;">
                <div class="col-md-7" style="background-color: whitesmoke;">
                <% using (Html.BeginForm("AgregarFoto", "Dueño", FormMethod.Post, new { enctype = "multipart/form-data" })) 
                    {  %>
                <div class="thumbnail" style="border:none;background-color: whitesmoke;">
                    <div class="caption"> 
                    <h3>Agregue fotos a su lugar</h3> 
                        <div class="input-group"> 
                                <span class="input-group-addon"><i class="fa fa-file-image-o"></i></span> 
                                <input type="file" id="image" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se ha ingresado una foto)" name="image1" accept="image/gif, image/jpeg, image/png" class="form-control"> 
                         
                        </div>
                        <p>Aqui podra agregar cada una de sus fotos del lugar de manera de brindar un mayor servicio a sus clientes.</p>
                        <button type="submit" class="btn btn-primary" name="submit1">Agregar foto</button>
                    </div>                                          
                </div> 
                    <% } %>                            
            </div>
            </div>
        <% } else { %>
          <div class="col-md-12"  style="background-color: whitesmoke;">
                <div class="col-md-7" style="background-color: whitesmoke;">
                <% using (Html.BeginForm("AgregarFoto", "Dueño", FormMethod.Post, new { enctype = "multipart/form-data" })) 
                    {  %>
                <div class="thumbnail" style="border:none;background-color: whitesmoke;">
                    <div class="caption"> 
                    <h3>Agregue fotos a su lugar</h3> 
                        <div class="input-group"> 
                                <span class="input-group-addon"><i class="fa fa-file-image-o"></i></span> 
                                <input type="file" id="image1" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se ha ingresado una foto)" name="image1" accept="image/gif, image/jpeg, image/png" class="form-control"> 
                         
                        </div>
                        <p>Aqui podra agregar cada una de sus fotos del lugar de manera de brindar un mayor servicio a sus clientes.</p>
                        <button type="submit" class="btn btn-primary" name="submit1">Agregar foto</button>
                    </div>                                          
                </div> 
                    <% } %>                            
            </div>
            </div>
         <div class=" col-md-7" style="background-color: whitesmoke;">
                <div id="Carousel-FotosLugar" style="height:380px;" class="carousel slide" data-ride="carousel" > 
                    <!-- Indicators -->                     
                    <ol class="carousel-indicators"> 
                        <%  List<EntidadesCompartidas.FotosLugar> foto=(List<EntidadesCompartidas.FotosLugar>)Session["Fotos"];
                            for(int i=0;i<foto.Count;i++) 
                            { 
                                %>
                     <% if(i == 0)
                        { %>
                                <li data-target="#Carousel-FotosLugar" data-slide-to="0" class="active"></li>   
                       <% }
                      else { %>                 
                                <li data-target="#Carousel-FotosLugar" data-slide-to="<%= i %>"></li> 
                         <% } %>                  
                        <% } %>                        
                    </ol>                     
                    <!-- Wrapper for slides -->                     
                    <div class="carousel-inner" style="height:380px;"> 
                      <%  List<EntidadesCompartidas.FotosLugar> foto1=(List<EntidadesCompartidas.FotosLugar>)Session["Fotos"];
                            for(int i=0;i<foto1.Count;i++) 
                            { %>
                        <% if(i==0) { %>
                        <div class="item active"> 
                            <img width="635" height="200"  src="data:image;base64,<%=System.Convert.ToBase64String(foto1[0].Imagen)%>"  /> 
                            <div class="carousel-caption"> 
                                <h3><%= foto1[0].NombreFoto  %></h3> 
                            </div>                             
                        </div>
                        <% } else { %> 
                              <div class="item"> 
                            <img width="635"  src="data:image;base64,<%=System.Convert.ToBase64String(foto1.ElementAt(i).Imagen)%>" /> 
                            <div class="carousel-caption"> 
                                <h3><%= foto1.ElementAt(1).NombreFoto  %></h3> 
                            </div>                             
                        </div>
                        <% } %>
                        <% } %>                                         
                    </div>                     
                    <!-- Controls -->                     
                    <a class="left carousel-control" href="#Carousel-FotosLugar" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> 
                    <a class="right carousel-control" href="#Carousel-FotosLugar" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> 
                </div> 
                             
            </div>
              
            <% } %>
            <!-- /.column -->
        </div>
        <!-- /.row -->
    <!-- /.container -->
</section>    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
