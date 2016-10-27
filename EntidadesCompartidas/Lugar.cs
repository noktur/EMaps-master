using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Lugar
    {
        #region Atributos

        private string _Nombre;
        private string _Direccion;
        private string _Descripcion;
        private int _Capacidad;
        private Ciudad _UbicacionLugar;
        private Mapa _MapaLugar;
        private float _CoordenadaX;
        private float _CoordenadaY;
        private List<FotosLugar> _fotosLugar;
        private Dueño _DueñoLugar;

        #endregion

        #region Propiedades

        [DataMember]
        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        [DataMember]
        public string Direccion
        {
            get { return _Direccion; }
            set { _Direccion = value; }
        }

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
        public Ciudad UbicacionLugar
        {
            get { return _UbicacionLugar; }
            set { _UbicacionLugar = value; }
        }

        [DataMember]
        public Mapa MapaLugar
        {
            get { return _MapaLugar; }
            set { _MapaLugar=value; } 
        }

        [DataMember]
        public float CoordenadaX
        {
            get { return _CoordenadaX; }
            set { _CoordenadaX = value; }
        }
        [DataMember]
        public float CoordenadaY
        {
            get { return _CoordenadaY; }
            set { _CoordenadaY = value; }
        }

        [DataMember]
        public Dueño DueñoLugar
        {
            get { return _DueñoLugar; }
            set { _DueñoLugar = value; }
        }

        public List<FotosLugar> Fotos
        {
            get { return _fotosLugar; }
            set { }
        }

        #endregion

        #region Constructores
        public Lugar(string pNombre,string pDireccion,string pDescripcion,int pCapacidad,Ciudad pUbicacionLugar,Mapa pMapaLugar,float pCoordenadaX,float pCoordenadaY,Dueño pDueñoLugar)
        {
            Direccion = pDireccion;
            Descripcion = pDescripcion;
            _fotosLugar= new List<FotosLugar>();
            Capacidad = pCapacidad;
            UbicacionLugar = pUbicacionLugar;
            MapaLugar = pMapaLugar;
            CoordenadaX = pCoordenadaX;
            CoordenadaY = pCoordenadaY;
            DueñoLugar = pDueñoLugar;
        }

        public Lugar()
        {
            Direccion = "";
            Descripcion = "";
            Capacidad = 0;
            UbicacionLugar = null;
            MapaLugar = null;
            CoordenadaX = 0;
            CoordenadaY = 0;
            DueñoLugar = null;
            _fotosLugar = null;
        }

        public void AgregarFoto(FotosLugar unaFoto)
        {
            _fotosLugar.Add(unaFoto);
        }




        #endregion
    }
}
