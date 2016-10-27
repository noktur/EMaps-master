using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Servicio
    {
        #region Atributos

        private string _NombreServicio;
        private string _Descripcion;
        private string _Contacto;
        private double _Precio;

        #endregion 

        #region Propiedades

        [DataMember]
        public string NombreServicio
        {
            get { return _NombreServicio; }
            set { _NombreServicio = value; }
        }

        [DataMember]
        public string Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        [DataMember]
        public string Contacto
        {
            get { return _Contacto; }
            set { _Contacto = value; }
        }

        [DataMember]
        public double Precio
        {
            get { return _Precio; }
            set { _Precio = value; }
        }

        #endregion

        #region Constructores

        public Servicio(string pNombreServicio,string pDescripcion,string pContacto,double pPrecio)
        {
            NombreServicio = pNombreServicio;
            Descripcion = pDescripcion;
            Contacto = pContacto;
            Precio = pPrecio;
        }

        public Servicio()
        {
            NombreServicio = "";
            Descripcion = "";
            Contacto = "";
            Precio = 0;
        }

        #endregion
    }
}
