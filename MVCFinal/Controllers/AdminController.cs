using EntidadesCompartidas;
using Logica;
using MVCFinal.Maps;
using MVCFinal.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Protocols;

namespace MVCFinal.Controllers
{
    public class AdminController : Controller
    {
        //

        #region ServicioWCF

        Maps.IServicioEvento _ServicioWCF = null;

        private IServicioEvento CreoServicio()
        {
            try
            {
                if (_ServicioWCF == null)

                    _ServicioWCF = new ServicioEventoClient();
            }
            catch (Exception ex)
            {
                throw new System.ServiceModel.FaultException(ex.Message);
            }
            return _ServicioWCF;
        }

        private void CerrarServicio()
        {
             if (_ServicioWCF != null)
             {
                 Maps.ServicioEventoClient e = new ServicioEventoClient();

                 e.Close();
                 
             }
        }


        #endregion

        #region ConvertirModels

        public static EntidadesCompartidas.Ciudad convertirModelCiudad(MVCFinal.Models.CiudadModel model)
        {
            Maps.IServicioEvento _ServicioWCF = new ServicioEventoClient();
            EntidadesCompartidas.Ciudad p = new EntidadesCompartidas.Ciudad();

            p.Nombre = model.NombreCiudad;
            p.CoordenadaX = model.CoordenadaX;
            p.CoordenadaY = model.CoordenadaY;
            p.UnPais = _ServicioWCF.BuscarPais(model.NombrePais);

            
            return p;
        }

        // GET: /Admin/

        public static EntidadesCompartidas.Pais convertirModelPais(MVCFinal.Models.PaisModel model)
        {
            EntidadesCompartidas.Pais p = new EntidadesCompartidas.Pais();

            p.Nombre = model.NombrePais;
            p.CoordenadaX = model.CoordenadaX;
            p.CoordenadaY = model.CoordenadaY;
            p.CodPais = model.CodPais;


            return p;
        }

        #endregion

        #region MetodosControllers

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Guardar")]
        public ActionResult Guardar(FormCollection collection)
        {
            try
            {

              
                PaisModel Pais = (PaisModel)Session["PaisActual"];
                

                MVCFinal.Models.CiudadModel Ciudad = new Models.CiudadModel();

                Ciudad.NombrePais = Convert.ToString(collection["NombrePais"]);
                Ciudad.NombreCiudad = Convert.ToString(collection["NombreCiudad"]);
                Ciudad.CoordenadaX = float.Parse(collection["CoordenadaX"], System.Globalization.CultureInfo.InvariantCulture);
                Ciudad.CoordenadaY = float.Parse(collection["CoordenadaY"], System.Globalization.CultureInfo.InvariantCulture);

                CreoServicio().AltaUbicacion(convertirModelCiudad(Ciudad));

                string JsonPais = JsonConvert.SerializeObject(Pais);
                Session["Pais"] = JsonPais;

                Session["CiudadActual"] =Ciudad;

                return RedirectToAction("ControlCiudad", "Admin");

            }

            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }
            
            finally
            {
             CerrarServicio();   
            }

            return View();
        }

        public ActionResult ControlEventos()
        {

            MVCFinal.Models.EventoModel Evento=new EventoModel();

            

            try
            {

                List<EntidadesCompartidas.Evento> lista = CreoServicio().ListarEventosOrdenFecha().ToList();

               Evento.milista = lista;
                return View(Evento);

            }
            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }
        [HttpGet]
        public ActionResult ControlCiudad()
        {

            MVCFinal.Models.CiudadModel Ciudad = new CiudadModel();
            MVCFinal.Models.PaisModel Pais;
            Pais = (PaisModel)Session["PaisActual"];

            try
            { 

            List<EntidadesCompartidas.Ciudad> lista = CreoServicio().ListarCiudadesPais(convertirModelPais(Pais)).ToList();

            string JsonResponse = JsonConvert.SerializeObject(lista);
            Session["ListarCiudadesPais"] = JsonResponse;
            string JsonPais = JsonConvert.SerializeObject(Pais);
            Session["Pais"] = JsonPais;

            Ciudad.milista = lista;
            return View(Ciudad);

            }
            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }


        [HttpGet]
        public ActionResult ControlPaises()
        {
           
            
            PaisModel pais = new PaisModel();

            try
            {


                List<EntidadesCompartidas.Pais> lista = CreoServicio().ListarPais().ToList();
               

                

                string JsonResponse = JsonConvert.SerializeObject(lista);
                Session["ListaPaises"] = JsonResponse;
                pais.milista = lista;
                Session["ListaTablePais"] = lista;
                return View(pais);             


            }
            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }

