using Logica;
using MVCFinal.Maps;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class RegistroAController : Controller
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

        public ActionResult RegistroAdmin(MVCFinal.Models.RegistroAdmin model)
        {
            return View();
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Register")]
        public ActionResult Register(FormCollection collection)
        {

            try
            {
                MVCFinal.Models.RegistroAdmin Usuario = new Models.RegistroAdmin();

                Usuario.Ci = Convert.ToString(collection["Ci"]);
                Usuario.Email = Convert.ToString(collection["Email"]);
                Usuario.Nombre = Convert.ToString(collection["Nombre"]);
                Usuario.Usuario = Convert.ToString(collection["Usuario"]);
                Usuario.Password = Convert.ToString(collection["Password"]);



                CreoServicio().AltaUsuario(convertirModelAdmin(Usuario));

                return View(Usuario);

            }
            catch
            {
                return View();
            }
        }


        public EntidadesCompartidas.Admin convertirModelAdmin(MVCFinal.Models.RegistroAdmin model)
        {
            EntidadesCompartidas.Admin p = new EntidadesCompartidas.Admin();

            p.CI = model.Ci;
            p.Contraseña = model.Password;
            p.Nombre = model.Nombre;
            p.Email = model.Email;
            p.NombreUsuario = model.Usuario;

            return p;
        }
    }
}
