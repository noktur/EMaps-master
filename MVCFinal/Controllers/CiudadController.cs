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
    
    public class CiudadController : Controller
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
        // GET: /Ciudad/
         [HttpGet]
        //Operacion que forma un json obtenido desde una lista de ciudades y retorna a la vista
        public ActionResult Index()
        {

            MVCFinal.Models.CiudadModel Ciudad = new CiudadModel();
            MVCFinal.Models.PaisModel Pais;
            Pais = (PaisModel)Session["PaisActual"];
            
            try
            {
                List<CiudadModel> list = new List<CiudadModel>();
                List<EntidadesCompartidas.Ciudad> lista = CreoServicio().ListarCiudadesPais(convertirModelPais(Pais)).ToList();

               if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        Ciudad.CoordenadaX = lista[i].CoordenadaX ;
                        Ciudad.CoordenadaY = lista[i].CoordenadaY;
                        Ciudad.NombrePais = lista[i].UnPais.Nombre;
                        Ciudad.NombreCiudad = lista[i].Nombre;
                    }

                    list.Add(Ciudad);

                    
                }
               else
               {
                   lista = null;
               }

               string JsonResponse = JsonConvert.SerializeObject(list);
               Session["ListarCiudadesPais"] = JsonResponse;
               string JsonPais = JsonConvert.SerializeObject(Pais);
               Session["Pais"] = JsonPais;
 
                return View();
                
            }
            catch
            {

                string JsonPais = JsonConvert.SerializeObject(Pais);
                Session["Pais"] = JsonPais;
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
         [MultiButton(MatchFormKey = "action", MatchFormValue = "Guardar")]
         public ActionResult Guardar(FormCollection collection)
         {

             try
             {
                 MVCFinal.Models.CiudadModel Ciudad = new Models.CiudadModel();

                Ciudad.NombrePais = Convert.ToString(collection["NombrePais"]);
                 Ciudad.NombreCiudad = Convert.ToString(collection["NombreCiudad"]);
                 Ciudad.CoordenadaX = float.Parse(collection["CoordenadaX"],System.Globalization.CultureInfo.InvariantCulture);
                 Ciudad.CoordenadaY = float.Parse(collection["CoordenadaY"],System.Globalization.CultureInfo.InvariantCulture);

                 CreoServicio().AltaUbicacion(convertirModelCiudad(Ciudad));

                 Session["Ciudad"] = Ciudad;
                 
                 return RedirectToAction("Index", "Lugar");

             }
             catch
             {
                 return View();
             }
         }


         public static EntidadesCompartidas.Ciudad convertirModelCiudad(MVCFinal.Models.CiudadModel model)
         {
             Maps.IServicioEvento _ServicioWCF = new ServicioEventoClient();
             EntidadesCompartidas.Ciudad p = new EntidadesCompartidas.Ciudad();
             
             p.Nombre = model.NombreCiudad;
             p.CoordenadaX = model.CoordenadaX;
             p.CoordenadaY = model.CoordenadaY;           
             p.UnPais= _ServicioWCF.BuscarPais(model.NombrePais);

             return p;
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
