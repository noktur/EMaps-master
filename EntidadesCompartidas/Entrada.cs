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
         private Cliente _UnCliente;
         private int _Cantidad;
         private Evento _EventoAsociado;
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
         public Cliente UnCliente
         {
             get { return _UnCliente; }
             set { _UnCliente = value; }
         }


         [DataMember]
         public DateTime FechaEmision
         {
             get { return _FechaEmision; }
             set { _FechaEmision = value; }
         }

         [DataMember]
         public Evento EventoAsociado
         {
             get { return _EventoAsociado; }
             set { _EventoAsociado = value; }
         }
         

         #endregion

         #region Constructores
         
         public Entrada(int pIdEntrada,double  pPrecio,Cliente pUnCliente,int pCantidad, Evento pEventoAsociado,DateTime pFechaEmision)
         {
             IdEntrada = pIdEntrada;
             Precio = pPrecio;
             UnCliente = pUnCliente;
             Cantidad = pCantidad;
             EventoAsociado = pEventoAsociado;
             FechaEmision = pFechaEmision;
         }

         public Entrada()
         {
             IdEntrada = 0;
             Precio = 0.0;
             UnCliente = null;
             Cantidad = 0;
             EventoAsociado = null;
             FechaEmision = DateTime.Today;
         }

         #endregion
     }
}
