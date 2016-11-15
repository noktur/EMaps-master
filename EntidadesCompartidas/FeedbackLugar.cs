using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace EntidadesCompartidas
{
    public class FeedbackLugar
    {

          #region Atributos

        private int _IdFeedbackLugar;
        private string _NombreFeedback;
        private Usuario _UsuarioFeedback;
        private string _Mensaje;
        private DateTime _FechaRealizado;
        private Lugar _LugarFeedback;


       #endregion

       #region Propiedades

        [DataMember]
        public int IdFeedbackLugar
        {
            get { return _IdFeedbackLugar;}
            set { _IdFeedbackLugar = value; }
        }
        
        [DataMember]
        public string NombreFeedback
        {
            get { return _NombreFeedback;}
            set { _NombreFeedback = value; }
        }

        [DataMember]
        public Usuario UsuarioFeedback
        {
            get { return _UsuarioFeedback;}
            set { _UsuarioFeedback= value;}
        }

        [DataMember]
        public  DateTime  FechaRealizado
        {
            get { return _FechaRealizado;}
            set { _FechaRealizado= value;}
        }
        
        [DataMember]
        public Lugar LugarFeedback
        {
            get { return _LugarFeedback;}
            set { _LugarFeedback= value;}
        }

        [DataMember]
        public string Mensaje
        {
            get { return _Mensaje; }
            set { _Mensaje = value; }
        }

       #endregion

       #region Constructores

        public FeedbackLugar(int pIdFeedbackLugar,string pNombreFeedback,string pMensaje,Usuario pUsuarioFeedback, DateTime pFechaRealizado,Lugar pLugarFeedback)
        {
            IdFeedbackLugar=pIdFeedbackLugar;
            NombreFeedback=pNombreFeedback;
            UsuarioFeedback=pUsuarioFeedback;
            FechaRealizado=pFechaRealizado;
            Mensaje = pMensaje;
            LugarFeedback=pLugarFeedback;
        }

        public FeedbackLugar()
        {
            IdFeedbackLugar=0;
            NombreFeedback="";
            UsuarioFeedback=null;
            Mensaje = "";
            FechaRealizado=DateTime.Now;
            LugarFeedback=null;
        }


       #endregion

    }
}
