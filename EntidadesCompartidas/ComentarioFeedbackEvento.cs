using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace EntidadesCompartidas
{
    public class ComentarioFeedbackEvento
    {
         #region Atributos

        private int _IdComentarioEvento;
        private string _AsuntoComentario;
        private Usuario _UsuarioComentario;
        private string _Comentario;
        private DateTime _FechaRealizado;
        private FeedbackEvento _MensajeAsociado;

       #endregion

       #region Propiedades

        [DataMember]
        public int IdComentarioEvento
        {
            get { return _IdComentarioEvento;}
            set { _IdComentarioEvento = value; }
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
        public FeedbackEvento MensajeAsociado
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

        public ComentarioFeedbackEvento(int pIdComentario,string pAsuntoComentario,string pComentario,Usuario pUsuarioComentario, DateTime pFechaRealizado,FeedbackEvento pMensajeAsociado)
        {
            IdComentarioEvento=pIdComentario;
            AsuntoComentario=pAsuntoComentario;
            UsuarioComentario=pUsuarioComentario;
            FechaRealizado=pFechaRealizado;
            Comentario = pComentario;
            MensajeAsociado=pMensajeAsociado;
        }

        public ComentarioFeedbackEvento()
        {
            IdComentarioEvento=0;
            AsuntoComentario="";
            UsuarioComentario=null;
            Comentario = "";
            FechaRealizado=DateTime.Now;
            MensajeAsociado=null;
        }


       #endregion
    }
}
