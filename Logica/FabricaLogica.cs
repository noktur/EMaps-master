using Logica.ClasesTrabajo;
using Logica.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica
{
    public class FabricaLogica
    {

        public static ILogicaAlquiler getLogicaAlquiler()
        {
            return (LogicaAlquiler.GetInstancia());
        }

        public static ILogicaArea getLogicaArea()
        {
            return (LogicaArea.GetInstancia());
        }

        public static ILogicaReserva getLogicaReserva()
        {
            return (LogicaReserva.GetInstancia());
        }

        public static ILogicaEntrada getLogicaEntrada()
        {
            return (LogicaEntrada.GetInstancia());
        }

        public static ILogicaEvento getLogicaEvento()
        {
            return (LogicaEvento.GetInstancia());
        }

        public static ILogicaComentariosFeedbackEvento getLogicaComentariosFeedbackEvento()
        {
            return (LogicaComentariosFeedbackEvento.GetInstancia());
        }
        public static ILogicaComentariosFeedbackLugar getLogicaComentariosFeedbackLugar()
        {
            return (LogicaComentariosFeedbackLugar.GetInstancia());
        }


        public static ILogicaFeedbackEvento getLogicaFeedbackEvento()
        {
            return (LogicaFeedbackEvento.GetInstancia());
        }

        public static ILogicaFeedbackLugar getLogicaFeedbackLugar()
        {
            return (LogicaFeedbackLugar.GetInstancia());
        }

        public static ILogicaLugar getLogicaLugar()
        {
            return (LogicaLugar.GetInstancia());
        }

        public static ILogicaMapa getLogicaMapa()
        {
            return (LogicaMapa.GetInstancia());
        }
        
        public static ILogicaUbicacion getLogicaUbicacion()
        {
            return (LogicaUbicacion.getInstancia());
        }
        public static ILogicaUsuario getLogicaUsuario()
        {
            return (LogicaUsuario.getInstancia());
        }
        

    }
}
