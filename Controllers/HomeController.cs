using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP-FINAL.Models;

namespace TP-FINAL.Controllers;

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
        if(BD.BuscarUsuario(user.nombre) != "")
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
        return view();
    }

    public IActionResult SeguirArtista(int artistaId, int usuarioId)
    {
        BD.SeguirArtista(artistaId, usuarioId);
    }

    public IActionResult DejarSeguirArtista(int artistaId, int usuarioId)
    {
        BD.DejarSeguirArtista(artistaId, usuarioId);
    }

    public IActionResult Gusta(int artistaId)
    {
        BD.Gusta(artistaId);
    }

    public IActionResult NoGusta(int artistaId)
    {
        BD.NoGusta(artistaId);
    }

    public IActionResult AñadirComentario(int artistaId, int usuarioId, string contenido)
    {
        BD.AñadirComentario(artistaId, usuarioId, contenido);
    }

    public IActionResult Perfil()
    {
        return view();
    }

    public IActionResult Creditos()
    {
        return View();
    }    
}
