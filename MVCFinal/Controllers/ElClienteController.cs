using MVCFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Protocols;

namespace MVCFinal.Controllers
{
    public class ElClienteController : Controller
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

        public ActionResult DetalleEvento()
        {
             if (Session["Cliente"] != null)
            {

              if(Session["EventoElegido"] != null)
              {

               EntidadesCompartidas.Cliente Cliente = (EntidadesCompartidas.Cliente)Session["Cliente"];

               DetalleEventoModel miModel=new DetalleEventoModel();
            
                 try
                {

                    miModel.ClienteActual=Cliente;
                    miModel.EventoActual=(EntidadesCompartidas.Evento)Session["EventoElegido"];
                   
                    return View(miModel);

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
            }
         }


            return RedirectToAction("Index,Portada");
        }

        public ActionResult Principal()
        {
            if (Session["Cliente"] != null)
            {

               EntidadesCompartidas.Cliente Cliente = (EntidadesCompartidas.Cliente)Session["Cliente"];

               PrincipalClienteModel model = new PrincipalClienteModel();

                try
                {
                    return View(model);

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
            }
            else
            {
                RedirectToAction("Index,Portada");
            }


            return RedirectToAction("Index,Portada");
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
