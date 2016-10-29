﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;

namespace Logica.Interfaces
{
    public interface ILogicaEvento
    {
        void AltaEvento(Evento p);
        void ComprobarEstadoEvento(Evento UnEvento, DateTime fecha1, DateTime fecha2);
        void BajaEvento(Evento e);
        Evento BuscarEvento(int IdEvento);
        Categoria BuscarCategoria(string NombreCategoria);
        List<Categoria> ListarCategorias();
        List<Evento> ListarEventosOrdenFecha();
        List<Evento> ListarEventosOrganizador(string CiOrganizador);
        List<Evento> ListarEventosReservados();
        List<Evento> ListarEventosxLugar(string pNombreLugar);
    }
}