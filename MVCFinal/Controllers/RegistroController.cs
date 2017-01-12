using Logica;
using MVCFinal.Maps;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class RegistroController : Controller
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

        //
        // GET: /RegistroAdmin/

        public ActionResult Registro()
        {
            return View();
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Register Now!")]
        public ActionResult Register(FormCollection collection)
        {

            try
            {
                EntidadesCompartidas.Usuario Usuario=null;

                Usuario.CI = Convert.ToString(collection["Ci"]);
                Usuario.Email = Convert.ToString(collection["Email"]);
                Usuario.Nombre = Convert.ToString(collection["Nombre"]);
                Usuario.NombreUsuario = Convert.ToString(collection["Usuario"]);
                Usuario.Contraseña = Convert.ToString(collection["Password"]);



                CreoServicio().AltaUsuario(Usuario);

                return View(Usuario);

            }
            catch
            {
                return View();
            }
        }
    }
}
