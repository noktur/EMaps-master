using MVCFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class OrganizadorController : Controller
    {
        //
        // GET: /Organizador/

        public ActionResult AlquilerAreas()
        {
            return View();
        }

        public ActionResult FeedbackOrganizador()
        {
            if (Session["Organizador"] != null)
            {


                    EntidadesCompartidas.Organizador Organizaor = (EntidadesCompartidas.Organizador)Session["Organizador"];

                    FeedbackOrganizadorModel miModel = new FeedbackOrganizadorModel();

                    try
                    {

                        miModel.OrganizadorActual = Organizaor;

                        return View(miModel);

                    }
                    catch
                    {

                        return View();
                    }
            }

            return RedirectToAction("Index,Portada");
        }

        public ActionResult MuestreoLugares()
        {
            return View();
        }

        public ActionResult Principal()
        {
            return View();
        }

        public ActionResult Geolocalizacion()
        {
            return View();
        }

        public ActionResult PublicacionEventos()
        {

            if(Session["Organizador"] != null)
            {

                EntidadesCompartidas.Organizador Organizador=(EntidadesCompartidas.Organizador)Session["Organizador"];

               

                MVCFinal.Models.EventoModel Evento = new EventoModel();

                    try
                    {
                

                        List<EntidadesCompartidas.Categoria> listaCategoria = Logica.FabricaLogica.getLogicaEvento().ListarCategorias();
                        List<EntidadesCompartidas.Alquiler> listaLugares = Logica.FabricaLogica.getLogicaAlquiler().ListarAlquileresOrganizador(Organizador.CI);


                        Evento.listaCategorias = listaCategoria;
                        Evento.listalugaresAlquilados = listaLugares;


                        Session["ListaAlquiler"] = listaLugares;
                        Session["ListaCategorias"] = listaCategoria;
                        return View(Evento);

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


            return View();

        }
    }
}
