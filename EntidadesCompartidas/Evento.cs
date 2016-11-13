using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Evento
    {
       #region Atributos

        private int _IdEvento;
        private string _NombreEvento;
        private string _Descripcion;
        private DateTime _FechaInicioEvento;
        private DateTime _FechaFinEvento;
        private Lugar _UnLugar;
        private Categoria _CategoriaEvento;
        private Organizador _OrganizadorEvento;

       #endregion

       #region Propiedades


        [DataMember]
        public int IdEvento
        {
            get { return _IdEvento; }
            set { _IdEvento = value; }
        }

        [DataMember]
        public string NombreEvento
        {
            get { return _NombreEvento;}
            set { _NombreEvento = value; }
        }

        [DataMember]
        public string Descripcion
        {
            get { return _Descripcion;}
            set { _Descripcion = value;}
        }

        [DataMember]
        public DateTime FechaInicio
        {
            get { return _FechaInicioEvento; }
            set { _FechaInicioEvento = value; }
        }

        [DataMember]
        public DateTime FechaFin
        {
            get { return _FechaFinEvento; }
            set { _FechaFinEvento = value; }
        }

        [DataMember]
        public Lugar UnLugar
        {
            get { return _UnLugar; }
            set { _UnLugar = value; }
        }

        [DataMember]
        public Categoria CategoriaEvento
        {
            get { return _CategoriaEvento; }
            set { _CategoriaEvento = value; }
        }

        public Organizador OrganizadorEvento
        {
            get { return _OrganizadorEvento; }
            set { _OrganizadorEvento = value; }
        }

       #endregion

       #region Constructores

        public Evento(int pIdEvento,string pNombreEvento,string pDescripcion,DateTime pFechaInicio,DateTime pFechaFin,Lugar pUnLugar,Categoria pCategoria,Organizador pOrganizadorEvento)
        {
            IdEvento = pIdEvento;
            NombreEvento = pNombreEvento;
            Descripcion = pDescripcion;
            FechaInicio = pFechaInicio;
            FechaFin = pFechaFin;
            UnLugar = pUnLugar;
            CategoriaEvento = pCategoria;
            OrganizadorEvento = pOrganizadorEvento;
        }

        public Evento()
        {
            IdEvento = 0;
            NombreEvento = "";
            Descripcion = "";
            FechaInicio = DateTime.Now;
            FechaFin = DateTime.Now;
            UnLugar = null;
           CategoriaEvento = null;
           OrganizadorEvento = null;
        }


       #endregion


    }
}
