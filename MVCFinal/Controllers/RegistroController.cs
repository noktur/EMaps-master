using MVCFinal.Maps;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Protocols;

namespace MVCFinal.Controllers
{
    public class RegistroController : Controller
    {


        #region ServicioWCF

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
                throw new System.ServiceModel.FaultException(ex.Message);
            }
            return _ServicioWCF;
        }

        private void CerrarServicio()
        {
            if (_ServicioWCF != null)
            {
                Maps.ServicioEventoClient e = new ServicioEventoClient();

                e.Close();

            }
        }


        #endregion


        #region MetodosControllers


        public ActionResult Register()
        {
            return View();
        }

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
                EntidadesCompartidas.Usuario Usuario = null;

                Usuario.CI = Convert.ToString(collection["Ci"]);
                Usuario.Email = Convert.ToString(collection["Email"]);
                Usuario.Nombre = Convert.ToString(collection["Nombre"]);
                Usuario.NombreUsuario = Convert.ToString(collection["Usuario"]);
                Usuario.Contraseña = Convert.ToString(collection["Password"]);



                CreoServicio().AltaUsuario(Usuario);

                return View(Usuario);

            }
            catch (SoapException ex)
            {
                ViewBag.Text = CodigoCatchSoap(ex);
            }
            catch (FaultException ex)
            {
                ViewBag.Text = CodigoCatchFault(ex);
            }
            catch (Exception ex)
            {
                ViewBag.Text = CodigoCatch(ex);
            }

            finally
            {
                CerrarServicio();
            }

            return View();
        }


        #endregion


        #region Exceptions

        private String CodigoCatch(Exception ex)
        {
            String msg = ex.Message; ;
            if (msg.Length > 100)
                msg = msg.Substring(0, 100);
            return msg;
        }

        private String CodigoCatchSoap(SoapException ex)
        {
            String msg = "Error al procesar la solicitud. Verifique informacion igresada.";

            if (ex.Detail.InnerText.CompareTo(String.Empty) == 0)
            {
                if (ex.Message.Contains("&$"))
                {
                    msg = (ex.Message.Split((new String[] { "&$" }), StringSplitOptions.RemoveEmptyEntries))[1];
                }
            }
            else
            {
                if (ex.Detail.InnerText.Length > 100)
                    msg = ex.Detail.InnerText.Substring(0, 100);
                else
                    msg = ex.Detail.InnerText;
            }
            return msg;
        }

        private String CodigoCatchFault(FaultException ex)
        {
            String msg = ex.Message;

            if (msg.Contains("&$"))
            {
                msg = (ex.Message.Split((new String[] { "&$" }), StringSplitOptions.RemoveEmptyEntries))[1];
            }
            else
            {
                if (msg.Length > 100)
                    msg = msg.Substring(0, 100);
            }
            return msg;
        }

        #endregion

    }
}
