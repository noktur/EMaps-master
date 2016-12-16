using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Area
    {
        #region Atributos

        private int _IdArea;
        private string _NombreArea;
        private string _Descripcion;
        private Mapa _MapaAsociado;
        private List<Punto>  _PuntosArea;
        private int _Capacidad;

        #endregion

        #region Propiedades

        [DataMember]
        public string Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }


        [DataMember]
        public int Capacidad
        {
            get { return _Capacidad; }
            set { _Capacidad = value; }
        }


        [DataMember]
        public int IdArea
        {
            get { return _IdArea; }
            set { _IdArea = value; }
        }
        
        [DataMember]
        public string NombreArea
        {
            get { return _NombreArea; }
            set { _NombreArea = value; }
        }

        [DataMember]
        public List<Punto> PuntosArea
        {
            get { return _PuntosArea; }
            set { _PuntosArea = value; }
        }
        
        [DataMember]
        public Mapa MapaAsociado
        {
            get { return _MapaAsociado; }
            set { _MapaAsociado = value; }
        }

        #endregion

        
        #region Constructores
        
        public Area(int pIdArea,string pNombreArea,string pDescripcion,int pCapacidad,Mapa pMapaAsociado)
        {
            IdArea = pIdArea;
            NombreArea = pNombreArea;
            Descripcion = pDescripcion;
            Capacidad = pCapacidad;
            MapaAsociado = pMapaAsociado;
        }
        public Area(int pIdArea, string pNombreArea, string pDescripcion, int pCapacidad, Mapa pMapaAsociado,List<Punto> pPuntos)
        {
            IdArea = pIdArea;
            NombreArea = pNombreArea;
            Descripcion = pDescripcion;
            Capacidad = pCapacidad;
            PuntosArea = pPuntos;
            MapaAsociado = pMapaAsociado;
        }

        public Area()
        {
            IdArea = 0;
            Descripcion = "";
            Capacidad = 0;
            NombreArea = "";
            PuntosArea = new List<Punto>();
            MapaAsociado = null;
        }

        public void AgregarPunto(Punto unPunto)
        {
            _PuntosArea.Add(unPunto);
        }

        #endregion
    }
}

