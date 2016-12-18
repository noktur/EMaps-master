using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Models
{
    public class EventoModel
    {
        public int IdEvento { get; set; }
        [Required(ErrorMessage = "Debe ingresar el nombre del evento")]
        [StringLength(30, ErrorMessage ="El nombre del evento no debe exceder los 30 caracteres")]
        public string NombreEvento { get; set; }
        [Required(ErrorMessage = "Debe ingresar la descripcion del evento")]
        [StringLength(100,ErrorMessage ="La descripcion del evento no debe exceder los 100 caracteres")]
        public string Descripcion { get; set; }

        public DateTime FechaInicio { get; set; }

        public DateTime FechaFin { get; set; }
        [Required(ErrorMessage = "Debe ingresar un lugar")]
        public LugarModel UnLugar { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de entradas")]
        public List<Entrada> EntradasEvento { get; set; }
        [Required(ErrorMessage = "Debe ingresar la clasificacion del evento")]
        public Categoria ClasificacionEvento { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de eventos")]
        public List<Evento> milista { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de categorias")]
        public List<Categoria> listaCategorias { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de lugares alquilados")]
        public List<Alquiler> listalugaresAlquilados { get; set; }
        [Required(ErrorMessage = "Debe ingresar el organizador del evento")]
        public Organizador OrganizadorEvento { get; set; }
        [Required(ErrorMessage = "Debe ingresar la entrada")]
        private EntidadesCompartidas.Entrada entrada { get; set; }

        public double PrecioEntradas { get { return entrada.Precio; } set { } }
    }
}
