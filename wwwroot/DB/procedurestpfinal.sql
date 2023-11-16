CREATE PROCEDURE Log_in
	@pname varchar(999),
	@pcon varchar(999)
AS
BEGIN
	Select * From Usuario Where nombre = @pname and Contraseña = @pcon;
END
GO

CREATE PROCEDURE Registrarse
	@use varchar(999),
	@con varchar(999),
	@mail varchar(999)
AS
BEGIN
	Insert into Usuario(nombre, contraseña, gmail) Values (@use, @con, @mail)
END
GO

alter PROCEDURE CargarArtistas
AS
BEGIN
Select * From Artista
END
GO

CREATE PROCEDURE SeguirArtista
	@art int,
	@user int
AS
BEGIN
	Insert into ArtistaxUsuario(artistaId, usuarioId) Values (@art, @user)
END
GO

--dejar de seguir a un artista // 
CREATE PROCEDURE DejarSeguirArtista
	@art int,
	@user int
AS
BEGIN
	Delete from ArtistaxUsuario Where artistaId = @art and usuarioId = @user
END
GO

alter PROCEDURE Gusta
	@art int
AS
BEGIN
	update Artista set gusta=gusta+1 where Artista.artistaId=@art
END
GO

alter PROCEDURE NoGusta
	@art int
AS
BEGIN
	update Artista set noGusta=noGusta+1 where Artista.artistaId=@art
END
GO

CREATE PROCEDURE CargarCanciones
	@art int
AS
BEGIN
	Select * From Cancion where artistaId = @art
END
GO

CREATE PROCEDURE CargarComentarios
AS
BEGIN
Select * From Comentario
END
GO

CREATE PROCEDURE AñadirComentario
	@art int,
	@userId int,
	@cont nchar(150)
AS
BEGIN
	Insert into Comentario(artistaId, usuarioId, contenido) Values (@art, @userId, @cont)
END
GO
