using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class PlanoModel
    {
        
        public EntidadesCompartidas.Mapa elMapa { get; set; }
        public List<EntidadesCompartidas.Area> ListaAreasPlano { get; set; }

    }
}