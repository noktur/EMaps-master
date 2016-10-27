using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class MapaModel
    
    {
        private int _IdMapa { get; set; }
        private string _UrlImagen { get; set; }
        private string _Nombre { get; set; }
        private List<Area> _ListaAreas { get; set; }
    }
}