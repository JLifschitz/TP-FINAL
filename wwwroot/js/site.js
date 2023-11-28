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
                    let cant = parseInt($("#gusta_" + response).html())+1;
                    console.log(cant);
                    $("#gusta_" + response).html(cant);
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
                    let cant = parseInt($("#nogusta_" + response).html())+1;
                    $("#nogusta_" + response).html(cant);
                },
            error:
                function(xhr, status)
                {
                    alert('Ocurrio un problema');
                }
        }
    );
}

function ValidarComentario(artistaId, usuarioId)
{
    let contenido = document.getElementById("#cont").html;
    let leng = document.getElementById("#cont").html.length;
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
                            $("#contenido").html(response.contenido);
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
    let upp = false;
    let password = document.getElementById("password")

    if(password.value.length >= 6){leng = true;}

    //Checking for an uppercase
    for (let i = 0; i < password.value.length; i++)
    {
        const element = password.value[i];
        let txt = element;
        if (element === txt.toUpperCase()) {upp = true;}
    }

    //Validate all 3
    if(!leng)
    {
        PasswordAlert.textContent = "La contraseña debe tener al menos 6 caracteres.";
    }
    if(!upp)
    {
        PasswordAlert.textContent = "La contraseña debe tener al menos 1 letra mayuscula.";
    }
    if(spec && leng && upp){PasswordAlert.textContent = "";}
}