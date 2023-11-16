function SeguirArtista(id)
{
    $.ajax
    (
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/SeguirArtista',
            data: {artistaId: id},
            success:
                function(response)
                {
                    if (response){$("#boton").html("Dejar de Seguir");}
                    else{$("#boton").html("Seguir");}
                }
        }
    );
}