        public ActionResult ModificarPerfil1()
        {
            try
            {


                if (Session["Admin"] == null)
                {
                    RedirectToAction("Portada,Index");
                }
                else
                {
                    Admin miAdmin = (Admin)Session["Admin"];


                    string JsonAdmin = JsonConvert.SerializeObject(miAdmin);
                    Session["AdminJson"] = JsonAdmin;

                    MVCFinal.Models.AdminModel a = new AdminModel();
                    a.Ci = miAdmin.CI;
                    a.Password = miAdmin.Contraseña;
                    a.Email = miAdmin.Email; ;
                    a.Nombre = miAdmin.Nombre;
                    a.Usuario = miAdmin.NombreUsuario;




                    //Cargo la lista de feedback por usuario 
                    List<FeedbackEvento> ListFeddback = FabricaLogica.getLogicaFeedbackEvento().ListarMensajesFeedbackEvento();


                    Session["ListFeedback"] = ListFeddback;


                    return View(a);

                }
            }
            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }


        public ActionResult ModificarPerfil()
        {
            try
            {

            if (Session["Admin"] == null)
            {
                RedirectToAction("Portada,Index");
            }
            else
            {
                EntidadesCompartidas.Admin miAdmin =(Admin)Session["Admin"];

                
                string JsonAdmin = JsonConvert.SerializeObject(miAdmin);
                Session["AdminJson"] = JsonAdmin;

                MVCFinal.Models.AdminModel a = new AdminModel();
                a.Ci = miAdmin.CI;
                a.Password = miAdmin.Contraseña;
                a.Email = miAdmin.Email; ;
                a.Nombre = miAdmin.Nombre;
                a.Usuario = miAdmin.NombreUsuario;
                

                return View(a);

                }
            }
             catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }


        [HttpGet]
        public ActionResult SeleccionarEvento(int IdEvento)
        {
            try
            {

                EntidadesCompartidas.Evento evento = new Evento();

                evento = CreoServicio().BuscarEvento(IdEvento);

                EventoModel model=new EventoModel();

                model.IdEvento = evento.IdEvento;
                model.ClasificacionEvento.NombreCategoria = evento.CategoriaEvento.NombreCategoria;
                model.ClasificacionEvento.Descripcion = evento.CategoriaEvento.Descripcion;
                model.Descripcion = evento.Descripcion;
                model.FechaInicio = evento.FechaInicio;
                model.FechaFin = evento.FechaFin;
                model.OrganizadorEvento.CI = evento.UnOrganizador.CI;
                model.OrganizadorEvento.Contraseña = evento.UnOrganizador.Contraseña;
                model.OrganizadorEvento.Email = evento.UnOrganizador.Email;
                model.OrganizadorEvento.Nombre = evento.UnOrganizador.Nombre;
                model.OrganizadorEvento.NombreUsuario = evento.UnOrganizador.NombreUsuario;

                Session["EventoSeleccionado"] = model;

                return View("",model);
            }
            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }


