using EntidadesCompartidas;
using Logica;
using MVCFinal.Maps;
using MVCFinal.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Protocols;
using System.Web.UI.WebControls;

namespace MVCFinal.Controllers
{
    public class DueñoController : Controller
    {

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


        #region MetodosControllers

        public ActionResult GalleryLugar()
        {
            return View();
        }


        public ActionResult PlanoLugar()
        {

            if (Session["Dueño"] != null)
            {

                MVCFinal.Models.PlanoModel Plano = new PlanoModel();
                EntidadesCompartidas.Mapa mapa = new EntidadesCompartidas.Mapa();


                try
                {

                    mapa = (EntidadesCompartidas.Mapa)Session["Plano"];

                    if (mapa.Areas.Count() > 0)
                    {

                        List<EntidadesCompartidas.Area> listaArea = CreoServicio().ListarAreasDeMapa(mapa.IdMapa).ToList();


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

                        return View(Plano);

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

               
            }

            return View();

        }


        public ActionResult Principal()
        {
            return View();
        }

        public ActionResult UpgradeDueño()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CiudadObtenida(String[] nombre)
        {

            try
            {

                List<String> a = nombre.ToList();

                string ciudad = "";

                ciudad = nombre[0].ToString();

                LugarModel lugar = new LugarModel();

                lugar.Ciudad = FabricaLogica.getLogicaUbicacion().BuscarCiudad(ciudad);

                string JsonCiudad = JsonConvert.SerializeObject(lugar.Ciudad);
                Session["CiudadJson"] = JsonCiudad;



                return Json(JsonCiudad, JsonRequestBehavior.AllowGet);
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
        public ActionResult RecuperarArea(string json)
        {


            try
            {

                EntidadesCompartidas.Area a = JsonConvert.DeserializeObject<EntidadesCompartidas.Area>(json);

                a.MapaAsociado = (EntidadesCompartidas.Mapa)Session["Plano"];

                Session["Puntos"] = a.PuntosArea;

                CreoServicio().AltaArea(a);

                a = CreoServicio().BuscarAreaPorNombre(a.NombreArea);

                a.PuntosArea = (List<Punto>)Session["Puntos"];

                foreach (Punto p in a.PuntosArea)
                {
                    CreoServicio().AltaPuntodeArea(a, p);
                }

                a.MapaAsociado.Areas.Add(a);

                string JsonAreas = JsonConvert.SerializeObject(a.MapaAsociado.Areas);
                Session["AreasMapaJson"] = JsonAreas;

                Session["Areas"] = a;

                return View("PlanoLugar");

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
        public ActionResult GuardarLugar(HttpPostedFileBase image, LugarModel milugar)
        {
            try
            {


                EntidadesCompartidas.Dueño dueño = new Dueño();
                dueño = (EntidadesCompartidas.Dueño)Session["Dueño"];

                EntidadesCompartidas.Lugar l = new EntidadesCompartidas.Lugar();


                EntidadesCompartidas.Ciudad Ciudad = Logica.FabricaLogica.getLogicaUbicacion().BuscarCiudad(milugar.NombreCiudad);                

                l.Nombre = milugar.Nombre;
                l.Direccion = milugar.Direccion;
                l.UbicacionLugar = Ciudad;
                l.Descripcion = milugar.Descripcion;
                l.CoordenadaX = milugar.CoordenadaX;
                l.CoordenadaY = milugar.CoordenadaY;
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

                CreoServicio().AltaMapa(miMapa);

                CreoServicio().AltaLugar(l);



                string JsonLugar = JsonConvert.SerializeObject(l);
                Session["LugarJson"] = JsonLugar;

                Session["LugarActual"] = l;
                Session["LugarModel"] = milugar;

                return View("AdministrarLugares");

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
         public ActionResult AdministrarLugares()
        {
               
                try
                {
                    MVCFinal.Models.CiudadModel Ciudad = new CiudadModel();
                    MVCFinal.Models.LugarModel Lugar = new LugarModel();
                    EntidadesCompartidas.Dueño dueño = null;


                        dueño = (EntidadesCompartidas.Dueño)Session["Dueño"];


                        List<EntidadesCompartidas.Ciudad> listaCiudad = CreoServicio().ListarCiudades().ToList();
                        List<EntidadesCompartidas.Lugar> listaLugar = CreoServicio().ListarLugares().ToList(); ;

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


            public ActionResult AgregarFoto(HttpPostedFileBase image1)
            {

                try
                {
                    List<EntidadesCompartidas.FotosLugar> list = null;

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
                    EntidadesCompartidas.Lugar l = (EntidadesCompartidas.Lugar)Session["LugarActual"];
                    l.Fotos = list;


                    return View("AdministrarLugares");
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

        public ActionResult FeedbackDueño()
        {
            return View();
        }


        [HttpPost]
        [MultiButton(MatchFormKey = "action2", MatchFormValue = "Upgrade")]
        public ActionResult AltaUpgradeCliente()
        {



            return View();
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Upgrade")]
        public ActionResult AltaUpgradeOrganizador()
        {


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
