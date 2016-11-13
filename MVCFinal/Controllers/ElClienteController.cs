using MVCFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class ElClienteController : Controller
    {
        //
        // GET: /ElCliente/

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
                catch
                {

                    return View();
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
                catch
                {

                    return View();
                }
            }
            else
            {
                RedirectToAction("Index,Portada");
            }


            return RedirectToAction("Index,Portada");
        }

    }
}
