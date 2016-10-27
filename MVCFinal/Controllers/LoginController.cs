using Logica;
using MVCFinal.Maps;
using MVCFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class LoginController : Controller
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
        // GET: /Login/

        public ActionResult LoginUsuario(LoginModel model)
        {
            return View();
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Login")]
        public ActionResult Login(FormCollection collection)
        {

            try
            {
               LoginModel Usuario = new Models.LoginModel();

                Usuario.Usuario = Convert.ToString(collection["Usuario"]);
                Usuario.Password = Convert.ToString(collection["Password"]);
                

                    CreoServicio().Login(Usuario.Usuario,Usuario.Password);
                    return View(Usuario);
                
            }
            catch
            {
                return View();
            }
        }


    }
}
