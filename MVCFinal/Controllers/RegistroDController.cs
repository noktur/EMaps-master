using Logica;
using MVCFinal.Maps;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class RegistroDController : Controller
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
        // GET: /RegistroD/

        public ActionResult RegistroDueño(MVCFinal.Models.RegistroDueño model)
        {
            return View();
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Register")]
        public ActionResult Register(FormCollection collection)
        {

            try
            {
                MVCFinal.Models.RegistroDueño Usuario = new Models.RegistroDueño();

                Usuario.Ci = Convert.ToString(collection["Ci"]);
                Usuario.Email = Convert.ToString(collection["Email"]);
                Usuario.Nombre = Convert.ToString(collection["Nombre"]);
                Usuario.Usuario = Convert.ToString(collection["Usuario"]);
                Usuario.Password = Convert.ToString(collection["Password"]);



                CreoServicio().AltaUsuario(convertirModelDueño(Usuario));

                return View(Usuario);

            }
            catch
            {
                return View();
            }
        }


        public EntidadesCompartidas.Dueño convertirModelDueño(MVCFinal.Models.RegistroDueño model)
        {
            EntidadesCompartidas.Dueño p = new EntidadesCompartidas.Dueño();

            p.CI = model.Ci;
            p.Contraseña = model.Password;
            p.Nombre = model.Nombre;
            p.Email = model.Email;
            p.NombreUsuario = model.Usuario;

            return p;
        }

    }
}
