using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class RegistroDueño
    {
        [Required(ErrorMessage = "Debe ingresar su usuario")]
        [StringLength(30, ErrorMessage = "El usuario no puede superar los 30 caracteres")]
        public string Usuario { get; set; }
        [Required(ErrorMessage = "Debe ingresar su contraseña")]
        [StringLength(30, ErrorMessage = "La contraseña no puede superar los 30 caracteres")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Debe ingresar su nombre")]
        [StringLength(30, ErrorMessage = "El nombre no puede superar los 30 caracteres")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "Debe ingresar su Cedula")]
        [StringLength(7, ErrorMessage = "La Cedula no puede superar los 7 caracteres")]
        public string Ci { get; set; }

        [Required(ErrorMessage = "Debe ingresar su Email")]
        [StringLength(30, ErrorMessage = "El Email no puede superar los 30 caracteres")]
        public string Email { get; set; }
    }
}