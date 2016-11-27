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
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Descripcion { get; set; }
        public int  Capacidad { get; set; }

        public Ciudad Ciudad  { get; set; }

        public string CodPais { get { return Ciudad.UnPais.CodPais; } set { } }

        public string NombreCiudad { get{ return Ciudad.Nombre; } set{}}

        private Mapa Mapa { get; set; }

        public int IdMapa { get { return Mapa.IdMapa; } set { } }

        public byte[] Imagen { get { return Mapa.Imagen; } set { } }
        
        public float CoordenadaX { get; set; }

        public float CoordenadaY { get; set; }

        public List<EntidadesCompartidas.Lugar> milistaLugar { get; set; }

        public List<EntidadesCompartidas.Ciudad> milistaCiudad { get; set; }
    }
}