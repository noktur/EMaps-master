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
        



        public ActionResult PlanoLugar()
        {
            
            if(Session["Dueño"] != null)
            {
               MVCFinal.Models.PlanoModel Plano = new PlanoModel();
               EntidadesCompartidas.Mapa mapa = new EntidadesCompartidas.Mapa();
               

                      try
              {

                 mapa=(EntidadesCompartidas.Mapa)Session["Plano"] ;

                 if (mapa.Areas.Count() > 0)
                 {

                     List<EntidadesCompartidas.Area> listaArea = Logica.FabricaLogica.getLogicaArea().ListarAreasDeMapa(mapa.IdMapa);


                     Plano.ListaAreasPlano = listaArea;
                     Session["ListaAreaPlano"] = Plano.ListaAreasPlano;

                 }
                 else
                 {


                     
                     Plano.elMapa = mapa;
                     Session["Plano"] = Plano.elMapa;
                     string JsonMapa = JsonConvert.SerializeObject(Plano.elMapa);
                     Session["MapaJson"] = JsonMapa;
                     string JsonAreas = JsonConvert.SerializeObject(Plano.ListaAreasPlano);
                     Session["AreasMapaJson"] = JsonAreas;

                     Session["Imagen"] = File(mapa.Imagen, mapa.Extension);


                     
                 }
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


        [HttpPost]
        public ActionResult RecuperarArea(string json)
        {

           

           EntidadesCompartidas.Area a= JsonConvert.DeserializeObject<EntidadesCompartidas.Area>(json);

           a.MapaAsociado =(EntidadesCompartidas.Mapa)Session["Plano"];

           Session["Puntos"] = a.PuntosArea;

           FabricaLogica.getLogicaArea().AltaArea(a);

           a = FabricaLogica.getLogicaArea().BuscarAreaPorNombre(a.NombreArea);

           a.PuntosArea = (List<Punto>)Session["Puntos"];
            
           foreach(Punto p in a.PuntosArea)
           {
               FabricaLogica.getLogicaArea().AltaPuntodeArea(a, p);
           }

           a.MapaAsociado.Areas.Add(a);

           string JsonAreas = JsonConvert.SerializeObject(a.MapaAsociado.Areas);
           Session["AreasMapaJson"] = JsonAreas;

           Session["Areas"]=a;

           return View("PlanoLugar");

        }


        [HttpPost]
        public ActionResult GuardarLugar(HttpPostedFileBase image, LugarModel milugar)
        {
            try
            {


                LugarModel lugar = new LugarModel();
                EntidadesCompartidas.Dueño dueño = new Dueño();
                dueño = (EntidadesCompartidas.Dueño)Session["Dueño"];

                EntidadesCompartidas.Lugar l = new EntidadesCompartidas.Lugar();


                EntidadesCompartidas.Ciudad Ciudad = Logica.FabricaLogica.getLogicaUbicacion().BuscarCiudad(lugar.Ciudad.Nombre);                

                l.Nombre = lugar.Nombre;
                l.Direccion = lugar.Direccion;
                l.UbicacionLugar = Ciudad;
                l.Descripcion = lugar.Descripcion;
                l.CoordenadaX = lugar.CoordenadaX;
                l.CoordenadaY = lugar.CoordenadaY;
                l.DueñoLugar = dueño;

                EntidadesCompartidas.Mapa miMapa = new Mapa();

                if (image != null)
                {
                    miMapa.Extension = Path.GetExtension(image.FileName);

                    int length = image.ContentLength;
                    byte[] buffer = new byte[length];
                    image.InputStream.Read(buffer, 0, length);
                    miMapa.Imagen = buffer;
                    miMapa.Nombre = image.FileName.Substring(0, image.FileName.LastIndexOf('.'));
                }

                l.MapaAsociado = miMapa;

                if (l.Fotos.Count() > 0)
                {
                    l.Fotos = (List<EntidadesCompartidas.FotosLugar>)Session["Fotos"];
                }
                else
                {
                    l.Fotos = null;
                }
                
                Logica.FabricaLogica.getLogicaLugar().AltaLugar(l);

                string JsonLugar = JsonConvert.SerializeObject(l);
                Session["LugarJson"] = JsonLugar;

                Session["LugarActual"] = l;
                Session["LugarModel"] = lugar;

                return View("AdministrarLugares");

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

                        EntidadesCompartidas.Lugar l = new EntidadesCompartidas.Lugar();
                        l =(EntidadesCompartidas.Lugar)Session["LugarActual"];
                        string JsonLugar = JsonConvert.SerializeObject(l);
                        Session["LugarJson"] = JsonLugar;

                        
                        
                    return View(Lugar);

            }
            catch
            {
                return View();
            }        
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
