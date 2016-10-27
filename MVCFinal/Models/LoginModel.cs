using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Debe ingresar su usuario")]
        [StringLength(30, ErrorMessage = "El usuario no puede superar los 30 caracteres")]
        public string Usuario { get; set; }
        [Required(ErrorMessage = "Debe ingresar su contraseña")]
        [StringLength(30, ErrorMessage = "La contraseña no puede superar los 30 caracteres")]
        public string Password { get; set; }
        
    }
}
