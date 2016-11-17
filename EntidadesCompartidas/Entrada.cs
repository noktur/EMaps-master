using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
     public class Entrada
     {
         #region Atributos

         private int _IdEntrada; 
         private double _Precio;
         private Reserva _ReservaEvento;
         private int _Cantidad;
         private DateTime _FechaEmision;

         
         #endregion

         #region Propiedades

         [DataMember]
         public int IdEntrada
         {
             get { return _IdEntrada; }
             set { _IdEntrada = value; }
         }


        [DataMember]
         public double Precio
         {
             get { return _Precio;}
             set {
                 if (value > 0)
                    _Precio = value;
                else
                    throw new Exception("&$ El precio no puede ser negativo &$");
                 }
         }

        [DataMember]
        public int Cantidad
        {
            get { return _Cantidad; }
            set
            {
                if (value > 0)
                    _Cantidad = value;
                else
                    throw new Exception("&$ La cantidad  no puede ser 0 &$");
            }
        }

         [DataMember]
         public Reserva ReservaEvento
         {
             get { return _ReservaEvento; }
             set { _ReservaEvento = value; }
         }


         [DataMember]
         public DateTime FechaEmision
         {
             get { return _FechaEmision; }
             set { _FechaEmision = value; }
         }
         

         #endregion

         #region Constructores
         
        public Entrada(int pIdEntrada,double  pPrecio,Reserva pUnaReserva,int pCantidad,DateTime pFechaEmision)
         {
             IdEntrada = pIdEntrada;
             Precio = pPrecio;
             ReservaEvento = pUnaReserva;
             Cantidad = pCantidad;
             FechaEmision = pFechaEmision;
         }

         public Entrada()
         {
             IdEntrada = 0;
             Precio = 0.0;
             ReservaEvento = null;
             Cantidad = 0;
             FechaEmision = DateTime.Today;
         }

         #endregion
     }
}
