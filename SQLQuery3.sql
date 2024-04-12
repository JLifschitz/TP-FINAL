USE [TPFINAL]
GO
/****** Object:  StoredProcedure [dbo].[AñadirComentario]    Script Date: 12/4/2024 11:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AñadirComentario]
	@art int,
	@userId int,
	@cont nchar(150)
AS
BEGIN
	Insert into Comentario(artistaId, usuarioId, contenido) Values (@art, @userId, @cont)
	Select C.*, U.nombre From Comentario as C inner join Usuario as U on C.usuarioId = U.usuarioId where C.comentarioId = @@IDENTITY;
END
