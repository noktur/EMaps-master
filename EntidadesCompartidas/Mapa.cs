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
        private string _Extension;
        private Lugar _LugarAsociado;
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
        public Lugar LugarAsociado
        {
            get { return _LugarAsociado; }
            set { _LugarAsociado = value; }
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
        public string Extension
        {
            get { return _Extension; }
            set { _Extension = value; }
        }

        [DataMember]
        public List<Area> Areas
        {
            get { return _ListaAreas; }
            set { }
        }

        #endregion

        #region Constructores

        public Mapa(int pIdMapa,byte[] pImagen,Lugar pLugarAsociado,string pNombre,string pExtension)
        {
            Imagen = pImagen;
            Nombre = pNombre;
            LugarAsociado = pLugarAsociado;
            IdMapa = pIdMapa;
            Extension = pExtension;
        }
        public Mapa(int pIdMapa, byte[] pImagen, string pNombre,string pExtension, Lugar pLugarAsociado, List<Area> pListaAreas)
        {
            Imagen = pImagen;
            Nombre = pNombre;
            IdMapa = pIdMapa;
            LugarAsociado = pLugarAsociado;
            _ListaAreas = pListaAreas;
            Extension = pExtension;
        }


        public Mapa()
        {
            IdMapa = 0;
            Imagen = null;
            Nombre = "";
            Extension = "";
            LugarAsociado = null;
            _ListaAreas = null;
        }
        #endregion
    }
}
