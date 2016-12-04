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

            string JsonCiudad = JsonConvert.SerializeObject(lugar.Ciudad);
            Session["CiudadJson"] = JsonCiudad;

           

            return Json(JsonCiudad,JsonRequestBehavior.AllowGet);

        }


        // [HttpPost]
        //public JsonResult GuardarImagenFondo() 
        // {
        //    int largoKeys = 0;
        //    largoKeys = System.Web.HttpContext.Current.Request.Files.AllKeys.Length;
        //    string res = "";
        //    Usuario usr = null;//new Usuario(); //setear usuario

        //    Image b = null;
        //    if (largoKeys > 0) {
        //        string pathForSaving = RutaImagenesGuardar;
        //        if (System.Web.HttpContext.Current.Request.Form.Keys.Count == 2) {
        //        }
        //        var pic = System.Web.HttpContext.Current.Request.Files["HelpSectionImages"];
        //        string exttension = System.IO.Path.GetExtension(pic.FileName);
        //        string nombreimagen = ""; //TODO: Obtener nombre del usuario en session para darle nombre al mapa
        //        Random rdm = new Random();
        //        int numRdm = rdm.Next(0, 999);
        //        nombreimagen += "_" + numRdm.ToString();
        //        string x = "0";
        //        string y = "0";
        //        string imagenPath;
        //        if (exttension != ".png") {
        //            try {
        //                nombreimagen += ".jpg";
        //                string originalPicTemp = RutaImagenesGuardar;//Temp + "temp\\l\\";
        //                pic.SaveAs(originalPicTemp + nombreimagen);
        //                originalPicTemp = originalPicTemp + nombreimagen;
        //                imageForCropping img = new imageForCropping(originalPicTemp, pathForSaving, usr, x, y, b, res);
        //                img.isPng = false;
        //                img.setPaths(null, null);//aca deberiamos setear si precisamos distintos tamaños
        //                imagenPath = originalPicTemp;
        //            } 
        //            catch (Exception ex) 
        //            {
        //                res = ex.Message;
        //            }
        //        } else 
        //        {
        //            try {
        //                nombreimagen += ".png";
        //                string originalPicTemp = RutaImagenesGuardar;// + "temp\\l\\";
        //                if (!Directory.Exists(originalPicTemp))
        //                    Directory.CreateDirectory(originalPicTemp);
        //                pic.SaveAs(originalPicTemp + nombreimagen);
        //                originalPicTemp = originalPicTemp + nombreimagen;
        //                imageForCropping img = new imageForCropping(originalPicTemp, pathForSaving, usr, x, y, b, res);
        //                img.isPng = true;
        //                img.setPaths(null, null);
        //                imagenPath = originalPicTemp;
        //            } catch (Exception ex) {
        //                res = ex.Message;
        //            }
        //        }
        //    }
        //    return Json(new { message = "" }, "text/html");
        //}

    
        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Guardar lugar")]
        public ActionResult Guardar(FormCollection collection)
        {
            try
            {

                EntidadesCompartidas.Dueño dueño = new Dueño();
                dueño = (EntidadesCompartidas.Dueño)Session["Dueño"];

                LugarModel Lugar = new LugarModel();
                EntidadesCompartidas.Lugar l = new EntidadesCompartidas.Lugar();

                Lugar.Nombre = Convert.ToString(collection["Nombre"]);
                Lugar.Direccion= Convert.ToString(collection["Direccion"]);
                Lugar.Capacidad = Convert.ToInt32(collection["Capacidad"]);
                Lugar.NombreCiudad = Convert.ToString(collection["NombreCiudad"]);

                EntidadesCompartidas.Ciudad Ciudad = Logica.FabricaLogica.getLogicaUbicacion().BuscarCiudad(Lugar.NombreCiudad);

                Lugar.Descripcion = Convert.ToString(collection["Descripcion"]);
                Lugar.CoordenadaX = float.Parse(collection["CoordenadaX"], System.Globalization.CultureInfo.InvariantCulture);
                Lugar.CoordenadaY = float.Parse(collection["CoordenadaY"], System.Globalization.CultureInfo.InvariantCulture);
                


                l.Nombre = Lugar.Nombre;
                l.Direccion = Lugar.Direccion;
                l.Capacidad = Lugar.Capacidad;
                l.UbicacionLugar = Ciudad;
                l.Descripcion = Lugar.Descripcion;
                l.CoordenadaX = Lugar.CoordenadaX;
                l.CoordenadaY = Lugar.CoordenadaY;
                l.DueñoLugar = dueño;
                l.Fotos =(List<EntidadesCompartidas.FotosLugar>)Session["Fotos"];

                Logica.FabricaLogica.getLogicaLugar().AltaLugar(l);

                Session["LugarActual"] = l;
                Session["LugarModel"] = Lugar;
                return View("AdministrarLugares",Lugar);

            }
            catch
            {
                return View("AdministrarLugares");
            }

    }

       


            [HttpGet]
         public ActionResult AdministrarLugares()
        {
               
                try
                {
                    MVCFinal.Models.CiudadModel Ciudad = new CiudadModel();
                    MVCFinal.Models.LugarModel Lugar = new LugarModel();
                    EntidadesCompartidas.Dueño dueño = null;


                        dueño = (EntidadesCompartidas.Dueño)Session["Dueño"];


                        List<EntidadesCompartidas.Ciudad> listaCiudad = Logica.FabricaLogica.getLogicaUbicacion().ListarCiudades();
                        List<EntidadesCompartidas.Lugar> listaLugar = Logica.FabricaLogica.getLogicaLugar().ListarLugares();

                        Lugar.milistaCiudad = listaCiudad;
                        Lugar.milistaLugar = listaLugar;
                        Session["ListaCiudad"] = Lugar.milistaCiudad;
                        Session["ListaLugares"] = Lugar.milistaLugar;
                        string JsonLugares = JsonConvert.SerializeObject(Lugar.milistaLugar);
                        Session["LugaresMapaJson"] = JsonLugares;
                        string JsonCiudades = JsonConvert.SerializeObject(listaCiudad);
                        Session["CiudadesJson"] = JsonCiudades;

                        
                    return View(Lugar);

            }
            catch
            {
                return View();
            }        
        }

        [HttpPost]
            public ActionResult SubirPlano(HttpPostedFileBase image)
            {
                LugarModel model = new LugarModel();

                

                EntidadesCompartidas.Mapa miMapa = new Mapa();

                if (image != null)
                {
                    miMapa.Extension = Path.GetExtension(image.FileName);
                    
                    int length = image.ContentLength;
                    byte[] buffer = new byte[length];
                    image.InputStream.Read(buffer, 0, length);
                    miMapa.Imagen = buffer;
                    miMapa.Nombre =image.FileName.Substring(0,image.FileName.LastIndexOf('.'));
                    miMapa.LugarAsociado =(EntidadesCompartidas.Lugar)Session["LugarActual"];
                }

                model.MapaActual = miMapa;

                FabricaLogica.getLogicaMapa().AltaMapa(miMapa);


                return View("AdministrarLugares",model);

                
            }

            public ActionResult AgregarFoto(HttpPostedFileBase image1)
            {


                List<EntidadesCompartidas.FotosLugar> list=null;

                list = (List<EntidadesCompartidas.FotosLugar>)Session["Fotos"];
                EntidadesCompartidas.FotosLugar foto = new FotosLugar();

                if (image1 != null)
                {
                    foto.Extension = Path.GetExtension(image1.FileName);

                    int length = image1.ContentLength;
                    byte[] buffer = new byte[length];
                    image1.InputStream.Read(buffer, 0, length);
                    foto.Imagen = buffer;
                    foto.NombreFoto = image1.FileName.Substring(0, image1.FileName.LastIndexOf('.'));
                      
                }

                if (list == null)
                {
                    list = new List<FotosLugar>();
                    list.Add(foto);
                }
                else
                {
                    list.Add(foto);
                }
                
                string JsonFotos = JsonConvert.SerializeObject(list);
                Session["FotosJson"] = JsonFotos;
                Session["Fotos"] = list;                   


                return View("AdministrarLugares");


            }


        public ActionResult FeedbackDueño()
        {
            return View();
        }
    }
}
