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
            ViewBag.usuarioId = BD.Login(nombre, contraseña);
            return RedirectToAction("Artistas");
        }
    }

    [HttpPost] public IActionResult Registro(Usuario user)
    {
        if(BD.BuscarUsuario(user.UserName) != "")
        {
            BD.Registrarse(user);
            return RedirectToAction("Login_view");
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
        ViewBag.Canciones = BD.CargarCanciones(artistaId)
        return view();
    }

    public IActionResult Creditos()
    {
        return View();
    }    
}
