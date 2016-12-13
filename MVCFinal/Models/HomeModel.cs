using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Models
{
    public class HomeModel
    {
        [Required(ErrorMessage = "Debe ingresar el lugar")]
        public LugarModel mapa;
    }
}
