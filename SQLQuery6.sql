USE [TPFINAL]
GO
/****** Object:  StoredProcedure [dbo].[AgregarCancion]   */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[A�adirCancion]
	@id int,
	@nom varchar(50),
	@fecha date
AS
BEGIN
	Insert into Cancion(cancionId, nombre, fechaestreno) Values (@id, @nom, @fecha)
END
