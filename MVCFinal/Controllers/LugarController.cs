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
    public class LugarController : Controller
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



        [HttpGet]
        public ActionResult Index()
        {
            MVCFinal.Models.LugarModel Lugar = new LugarModel();
            MVCFinal.Models.CiudadModel Ciudad;
            Ciudad = (CiudadModel)Session["Ciudad"];

            try
            {
                List<LugarModel> list = new List<LugarModel>();
                List<EntidadesCompartidas.Lugar> lista = null;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        Lugar.CoordenadaX = lista[i].CoordenadaX;
                        Lugar.CoordenadaY = lista[i].CoordenadaY;
                        Lugar.Nombre = lista[i].Nombre;
                        Lugar._IdLugar = lista[i].IdLugar;
                        Lugar.Capacidad = lista[i].Capacidad;
                        Lugar.Descripcion = lista[i].Descripcion;
                        Lugar.Direccion = lista[i].Direccion;
                        Lugar.NombreCiudad = lista[i].UbicacionLugar.Nombre;
                    }

                    list.Add(Lugar);


                }
                else
                {
                    lista = null;
                }

                string JsonResponse = JsonConvert.SerializeObject(list);
                Session["ListarLugares"] = JsonResponse;
                string JsonCiudad = JsonConvert.SerializeObject(Ciudad);
                Session["CiudadActual"] = JsonCiudad;

                return View();
            }
            catch
            {

                string JsonCiudad = JsonConvert.SerializeObject(Ciudad);
                Session["CiudadActual"] = JsonCiudad;
                return View();
            }
        }


    }
}
