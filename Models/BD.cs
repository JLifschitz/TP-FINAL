namespace TPFINAL.Models;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using Dapper;
public static class BD
{
    private static string _connectionString = @"Server=.; DataBase=TPFINAL; Trusted_Connection=True;";
    public static Usuario user;
    public static Usuario Login(string nombre, string contraseña)
    {
        Usuario devolver = null;
        string sql = "Log_in";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.QueryFirstOrDefault<Usuario>(sql, new{pname = nombre, pcon = contraseña}, commandType: CommandType.StoredProcedure);
        }   
        return devolver;
    }

    public static void Registrarse(Usuario user)
    {
        string sql = "Registrarse";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new{use = user.nombre, con = user.contraseña, mail = user.mail, admin = user.admin}, commandType: CommandType.StoredProcedure);
        }
    }

    public static Usuario BuscarUsuario(int usuarioId)
    {
        Usuario devolver = null;
        string sql = "BuscarUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.QueryFirstOrDefault<Usuario>(sql, new{id = usuarioId}, commandType: CommandType.StoredProcedure);
        }   
        return devolver;
    }

    public static List<Artista> CargarArtistas(string buscar)
    {
        List<Artista> devolver = null;
        string sql = "CargarArtistas";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.Query<Artista>(sql, new{buscar = buscar}, commandType: CommandType.StoredProcedure).ToList();
        }
        return devolver;
    }

    public static int SeguirArtista(int artistaId, int usuarioId)
    {
        int devolver;
        string sql = "SeguirArtista";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.QueryFirstOrDefault<int>(sql, new{art = artistaId, user = usuarioId}, commandType: CommandType.StoredProcedure);
        }
        return devolver;
    }

    public static List<Artista> CargarSeguidos(int usuarioId)
    {
        List<Artista> devolver = null;
        string sql = "CargarSeguidos";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.Query<Artista>(sql, new{id = usuarioId}, commandType: CommandType.StoredProcedure).ToList();
        }
        return devolver;
    }

    public static int Gusta(int artistaId, int userId, bool gusta)
    {
        int devolver; 
        string sql = "Gusta";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
           devolver = db.Execute(sql, new{art = artistaId, user = userId, gusta = gusta}, commandType: CommandType.StoredProcedure);
        }
        return devolver;
    }

    public static List<Cancion> CargarCanciones(int artistaId)
    {
        List<Cancion> devolver = null;
        string sql = "CargarCanciones";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.Query<Cancion>(sql, new{art = artistaId}, commandType: CommandType.StoredProcedure).ToList();
        }
        return devolver;
    }

    public static List<Comentario> CargarComentarios(int artistaId)
    {
        List<Comentario> devolver = null;
        string sql = "CargarComentarios";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.Query<Comentario>(sql, new{art = artistaId}, commandType: CommandType.StoredProcedure).ToList();
        }
        return devolver;
    }

    public static Comentario  AñadirComentario(int artistaId, int usuarioId, string contenido)
    {
        Comentario devolver = null;
        string sql = "AñadirComentario";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.QueryFirstOrDefault<Comentario>(sql, new{art = artistaId, userId=usuarioId, cont=contenido}, commandType: CommandType.StoredProcedure);
        }
        return devolver;
    }
    public static void  AñadirArtista(string nombre, string descripcion, string genero, string foto)
    {
        string sql = "AñadirArtista";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new{nom=nombre, descrip=descripcion, gen=genero, foto=foto}, commandType: CommandType.StoredProcedure);
        }
    }
    public static void  AñadirCancion(int artistaId, string nombre, DateTime fecha)
    {
        string sql = "AñadirArtista";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new{id=artistaId, nom=nombre, fecha=fecha}, commandType: CommandType.StoredProcedure);
        }
    }
}