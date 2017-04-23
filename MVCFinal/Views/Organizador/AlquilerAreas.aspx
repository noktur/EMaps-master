<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <form id="Form1">
   <div class="row">
        <div class="col-md-3">
          <div class="panel panel-default" data-toggle="panel-collapse" data-open="true">

                 <% using(Html.BeginForm()) { %>

            <div class="panel-heading panel-collapse-trigger collapse" data-toggle="collapse" data-target="#de8fb204-3a80-b158-15e3-1b90b4cd3a29" aria-expanded="false" style="height: 38px;">
              <h4 class="panel-title"></h4>
            </div>
            
          <div id="406f12c9-12c6-1bf8-3658-f92403704ea5" class="collapse in"></div><div id="de8fb204-3a80-b158-15e3-1b90b4cd3a29" class="collapse in"><div class="panel-body">
              
             
              
               <div class="form-group">
                
                  <select id="seleccion"  class="form-control" name="seleccion">                                                     
                            <option value="0">Seleccione una ciudad</option>                                                                                      
                            </select>

              </div>



          <div class="panel panel-default" data-toggle="panel-collapse" data-open="false">
            <div class="panel-heading panel-collapse-trigger collapse" data-toggle="collapse" data-target="#6e0479c0-a2b7-6cba-3d91-0506c1a6f8e6" aria-expanded="false" style="height: 38px;">
              <h4 class="panel-title">Date</h4>
            </div>
            


            </div></div></div>



                  <div class="panel-body">

             
        <div class="form-group">
            <label class="control-label" style="padding-left:5px;">Check in</label>
            <div class='input-group date margin-bottom25' id='Fecha1'>
                <input type="date" id="FechaInicio" name="FechaInicio" class="form-control" />
                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
            </div>
            <div class="form-group">
                <label class="control-label" style="padding-left:5px;">Check Out</label>
                <div class='input-group date' id='Fecha2'>
                    <input type="date" id="FechaFin" name="FechaFin" class="form-control" />
                    <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <button class="btn btn-primary" type="submit" id="Filtrar" name="action" value="Filtrar Busqueda"> Shearch Now </button>
        </div>
    <% } %>

            </div>

          </div>
        </div>
        <div class="col-md-9">
            <% if(Session["ListaLugaresBusqueda"] != null )
               { List<EntidadesCompartidas.Lugar> a=(List<EntidadesCompartidas.Lugar>)Session["ListaAreaBusqueda"]; 
                    %>

            <%  foreach(var item in a)
                {  %>
          <div class="panel panel-default">
            <div class="panel-body">
              <div class="media media-clearfix-xs media-clearfix-sm">
                <div class="media-left">
                  <p>
                   
                      <img src="./Real Estate5_files/photodune-195203-houses-xs.jpg" alt="property" width="150" class="media-object">
                  
                       </p>
                </div>
                <div class="media-body">
                  <h4 class="media-heading margin-v-0-10">
                    <a href="#"><%= item.Nombre %></a>
                    <small class="text-grey-400"><i class="fa fa-clock-o fa-fw"></i><%=item.Direccion %> </small>
                  </h4>
                  <p>
                    <span class="label label-grey-100"><i class="fa fa-home fa-fw"></i><%= item.UbicacionLugar.Nombre %></span>
                    <span class="label label-grey-100"><i class="fa fa-fw icon icon-toilet"></i><%= item.DueñoLugar.Nombre %></span>
                  </p>
                  <p class="margin-none"><%= item.Descripcion %></p>
                </div>
                  <button type="submit" class="btn btn-primary">More Info !</button>

              </div>
            </div>
          </div>
            <% } %>

            <% } %>
        </div>
      </div>
          
                
            </form>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
