using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace EntidadesCompartidas
{
    public class ComentarioFeedbackLugar
    {
         #region Atributos

        private int _IdComentarioLugar;
        private string _AsuntoComentario;
        private Usuario _UsuarioComentario;
        private string _Comentario;
        private DateTime _FechaRealizado;
        private FeedbackLugar _MensajeAsociado;

       #endregion

       #region Propiedades

        [DataMember]
        public int IdComentarioLugar
        {
            get { return _IdComentarioLugar;}
            set { _IdComentarioLugar = value; }
        }
        
        [DataMember]
        public string AsuntoComentario
        {
            get { return _AsuntoComentario;}
            set { _AsuntoComentario = value; }
        }

        [DataMember]
        public Usuario UsuarioComentario
        {
            get { return _UsuarioComentario;}
            set { _UsuarioComentario= value;}
        }

        [DataMember]
        public  DateTime  FechaRealizado
        {
            get { return _FechaRealizado;}
            set { _FechaRealizado= value;}
        }
        
        [DataMember]
        public FeedbackLugar MensajeAsociado
        {
            get { return _MensajeAsociado;}
            set { _MensajeAsociado= value;}
        }

        [DataMember]
        public string Comentario
        {
            get { return _Comentario; }
            set { _Comentario = value; }
        }

       #endregion

       #region Constructores

        public ComentarioFeedbackLugar(int pIdComentario,string pAsuntoComentario,string pComentario,Usuario pUsuarioComentario, DateTime pFechaRealizado,FeedbackLugar pMensajeAsociado)
        {
            IdComentarioLugar=pIdComentario;
            AsuntoComentario=pAsuntoComentario;
            UsuarioComentario=pUsuarioComentario;
            FechaRealizado=pFechaRealizado;
            Comentario = pComentario;
            MensajeAsociado=pMensajeAsociado;
        }

        public ComentarioFeedbackLugar()
        {
            IdComentarioLugar=0;
            AsuntoComentario="";
            UsuarioComentario=null;
            Comentario = "";
            FechaRealizado=DateTime.Now;
            MensajeAsociado=null;
        }


       #endregion
    }
}
