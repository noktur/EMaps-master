using MVCFinal.Maps;
using MVCFinal.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class AdminController : Controller
    {
        //

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
            catch
            {
                return View();
            }
        }

        public ActionResult ControlEventos()
        {

            MVCFinal.Models.EventoModel Evento=new EventoModel();

            try
            {

                List<EntidadesCompartidas.Evento> lista = Logica.FabricaLogica.getLogicaEvento().ListarEventosOrdenFecha();

               Evento.milista = lista;
                return View(Evento);

            }
            catch
            {

                return View();
            }
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
            catch
            {

                string JsonPais = JsonConvert.SerializeObject(Pais);
                Session["Pais"] = JsonPais;
                return View();
            }

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
            catch
            {
                return View();
            }
        }

        public ActionResult ModificarPerfil()
        {

            if (Session["Admin"] == null)
            {
                RedirectToAction("Portada,Index");
            }
            else
            {
                AdminModel miAdmin =(AdminModel)Session["Admin"];

                return View(miAdmin);

            }


            return RedirectToAction("Portada", "Index");
        }

        public ActionResult SaveChanges()
        {

            if (Session["Admin"] == null)
            {
                RedirectToAction("Portada,Index");
            }
            else
            {
                AdminModel miAdmin = (AdminModel)Session["Admin"];

                return View(miAdmin);

            }


            return View();
        }






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
                ViewBag.Text = "Problemas al crear Servicio: " + ex.Message;
            }
            return _ServicioWCF;
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
            catch
            {
                return View();
            }
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Buscar")]
        public ActionResult Buscar(FormCollection collection)
        {
            try
            {
                return View();

            }
            catch
            {
                return View();
            }
        }



        [HttpPost]
        public ActionResult ModificarCiudad(string Nombre)
        {
            string valor1="";
            valor1 = Nombre;

            try
            {
               
                


                return View();

            }
            catch
            {
                return View();
            }
        }



        [HttpGet]
        public ActionResult ModificarPais(string NombrePais)
        {
            string valor1 = "";
            valor1 = NombrePais;

            try
            {




                return View();

            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Eliminar")]
        public ActionResult Eliminar(FormCollection coleccion)
        {
            try
            {
                string Nombre = Convert.ToString(coleccion["Nombre"]);

                
                    return View();

            }
            catch
            {
                return View();
            }
        }



        public static EntidadesCompartidas.Pais convertirModelPais(MVCFinal.Models.PaisModel model)
        {
            EntidadesCompartidas.Pais p = new EntidadesCompartidas.Pais();

            p.Nombre = model.NombrePais;
            p.CoordenadaX = model.CoordenadaX;
            p.CoordenadaY = model.CoordenadaY;
            p.CodPais = model.CodPais;


            return p;
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
                catch
                {
                    return View();
                }          

            }


            return RedirectToAction("Portada,Index");
        }

    }
}
