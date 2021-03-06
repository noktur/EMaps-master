﻿using EntidadesCompartidas;
using MySql.Data.MySqlClient;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Persistencia
{
    internal class PersistenciaFeedbackEvento:IPersistenciaFeedbackEvento
    {
           #region Singleton

        private static PersistenciaFeedbackEvento _instancia = null;

        private PersistenciaFeedbackEvento() { }

        public static PersistenciaFeedbackEvento GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaFeedbackEvento();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public void AltaMensajeFeebackEvento(FeedbackEvento e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaMensajeFeedbackEvento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombreFeedback", e.NombreFeedback);
            cmd.Parameters.AddWithValue("pCiUsuario", e.UsuarioFeedback.CI);
            cmd.Parameters.AddWithValue("pFechaRealizado", e.FechaRealizado);
            cmd.Parameters.AddWithValue("pMensaje", e.Mensaje);
            cmd.Parameters.AddWithValue("pIdEvento", e.EventoFeedback.IdEvento);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problema con la base de datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public void ModificarMensajeFeebackEvento(FeedbackEvento e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarMensajeFeedbackEvento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdFeedback", e.IdFeedbackEvento);
            cmd.Parameters.AddWithValue("pNombreFeedback", e.NombreFeedback);
            cmd.Parameters.AddWithValue("pCiUsuario", e.UsuarioFeedback.CI);
            cmd.Parameters.AddWithValue("pMensaje", e.Mensaje);
            cmd.Parameters.AddWithValue("pFechaRealizado", e.FechaRealizado);
            cmd.Parameters.AddWithValue("pIdEvento", e.EventoFeedback.IdEvento);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problema con la base de datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public void BajaMensajeFeedbackEvento(FeedbackEvento e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarMensajeFeedbackEvento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdFeedback", e.IdFeedbackEvento);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Error con la Base de Datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public FeedbackEvento BuscarMensajeFeedbackEvento(int IdFeedback)
        {
            FeedbackEvento UnFeedbackEvento = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarMensajeFeebackEvento", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            cmd.Parameters.AddWithValue("pIdFeedback", IdFeedback);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    


                    oReader.Read();

                    Usuario unUsuario=null;

                    unUsuario=Persistencia.Clases_Trabajo.PersistenciaAdmin.GetInstancia().Buscar((string)oReader["CiUsuario"]);

                    if(unUsuario == null)
                    {
                        unUsuario=Persistencia.Clases_Trabajo.PersistenciaCliente.GetInstancia().Buscar((string)oReader["CiUsuario"]);
                    }
                    else if(unUsuario == null)
                    {
                         unUsuario=Persistencia.Clases_Trabajo.PersistenciaOrganizador.GetInstancia().Buscar((string)oReader["CiUsuario"]);
                    }
                    else if(unUsuario == null)
                    {
                         unUsuario=Persistencia.Clases_Trabajo.PersistenciaDueño.GetInstancia().Buscar((string)oReader["CiUsuario"]);
                    }


                    UnFeedbackEvento = new FeedbackEvento(IdFeedback, Convert.ToString(oReader["NombreFeedback"]),Convert.ToString(oReader["MensajeFeedback"]), unUsuario, Convert.ToDateTime(oReader["FechaRealizado"]), Persistencia.Clases_Trabajo.PersistenciaEvento.GetInstancia().BuscarEvento((int)oReader["IdEvento"]));
                }

                oReader.Close();
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error con la base de datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return UnFeedbackEvento;
        }

        public List<FeedbackEvento> ListarMensajesFeedbackEvento()
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            FeedbackEvento UnFeedbackEvento = null;
            List<FeedbackEvento> listaFeedbackEvento = new List<FeedbackEvento>();

            MySqlCommand comando = new MySqlCommand("ListarMensajesFeedbackEvento", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {

                        Usuario unUsuario = null;

                        unUsuario = Persistencia.Clases_Trabajo.PersistenciaAdmin.GetInstancia().Buscar((string)lector["CiUsuario"]);

                        if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaCliente.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaOrganizador.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaDueño.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }

                        UnFeedbackEvento = new FeedbackEvento(Convert.ToInt32(lector["IdFeedback"]), Convert.ToString(lector["NombreFeedback"]),Convert.ToString(lector["MensajeFeedback"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), Persistencia.Clases_Trabajo.PersistenciaEvento.GetInstancia().BuscarEvento((int)lector["IdEvento"]));
                        listaFeedbackEvento.Add(UnFeedbackEvento);
                    }
                }
                lector.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conexion.Close();
            }
            return listaFeedbackEvento;
        }

        public List<FeedbackEvento> ListarMensajesFeedbackEventoxUsuario(string CiUsuario)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            FeedbackEvento UnFeedbackEvento = null;
            List<FeedbackEvento> listaFeedbackEvento = new List<FeedbackEvento>();

            MySqlCommand comando = new MySqlCommand("ListarMensajesFeedbackEventoxUsuario", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pCiUsuario", CiUsuario);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {

                        Usuario unUsuario = null;

                        unUsuario = Persistencia.Clases_Trabajo.PersistenciaAdmin.GetInstancia().Buscar(CiUsuario);

                        if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaCliente.GetInstancia().Buscar(CiUsuario);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaOrganizador.GetInstancia().Buscar(CiUsuario);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaDueño.GetInstancia().Buscar(CiUsuario);
                        }

                        UnFeedbackEvento = new FeedbackEvento(Convert.ToInt32(lector["IdFeedback"]), Convert.ToString(lector["NombreFeedback"]),Convert.ToString(lector["MensajeFeedback"]) ,unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), Persistencia.Clases_Trabajo.PersistenciaEvento.GetInstancia().BuscarEvento((int)lector["IdEvento"]));
                        listaFeedbackEvento.Add(UnFeedbackEvento);
                    }
                }
                lector.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conexion.Close();
            }
            return listaFeedbackEvento;
        }

        public List<FeedbackEvento> ListarMensajesFeedbackPorEvento(int IdEvento)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            FeedbackEvento UnFeedbackEvento = null;
            List<FeedbackEvento> listaFeedbackEvento = new List<FeedbackEvento>();

            MySqlCommand comando = new MySqlCommand("ListarMensajesFeedbackPorEvento", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pIdEvento", IdEvento);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {

                        Usuario unUsuario = null;

                        unUsuario = Persistencia.Clases_Trabajo.PersistenciaAdmin.GetInstancia().Buscar((string)lector["CiUsuario"]);

                        if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaCliente.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaOrganizador.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaDueño.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }

                        UnFeedbackEvento = new FeedbackEvento(Convert.ToInt32(lector["IdFeedback"]), Convert.ToString(lector["NombreFeedback"]),Convert.ToString(lector["MensajeFeedback"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), Persistencia.Clases_Trabajo.PersistenciaEvento.GetInstancia().BuscarEvento(IdEvento));
                        listaFeedbackEvento.Add(UnFeedbackEvento);
                    }
                }
                lector.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conexion.Close();
            }
            return listaFeedbackEvento;
        }

        public List<FeedbackEvento> ListarMensajesFeedbackPorEventoYUsuario(int IdEvento,string CiUsuario)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            FeedbackEvento UnFeedbackEvento = null;
            List<FeedbackEvento> listaFeedbackEvento = new List<FeedbackEvento>();

            MySqlCommand comando = new MySqlCommand("ListarMensajesPorEventoYUsuario", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pIdEvento", IdEvento);
            comando.Parameters.AddWithValue("pCiUsuario", CiUsuario);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {

                        Usuario unUsuario = null;

                        unUsuario = Persistencia.Clases_Trabajo.PersistenciaAdmin.GetInstancia().Buscar(CiUsuario);

                        if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaCliente.GetInstancia().Buscar(CiUsuario);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaOrganizador.GetInstancia().Buscar(CiUsuario);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaDueño.GetInstancia().Buscar(CiUsuario);
                        }

                        UnFeedbackEvento = new FeedbackEvento(Convert.ToInt32(lector["IdFeedback"]), Convert.ToString(lector["NombreFeedback"]), Convert.ToString(lector["MensajeFeedback"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), Persistencia.Clases_Trabajo.PersistenciaEvento.GetInstancia().BuscarEvento(IdEvento));
                        listaFeedbackEvento.Add(UnFeedbackEvento);
                    }
                }
                lector.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conexion.Close();
            }
            return listaFeedbackEvento;
        }



        #endregion
    }
}
