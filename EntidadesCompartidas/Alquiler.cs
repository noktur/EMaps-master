using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
 
namespace EntidadesCompartidas
{
    public class Alquiler
    {
        #region Atributos

        private int _IdAlquiler;
        private Lugar _LugarAlquiler;
        private Organizador _ClienteAlquiler;
        private DateTime _FechaReservacion;
        private DateTime _FechaInicio;
        private DateTime _FechaFin;

        #endregion

         #region Propiedades

        [DataMember]
         public int IdAlquiler
         {
             get { return _IdAlquiler;}
             set {
                    _IdAlquiler = value;
                 }
         }

        [DataMember]
         public Lugar LugarAlquiler
         {
             get { return _LugarAlquiler;}
             set { _LugarAlquiler = value; }
         }

         [DataMember]
         public Organizador ClienteAlquiler
         {
             get { return _ClienteAlquiler; }
             set { _ClienteAlquiler = value; }
         }

          [DataMember]
         public DateTime FechaInicio
         {
             get { return _FechaInicio; }
             set { _FechaInicio = value; }
         }

          [DataMember]
          public DateTime FechaFin
          {
              get { return _FechaFin; }
              set { _FechaFin = value; }
          }

          [DataMember]
          public DateTime FechaReservacion
          {
              get { return _FechaReservacion; }
              set { _FechaReservacion = value; }
          }
         
         #endregion

         #region Constructores
         
         public Alquiler(int pIdAlquiler,Lugar pLugarAlquiler,Organizador pUnClienteAlquiler,DateTime pFechaInicio,DateTime pFechaFin,DateTime pFechaReservacion)
         {
             IdAlquiler= pIdAlquiler;
             LugarAlquiler = pLugarAlquiler;
              ClienteAlquiler= pUnClienteAlquiler;
              FechaInicio = pFechaInicio;
              FechaFin = pFechaFin;
             FechaReservacion=pFechaReservacion;
         }

         public Alquiler()
         {
             IdAlquiler = 0;
             LugarAlquiler = null;
             FechaInicio = DateTime.Now;
             FechaFin = DateTime.Now;
             FechaReservacion = DateTime.Now;
             ClienteAlquiler = null;
         }

         #endregion

    }
}
