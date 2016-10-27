using EntidadesCompartidas;
using Logica.Interfaces;
using Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.ClasesTrabajo
{
    internal class LogicaUsuario:ILogicaUsuario
    {
        #region Singleton
        private static LogicaUsuario _instancia = null;
        private LogicaUsuario() { }
        public static LogicaUsuario getInstancia()
        {
            if (_instancia == null)
                _instancia = new LogicaUsuario();

            return _instancia;
        }
        #endregion

        #region Operaciones

        public void Alta(Usuario U)
        {
            if (U is Admin)
            {
                FabricaPersistencia.getPersistenciaAdmin().Alta((Admin)U);
            }
            else if(U is Cliente)
            {
                FabricaPersistencia.getPersistenciaCliente().Alta((Cliente)U);
            }
            else if (U is Dueño)
            {
                FabricaPersistencia.getPersistenciaDueño().Alta((Dueño)U);
            }
            else
            {
                FabricaPersistencia.getPersistenciaOrganizador().Alta((Organizador)U);
            }

        }

        public void Modificar(Usuario U)
        {
            if (U is Admin)
            {
                FabricaPersistencia.getPersistenciaAdmin().Modificar((Admin)U);
            }
            else if (U is Cliente)
            {
                FabricaPersistencia.getPersistenciaCliente().Modificar((Cliente)U);
            }
            else if (U is Dueño)
            {
                FabricaPersistencia.getPersistenciaDueño().Modificar((Dueño)U);
            }
            else
            {
                FabricaPersistencia.getPersistenciaOrganizador().Modificar((Organizador)U);
            }
        }

        public void Eliminar(Usuario U)
        {
            if (U is Admin)
            {
                FabricaPersistencia.getPersistenciaAdmin().Baja((Admin)U);
            }
            else if (U is Cliente)
            {
                FabricaPersistencia.getPersistenciaCliente().Baja((Cliente)U);
            }
            else if (U is Dueño)
            {
                FabricaPersistencia.getPersistenciaDueño().Baja((Dueño)U);
            }
            else
            {
                FabricaPersistencia.getPersistenciaOrganizador().Baja((Organizador)U);
            }
        }

        public Usuario Buscar(string pDoc)
        {
            Usuario U = null;

            U = FabricaPersistencia.getPersistenciaCliente().Buscar(pDoc);

            if(U == null)
            {
                U = FabricaPersistencia.getPersistenciaAdmin().Buscar(pDoc);
            }
            else if(U == null)
            {
                U = FabricaPersistencia.getPersistenciaDueño().Buscar(pDoc);
            }
            else if (U == null)
            {
                U = FabricaPersistencia.getPersistenciaOrganizador().Buscar(pDoc);
            }

            return U;
        }


        public Usuario Login(String nomUsu, String pass)
        {
            Usuario U = null;

            U = FabricaPersistencia.getPersistenciaCliente().Logueo(nomUsu,pass);

            if (U == null)
            {
                U = FabricaPersistencia.getPersistenciaAdmin().Logueo(nomUsu, pass);
            }
            else if (U == null)
            {
                U = FabricaPersistencia.getPersistenciaDueño().Logueo(nomUsu, pass);
            }
            else if (U == null)
            {
                U = FabricaPersistencia.getPersistenciaOrganizador().Logueo(nomUsu, pass);
            }

            return U;
        }

        public List<Admin> ListarAdmin()
        {
            return FabricaPersistencia.getPersistenciaAdmin().ListarAdmin();
        }

        public List<Dueño> ListarDueños()
        {
            return FabricaPersistencia.getPersistenciaDueño().ListarDueños();
        }
        
        public List<Organizador> ListarOrganizadores()
        {
            return FabricaPersistencia.getPersistenciaOrganizador().ListarOrganizadores();
        }

        public List<Cliente> ListarClientes()
        {
            return FabricaPersistencia.getPersistenciaCliente().ListarClientes();
        }

        #endregion
    }
}
