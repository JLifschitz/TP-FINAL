using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TPFINAL.Models;

namespace TPFINAL.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Login(string nombre, string contraseña)
    {
        if (BD.Login(nombre, contraseña) == null)
        {
            return View("Login");
        }
        else
        {
            ViewBag.user = BD.Login(nombre, contraseña);
            return RedirectToAction("Artistas");
        }
    }

    [HttpPost] public IActionResult Registro(Usuario user)
    {
        if(user != null)
        {
            BD.Registrarse(user);
            return RedirectToAction("Index");
        }
        else{return View("Registro",user);}
    }

    public IActionResult Artistas()
    {
        ViewBag.Artistas = BD.CargarArtistas();
        return View();
    }

    public IActionResult DetallesArtista(int artistaId)
    {
        ViewBag.artistaId = artistaId;
        ViewBag.Canciones = BD.CargarCanciones(artistaId);
        ViewBag.Comentarios = BD.CargarComentarios(artistaId);
        return View();
    }

    public int SeguirArtista(int artistaId, int usuarioId)
    {
        return BD.SeguirArtista(artistaId, usuarioId);
    }

    public int Gusta(int artistaId)
    {
        BD.Gusta(artistaId);
        return artistaId;
    }

    public int NoGusta(int artistaId)
    {
        BD.NoGusta(artistaId);
        return artistaId;
    }

    public Comentario AñadirComentario(int artistaId, int usuarioId, string contenido)
    {
        return BD.AñadirComentario(artistaId, usuarioId, contenido);
    }

    public Usuario BuscarUsuario(int usuarioId)
    {
        return BD.BuscarUsuario(usuarioId);
    }

    public IActionResult Perfil()
    {
        return View();
    }

    public IActionResult Creditos()
    {
        return View();
    }    
}
