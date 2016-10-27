using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Mapa
    {
        #region Atributos

        private int _IdMapa;
        private byte[] _Imagen;
        private string _Nombre;
        private List<Area> _ListaAreas;

        #endregion
        
        #region Propiedades

        [DataMember]
        public int IdMapa
        {
            get { return _IdMapa; }
            set { _IdMapa = value; }
        }

        [DataMember]
        public byte[] Imagen
        {
            get { return _Imagen;}
            set { _Imagen = value; }
        }

        [DataMember]
        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        [DataMember]
        public List<Area> Areas
        {
            get { return _ListaAreas; }
            set { }
        }

        #endregion

        #region Constructores

        public Mapa(int pIdMapa,byte[] pImagen,string pNombre)
        {
            Imagen = pImagen;
            Nombre = pNombre;
            IdMapa = pIdMapa;
        }
        public Mapa(int pIdMapa,byte[] pImagen, string pNombre,List<Area> pListaAreas)
        {
            Imagen = pImagen;
            Nombre = pNombre;
            IdMapa = pIdMapa;
            _ListaAreas = pListaAreas;
        }


        public Mapa()
        {
            IdMapa = 0;
            Imagen = null;
            Nombre = "";
            _ListaAreas = null;
        }
        #endregion
    }
}
