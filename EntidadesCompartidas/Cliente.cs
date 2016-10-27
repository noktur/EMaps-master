using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Cliente:Usuario
    {

       #region Atributos

        private List<Entrada> _EntradasEventos;

       #endregion

       #region Propiedades

        [DataMember]
        public List<Entrada> EntradasEvento
        {
            get { return _EntradasEventos; }
            set { _EntradasEventos = value; }
        }

       #endregion

       #region Constructores

        public Cliente(string pCi, string pNombre, string pNombreUsuario, string pContraseña, string pEmail, List<Entrada> pEntradasEventos)
            : base(pCi, pNombre, pNombreUsuario, pContraseña, pEmail)
        {
            EntradasEvento = pEntradasEventos;
        }
        public Cliente(string pCi, string pNombre, string pNombreUsuario, string pContraseña, string pEmail)
            : base(pCi, pNombre, pNombreUsuario, pContraseña, pEmail)
        {
            
        }

            public Cliente()
            {
                EntradasEvento = new List<Entrada>();
            }

       #endregion

    }
}
