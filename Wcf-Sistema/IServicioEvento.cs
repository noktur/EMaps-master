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
        Lugar BuscarLugarxId(int IdLugar, string NombreCiudad, string NombrePais);

        [OperationContract]
        void BajaLugar(Lugar l);

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

        #region Ubicacion

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



    }
}
