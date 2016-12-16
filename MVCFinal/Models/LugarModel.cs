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
        public EntidadesCompartidas.Mapa MapaActual { get; set; }

        public EntidadesCompartidas.Lugar LugarActual { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Descripcion { get; set; }

        public Ciudad Ciudad  { get; set; }

        public string NombreCiudad { get; set; }

        private Mapa Mapa { get; set; }

        public float CoordenadaX { get; set; }

        public float CoordenadaY { get; set; }

        public List<EntidadesCompartidas.Lugar> milistaLugar { get; set; }

        public List<EntidadesCompartidas.Ciudad> milistaCiudad { get; set; }
    }
}