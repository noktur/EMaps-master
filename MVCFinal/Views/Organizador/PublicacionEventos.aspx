<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterOrganizador.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <section class="content-block content-1-8 pad-bottom15 pad45">
                <div class="container">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10">
                            <div class="underlined-title pad-bottom10">
                                <h1 class="text-left orange" style="font-size:3.5em;font-family:grand hote;">Publicacion evento</h1>
                                <hr class="text-left">
                                <h2 class="text-left">realize la publicacion sobre un evento al instante</h2>
                            </div>
                            <p class="orange margin-top0 margin-bottom45 pad0" style="font-size:0.9em;font-family:constantia;">Aqui usted podra agregar los datos pertinentes a la publicacion de un evento</p>
                            <div id="contact1" class="form-container">
                                <div id="message1"></div>
                                <form method="post" action="js/contact-form.php" name="contactform" id="contactform1">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <select class="form-control"> 
                                                    <option>Lugar 1</option>                                                     
                                                    <option>Lugar 2</option>                                                     
                                                    <option>Lugar 3</option>                                                     
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input name="email" id="email1" type="datetime-local" value="" placeholder="Email" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input name="phone" id="phone1" type="datetime-local" value="" placeholder="Phone" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.row -->
                                    <div class="form-group text-center">
                                        <button class="btn btn-warning" type="submit" id="cf-submit1" name="submit">Comprobar disponibilidad</button>
                                    </div>
                                    <div class="text-center col-md-5" style="padding-left:0px;">
                                        <div class="form-group"> 
                                            <label class="control-label pull-left orange" for="formInput132" style=" font-family:Constantia; font-size:0.9em;">Elige un lugar</label>                                             
                                            <select id="formInput132" class="form-control"> 
                                                <option>Categoria 1</option>                                                 
                                                <option>Categoria 2</option>                                                 
                                                <option>Categoria 3</option>                                                 
                                            </select>
                                        </div>                                         
                                    </div>
                                    <div class="form-group">
                                        <textarea name="comments" id="comments1" class="form-control" rows="3" placeholder="Message"></textarea>
                                        <p class="small text-muted"><span class="guardsman">* All fields are required.</span> Once we receive your message we will respond as soon as possible.</p>
                                    </div>
                                    <div class="form-group text-center">
                                        <button class="btn btn-info" type="submit" id="cf-submit1" name="submit">PUBLICAR EVENTO</button>
                                    </div>
                                </form>
                            </div>
                            <!-- /.form-container -->
                        </div>
                    </div>
                </div>
            </section>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
