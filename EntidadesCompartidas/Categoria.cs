using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace EntidadesCompartidas
{
    public class Categoria
    {
        #region Atributos

        private string _NombreCategoria;
        private string _Descripcion;

       #endregion

       #region Propiedades

        [DataMember]
        public string NombreCategoria
        {
            get { return _NombreCategoria;}
            set { _NombreCategoria = value; }
        }

        [DataMember]
        public string Descripcion
        {
            get { return _Descripcion;}
            set { _Descripcion = value;}
        }

       #endregion

       #region Constructores

        public Categoria(string pNombreCategoria,string pDescripcion)
        {
            NombreCategoria = pNombreCategoria;
            Descripcion = pDescripcion;
        }

        public Categoria()
        {
            NombreCategoria = "";
            Descripcion="";
        }


       #endregion
    }
}
