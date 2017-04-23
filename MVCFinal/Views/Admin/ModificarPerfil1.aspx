<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<MVCFinal.Models.AdminModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-register " style="color:#9fa8da;opacity:0.3;">
<div class="page-header">
      <h1 class="page-title">Information Profile</h1>
    </div>
    <div class="page-content container-fluid ">
      <div class="row">
        <div class="col-lg-3 col-sm-4 bg-blue-grey-50">
          <!-- Panel -->
          <div class="panel">
            <div class="panel-body">
              <div class="list-group" data-plugin="nav-tabs" role="tablist">
                <a class="list-group-item active" data-toggle="tab" href="#category-1" aria-controls="category-1" role="tab">Feedback</a>
                <a class="list-group-item" data-toggle="tab" href="#category-2" aria-controls="category-2" role="tab">Profile Update</a>
                <a class="list-group-item" data-toggle="tab" href="#category-3" aria-controls="category-3" role="tab">Profile Details</a>
                <a class="list-group-item" data-toggle="tab" href="#category-4" aria-controls="category-4" role="tab">Users Admin</a>
              </div>
            </div>
          </div>
          <!-- End Panel -->
        </div>

        <div class="col-lg-9 col-sm-8">
          <!-- Panel -->
          <div class="panel">
            <div class="panel-body">
              <div class="tab-content">
                <!-- Categroy 1 -->
                <div class=" tab-pane animation-fade active" id="category-1" role="tabpanel">
                  <div class="panel-group panel-group-simple panel-group-continuous" id="accordion2" aria-multiselectable="true" role="tablist">
                    <!-- Question 1 -->
                    <div class="panel">
                        <div class="panel-body">
                         <form id="formulario" class=" form-horizontal" runat="server"> 
                        <% if(Session["Admin"] != null) { %>
                        <% using (Html.BeginForm())
                           { %>
                    <div class="form-group form-material">
                      <label class="col-sm-3 control-label">Identity Card: </label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" readonly="readonly" name="Ci" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar su cedula)" placeholder="<%= Model.Password %>" autocomplete="off">
                      </div>
                    </div>
                    <div class="form-group form-material">
                      <label class="col-sm-3 control-label">Your Name: </label>

                      <div class="col-sm-9">
                        <input type="text" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar su nombre')" name="Nombre" id="Nombre" placeholder="<%= Model.Nombre %>" class="form-control">
                      </div>
                    </div>
                    <div class="form-group form-material">
                      <label class="col-sm-3 control-label">Your Password: </label>
                      <div class="col-sm-9">
                          <input type="password" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar su contraseña)" name="Password" id="Password" placeholder="<%= Model.Password %>" class="form-control">
                      </div>
                    </div>
                             <div class="form-group form-material">
                      <label class="col-sm-3 control-label">Your Email: </label>
                      <div class="col-sm-9">
                         <input type="email" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar su email)" name="Email" id="Email" placeholder="<%= Model.Email %>" class="form-control">
                      </div>
                    </div>
                                  <div class="form-group form-material">
                      <label class="col-sm-3 control-label">Your Username: </label>
                      <div class="col-sm-9">
                         <input type="text" required="required" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Se requiere ingresar su nombre de usuario)" name="Usuario" id="Usuario" placeholder="<%= Model.Usuario %>"  class ="form-control">
                      </div>
                    </div>
                    <div class="form-group form-material">
                      <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary waves-effect waves-light waves-effect waves-light" name="action" value="Save Changes">Save Changes </button>
                        <button type="reset" class="btn btn-warning waves-effect waves-light waves-effect waves-light">Reset</button>
                      </div>
                    </div>

                        <% } %>
                        <% } else {  %>
                        <div id="message">
                            <h1>No se encontro la informacion del admin </h1>
                        </div>
                        <% } %>
                    </form>            
                        </div>
                      </div>
                    <!-- End Question 1 -->
                  </div>
                </div>
                <!-- End Categroy 1 -->

                <!-- Categroy 2 -->
                <div class="tab-pane animation-fade" id="category-2" role="tabpanel">
                  <div class="panel-group panel-group-simple panel-group-continuous" id="accordion" aria-multiselectable="true" role="tablist">
                    <!-- Question 5 -->
                    <div class="panel">
                      <div class="panel-heading" id="question-5" role="tab">
                        <a class="panel-title" aria-controls="answer-5" aria-expanded="true" data-toggle="collapse" href="http://getbootstrapadmin.com/remark/material/iconbar/pages/faq.html#answer-5" data-parent="#accordion">
                        Can I exercitation occaecat voluptate duis ut dolore?
                      </a>
                      </div>
                      <div class="panel-collapse collapse in" id="answer-5" aria-labelledby="question-5" role="tabpanel">
                        <div class="panel-body">
                          Consecutus sicine hominum, artem conclusionemque patientia, omni fuerit intemperantiam
                          efficeretur phaedrum minime obiecta constituam, motus
                          mandamus perfunctio contra, imagines exquisitis reiciat.
                        </div>
                      </div>
                    </div>
                    <!-- End Question 5 -->

                    <!-- Question 6 -->
                    <div class="panel">
                      <div class="panel-heading" id="question-6" role="tab">
                        <a class="panel-title" aria-controls="answer-6" aria-expanded="false" data-toggle="collapse" href="http://getbootstrapadmin.com/remark/material/iconbar/pages/faq.html#answer-6" data-parent="#accordion">
                        How do lorem ipsum quis magna magna?
                      </a>
                      </div>
                      <div class="panel-collapse collapse" id="answer-6" aria-labelledby="question-6" role="tabpanel">
                        <div class="panel-body">
                          Pluribus horum laetamur forensibus investigandi gravissimis quaeque possumus copulationesque.
                          Sapientium interdictum, secutus servata expressas reici.
                          Dixerit dixerit tantis conscientiam arbitramur reprehensa
                          traditur propositum locos remotis, metus continent maledici
                          attico sermo iucundius gerendarum. Bonarum incommoda
                          afferrent iisque graeca perdiscere munere recordatione
                          nos sapiens, perspexit, oderit nominata.
                        </div>
                      </div>
                    </div>
                    <!-- End Question 6 -->

                    <!-- Question 7 -->
                    <div class="panel">
                      <div class="panel-heading" id="question-7" role="tab">
                        <a class="panel-title" aria-controls="answer-7" aria-expanded="false" data-toggle="collapse" href="http://getbootstrapadmin.com/remark/material/iconbar/pages/faq.html#answer-7" data-parent="#accordion">
                        How do I set up lorem ipsum?
                      </a>
                      </div>
                      <div class="panel-collapse collapse" id="answer-7" aria-labelledby="question-7" role="tabpanel">
                        <div class="panel-body">
                          Acute ennius fuisset facile plena quem possim tribus antipatrum moveat, praestabiliorem
                          geometria inportuno privamur, remissius habemus desperantes,
                          nullas quas terrore modum uberius homine adiuvet, dissentio
                          iudicabit ac, nullus molita foedus num. Circumcisaque
                          nulla aut etenim doceat pecunias afferrent infinitis,
                          propterea repellat epularum inveneris dissentiet meminerunt
                          malivoli gloriosis, faciunt petat conscientia, nesciunt
                          logikh fortunae, primos expedire aliquo putet aptissimum
                          officiis naturalem.
                        </div>
                      </div>
                    </div>
                    <!-- End Question 7 -->
                  </div>
                </div>
                <!-- End Categroy 2 -->

                <!-- Categroy 3 -->
                <div class="tab-pane animation-fade" id="category-3" role="tabpanel">
                  <div class="panel-group panel-group-simple panel-group-continuous" id="accordion1" aria-multiselectable="true" role="tablist">
                    <!-- Question 8 -->
                    <div class="panel">
                      <div class="panel-heading" id="question-8" role="tab">
                        <a class="panel-title" aria-controls="answer-8" aria-expanded="true" data-toggle="collapse" href="http://getbootstrapadmin.com/remark/material/iconbar/pages/faq.html#answer-8" data-parent="#accordion1">
                        How can I lorem ipsum elit commodo?
                      </a>
                      </div>
                      <div class="panel-collapse collapse in" id="answer-8" aria-labelledby="question-8" role="tabpanel">
                        <div class="panel-body">
                          Lorem ipsum Est dolore eiusmod sunt fugiat sunt minim qui ullamco incididunt mollit.
                        </div>
                      </div>
                    </div>
                    <!-- End Question 8 -->

                    <!-- Question 9 -->
                    <div class="panel">
                      <div class="panel-heading" id="question-9" role="tab">
                        <a class="panel-title" aria-controls="answer-9" aria-expanded="false" data-toggle="collapse" href="http://getbootstrapadmin.com/remark/material/iconbar/pages/faq.html#answer-9" data-parent="#accordion1">
                        Where can I lorem ipsum efficere sed ullamco?
                      </a>
                      </div>
                      <div class="panel-collapse collapse" id="answer-9" aria-labelledby="question-9" role="tabpanel">
                        <div class="panel-body">
                          Solitudo per mox coerceri efficere vetuit exhorrescere, silano sitisque efficere
                          iniurias adhaesiones agam dolores ponit multa. Exiguam
                          ii genus libidinosarum scribere, hinc ipsius severitatem
                          falsis desistemus praeteritas cogitemus delectu terentii,
                          pedalis angusta scripserit sit iucundum mirari ipsi parta.
                          Maluisti emolumento solido gravissimis amicitia ornatum
                          eademque scribi terentianus tollit, tranquillitatem intellegentium
                          persequeris ordiamur declinationem optio detrimenti inclusae,
                          augendas semper.
                        </div>
                      </div>
                    </div>
                    <!-- End Question 9 -->

                    <!-- Question 10 -->
                    <div class="panel">
                      <div class="panel-heading" id="question-10" role="tab">
                        <a class="panel-title" aria-controls="answer-10" aria-expanded="false" data-toggle="collapse" href="http://getbootstrapadmin.com/remark/material/iconbar/pages/faq.html#answer-10" data-parent="#accordion1">
                        Do I have to torquate artem irure et quis dolor?
                      </a>
                      </div>
                      <div class="panel-collapse collapse" id="answer-10" aria-labelledby="question-10" role="tabpanel">
                        <div class="panel-body">
                          Exeamus, frustra, imperitorum torquate artem efficeret talem vivendi, primum libidinem
                          virtus apte incurrunt, appetendum utramque, oderis. Homines
                          traditur loquerer fugiat sequitur gravitate nisi recordatione
                          efflorescere. Primisque hostis prorsus praeda, solitudo
                          labefactetur miserum chrysippi afficit deterret ipsam.
                        </div>
                      </div>
                    </div>
                    <!-- End Question 10 -->
                  </div>
                </div>
                <!-- End Categroy 3 -->

                <!-- Categroy 4 -->
                <div class="tab-pane animation-fade" id="category-4" role="tabpanel">
                  <div class="panel-group panel-group-simple panel-group-continuous" id="accordion3" aria-multiselectable="true" role="tablist">
                    <!-- Question 11 -->
                    <div class="panel">
                      <div class="panel-heading" id="question-11" role="tab">
                        <a class="panel-title" aria-controls="answer-11" aria-expanded="true" data-toggle="collapse" href="http://getbootstrapadmin.com/remark/material/iconbar/pages/faq.html#answer-11" data-parent="#accordion3">
                        What if caritatem interesse nulla ut non esse laborum?
                      </a>
                      </div>
                      <div class="panel-collapse collapse in" id="answer-11" aria-labelledby="question-11" role="tabpanel">
                        <div class="panel-body">
                          Malint docui o animos opus confidam isti animadvertat sententiae, imagines faciendumve
                          varias dolemus detrimenti caritatem, interesse primos
                          perfecto.
                        </div>
                      </div>
                    </div>
                    <!-- End Question 11 -->

                    <!-- Question 12 -->
                    <div class="panel">
                      <div class="panel-heading" id="question-12" role="tab">
                        <a class="panel-title" aria-controls="answer-12" aria-expanded="false" data-toggle="collapse" href="http://getbootstrapadmin.com/remark/material/iconbar/pages/faq.html#answer-12" data-parent="#accordion3">
                        Do my tempor fugiat dolore culpa commodo ex?
                      </a>
                      </div>
                      <div class="panel-collapse collapse" id="answer-12" aria-labelledby="question-12" role="tabpanel">
                        <div class="panel-body">
                          Lorem ipsum Aliquip aute ut tempor consectetur laboris ea aliqua Duis Excepteur
                          laboris consequat enim dolore dolore ut officia esse
                          sunt ut voluptate cupidatat.
                        </div>
                      </div>
                    </div>
                    <!-- End Question 12 -->

                    <!-- Question 13 -->
                    <div class="panel">
                      <div class="panel-heading" id="question-13" role="tab">
                        <a class="panel-title" aria-controls="answer-13" aria-expanded="false" data-toggle="collapse" href="http://getbootstrapadmin.com/remark/material/iconbar/pages/faq.html#answer-13" data-parent="#accordion3">
                        How do I metuamus ipsum nostrud commodo aliquip?
                      </a>
                      </div>
                      <div class="panel-collapse collapse" id="answer-13" aria-labelledby="question-13" role="tabpanel">
                        <div class="panel-body">
                          Illo scribi depulsa atomus puto omnium legat, plus pater. Siculis voluptate repellendus
                          debilitatem moderatio angatur careret, integre quale
                          sollicitant, potest fallare attingere theophrasti gratiam
                          quasi, vivendum solet metuamus declinare, elegans detractis.
                          Loquuntur coerceri solitudo optabilem transferre malum.
                          Desiderat. Didicisset. Timiditatem, aliena, tranquilli
                          dicebas sicine. Conquirendae refugiendi desideret disserunt
                          probaretur, brevis iure eidola intemperantiam dixisset
                          quiete quaerenda ferae patria, dicemus declinabunt congressus,
                          auctori referuntur, aliquod consumere consumeret quicquam
                          mors, longinquitate tenebimus alienae sensu impeditur,
                          uberius splendore, aegritudo rem cognitionem alienus
                          quamvis.
                        </div>
                      </div>
                    </div>
                    <!-- End Question 13 -->
                  </div>
                </div>
                <!-- End Categroy 4 -->
              </div>
            </div>
          </div>
          <!-- End Panel -->
        </div>
      </div>
    </div>
  <!-- End Page -->
    </div>
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
   

  
</asp:Content>
