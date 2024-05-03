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
        ViewBag.mostrarNav = false;
        return View();
    }

    public IActionResult Login(string nombre, string contraseña)
    {
        ViewBag.mostrarNav = false;
        if (BD.Login(nombre, contraseña) == null)
        {
            return View("Login");
        }
        else
        {
            BD.user = BD.Login(nombre, contraseña);
            return RedirectToAction("VerArtistas", new {buscar = "", admin = BD.user.admin});
        }
    }

    public IActionResult Registrarse()
    {
        ViewBag.mostrarNav = false;
        return View("Registro");
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

    public IActionResult VerArtistas(string buscar, bool admin)
    {
        ViewBag.admin = admin;
        ViewBag.user = BD.user;
        ViewBag.Artistas = BD.CargarArtistas(buscar);
        return View();
    }

    public IActionResult AgregarArtista()
    {
        return View();
    }
    public IActionResult AñadirArtista(string nombre, string descripcion, string genero, string foto)
    {
        BD.AñadirArtista(nombre, descripcion, genero, foto);
        return RedirectToAction("VerArtistas", new {buscar = "", admin = BD.user.admin});
    }

    public IActionResult AgregarCancion(int artistaId)
    {
        ViewBag.artista = BD.BuscarArtista(artistaId);
        return View();
    }
    public IActionResult AñadirCancion(string nombre, DateTime fecha, int artistaId)
    {
        BD.AñadirCancion(artistaId, nombre, fecha);
        return RedirectToAction("DetallesArtista", new {artistaId = artistaId});
    }

    public IActionResult DetallesArtista(int artistaId)
    {
        ViewBag.user = BD.user;
        ViewBag.admin = BD.user.admin;
        ViewBag.artista = BD.BuscarArtista(artistaId);
        ViewBag.Canciones = BD.CargarCanciones(artistaId);
        ViewBag.Comentarios = BD.CargarComentarios(artistaId);
        return View();
    }

    public int SeguirArtista(int artistaId, int usuarioId)
    {
        return BD.SeguirArtista(artistaId, usuarioId);
    }

    public int Gusta(int artistaId, int usuarioId)
    {
        return (BD.Gusta(artistaId, usuarioId, true));
    }

    public int NoGusta(int artistaId, int usuarioId)
    {
        return (BD.Gusta(artistaId, usuarioId, false));
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
        ViewBag.seguidos = BD.CargarSeguidos(BD.user.usuarioId);
        return View();
    }

    public IActionResult Creditos()
    {
        return View();
    }    
}
