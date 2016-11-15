using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace EntidadesCompartidas
{
    public class FeedbackEvento
    {
         #region Atributos

        private int _IdFeedbackEvento;
        private string _NombreFeedback;
        private Usuario _UsuarioFeedback;
        private string _Mensaje;
        private DateTime _FechaRealizado;
        private Evento _EventoFeedback;

       #endregion

       #region Propiedades

        [DataMember]
        public int IdFeedbackEvento
        {
            get { return _IdFeedbackEvento;}
            set { _IdFeedbackEvento = value; }
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
        public Evento EventoFeedback
        {
            get { return _EventoFeedback;}
            set { _EventoFeedback= value;}
        }

        [DataMember]
        public string Mensaje
        {
            get { return _Mensaje; }
            set { _Mensaje = value; }
        }

       #endregion

       #region Constructores

        public FeedbackEvento(int pIdFeedbackEvento,string pNombreFeedback,string pMensaje,Usuario pUsuarioFeedback, DateTime pFechaRealizado,Evento pEventoFeedback)
        {
            IdFeedbackEvento=pIdFeedbackEvento;
            NombreFeedback=pNombreFeedback;
            UsuarioFeedback=pUsuarioFeedback;
            FechaRealizado=pFechaRealizado;
            Mensaje = pMensaje;
            EventoFeedback=pEventoFeedback;
        }

        public FeedbackEvento()
        {
            IdFeedbackEvento=0;
            NombreFeedback="";
            UsuarioFeedback=null;
            Mensaje = "";
            FechaRealizado=DateTime.Now;
            EventoFeedback=null;
        }


       #endregion
    }
 }
