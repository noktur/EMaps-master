using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Logica;

namespace Wcf_Sistema
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    // NOTE: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class ServicioEvento : IServicioEvento
    {

        #region Lugar

        void IServicioEvento.AltaLugar(Lugar l)
        {
            try
            {
            FabricaLogica.getLogicaLugar().AltaLugar(l);
            }
            catch (FaultException ex)
             {
                 CodigoCatchFault(ex);
             }
        }

        void IServicioEvento.ModificarLugar(Lugar l)
        {
            try
            {
            FabricaLogica.getLogicaLugar().ModificarLugar(l);
            }
            catch (FaultException ex)
             {
                 CodigoCatchFault(ex);
             }
        }

        void IServicioEvento.BajaLugar(Lugar l)
        {
            try
            {
            FabricaLogica.getLogicaLugar().BajaLugar(l);
            }
            catch (FaultException ex)
             {
                 CodigoCatchFault(ex);
             }
        }

        Lugar IServicioEvento.BuscarLugar(string NombreLugar)
        {
            Lugar _Lugar = null;

            try
            {

            _Lugar = FabricaLogica.getLogicaLugar().BuscarLugar(NombreLugar);
            }
            catch (FaultException ex)
             {
                 CodigoCatchFault(ex);
             }

            return _Lugar;
        }

         List<Lugar>  IServicioEvento.ListarLugares()
        {
             List<Lugar> e=null;

             try
             {
            e= FabricaLogica.getLogicaLugar().ListarLugares();
             }
             catch (FaultException ex)
             {
                 CodigoCatchFault(ex);
             }

             return e;
        }

          List<Lugar> IServicioEvento.ListarLugaresDisponibles()
         {
              List<Lugar> e=null;
              try
              {
             e= FabricaLogica.getLogicaLugar().ListarLugaresDisponibles();
              }
              catch (FaultException ex)
             {
                 CodigoCatchFault(ex);
             }

              return e;
         }
          List<Lugar> IServicioEvento.ListarLugaresCiudad(string pNombreCiudad)
         {

              List<Lugar> e=null;
              try
              {
             e= FabricaLogica.getLogicaLugar().ListarLugaresCiudad(pNombreCiudad);
              }
              catch (FaultException ex)
             {
                 CodigoCatchFault(ex);
             }

              return e;
         }

          Lugar IServicioEvento.BuscarMapaLugar(int IdMapa)
         {
              Lugar e=null;
              try
              {
             e= FabricaLogica.getLogicaLugar().BuscarMapaLugar(IdMapa);
              }
              catch (FaultException ex)
             {
                 CodigoCatchFault(ex);
             }

              return e;
         }

        #endregion

        #region Mapa

        void IServicioEvento.AltaMapa(Mapa m)
        {
            try
            {
                FabricaLogica.getLogicaMapa().AltaMapa(m);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

        }

        void IServicioEvento.ModificarMapa(Mapa m)
        {
            try
            {
                FabricaLogica.getLogicaMapa().ModificarMapa(m);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }

        Mapa IServicioEvento.BuscarMapa(int IdMapa)
        {
            Mapa _Mapa = null;
            try
            {

                _Mapa = FabricaLogica.getLogicaMapa().BuscarMapa(IdMapa);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return _Mapa;
        }

        void IServicioEvento.BajaMapa(Mapa m)
        {
            try
            {
                FabricaLogica.getLogicaMapa().BajaMapa(m);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }

        #endregion

        #region Alquiler

         void IServicioEvento.AltaAlquiler(Alquiler e)
        {
            try
            {
                FabricaLogica.getLogicaAlquiler().AltaAlquiler(e);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }
         void IServicioEvento.BajaAlquiler(Alquiler e)
        {
            try
            {
                FabricaLogica.getLogicaAlquiler().BajaAlquiler(e);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }

         Alquiler IServicioEvento.BuscarAlquiler(int IdAlquiler)
        {
            Alquiler e = null;
            try
            {
                e= FabricaLogica.getLogicaAlquiler().BuscarAlquiler(IdAlquiler);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }
         List<Alquiler> IServicioEvento.ListarAlquileres()
        {
           List<Alquiler> e = null;
            try
            {
                e= FabricaLogica.getLogicaAlquiler().ListarAlquileres();
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }
         List<Alquiler> IServicioEvento.ListarAlquileresArea(int IdArea)
        {

            List<Alquiler> e = null;
            try
            {
                e= FabricaLogica.getLogicaAlquiler().ListarAlquileresArea(IdArea);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }

         List<Alquiler> IServicioEvento.ListarAlquileresOrganizador(string Ci)
        {

            List<Alquiler> e = null;
            try
            {
                e= FabricaLogica.getLogicaAlquiler().ListarAlquileresOrganizador(Ci);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }



        #endregion

        #region Area

        void IServicioEvento.AltaArea(Area a)
        {
            try
            {
                FabricaLogica.getLogicaArea().AltaArea(a);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
           
        }
         void IServicioEvento.ModificarArea(Area a)
        {
            try
            {
                FabricaLogica.getLogicaArea().ModificarArea(a);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }
         Area IServicioEvento.BuscarArea(int IdArea)
        {
            Area e = null;
            try
            {
                e= FabricaLogica.getLogicaArea().BuscarArea(IdArea);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }

         Area IServicioEvento.BuscarAreaPorNombre(string NombreArea)
        {

            Area e = null;
            try
            {
                e= FabricaLogica.getLogicaArea().BuscarAreaPorNombre(NombreArea);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }
         void IServicioEvento.AltaPuntodeArea(Area a, Punto p)
        {
            try
            {
                FabricaLogica.getLogicaArea().AltaPuntodeArea(a, p);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }
         void IServicioEvento.BajaArea(Area a)
        {
            try
            {
                FabricaLogica.getLogicaArea().BajaArea(a);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }
         List<Area> IServicioEvento.ListarAreasDeMapa(int IdMapa)
         {
             List<Area> e = null;
             try
             {
                 e = FabricaLogica.getLogicaArea().ListarAreasDeMapa(IdMapa);
             }
             catch (FaultException ex)
             {
                 CodigoCatchFault(ex);
             }

             return e;
         }
        List<Punto> IServicioEvento.ListarPuntosDeUnArea(Area a)
        {

            List<Punto> e = null;
            try
            {
                e= FabricaLogica.getLogicaArea().ListarPuntosDeUnArea(a);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;

        }

        #endregion

        #region Ubicaciones

        void IServicioEvento.AltaUbicacion(Ubicacion U)
        {
            try
            {
                if (U is Pais)
                {
                    FabricaLogica.getLogicaUbicacion().Alta((Pais)U);
                }
                else if (U is Ciudad)
                {
                    FabricaLogica.getLogicaUbicacion().Alta((Ciudad)U);
                }
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

        }

        void IServicioEvento.ModificarUbicacion(Ubicacion U)
        {
            try
            {
                if (U is Pais)
                {
                    FabricaLogica.getLogicaUbicacion().Modificar((Pais)U);
                }
                else if (U is Ciudad)
                {
                    FabricaLogica.getLogicaUbicacion().Modificar((Ciudad)U);
                }
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }

        void IServicioEvento.EliminarUbicacion(Ubicacion U)
        {
            try
            {
                if (U is Pais)
                {
                    FabricaLogica.getLogicaUbicacion().Eliminar((Pais)U);
                }
                else if (U is Ciudad)
                {
                    FabricaLogica.getLogicaUbicacion().Eliminar((Ciudad)U);
                }
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }


        Pais IServicioEvento.BuscarPais(string pNombre)
        {

            Pais _Pais = null;

            try
            {
                _Pais = FabricaLogica.getLogicaUbicacion().BuscarPais(pNombre);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return _Pais;
        }

        Ciudad IServicioEvento.BuscarCiudad(string pNombreCiudad)
        {
            Ciudad _Ciudad = null;

            try
            {
                _Ciudad = FabricaLogica.getLogicaUbicacion().BuscarCiudad(pNombreCiudad);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return _Ciudad;
        }

        List<Ciudad> IServicioEvento.ListarCiudades()
        {

            List<Ciudad> e = null;
            try
            {
                e= FabricaLogica.getLogicaUbicacion().ListarCiudades();
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }

        List<Pais> IServicioEvento.ListarPais()
        {

            List<Pais> e = null;
            try
            {
                e= FabricaLogica.getLogicaUbicacion().ListarPais();
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }

        List<Ciudad> IServicioEvento.ListarCiudadesPais(Pais UnPais)
        {
            List<Ciudad> e = null;
            try
            {
                e= FabricaLogica.getLogicaUbicacion().ListarCiudadesPais(UnPais);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
            return e;
        }

        #endregion

        #region Usuarios

        void IServicioEvento.AltaUsuario(Usuario U)
        {
            try
            {
                FabricaLogica.getLogicaUsuario().Alta(U);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
            
        }

        void IServicioEvento.ModificarUsuario(Usuario U)
        {
            try
            {
                FabricaLogica.getLogicaUsuario().Modificar(U);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }

        void IServicioEvento.EliminarUsuario(Usuario U)
        {
            try
            {
                FabricaLogica.getLogicaUsuario().Eliminar(U);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }

        Usuario IServicioEvento.BuscarUsuario(string pDoc)
        {
            Usuario _Usuario = null;

            try
            {

                _Usuario = FabricaLogica.getLogicaUsuario().Buscar(pDoc);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return _Usuario;
        }

        Usuario IServicioEvento.Login(String nomUsu, String pass)
        {
            Usuario _Usuario = null;

            try
            {
                _Usuario = FabricaLogica.getLogicaUsuario().Login(nomUsu, pass);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return _Usuario;
        }

        List<Admin> IServicioEvento.ListarAdmin()
        {
            List<Admin> e = null;
            try
            {
                e= FabricaLogica.getLogicaUsuario().ListarAdmin();
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }

        List<Dueño> IServicioEvento.ListarDueños()
        {

            List<Dueño> e = null;
            try
            {
                e= FabricaLogica.getLogicaUsuario().ListarDueños();
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }

        List<Organizador> IServicioEvento.ListarOrganizadores()
        {
            List<Organizador> e = null;
            try
            {
                e= FabricaLogica.getLogicaUsuario().ListarOrganizadores();
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }

        List<Cliente> IServicioEvento.ListarClientes()
        {
            List<Cliente> e = null;
            try
            {
                e= FabricaLogica.getLogicaUsuario().ListarClientes();
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }

        #endregion

        #region Evento

         void IServicioEvento.AltaEvento(Evento p)
        {
            try
            {
                FabricaLogica.getLogicaEvento().AltaEvento(p);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }
         void IServicioEvento.ComprobarEstadoEvento(Evento UnEvento, DateTime fecha1, DateTime fecha2)
        {
            try
            {
                FabricaLogica.getLogicaEvento().ComprobarEstadoEvento(UnEvento, fecha1, fecha2);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }
         void IServicioEvento.BajaEvento(Evento e)
        {
            try
            {
                FabricaLogica.getLogicaEvento().BajaEvento(e);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }
        }
         Evento IServicioEvento.BuscarEvento(int IdEvento)
        {
            Evento e = null;
            try
            {
                e=FabricaLogica.getLogicaEvento().BuscarEvento(IdEvento);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }
         Categoria IServicioEvento.BuscarCategoria(string NombreCategoria)
        {
            Categoria e = null;
            try
            {
                e= FabricaLogica.getLogicaEvento().BuscarCategoria(NombreCategoria);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }
         List<Categoria> IServicioEvento.ListarCategorias()
        {
            List<Categoria> e = null;
            try
            {
                e= FabricaLogica.getLogicaEvento().ListarCategorias();
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }
        List<Evento> IServicioEvento.ListarEventosOrdenFecha()
        {
            List<Evento> e = null;
            try
            {
                e= FabricaLogica.getLogicaEvento().ListarEventosOrdenFecha();
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }
         List<Evento> IServicioEvento.ListarEventosOrganizador(string CiOrganizador)
        {

            List<Evento> e = null;
            try
            {
                e= FabricaLogica.getLogicaEvento().ListarEventosOrganizador(CiOrganizador);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }       
        List<Evento> IServicioEvento.ListarEventosReservados()
        {
            List<Evento> e = null;
            try
            {
                e= FabricaLogica.getLogicaEvento().ListarEventosReservados();
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }
         List<Evento> IServicioEvento.ListarEventosxArea(int IdArea)
        {
            List<Evento> e = null;
            try
            {
                e=FabricaLogica.getLogicaEvento().ListarEventosxArea(IdArea);
            }
            catch (FaultException ex)
            {
                CodigoCatchFault(ex);
            }

            return e;
        }

        #endregion


        private String CodigoCatchFault(FaultException ex)
        {
            String msg = ex.Message;

            if (msg.Contains("&$"))
            {
                msg = (ex.Message.Split((new String[] { "&$" }), StringSplitOptions.RemoveEmptyEntries))[1];
            }
            else
            {
                if (msg.Length > 100)
                    msg = msg.Substring(0, 100);
            }
            return msg;
        }

    }
}
