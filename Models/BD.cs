namespace TP-FINAL.Models;
using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
public static class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=TPFINAL; Trusted_Connection=True;";
    
    public static List<Artista> Artistas()
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