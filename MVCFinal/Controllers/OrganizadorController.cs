using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class OrganizadorController : Controller
    {
        //
        // GET: /Organizador/

        public ActionResult AlquilerLugares()
        {
            return View();
        }

        public ActionResult FeedbackOrganizador()
        {
            return View();
        }

        public ActionResult MuestreoLugares()
        {
            return View();
        }

        public ActionResult Principal()
        {
            return View();
        }

        public ActionResult Geolocalizacion()
        {
            return View();
        }

        public ActionResult PublicacionEventos()
        {
            return View();
        }
    }
}
