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
        // GET: /Admin/

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

            try
            {


                List<EntidadesCompartidas.Pais> lista = CreoServicio().ListarPais().ToList();
                PaisModel pais = new PaisModel();

                

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
        public ActionResult Guardar(FormCollection collection)
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
            return View();
        }

    }
}
