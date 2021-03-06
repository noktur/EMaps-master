﻿using MVCFinal.Maps;
using MVCFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class PortadaController : Controller
    {
        //
        // GET: /Portada/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Register Now!")]
        public ActionResult Register(FormCollection collection)
        {

            try
            {
                EntidadesCompartidas.Usuario Usuario = null;

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


                if (Usu is EntidadesCompartidas.Dueño)
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

                    return RedirectToAction("Principal", "Admin");
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
