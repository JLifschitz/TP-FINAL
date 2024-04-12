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
                console.log(response.nombre)
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
                    console.log(response);
                    if (response == 1){$("#seguir").html("Dejar de Seguir");}
                    if (response == 0){$("#seguir").html("Seguir");}
                    else{}
                },
            error:
                function(xhr, status)
                {
                    alert('Ocurrio un problema');
                }
        }
    );
}

function Gusta(artistaId, usuarioId)
{
    $.ajax
    (
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/Gusta',
            data: {artistaId: artistaId, usuarioId: usuarioId},
            success:
                function(response)
                {
                    if (response == 1)
                    {
                        let cant = parseInt($("#gusta_" + artistaId).html())+1;
                        console.log(cant);
                        $("#gusta_" + artistaId).html(cant);
                    }
                    if (response == 0){return false}
                },
            error:
                function(xhr, status)
                {
                    alert('Ocurrio un problema');
                }
        }
    );
}

function NoGusta(artistaId, usuarioId)
{
    $.ajax
    (
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/NoGusta',
            data: {artistaId: artistaId, usuarioId: usuarioId},
            success:
                function(response)
                {
                    if (response == 1)
                    {
                        let cant = parseInt($("#nogusta_" + artistaId).html())+1;
                        $("#nogusta_" + artistaId).html(cant);
                    }
                    if (response == 0){return false}
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
    let contenido = document.getElementById("cont").value;
    let leng = contenido.length;
    if(leng > 0)
    {
        AñadirComentario(artistaId, usuarioId, contenido);
    }
    else{alert('no se puede añadir un comentario vacio')}
}

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
                    $("#name").html(response.nombre + ": ");
                    $("#contenido").html(" " + response.contenido);
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

