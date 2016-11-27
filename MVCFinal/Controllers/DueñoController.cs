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
    public class DueñoController : Controller
    {
        //
        // GET: /Dueño/

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
        public ActionResult SeleccionarLugar(string NombreLugar)
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
        

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult PlanoLugar()
        {
            if(Session["Dueño"] != null)
            {
                MVCFinal.Models.PlanoModel Plano = new PlanoModel();
                EntidadesCompartidas.Mapa mapa = new EntidadesCompartidas.Mapa();
               

                try
                {

                    Session["Plano"] = mapa;
                    List<EntidadesCompartidas.Area> listaArea= Logica.FabricaLogica.getLogicaArea().ListarAreasDeMapa(mapa.IdMapa);
                    
                    


                    Plano.ListaAreasPlano=listaArea;
                    Session["ListaAreaPlano"] = Plano.ListaAreasPlano;
                    Plano.elMapa = mapa;
                    Session["MiMapa"] = Plano.elMapa;
                    string JsonMapa = JsonConvert.SerializeObject(Plano.elMapa);
                    Session["MapaJson"] = JsonMapa;
                    string JsonAreas = JsonConvert.SerializeObject(Plano.ListaAreasPlano);
                    Session["AreasMapaJson"] = JsonMapa;

                    return View(Plano);

                }
                catch
                {
                    return View();
                }
            }

            return RedirectToAction("Portada", "Index");
        }


        public ActionResult Principal()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CiudadObtenida(String[] nombre)
        {

            List<String> a = nombre.ToList();

            string ciudad = "";

            ciudad = nombre[0].ToString();

            LugarModel lugar = new LugarModel();

            lugar.Ciudad = FabricaLogica.getLogicaUbicacion().BuscarCiudad(ciudad);

            Session["Ciudad"] = lugar.Ciudad;

            string JsonCiudad = JsonConvert.SerializeObject(lugar.Ciudad);
            Session["CiudadJson"] = JsonCiudad;

            return Json(JsonCiudad,JsonRequestBehavior.AllowGet);
        }
        
        [HttpGet]
        public ActionResult AdministrarLugares()
        {

             MVCFinal.Models.CiudadModel Ciudad = new CiudadModel();
            MVCFinal.Models.LugarModel Lugar=new LugarModel();

            try
            { 

            List<EntidadesCompartidas.Ciudad> listaCiudad = Logica.FabricaLogica.getLogicaUbicacion().ListarCiudades();
            List<EntidadesCompartidas.Lugar> listaLugar = Logica.FabricaLogica.getLogicaLugar().ListarLugares();

            Lugar.milistaCiudad = listaCiudad;
            Lugar.milistaLugar = listaLugar;
            Session["ListaCiudad"] = listaCiudad;
            Session["ListaLugares"] = listaLugar;
            string JsonLugares = JsonConvert.SerializeObject(Lugar.milistaLugar);
            Session["LugaresMapaJson"] = JsonLugares;
            
            return View(Lugar);

            }
            catch
            {
                return View();
            }

        }

        public ActionResult FeedbackDueño()
        {
            return View();
        }
    }
}
