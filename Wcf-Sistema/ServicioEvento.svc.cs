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
            FabricaLogica.getLogicaLugar().AltaLugar(l);
        }

        void IServicioEvento.ModificarLugar(Lugar l)
        {
            FabricaLogica.getLogicaLugar().ModificarLugar(l);
        }

        void IServicioEvento.BajaLugar(Lugar l)
        {
            FabricaLogica.getLogicaLugar().BajaLugar(l);
        }

        Lugar IServicioEvento.BuscarLugar(string NombreLugar)
        {
            Lugar _Lugar = null;

            _Lugar = FabricaLogica.getLogicaLugar().BuscarLugar(NombreLugar);

            return _Lugar;
        }

         List<Lugar>  IServicioEvento.ListarLugares()
        {
            return FabricaLogica.getLogicaLugar().ListarLugares();
        }

          List<Lugar> IServicioEvento.ListarLugaresDisponibles()
         {
             return FabricaLogica.getLogicaLugar().ListarLugaresDisponibles();
         }
          List<Lugar> IServicioEvento.ListarLugaresCiudad(string pNombreCiudad)
         {
             return FabricaLogica.getLogicaLugar().ListarLugaresCiudad(pNombreCiudad);
         }

          Lugar IServicioEvento.BuscarMapaLugar(int IdMapa)
         {
             return FabricaLogica.getLogicaLugar().BuscarMapaLugar(IdMapa);
         }

        #endregion

        #region Mapa

        void IServicioEvento.AltaMapa(Mapa m)
        {
            FabricaLogica.getLogicaMapa().AltaMapa(m);
        }

        void IServicioEvento.ModificarMapa(Mapa m)
        {
            FabricaLogica.getLogicaMapa().ModificarMapa(m);
        }

        Mapa IServicioEvento.BuscarMapa(int IdMapa)
        {
            Mapa _Mapa = null;

            _Mapa = FabricaLogica.getLogicaMapa().BuscarMapa(IdMapa);

            return _Mapa;
        }

        void IServicioEvento.BajaMapa(Mapa m)
        {
            FabricaLogica.getLogicaMapa().BajaMapa(m);
        }

        #endregion

        #region Alquiler

         void IServicioEvento.AltaAlquiler(Alquiler e)
        {
            FabricaLogica.getLogicaAlquiler().AltaAlquiler(e);
        }
         void IServicioEvento.BajaAlquiler(Alquiler e)
        {
            FabricaLogica.getLogicaAlquiler().BajaAlquiler(e);
        }

         Alquiler IServicioEvento.BuscarAlquiler(int IdAlquiler)
        {
            return FabricaLogica.getLogicaAlquiler().BuscarAlquiler(IdAlquiler);
        }
         List<Alquiler> IServicioEvento.ListarAlquileres()
        {
            return FabricaLogica.getLogicaAlquiler().ListarAlquileres();
        }
         List<Alquiler> IServicioEvento.ListarAlquileresArea(int IdArea)
        {
            return FabricaLogica.getLogicaAlquiler().ListarAlquileresArea(IdArea);
        }

         List<Alquiler> IServicioEvento.ListarAlquileresOrganizador(string Ci)
        {
            return FabricaLogica.getLogicaAlquiler().ListarAlquileresOrganizador(Ci);
        }



        #endregion

        #region Area

        void IServicioEvento.AltaArea(Area a)
        {
            FabricaLogica.getLogicaArea().AltaArea(a);
        }
         void IServicioEvento.ModificarArea(Area a)
        {
            FabricaLogica.getLogicaArea().ModificarArea(a);
        }
         Area IServicioEvento.BuscarArea(int IdArea)
        {
            return FabricaLogica.getLogicaArea().BuscarArea(IdArea);
        }

         Area IServicioEvento.BuscarAreaPorNombre(string NombreArea)
        {
            return FabricaLogica.getLogicaArea().BuscarAreaPorNombre(NombreArea);
        }
         void IServicioEvento.AltaPuntodeArea(Area a, Punto p)
        {
            FabricaLogica.getLogicaArea().AltaPuntodeArea(a, p);
        }
         void IServicioEvento.BajaArea(Area a)
        {
            FabricaLogica.getLogicaArea().BajaArea(a);
        }
        List<Area> IServicioEvento.ListarAreasDeMapa(int IdMapa)
        {
            return FabricaLogica.getLogicaArea().ListarAreasDeMapa(IdMapa);
        }
        List<Punto> IServicioEvento.ListarPuntosDeUnArea(Area a)
        {
            return FabricaLogica.getLogicaArea().ListarPuntosDeUnArea(a);
        }

        #endregion

        #region Ubicaciones

        void IServicioEvento.AltaUbicacion(Ubicacion U)
        {
            if (U is Pais)
            {
                FabricaLogica.getLogicaUbicacion().Alta((Pais)U);
            }
            else if(U is Ciudad)
            {
                FabricaLogica.getLogicaUbicacion().Alta((Ciudad)U);
            }

        }

        void IServicioEvento.ModificarUbicacion(Ubicacion U)
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

        void IServicioEvento.EliminarUbicacion(Ubicacion U)
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


        Pais IServicioEvento.BuscarPais(string pNombre)
        {
            Pais _Pais = null;

            _Pais = FabricaLogica.getLogicaUbicacion().BuscarPais(pNombre);

            return _Pais;
        }

        Ciudad IServicioEvento.BuscarCiudad(string pNombreCiudad, Pais UnPais)
        {
            Ciudad _Ciudad = null;

            _Ciudad = FabricaLogica.getLogicaUbicacion().BuscarCiudad(pNombreCiudad);

            return _Ciudad;
        }

        List<Ciudad> IServicioEvento.ListarCiudades()
        {
            return FabricaLogica.getLogicaUbicacion().ListarCiudades();
        }

        List<Pais> IServicioEvento.ListarPais()
        {
            return FabricaLogica.getLogicaUbicacion().ListarPais();
        }

        List<Ciudad> IServicioEvento.ListarCiudadesPais(Pais UnPais)
        {
            return FabricaLogica.getLogicaUbicacion().ListarCiudadesPais(UnPais);
        }

        #endregion

        #region Usuarios

        void IServicioEvento.AltaUsuario(Usuario U)
        {
            FabricaLogica.getLogicaUsuario().Alta(U);
        }

        void IServicioEvento.ModificarUsuario(Usuario U)
        {
            FabricaLogica.getLogicaUsuario().Modificar(U);
        }

        void IServicioEvento.EliminarUsuario(Usuario U)
        {
            FabricaLogica.getLogicaUsuario().Eliminar(U);
        }

        Usuario IServicioEvento.BuscarUsuario(string pDoc)
        {
            Usuario _Usuario = null;

            _Usuario = FabricaLogica.getLogicaUsuario().Buscar(pDoc);

            return _Usuario;
        }

        Usuario IServicioEvento.Login(String nomUsu, String pass)
        {
            Usuario _Usuario = null;

            _Usuario = FabricaLogica.getLogicaUsuario().Login(nomUsu, pass);

            return _Usuario;
        }

        List<Admin> IServicioEvento.ListarAdmin()
        {
            return FabricaLogica.getLogicaUsuario().ListarAdmin();
        }

        List<Dueño> IServicioEvento.ListarDueños()
        {
            return FabricaLogica.getLogicaUsuario().ListarDueños();
        }

        List<Organizador> IServicioEvento.ListarOrganizadores()
        {
            return FabricaLogica.getLogicaUsuario().ListarOrganizadores();
        }

        List<Cliente> IServicioEvento.ListarClientes()
        {
            return FabricaLogica.getLogicaUsuario().ListarClientes();
        }

        #endregion

        #region Evento

         void IServicioEvento.AltaEvento(Evento p)
        {
            FabricaLogica.getLogicaEvento().AltaEvento(p);
        }
         void IServicioEvento.ComprobarEstadoEvento(Evento UnEvento, DateTime fecha1, DateTime fecha2)
        {
            FabricaLogica.getLogicaEvento().ComprobarEstadoEvento(UnEvento, fecha1, fecha2);
        }
         void IServicioEvento.BajaEvento(Evento e)
        {
            FabricaLogica.getLogicaEvento().BajaEvento(e);
        }
         Evento IServicioEvento.BuscarEvento(int IdEvento)
        {
            return FabricaLogica.getLogicaEvento().BuscarEvento(IdEvento);
        }
         Categoria IServicioEvento.BuscarCategoria(string NombreCategoria)
        {
            return FabricaLogica.getLogicaEvento().BuscarCategoria(NombreCategoria);
        }
         List<Categoria> IServicioEvento.ListarCategorias()
        {
            return FabricaLogica.getLogicaEvento().ListarCategorias();
        }
        List<Evento> IServicioEvento.ListarEventosOrdenFecha()
        {
            return FabricaLogica.getLogicaEvento().ListarEventosOrdenFecha();
        }
         List<Evento> IServicioEvento.ListarEventosOrganizador(string CiOrganizador)
        {
            return FabricaLogica.getLogicaEvento().ListarEventosOrganizador(CiOrganizador);
        }       
        List<Evento> IServicioEvento.ListarEventosReservados()
        {
            return FabricaLogica.getLogicaEvento().ListarEventosReservados();
        }
         List<Evento> IServicioEvento.ListarEventosxArea(int IdArea)
        {
            return FabricaLogica.getLogicaEvento().ListarEventosxArea(IdArea);
        }

        #endregion

    }
}
