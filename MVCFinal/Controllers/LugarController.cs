﻿using EntidadesCompartidas;
using Logica;
using MVCFinal.Maps;
using MVCFinal.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Controllers
{
    public class LugarController : Controller
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



        [HttpGet]
        public ActionResult Index()
        {
            MVCFinal.Models.LugarModel Lugar = new LugarModel();
            MVCFinal.Models.CiudadModel Ciudad;
            Ciudad = (CiudadModel)Session["Ciudad"];

            try
            {
                List<LugarModel> list = new List<LugarModel>();
                List<EntidadesCompartidas.Lugar> lista = null;

                if (lista.Count > 0)
                {
                    for (int i = 0; i < lista.Count; i++)
                    {
                        Lugar.CoordenadaX = lista[i].CoordenadaX;
                        Lugar.CoordenadaY = lista[i].CoordenadaY;
                        Lugar.Nombre = lista[i].Nombre;
                        Lugar.Capacidad = lista[i].Capacidad;
                        Lugar.Descripcion = lista[i].Descripcion;
                        Lugar.Direccion = lista[i].Direccion;
                        Lugar.NombreCiudad = lista[i].UbicacionLugar.Nombre;
                    }

                    list.Add(Lugar);


                }
                else
                {
                    lista = null;
                }

                string JsonResponse = JsonConvert.SerializeObject(list);
                Session["ListarLugares"] = JsonResponse;
                string JsonCiudad = JsonConvert.SerializeObject(Ciudad);
                Session["CiudadActual"] = JsonCiudad;

                return View();
            }
            catch
            {

                string JsonCiudad = JsonConvert.SerializeObject(Ciudad);
                Session["CiudadActual"] = JsonCiudad;
                return View();
            }
        }

        public string RutaImagenesGuardar
        {
            get
            {
                string temp = System.Configuration.ConfigurationManager.AppSettings["RutaImagen_Originales"];
                if (!temp.EndsWith(@"\"))
                    temp += @"\";

                return temp;
            }
        }

        [HttpGet]
        public ActionResult SubirImagen()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SubirImagen(MapaModel model)
        {

            return RedirectToAction("Index", "Lugar");
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
                var pic = System.Web.HttpContext.Current.Request.Files["Images"];
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
                        //pic.SaveAs(originalPicTemp + nombreimagen);
                        byte[] fileData = null;
                        using (var binaryReader = new BinaryReader(pic.InputStream))
                        {
                            fileData = binaryReader.ReadBytes(pic.ContentLength);
                        }
                        //alta mapa lugar coso
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
                        //pic.SaveAs(originalPicTemp + nombreimagen);
                        byte[] fileData = null;
                        using (var binaryReader = new BinaryReader(pic.InputStream))
                        {
                            fileData = binaryReader.ReadBytes(pic.ContentLength);
                        }
                        //alta mapa lugar coso
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
}
