using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class PrincipalClienteModel
    {
        public List<EntidadesCompartidas.Categoria> listaCategorias { get; set; }
        public List<EntidadesCompartidas.Evento> listaEventos { get; set; }
        public List<EntidadesCompartidas.Entrada> listaEntradasEvento { get; set; }
        public List<EntidadesCompartidas.Area> listaAreasEvento { get; set; }
        public EventoModel unEvento { get; set; }


    }
}