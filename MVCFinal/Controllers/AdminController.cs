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
            return View();
        }

        public ActionResult ControlCiudad()
        {
            return View();
        }

        public ActionResult ControlPaises()
        {

            try
            {
                
                PaisModel model = new PaisModel();   
                model.milista = CreoServicio().ListarPais().ToList();
               

                if (model.milista.Count > 0)
                {

                    string JsonResponse = JsonConvert.SerializeObject(model.milista);
                    Session["ListaPaises"] = JsonResponse;

                    return View(model.milista); 
                   
                }


                return View();


            }
            catch
            {
                return View();
            }
        }

        public ActionResult ModificarPerfil()
        {
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
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Modificar")]
        public ActionResult Modificar(PaisModel miPais)
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
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Eliminar")]
        public ActionResult Eliminar(PaisModel milista)
        {
            try
            {

                    var nombrePais = "";

                    nombrePais = milista.milista[0].Nombre;
                    
                
                    
                    
                
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
