﻿using EntidadesCompartidas;
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
        public string NombreEvento { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaInicio { get; set; }

        public DateTime FechaFin { get; set; }
        public LugarModel UnLugar { get; set; }
        public List<Entrada> EntradasEvento { get; set; }
        public Categoria ClasificacionEvento { get; set; }
    }
}