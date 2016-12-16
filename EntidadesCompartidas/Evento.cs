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
        private Categoria _CategoriaEvento;
        private Area _AreaAlquilada;
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
        public Organizador UnOrganizador
        {
            get { return _OrganizadorEvento; }
            set { _OrganizadorEvento = value; }
        }

        [DataMember]
        public Area AreaEvento
        {
            get { return _AreaAlquilada; }
            set { _AreaAlquilada = value; }
        }

        [DataMember]
        public Categoria CategoriaEvento
        {
            get { return _CategoriaEvento; }
            set { _CategoriaEvento = value; }
        }

       #endregion

       #region Constructores

        public Evento(int pIdEvento,string pNombreEvento,string pDescripcion,DateTime pFechaInicio,DateTime pFechaFin,Area pArea,Categoria pCategoria,Organizador pOrganizador)
        {
            IdEvento = pIdEvento;
            NombreEvento = pNombreEvento;
            Descripcion = pDescripcion;
            FechaInicio = pFechaInicio;
            FechaFin = pFechaFin;
            UnOrganizador = pOrganizador;
            AreaEvento = pArea;
            CategoriaEvento = pCategoria;
        }

        public Evento()
        {
            IdEvento = 0;
            NombreEvento = "";
            Descripcion = "";
            FechaInicio = DateTime.Now;
            FechaFin = DateTime.Now;
            AreaEvento = null;
           CategoriaEvento = null;
           UnOrganizador= null;
        }


       #endregion


    }
}
