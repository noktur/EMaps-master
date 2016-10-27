using Logica;
using MVCFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class HomeController : Controller
    {

        [HttpPost]
        public JsonResult Save()
        {
            //List<PuntoModel> res = new List<PuntoModel>();
            //if (markerlat != null && (markerlat.Length == markerlong.Length))
            //{
            //    for (int i = 0; markerlong.Length > i; i++)
            //    {
            //        double x = double.Parse(markerlat[i]);
            //        double y = double.Parse(markerlong[i]);
            //        PuntoModel ub = new PuntoModel() {CoordenadaX = x, CoordenadaY = y};
            //        res.Add(ub);
            //    }
            //}

            ////los marcadores quedaron en la variable res
            ////los meto aca para imaginarnos que tenemos esto como variable en session
            ////y cuando vamos a guardar el mapa lo obtenemos de session asi noma
            ////la operacion de guardar todo esto se haria en el index(model)
            ////POR AHORA: genero el model aca a manopla, este boton podriamos considerarlo
            ////como un boton de guardar area
            //if (Session["HomeModel"] == null)
            //{
            //    HomeModel model = new HomeModel();
            //    model.mapa = new MVCFinal.Models.LugarModel();
            //    model.mapa.Areas = new List<AreaModel>();
            //    AreaModel area = new AreaModel();
            //    area._Puntos = res;
            //    area.Color = "verdiazulcuro";
            //    Random rnd = new Random(888999);
            //    area.NombreArea = "Area" + rnd.Next().ToString();
            //}
            //else
            //{
            //    HomeModel model = (HomeModel) Session["HomeModel"];
            //    if(model.mapa == null)
            //    { model.mapa = new MVCFinal.Models.LugarModel(); }
            //    if(model.mapa.Areas == null)
            //    { model.mapa.Areas = new List<AreaModel>(); }
            //    AreaModel area = new AreaModel();
            //    area._Puntos = res;
            //    area.Color = "verdiazulcuro";
            //    Random rnd = new Random(888999);
            //    area.NombreArea = "Area" + rnd.Next().ToString();
            //}

            //return Json(new { message = "msg" }, "text/html");
            return Save();
        }

        public ActionResult Index(HomeModel model)
        {

            return View();
        }


    }
}
