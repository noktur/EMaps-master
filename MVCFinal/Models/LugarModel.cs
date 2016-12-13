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
        [Required(ErrorMessage = "Debe ingresar el mapa")]
        public EntidadesCompartidas.Mapa MapaActual { get; set; }
        [Required(ErrorMessage = "Debe ingresar el lugar")]
        public EntidadesCompartidas.Lugar LugarActual { get; set; }
        [Required(ErrorMessage = "Debe ingresar el nombre")]
        [StringLength(30,ErrorMessage ="El nombre no puede exeder los 30 caracteres")]
        public string Nombre { get; set; }
        [Required(ErrorMessage = "Debe ingresar la direccion")]
        [StringLength(30,ErrorMessage ="La direccion no puede exceder los 30 caracteres")]
        public string Direccion { get; set; }
        [Required(ErrorMessage = "Debe ingresar la descripcion")]
        [StringLength(30,ErrorMessage ="La descripcion no puede exceder los 30 caracteres")]
        public string Descripcion { get; set; }
        public int  Capacidad { get; set; }
        [Required(ErrorMessage = "Debe ingresar la ciudad")]
        public Ciudad Ciudad  { get; set; }
        [Required(ErrorMessage = "Debe ingresar el nombre de la ciudad")]
        [StringLength(30,ErrorMessage ="El nombre de la ciudad no puede exceder los 30 caracteres")]
        public string NombreCiudad { get; set; }
        [Required(ErrorMessage = "Debe ingresar el mapa")]
        private Mapa Mapa { get; set; }

        public int IdMapa { get; set; }
        [Required(ErrorMessage = "Debe ingresar la imagen")]
        public byte[] Imagen { get; set; }
        [Required(ErrorMessage = "Debe ingresar el nombre del mapa")]
        [StringLength(30,ErrorMessage ="El nombre del mapa no puede exceder los 30 caracteres")]
        public string NombreMapa { get; set; }
        [Required(ErrorMessage = "Debe ingresar la extension de la foto")]
        [StringLength(5,ErrorMessage ="La extension no puede exceder los 5 caracteres")]
        public string ExtensionFoto { get; set; }
        
        public float CoordenadaX { get; set; }

        public float CoordenadaY { get; set; }
        [Required(ErrorMessage = "Debe ingresar los lugares")]
        public List<EntidadesCompartidas.Lugar> milistaLugar { get; set; }
        [Required(ErrorMessage = "Debe ingresar las ciudades")]
        public List<EntidadesCompartidas.Ciudad> milistaCiudad { get; set; }
    }
}