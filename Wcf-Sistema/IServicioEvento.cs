using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Wcf_Sistema
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IServicioEvento
    {

        #region Lugar

        [OperationContract]
        void AltaLugar(Lugar l);

        [OperationContract]
        void ModificarLugar(Lugar l);

        [OperationContract]
        Lugar BuscarLugar(string NombreLugar);

        [OperationContract]
        void BajaLugar(Lugar l);

        [OperationContract]
        List<Lugar> ListarLugares();

        [OperationContract]
         List<Lugar> ListarLugaresDisponibles();

        [OperationContract]
         List<Lugar> ListarLugaresCiudad(string pNombreCiudad);

        [OperationContract]
         Lugar BuscarMapaLugar(int IdMapa);


        #endregion

        #region Area

        [OperationContract]
        void AltaArea(Area a);

        [OperationContract]
        void ModificarArea(Area a);

        [OperationContract]
        Area BuscarArea(int IdArea);

        [OperationContract]
        Area BuscarAreaPorNombre(string NombreArea);

        [OperationContract]
        void AltaPuntodeArea(Area a, Punto p);

        [OperationContract]
        void BajaArea(Area a);

        [OperationContract]
        List<Area> ListarAreasDeMapa(int IdMapa);

        [OperationContract]
        List<Punto> ListarPuntosDeUnArea(Area a);

        #endregion

        #region Alquiler 

        [OperationContract]
        void AltaAlquiler(Alquiler e);

        [OperationContract]
        void BajaAlquiler(Alquiler e);

        [OperationContract]
        Alquiler BuscarAlquiler(int IdAlquiler);

        [OperationContract]
        List<Alquiler> ListarAlquileres();

        [OperationContract]
        List<Alquiler> ListarAlquileresArea(int IdArea);

        [OperationContract]
        List<Alquiler> ListarAlquileresOrganizador(string Ci);

        #endregion

        #region Mapa

        [OperationContract]
        void AltaMapa(Mapa m);

        [OperationContract]
        void ModificarMapa(Mapa m);

        [OperationContract]
        Mapa BuscarMapa(int IdMapa);

        [OperationContract]
        void BajaMapa(Mapa m);

        #endregion

        #region Ubicaciones

        [OperationContract]
        void AltaUbicacion(Ubicacion U);

        [OperationContract]
        void ModificarUbicacion(Ubicacion U);

        [OperationContract]
        void EliminarUbicacion(Ubicacion U);

        [OperationContract]
        Pais BuscarPais(string pNombre);

        [OperationContract]
        Ciudad BuscarCiudad(string pNombrePais, Pais UnPais);

        [OperationContract]
        List<Ciudad> ListarCiudades();

        [OperationContract]
        List<Pais> ListarPais();

        [OperationContract]
        List<Ciudad> ListarCiudadesPais(Pais UnPais);

        #endregion

        #region Usuarios

        [OperationContract]
        void AltaUsuario(Usuario U);

        [OperationContract]
        void ModificarUsuario(Usuario U);

        [OperationContract]
        void EliminarUsuario(Usuario U);

        [OperationContract]
        Usuario BuscarUsuario(string pDoc);

        [OperationContract]
        Usuario Login(String nomUsu, String pass);

        [OperationContract]
        List<Admin> ListarAdmin();

        [OperationContract]
        List<Dueño> ListarDueños();

        [OperationContract]
        List<Organizador> ListarOrganizadores();

        [OperationContract]
        List<Cliente> ListarClientes();

        #endregion

        #region Evento

        [OperationContract]
        void AltaEvento(Evento p);

        [OperationContract]
        void ComprobarEstadoEvento(Evento UnEvento, DateTime fecha1, DateTime fecha2);
       
        [OperationContract]
        void BajaEvento(Evento e);

        [OperationContract]
        Evento BuscarEvento(int IdEvento);

        [OperationContract]
        Categoria BuscarCategoria(string NombreCategoria);

        [OperationContract]
        List<Categoria> ListarCategorias();

        [OperationContract]
        List<Evento> ListarEventosOrdenFecha();

        [OperationContract]
        List<Evento> ListarEventosOrganizador(string CiOrganizador);

        [OperationContract]
        List<Evento> ListarEventosReservados();

        [OperationContract]
        List<Evento> ListarEventosxArea(int IdArea);

        #endregion


    }
}
