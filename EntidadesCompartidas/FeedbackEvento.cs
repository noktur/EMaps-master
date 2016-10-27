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

       #endregion

       #region Constructores

        public FeedbackEvento(int pIdFeedbackEvento,string pNombreFeedback,Usuario pUsuarioFeedback, DateTime pFechaRealizado,Evento pEventoFeedback)
        {
            IdFeedbackEvento=pIdFeedbackEvento;
            NombreFeedback=pNombreFeedback;
            UsuarioFeedback=pUsuarioFeedback;
            FechaRealizado=pFechaRealizado;
            EventoFeedback=pEventoFeedback;
        }

        public FeedbackEvento()
        {
            IdFeedbackEvento=0;
            NombreFeedback="";
            UsuarioFeedback=null;
            FechaRealizado=DateTime.Now;
            EventoFeedback=null;
        }


       #endregion
    }
 }
