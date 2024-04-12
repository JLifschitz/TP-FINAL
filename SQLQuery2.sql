USE [TPFINAL]
GO
/****** Object:  StoredProcedure [dbo].[AgregarArtista]   */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AñadirArtista]
	@id int,
	@nom varchar(50),
	@descrip varchar(50),
	@gen varchar(50),
	@foto varchar(50)
AS
BEGIN
	Insert into Artista(artistaId, nombre, descripcion, genero, foto) Values (@id, @nom, @descrip, @gen,@foto)
END
