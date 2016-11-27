using EntidadesCompartidas;
using Logica;
using MVCFinal.Maps;
using MVCFinal.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

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


         [HttpPost]
        public JsonResult GuardarImagenFondo() 
         {
            int largoKeys = 0;
            largoKeys = System.Web.HttpContext.Current.Request.Files.AllKeys.Length;
            string res = "";
            Usuario usr = null;//new Usuario(); //setear usuario

            Image b = null;
            if (largoKeys > 0) {
                string pathForSaving = RutaImagenesGuardar;
                if (System.Web.HttpContext.Current.Request.Form.Keys.Count == 2) {
                }
                var pic = System.Web.HttpContext.Current.Request.Files["HelpSectionImages"];
                string exttension = System.IO.Path.GetExtension(pic.FileName);
                string nombreimagen = ""; //TODO: Obtener nombre del usuario en session para darle nombre al mapa
                Random rdm = new Random();
                int numRdm = rdm.Next(0, 999);
                nombreimagen += "_" + numRdm.ToString();
                string x = "0";
                string y = "0";
                string imagenPath;
                if (exttension != ".png") {
                    try {
                        nombreimagen += ".jpg";
                        string originalPicTemp = RutaImagenesGuardar;//Temp + "temp\\l\\";
                        pic.SaveAs(originalPicTemp + nombreimagen);
                        originalPicTemp = originalPicTemp + nombreimagen;
                        imageForCropping img = new imageForCropping(originalPicTemp, pathForSaving, usr, x, y, b, res);
                        img.isPng = false;
                        img.setPaths(null, null);//aca deberiamos setear si precisamos distintos tamaños
                        imagenPath = originalPicTemp;
                    } 
                    catch (Exception ex) 
                    {
                        res = ex.Message;
                    }
                } else 
                {
                    try {
                        nombreimagen += ".png";
                        string originalPicTemp = RutaImagenesGuardar;// + "temp\\l\\";
                        if (!Directory.Exists(originalPicTemp))
                            Directory.CreateDirectory(originalPicTemp);
                        pic.SaveAs(originalPicTemp + nombreimagen);
                        originalPicTemp = originalPicTemp + nombreimagen;
                        imageForCropping img = new imageForCropping(originalPicTemp, pathForSaving, usr, x, y, b, res);
                        img.isPng = true;
                        img.setPaths(null, null);
                        imagenPath = originalPicTemp;
                    } catch (Exception ex) {
                        res = ex.Message;
                    }
                }
            }
            return Json(new { message = res }, "text/html");
        }

    

    [Serializable]
    public class imageForCropping {
        //public System.Web.HttpPostedFile pic;
        public string originalPicTemp;
        public string pathForSaving;
        public Usuario usr;
        public string x;
        public string y;
        public Image b;
        public string res;
        public string pathForSaving400x300;
        public string pathForSaving1280x220;
        public bool isPng;


        public imageForCropping() {
            originalPicTemp = null;
            pathForSaving = null;
            usr = null;
            x = null;
            y = null;
            b = null;
            res = null;
            pathForSaving400x300 = null;
            pathForSaving1280x220 = null;

        }

        public imageForCropping(string pic1, string pathForSaving1, Usuario usr1, string x1, string y1, Image b1, string res1) {
            originalPicTemp = pic1;
            pathForSaving = pathForSaving1;
            usr = usr1;
            x = x1;
            y = y1;
            b = b1;
            res = res1;
        }

        public void setPaths(string p400x300, string p1280x220) { //aca podemos setear los tamaños
            this.pathForSaving400x300 = p400x300;
            this.pathForSaving1280x220 = p1280x220;
        }
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
