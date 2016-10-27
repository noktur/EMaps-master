using Logica;
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
    public class PaisController : Controller
    {

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



        //
        // GET: /Pais/ 
        [HttpGet]
        public ActionResult Index()
        {
              
           
            try
            {           
                List<PaisModel> list=new List<PaisModel>();
                 List<EntidadesCompartidas.Pais> lista  = CreoServicio().ListarPais().ToList();
                
                if (lista.Count > 0)
                {
                    for(int i=0; i < lista.Count;i++)
                    {
                        MVCFinal.Models.PaisModel Pais=new PaisModel();

                        Pais.CoordenadaX=lista[i].CoordenadaX ;
                        Pais.CoordenadaY = lista[i].CoordenadaY;
                        Pais.NombrePais = lista[i].Nombre;
                        Pais.CodPais = lista[i].CodPais;

                        list.Add(Pais);
                   }
                    
             
                }
           
                    string JsonResponse =JsonConvert.SerializeObject(list);
                    Session["datos"] = JsonResponse;
                return View();

            }
            catch
            {
                return View();
            }
        }


        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Guardar")]
        public ActionResult Guardar(FormCollection collection)
        {

            try
            {
                MVCFinal.Models.PaisModel Pais = new Models.PaisModel();
                
                Pais.NombrePais = Convert.ToString(collection["NombrePais"]);
                Pais.CodPais = Convert.ToString(collection["CodPais"]);
                Pais.CoordenadaX =float.Parse(collection["CoordenadaX"],System.Globalization.CultureInfo.InvariantCulture);
                Pais.CoordenadaY =float.Parse(collection["CoordenadaY"],System.Globalization.CultureInfo.InvariantCulture);
                
                CreoServicio().AltaUbicacion(convertirModelPais(Pais));
                
                Session["PaisActual"]=Pais;

                return RedirectToAction("Index","Ciudad");

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


        public static EntidadesCompartidas.Pais convertirModelPais(MVCFinal.Models.PaisModel model)
        {
            EntidadesCompartidas.Pais p = new EntidadesCompartidas.Pais();

            p.Nombre = model.NombrePais;
            p.CoordenadaX = model.CoordenadaX;
            p.CoordenadaY = model.CoordenadaY;
            p.CodPais = model.CodPais;


            return p;
        }

    }
}
