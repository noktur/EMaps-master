using Persistencia.Clases_Trabajo;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public class FabricaPersistencia
    {
        public static IPersistenciaAdmin getPersistenciaAdmin()
        {
            return (PersistenciaAdmin.GetInstancia());
        }

        public static IPersistenciaFotosLugar getPersistenciaFotosLugar()
        {
            return (PersistenciaFotosLugar.getInstancia());
        }

        public static IPersistenciaAlquiler getPersistenciaAlquiler()
        {
            return (PersistenciaAlquiler.GetInstancia());
        }

        public static IPersistenciaArea getPersistenciaArea()
        {
            return (PersistenciaArea.GetInstancia());
        }

        public static IPersistenciaCiudad getPersistenciaCiudad()
        {
            return (PersistenciaCiudad.GetInstancia());
        }

        public static IPersistenciaCliente getPersistenciaCliente()
        {
            return (PersistenciaCliente.GetInstancia());
        }

        public static IPersistenciaDueño getPersistenciaDueño()
        {
            return (PersistenciaDueño.GetInstancia());
        }

        public static IPersistenciaEntrada getPersistenciaEntrada()
        {
            return (PersistenciaEntrada.GetInstancia());
        }

        public static IPersistenciaReserva getPersistenciaReserva()
        {
            return (PersistenciaReserva.GetInstancia());
        }

        public static IPersistenciaEvento getPersistenciaEvento()
        {
            return (PersistenciaEvento.GetInstancia());
        }

        public static IPersistenciaComentariosFeedbackEvento getPersistenciaComentariosFeedbakEvento()
        {
            return (PersistenciaComentariosFeedbackEvento.GetInstancia());
        }

        public static IPersistenciaComentariosFeedbackLugar getPersistenciaComentariosFeedbakLugar()
        {
            return (PersistenciaComentariosFeedbackLugar.GetInstancia());
        }


        public static IPersistenciaFeedbackEvento getPersistenciaFeedbakEvento()
        {
            return (PersistenciaFeedbackEvento.GetInstancia());
        }

        public static IPersistenciaFeedbackLugar getPersistenciaFeedbackLugar()
        {
            return (PersistenciaFeedbackLugar.GetInstancia());
        }

         public static IPersistenciaLugar getPersistenciaLugar()
        {
            return (PersistenciaLugar.GetInstancia());
        }

         public static IPersistenciaMapa getPersistenciaMapa()
        {
            return (PersistenciaMapa.GetInstancia());
        }

         public static IPersistenciaOrganizador getPersistenciaOrganizador()
         {
             return (PersistenciaOrganizador.GetInstancia());
         }

        public static IPersistenciaPais getPersistenciaPais()
        {
            return (PersistenciaPais.GetInstancia());
        }
       
        public static IPersistenciaPunto getPersistenciaPunto()
        {
            return (PersistenciaPunto.GetInstancia());
        }
    }
}
