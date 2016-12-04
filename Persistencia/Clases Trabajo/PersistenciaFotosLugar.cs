using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using MySql.Data.MySqlClient;
using System.Data;
using Persistencia.Interfaces;

namespace Persistencia.Clases_Trabajo
{
    internal class PersistenciaFotosLugar : IPersistenciaFotosLugar
    {

        private static PersistenciaFotosLugar _instancia = null;
        private PersistenciaFotosLugar() { }
        public static PersistenciaFotosLugar getInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaFotosLugar();
            return _instancia;
        }

        public void AltaFotoLugar(FotosLugar F, Lugar L)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand comando = new MySqlCommand("AltaFotosLugar", con);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("pNombreFoto", F.NombreFoto);
            comando.Parameters.AddWithValue("pFoto", F.Imagen);
            comando.Parameters.AddWithValue("pNombreLugar", L.Nombre);
            comando.Parameters.AddWithValue("pExtension", F.Extension);

            try
            {
                con.Open();
                comando.ExecuteNonQuery();

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

        public void AgregarFotosLugar(Lugar L)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            MySqlCommand comando = new MySqlCommand("ListarFotosLugar", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("pNombreLugar", L.Nombre);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();

                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        FotosLugar foto = new FotosLugar((string)lector["NombreFoto"], (byte[])lector["Foto"],(string)lector["Extension"]);
                        L.AgregarFoto(foto);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problema con la base de datos: " + ex.Message);
            }
            finally
            {
                conexion.Close();
               
            }
        }

        public void BajaFotoLugar(FotosLugar F, Lugar L)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand comando = new MySqlCommand("BajaFotosLugar", con);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("pNombreFoto", F.NombreFoto);
            comando.Parameters.AddWithValue("pNombreLugar", L.Nombre);

            try
            {
                con.Open();
                comando.ExecuteNonQuery();

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

    }
}
