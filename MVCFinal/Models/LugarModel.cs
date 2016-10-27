using EntidadesCompartidas;
using MVCFinal.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Models
{
    public class LugarModel
    {
        public int _IdLugar { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Descripcion { get; set; }
        public int  Capacidad { get; set; }

        private Ciudad Ubicacion;

        public string NombreCiudad { get{ return Ubicacion.Nombre; } set{}}

        private Mapa Mapa { get; set; }

        public int IdMapa { get { return Mapa.IdMapa; } set { } }

        public string Imagen { get { return Mapa.UrlImagen; } set { } }
        
        public float CoordenadaX { get; set; }

        public float CoordenadaY { get; set; }
    }
}