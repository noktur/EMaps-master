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

        Lugar IServicioEvento.BuscarLugarxId(int IdLugar, string NombreCiudad, string NombrePais)
        {
            Lugar _Lugar = null;

            _Lugar = FabricaLogica.getLogicaLugar().BuscarLugarxId(IdLugar,NombreCiudad,NombrePais);

            return _Lugar;
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

        #region Ubicacion

        void IServicioEvento.AltaUbicacion(Ubicacion U)
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

        void IServicioEvento.ModificarUbicacion(Ubicacion U)
        {
            FabricaLogica.getLogicaUbicacion().Modificar(U);
        }

        void IServicioEvento.EliminarUbicacion(Ubicacion U)
        {
            FabricaLogica.getLogicaUbicacion().Eliminar(U);
        }

        Pais IServicioEvento.BuscarPais(string pNombre)
        {
            Pais _Pais = null;

            _Pais = FabricaLogica.getLogicaUbicacion().BuscarPais(pNombre);

            return _Pais;
        }

        Ciudad IServicioEvento.BuscarCiudad(string pNombrePais, Pais UnPais)
        {
            Ciudad _Ciudad = null;

            _Ciudad = FabricaLogica.getLogicaUbicacion().BuscarCiudad(pNombrePais,UnPais);

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

    }
}
