using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        public ActionResult ControlEventos()
        {
            return View();
        }

        public ActionResult ControlCiudad()
        {
            return View();
        }

        public ActionResult ControlPaises()
        {
            return View();
        }

        public ActionResult ModificarPerfil()
        {
            return View();
        }
        
        public ActionResult ControlLugares()
        {
            return View();
        }

        public ActionResult ControlFeedbacks()
        {
            return View();
        }

    }
}
