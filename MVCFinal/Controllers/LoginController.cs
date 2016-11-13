using Logica;
using MVCFinal.Maps;
using MVCFinal.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

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

                convertirModelUsuario(Usuario);

                 if (convertirModelUsuario(Usuario) is EntidadesCompartidas.Dueño)
                {
                    Session["Dueño"] = Usuario;
                    return RedirectToAction("Principal", "Dueño");
                   
                }
                else if (convertirModelUsuario(Usuario) is EntidadesCompartidas.Cliente)
                {
                   
                    Session["Cliente"] = Usuario;

                    return RedirectToAction("Principal", "Cliente");
                }
                else if (convertirModelUsuario(Usuario) is EntidadesCompartidas.Admin)
                {
                    Session["Admin"] = Usuario;

                    return RedirectToAction("Principal", "Admin");
                }
                else if (convertirModelUsuario(Usuario) is EntidadesCompartidas.Organizador)
                {
                    Session["Organizador"] = Usuario;

                    return RedirectToAction("Principal", "Organizador");
                }


                return View();


                
            }
            catch
            {
                return View();
            }
        }

        public static EntidadesCompartidas.Usuario convertirModelUsuario(MVCFinal.Models.LoginModel model)
        {
            Maps.IServicioEvento _ServicioWCF = new ServicioEventoClient();

            EntidadesCompartidas.Cliente p = new EntidadesCompartidas.Cliente();
            EntidadesCompartidas.Dueño p1 = new EntidadesCompartidas.Dueño();
            EntidadesCompartidas.Admin p2 = new EntidadesCompartidas.Admin();
            EntidadesCompartidas.Organizador p3 = new EntidadesCompartidas.Organizador();

            p.NombreUsuario = model.Usuario;
            p.Contraseña = model.Password;

            _ServicioWCF.Login(p.NombreUsuario, p.Contraseña);

            if(p== null)
            {
                p1.NombreUsuario = model.Usuario;
                p1.Contraseña = model.Password;

                _ServicioWCF.Login(p.NombreUsuario, p.Contraseña);

                return p1;

            }
            else if(p1== null )
            {
                p2.NombreUsuario = model.Usuario;
                p2.Contraseña = model.Password;

                _ServicioWCF.Login(p.NombreUsuario, p.Contraseña);

                return p2;
            }
            else if (p2 == null)
            {
                p3.NombreUsuario = model.Usuario;
                p3.Contraseña = model.Password;

                _ServicioWCF.Login(p.NombreUsuario, p.Contraseña);

                return p3;
            }
            else if (p3 == null)
            {
                return null;
            }


            return p;
            
        }

    }
}