        [HttpGet]
        public ActionResult ElegirFeedback(int IdFeedback)
        {
            try
            {

                EntidadesCompartidas.FeedbackEvento feedback = new FeedbackEvento();

               feedback = Logica.FabricaLogica.getLogicaFeedbackEvento().BuscarMensajeFeedbackEvento(IdFeedback);

                FeebackAdminModel model = new FeebackAdminModel();

                model.FeedbackSeleccionado.UsuarioFeedback.CI = feedback.UsuarioFeedback.CI;
                model.FeedbackSeleccionado.UsuarioFeedback.Contraseña = feedback.UsuarioFeedback.Contraseña;
                model.FeedbackSeleccionado.UsuarioFeedback.Email = feedback.UsuarioFeedback.Email;
                model.FeedbackSeleccionado.UsuarioFeedback.Nombre = feedback.UsuarioFeedback.Nombre;
                model.FeedbackSeleccionado.UsuarioFeedback.NombreUsuario = feedback.UsuarioFeedback.NombreUsuario;
                model.FeedbackSeleccionado.EventoFeedback.NombreEvento = feedback.EventoFeedback.NombreEvento;
                model.FeedbackSeleccionado.EventoFeedback.Descripcion= feedback.EventoFeedback.Descripcion;
                model.FeedbackSeleccionado.EventoFeedback.FechaInicio = feedback.EventoFeedback.FechaInicio;
                model.FeedbackSeleccionado.EventoFeedback.FechaFin = feedback.EventoFeedback.FechaFin;
                model.FeedbackSeleccionado.EventoFeedback.CategoriaEvento.NombreCategoria = feedback.EventoFeedback.CategoriaEvento.NombreCategoria;

                Session["FeedbackSeleccionado"] = model;

                List<EntidadesCompartidas.ComentarioFeedbackEvento> comentariosFeedback = new List<ComentarioFeedbackEvento>();

                 comentariosFeedback = Logica.FabricaLogica.getLogicaComentariosFeedbackEvento().ListarComentariosdeUnMensajeFeedbackEvento(feedback.IdFeedbackEvento);

                 model.listaComentariosFeedback = comentariosFeedback;

                 Session["ComentariosMensajeSelect"] = model.listaComentariosFeedback;


                return View(model);
            
            }
            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }




        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Save Changes")]
        public ActionResult SaveChanges(FormCollection collection)
        {

            try
            {

                if (Session["Admin"] == null)
                {
                    RedirectToAction("Portada,Index");
                }
                else
                {
                    AdminModel miAdmin = (AdminModel)Session["Admin"];



                    miAdmin.Ci = Convert.ToString(collection["Ci"]);
                    miAdmin.Email = Convert.ToString(collection["Email"]);
                    miAdmin.Nombre = Convert.ToString(collection["Nombre"]);
                    miAdmin.Password = Convert.ToString(collection["Password"]);
                    miAdmin.Usuario = Convert.ToString(collection["Usuario"]);

                    EntidadesCompartidas.Admin admin = new Admin();

                    admin.CI = miAdmin.Ci;
                    admin.Contraseña = miAdmin.Password;
                    admin.Email = miAdmin.Email;
                    admin.Nombre = miAdmin.Nombre;
                    admin.NombreUsuario = miAdmin.Usuario;



                    CreoServicio().ModificarUsuario((Usuario)admin);


                    return RedirectToAction("Principal", "Admin");

                }

            }
            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }





        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Enviar Datos")]
        public ActionResult  EnviarDatos(FormCollection collection)
        {

            try
            {
                MVCFinal.Models.PaisModel Pais = new Models.PaisModel();

                Pais.NombrePais = Convert.ToString(collection["NombrePais"]);
                Pais.CodPais = Convert.ToString(collection["CodPais"]);
                Pais.CoordenadaX = float.Parse(collection["CoordenadaX"], System.Globalization.CultureInfo.InvariantCulture);
                Pais.CoordenadaY = float.Parse(collection["CoordenadaY"], System.Globalization.CultureInfo.InvariantCulture);

                CreoServicio().AltaUbicacion(convertirModelPais(Pais));

                Session["PaisActual"] = Pais;


                return RedirectToAction("ControlCiudad", "Admin");
                
            }
            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Eliminar")]
        public ActionResult Eliminar(FormCollection collection)
        {

            try
            {

                string NombrePais = Convert.ToString(collection["NombrePais"]);

                EntidadesCompartidas.Pais pais = new EntidadesCompartidas.Pais();

                pais = CreoServicio().BuscarPais(NombrePais);


                CreoServicio().EliminarUbicacion(pais);

                return View();

            }
            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }


        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Dar de Baja")]
        public ActionResult DarBaja(FormCollection collection)
        {


            try
            {

                string NombreCiudad = Convert.ToString(collection["NombreCiudad"]);

                EntidadesCompartidas.Ciudad ciudad = new EntidadesCompartidas.Ciudad();

                ciudad = CreoServicio().BuscarCiudad(NombreCiudad);


                CreoServicio().EliminarUbicacion(ciudad);

                return View();

            }
            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }


        
        public ActionResult ControlLugares()
        {
            return View();
        }

        public ActionResult ControlFeedbacks()
        {
            if (Session["Admin"] == null)
            {
                RedirectToAction("Portada,Index");
            }
            else
            {

                FeebackAdminModel feedback = new FeebackAdminModel();

                try
                {

                    List<EntidadesCompartidas.FeedbackEvento> lista = Logica.FabricaLogica.getLogicaFeedbackEvento().ListarMensajesFeedbackEvento();

                    feedback.listaFeedback = lista;

                    Session["ControlAdminListaFeedback"] = lista;
                    return View(feedback);

                }
                catch (SoapException ex)
                {
                    ViewBag.Text = CodigoCatchSoap(ex);
                }
                catch (FaultException ex)
                {
                    ViewBag.Text = CodigoCatchFault(ex);
                }
                catch (Exception ex)
                {
                    ViewBag.Text = CodigoCatch(ex);
                }

                finally
                {
                    CerrarServicio();
                }        

            }

            return View();
        }


        #endregion


        #region Exceptions

        private String CodigoCatch(Exception ex)
        {
            String msg = ex.Message; ;
            if (msg.Length > 100)
                msg = msg.Substring(0, 100);
            return msg;
        }

        private String CodigoCatchSoap(SoapException ex)
        {
            String msg = "Error al procesar la solicitud. Verifique informacion igresada.";

            if (ex.Detail.InnerText.CompareTo(String.Empty) == 0)
            {
                if (ex.Message.Contains("&$"))
                {
                    msg = (ex.Message.Split((new String[] { "&$" }), StringSplitOptions.RemoveEmptyEntries))[1];
                }
            }
            else
            {
                if (ex.Detail.InnerText.Length > 100)
                    msg = ex.Detail.InnerText.Substring(0, 100);
                else
                    msg = ex.Detail.InnerText;
            }
            return msg;
        }

        private String CodigoCatchFault(FaultException ex)
        {
            String msg = ex.Message;

            if (msg.Contains("&$"))
            {
                msg = (ex.Message.Split((new String[] { "&$" }), StringSplitOptions.RemoveEmptyEntries))[1];
            }
            else
            {
                if (msg.Length > 100)
                    msg = msg.Substring(0, 100);
            }
            return msg;
        }

        #endregion

    }
}
