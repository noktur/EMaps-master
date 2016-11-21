using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Reserva
    {
        #region Atributos

        private Cliente _ClienteReserva;
        private Evento _EventoReservado;
        private DateTime _FechaReserva;
        private DateTime _FechaEmision;
        private int _IdReserva;
        private int _CantidadEntradasReservadas;

        #endregion

          #region Propiedades

        [DataMember]
        public int IdReserva
        {
            get { return _IdReserva; }
            set  {_IdReserva = value; }
        }

        [DataMember]
        public Cliente ClienteReserva
        {
            get { return _ClienteReserva;}
            set { _ClienteReserva= value; }
        }

        [DataMember]
        public Evento EventoReservado
        {
            get { return _EventoReservado;}
            set { _EventoReservado = value;}
        }

        [DataMember]
        public int Cantidad
        {
            get { return _CantidadEntradasReservadas; }
            set { _CantidadEntradasReservadas = value; }
        }


        [DataMember]
        public DateTime FechaReserva
        {
            get { return _FechaReserva;}
            set { _FechaReserva = value;}
        }

        [DataMember]
        public DateTime FechaEmision
        {
            get { return _FechaEmision;}
            set { _FechaEmision = value;}
        }

       #endregion

       #region Constructores

        public Reserva(int pIdReserva,Cliente pCliente,Evento pEvento,int pCantidad,DateTime pFechaReserva,DateTime pFechaEmision)
        {
            IdReserva = pIdReserva;
            ClienteReserva=pCliente;
            EventoReservado=pEvento;
            FechaReserva=pFechaReserva;
            Cantidad = pCantidad;
            FechaEmision=pFechaEmision;
        }

        public Reserva()
        {
            IdReserva = 0;
            Cantidad = 0;
            ClienteReserva = null;
            EventoReservado = null;
            FechaReserva = DateTime.Now;
            FechaEmision = DateTime.Now;
        }


       #endregion
    }
}
