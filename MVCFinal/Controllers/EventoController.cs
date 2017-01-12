using MVCFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCFinal.Maps;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class EventoController : Controller
    {
        public ActionResult Index(EventoModel model)
        {
            
            return View();
        }

        IServicioEvento _ServicioWCF = null;

        private IServicioEvento CreoServicio() {
            try
            {
                if (_ServicioWCF == null) {
                    _ServicioWCF = new ServicioEventoClient();
                }
            }
            catch (Exception ex)
            {
                ViewBag.Text = "Problemas para crear el servicio " + ex.Message;
            }
            return _ServicioWCF;
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Crear")]
        public ActionResult Crear(FormCollection collection) {
            try
            {
                EventoModel Evento = new EventoModel();
                Evento.NombreEvento = Convert.ToString(collection["Nombre"]);
                Evento.Descripcion = Convert.ToString(collection["Descripcion"]);
                //Evento.ClasificacionEvento =
                Evento.FechaInicio = Convert.ToDateTime(collection["FechaInicio"]);
                Evento.FechaFin = Convert.ToDateTime(collection["FechaFin"]);
                //Evento.UnLugar = new LugarModel();//_ServicioWCF.BuscarLugarxId(1,"","");

                //CreoServicio().AltaEvento(ModelEvento(Evento));
                return View();
            }
            catch {
                return View();
            }
        }

        public EntidadesCompartidas.Evento ModelEvento(EventoModel e) 
        {

            EntidadesCompartidas.Evento _evento = new EntidadesCompartidas.Evento();

            _evento.NombreEvento = e.NombreEvento;
            _evento.Descripcion = e.Descripcion;
            _evento.FechaInicio = e.FechaInicio;
            _evento.FechaFin = e.FechaFin;
            _evento.CategoriaEvento = e.ClasificacionEvento;
            _evento.AreaEvento = new EntidadesCompartidas.Area();//e.UnLugar;

            return _evento;
        }

    }
}
