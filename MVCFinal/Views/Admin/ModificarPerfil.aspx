<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterAdmin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">

<section class="content-block contact-1 pad0 pad-bottom0 margin-top0 margin-bottom0 bg-deepocean offwhite">
            <div class="container text-center">
                <div class="col-sm-8 col-md-9 col-md-offset-1 pad-bottom25">
                    <div class="tab-pane fade in active pad-bottom0 pad0">
                        <h3 class="text-left">Edit Profile Settings</h3>
                    </div>
                    <p class="offwhite text-left margin-top20 pad-bottom20">En este modulo usted podra modificar los datos de su perfil en caso que lo solicite.</p>
                    <form action="./page-settings.html" class="form-horizontal" data-pg-collapsed> 
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">Cedula Identidad</label>
                            <div class="col-md-7">
                                <input type="text" name="user-name" value="jumpstartui" class="form-control" disabled="">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">First Name</label>
                            <div class="col-md-7">
                                <input type="text" name="first-name" value="Rod" class="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">Last Name</label>
                            <div class="col-md-7">
                                <input type="text" name="last-name" value="Howard" class="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">Email Address</label>
                            <div class="col-md-7">
                                <input type="text" name="email-address" value="rod@example.com" class="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <label class="col-md-3 text-left">User Login</label>
                            <div class="col-md-7">
                                <input type="text" name="website" value="http://jumpstartthemes.com" class="form-control">
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->                         
                        <!-- /.form-group -->
                        <div class="form-group">
                            <div class="col-md-7 col-md-push-3">
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                &nbsp;
                                <button type="reset" class="btn btn-default">Cancel</button>
                            </div>                             
                            <!-- /.col -->
                        </div>                         
                        <!-- /.form-group -->
                    </form>
                </div>
                <!-- /.container -->
        </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
