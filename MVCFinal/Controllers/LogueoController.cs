using MVCFinal.Maps;
using MVCFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class LogueoController : Controller
    {
        //
        // GET: /Logueo/

        public ActionResult Login()
        {
            return View();
        }

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


        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "SIGN IN")]
        public ActionResult Login(FormCollection collection)
        {


            try
            {
                LoginModel Usuario = new Models.LoginModel();

                EntidadesCompartidas.Usuario Usu = null;

                Usuario.Usuario = Convert.ToString(collection["Usuario"]);
                Usuario.Password = Convert.ToString(collection["Password"]);

                Usu = CreoServicio().Login(Usuario.Usuario, Usuario.Password);



                if(Usu == null) 
                {
                    Session["ErrorUsu"] = Usu;
                    return View("Login");
                
                }
                else if (Usu is EntidadesCompartidas.Dueño)
                {
                    Session["Dueño"] = Usu;
                    return RedirectToAction("Principal", "Dueño");

                }
                else if (Usu is EntidadesCompartidas.Cliente)
                {

                    Session["Cliente"] = Usu;

                    return RedirectToAction("Principal", "ElCliente");
                }
                else if (Usu is EntidadesCompartidas.Admin)
                {
                    Session["Admin"] = Usu;

                    return RedirectToAction("ControlPaises", "Admin");
                }
                else if (Usu is EntidadesCompartidas.Organizador)
                {
                    Session["Organizador"] = Usu;

                    return RedirectToAction("Principal", "Organizador");
                }



                return View();


            }
            catch
            {
                return View();
            }
        }

    }
}
