using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class MapaModel

    {

        private int _IdMapa { get; set; }
        [Required(ErrorMessage = "Debe ingresar la imagen")]
        private string _UrlImagen { get; set; }
        [Required(ErrorMessage = "Debe ingresar el nombre")]
        [StringLength(30,ErrorMessage ="El nombre del mapa no puede exceder los 30 caracteres")]
        private string _Nombre { get; set; }
        [Required(ErrorMessage = "Debe ingresar las areas")]
        private List<Area> _ListaAreas { get; set; }
    }
}