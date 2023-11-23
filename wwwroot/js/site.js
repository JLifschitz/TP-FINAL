function Buscarnombre(usuarioId)
{
    $.ajax
    (
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/BuscarUsuario',
            data: {usuarioId: usuarioId},
            success:
            function(response)
            {
                return response.nombre
            },
            error:
            function(xhr, status)
            {
                alert('Ocurrio un problema');
            }
        }
    );
}

function SeguirArtista(artistaId, usuarioId)
{
    $.ajax
    (
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/SeguirArtista',
            data: {artistaId: artistaId, usuarioId: usuarioId},
            success:
                function(response)
                {
                    if (response == 1){$("#boton").html("Dejar de Seguir");}
                    else{$("#boton").html("Seguir");}
                },
            error:
                function(xhr, status)
                {
                    alert('Ocurrio un problema');
                }
        }
    );
}

function Gusta(artistaId)
{
    $.ajax
    (
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/Gusta',
            data: {artistaId: artistaId},
            success:
                function(response)
                {
                    $("#gusta").html(+ 1);
                },
            error:
                function(xhr, status)
                {
                    alert('Ocurrio un problema');
                }
        }
    );
}

function NoGusta(artistaId)
{
    $.ajax
    (
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/NoGusta',
            data: {artistaId: artistaId},
            success:
                function(response)
                {
                    $("#nogusta").html(+ 1);
                },
            error:
                function(xhr, status)
                {
                    alert('Ocurrio un problema');
                }
        }
    );
}

function ValidarComentario()
{
    let leng = document.getElementById("cont").length;
    if(leng > 0)
    {
        function AñadirComentario(artistaId, usuarioId, contenido)
        {
            $.ajax
            (
                {
                    type: 'POST',
                    dataType: 'JSON',
                    url: '/Home/AñadirComentario',
                    data: {artistaId: artistaId, usuarioId: usuarioId, contenido: contenido},
                    success:
                        function(response)
                        {
                            $("#name").html(Buscarnombre(response.usuarioId));
                            $("#cont").html(response.contenido);
                            $("#nuevo").style.display = "block";
                        },
                    error:
                        function(xhr, status)
                        {
                            alert('Ocurrio un problema');
                        }
                }
            );
        }
    }
    else{alert('no se puede añadir un comentario vacio')}
}

function ValidarContraseña()
{  
    let leng = false;
    let spec = false;
    let upp = false;
    let password = document.getElementById("c1")
    var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;

    //Checking length
    if(password.value.length >= 8){leng = true;}

    //Checking for special characters
    for (let i = 0; i < password.value.length; i++)
    {
        const element = password.value[i];
        if(format.test(element)){spec = true;}
    }

    //Checking for an uppercase
    for (let i = 0; i < password.value.length; i++) {
        const element = password.value[i];
        let txt = element;
        if (element === txt.toUpperCase()) {upp = true;}
    }

    //Validate all 3
    if(!leng)
    {
        PasswordAlert.textContent = "La contraseña debe tener al menos 8 caracteres.";
    }
    if(!spec)
    {
        PasswordAlert.textContent = "La contraseña debe tener al menos 1 caracter especial.";
    }
    if(!upp)
    {
        PasswordAlert.textContent = "La contraseña debe tener al menos 1 letra mayuscula.";
    }
    if(spec && leng && upp){PasswordAlert.textContent = "";}
}