using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class PrincipalClienteModel
    {
        [Required(ErrorMessage = "Debe ingresar las categorias")]
        public List<EntidadesCompartidas.Categoria> listaCategorias { get; set; }
        [Required(ErrorMessage = "Debe ingresar los eventos")]
        public List<EntidadesCompartidas.Evento> listaEventos { get; set; }
        [Required(ErrorMessage = "Debe ingresar las entradas del evento")]
        public List<EntidadesCompartidas.Entrada> listaEntradasEvento { get; set; }
        [Required(ErrorMessage = "Debe ingresar las areas del evento")]
        public List<EntidadesCompartidas.Area> listaAreasEvento { get; set; }
        [Required(ErrorMessage = "Debe ingresar el evento")]
        public EventoModel unEvento { get; set; }


    }
}