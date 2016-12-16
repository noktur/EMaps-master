using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class PlanoModel
    {
        
        public EntidadesCompartidas.Mapa elMapa { get; set; }

        public string Nombre { get; set; }

        public string Descripcion { get; set; }

        public string Capacidad { get; set; }

        public List<EntidadesCompartidas.Punto> ListaPuntos { get; set; }

        public List<EntidadesCompartidas.Area> ListaAreasPlano { get; set; }

    }
}