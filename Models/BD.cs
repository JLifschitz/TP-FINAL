namespace TP-FINAL.Models;
using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
public static class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=TPFINAL; Trusted_Connection=True;";
    
    public static Usuario Login(string nombre, string contraseña)
    {
        Usuario devolver = null;
        string sql = "Select * From Usuario Where nombre = @pname and Contraseña = @pcon";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.QueryFirstOrDefault<Usuario>(sql, new{pname = nombre, pcon = contraseña});
        }
        return devolver;
    }

    public static void Registrarse(Usuario user)
    {
        string sql = "Insert into Usuario(nombre, contraseña, mail) Values (@use, @con, @mail)";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new{use = user.nombre, con = user.contraseña, mail = user.gmail});
        }
    }

    public static void SeguirArtista(int artistaId, int usuarioId)
    {
        string sql = "Insert into ArtistaxUsuario(artistaId, usuarioId) Values (@art, @user)";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new{art = artistaId, user = usuarioId});
        }
    }

    public static void DejarSeguirArtista(int artistaId, int usuarioId)
    {
        string sql = "Delete from ArtistaxUsuario Where artistaId = @art, usuarioId = @user";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new{art = artistaId, user = usuarioId});
        }
    }
    
    public static List<Artista> CargarArtistas()
    {
        List<Artista> devolver = null;
        string sql = "Select * From Artista";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.Query<Artista>(sql).ToList();
        }
        return devolver;
    }
}