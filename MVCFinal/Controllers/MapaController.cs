using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class MapaController : Controller
    {

        // GET: /MapaDueño/

        public string RutaImagenesGuardar {
            get {
                string temp = System.Configuration.ConfigurationManager.AppSettings["RutaImagen_Originales"];
                if (!temp.EndsWith(@"\"))
                    temp += @"\";

                return temp;
            }
        }

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "action", MatchFormValue = "Subir Imagen")]
        public ActionResult Guardar()
        {

            try
            {

                return Guardar();
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public JsonResult GuardarImagenFondo() {
            int largoKeys = 0;
            largoKeys = System.Web.HttpContext.Current.Request.Files.AllKeys.Length;
            string res = "";
            Usuario usr = null;//new Usuario(); //setear usuario

            Image b = null;
            if (largoKeys > 0) {
                string pathForSaving = RutaImagenesGuardar;
                if (System.Web.HttpContext.Current.Request.Form.Keys.Count == 2) {
                }
                var pic = System.Web.HttpContext.Current.Request.Files["HelpSectionImages"];
                string exttension = System.IO.Path.GetExtension(pic.FileName);
                string nombreimagen = ""; //TODO: Obtener nombre del usuario en session para darle nombre al mapa
                Random rdm = new Random();
                int numRdm = rdm.Next(0, 999);
                nombreimagen += "_" + numRdm.ToString();
                string x = "0";
                string y = "0";
                string imagenPath;
                if (exttension != ".png") {
                    try {
                        nombreimagen += ".jpg";
                        string originalPicTemp = RutaImagenesGuardar;//Temp + "temp\\l\\";
                        pic.SaveAs(originalPicTemp + nombreimagen);
                        originalPicTemp = originalPicTemp + nombreimagen;
                        imageForCropping img = new imageForCropping(originalPicTemp, pathForSaving, usr, x, y, b, res);
                        img.isPng = false;
                        img.setPaths(null, null);//aca deberiamos setear si precisamos distintos tamaños
                        imagenPath = originalPicTemp;
                    } catch (Exception ex) {
                        res = ex.Message;
                    }
                } else {
                    try {
                        nombreimagen += ".png";
                        string originalPicTemp = RutaImagenesGuardar;// + "temp\\l\\";
                        if (!Directory.Exists(originalPicTemp))
                            Directory.CreateDirectory(originalPicTemp);
                        pic.SaveAs(originalPicTemp + nombreimagen);
                        originalPicTemp = originalPicTemp + nombreimagen;
                        imageForCropping img = new imageForCropping(originalPicTemp, pathForSaving, usr, x, y, b, res);
                        img.isPng = true;
                        img.setPaths(null, null);
                        imagenPath = originalPicTemp;
                    } catch (Exception ex) {
                        res = ex.Message;
                    }
                }
            }
            return Json(new { message = res }, "text/html");
        }

    }

    [Serializable]
    public class imageForCropping {
        //public System.Web.HttpPostedFile pic;
        public string originalPicTemp;
        public string pathForSaving;
        public Usuario usr;
        public string x;
        public string y;
        public Image b;
        public string res;
        public string pathForSaving400x300;
        public string pathForSaving1280x220;
        public bool isPng;


        public imageForCropping() {
            originalPicTemp = null;
            pathForSaving = null;
            usr = null;
            x = null;
            y = null;
            b = null;
            res = null;
            pathForSaving400x300 = null;
            pathForSaving1280x220 = null;

        }

        public imageForCropping(string pic1, string pathForSaving1, Usuario usr1, string x1, string y1, Image b1, string res1) {
            originalPicTemp = pic1;
            pathForSaving = pathForSaving1;
            usr = usr1;
            x = x1;
            y = y1;
            b = b1;
            res = res1;
        }

        public void setPaths(string p400x300, string p1280x220) { //aca podemos setear los tamaños
            this.pathForSaving400x300 = p400x300;
            this.pathForSaving1280x220 = p1280x220;
        }
    }

}
