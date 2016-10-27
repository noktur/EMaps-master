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
                Evento.FechaEvento = Convert.ToDateTime(collection["Fecha"]);
                Evento.UnLugar = new LugarModel();//_ServicioWCF.BuscarLugarxId(1,"","");

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
            _evento.EntradasEvento = e.EntradasEvento;
            _evento.FechaEvento = e.FechaEvento;
            _evento.ClasificacionEvento = e.ClasificacionEvento;
            _evento.UnLugar = new EntidadesCompartidas.Lugar();//e.UnLugar;

            return _evento;
        }

    }
}
