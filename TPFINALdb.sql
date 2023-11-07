USE [master]
GO
/****** Object:  Database [TPFINAL]    Script Date: 31/10/2023 12:09:40 ******/
CREATE DATABASE [TPFINAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TPFINAL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TPFINAL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TPFINAL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TPFINAL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TPFINAL] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TPFINAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TPFINAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TPFINAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TPFINAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TPFINAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TPFINAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [TPFINAL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TPFINAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TPFINAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TPFINAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TPFINAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TPFINAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TPFINAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TPFINAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TPFINAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TPFINAL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TPFINAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TPFINAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TPFINAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TPFINAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TPFINAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TPFINAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TPFINAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TPFINAL] SET RECOVERY FULL 
GO
ALTER DATABASE [TPFINAL] SET  MULTI_USER 
GO
ALTER DATABASE [TPFINAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TPFINAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TPFINAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TPFINAL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TPFINAL] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TPFINAL', N'ON'
GO
ALTER DATABASE [TPFINAL] SET QUERY_STORE = OFF
GO
USE [TPFINAL]
GO
/****** Object:  User [alumno]    Script Date: 31/10/2023 12:09:40 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Artistaa]    Script Date: 31/10/2023 12:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artistaa](
	[artistaId] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](99) NOT NULL,
	[genero] [nchar](99) NOT NULL,
	[gusta] [bit] NOT NULL,
	[noGusta] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistaXUsuario]    Script Date: 31/10/2023 12:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistaXUsuario](
	[usuarioId] [int] NOT NULL,
	[ArtistaId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cancion]    Script Date: 31/10/2023 12:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancion](
	[cancionId] [int] NOT NULL,
	[artistaId] [int] NOT NULL,
	[nombre] [nchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 31/10/2023 12:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[comentarioId] [int] NOT NULL,
	[artistaId] [int] NOT NULL,
	[usuarioId] [int] NOT NULL,
	[contenido] [nchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 31/10/2023 12:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[usuarioId] [int] NOT NULL,
	[nombre] [nchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Artistaa] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta]) VALUES (1, N'Billy Joel ', N'cantante, compositor y pianista estadounidense. Ha logrado más de 40 hits desde 1973', N'rock, pop, clasica                                                                                 ', 1, 0)
INSERT [dbo].[Artistaa] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta]) VALUES (2, N'Queen', N'banda británica de rock formada en 1970', N'rock, pop                                                                                          ', 1, 0)
INSERT [dbo].[Artistaa] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta]) VALUES (3, N'Fito Paez', N'músico, compositor, pianista, director de cine y cantante argentino', N'rock, pop                                                                                          ', 1, 0)
INSERT [dbo].[Artistaa] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta]) VALUES (4, N'Charly Garcia', N'na de las figuras más importantes y vanguardistas de la música popular argentina.?', N'rock, pop                                                                                          ', 1, 0)
INSERT [dbo].[Artistaa] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta]) VALUES (5, N'no te va a gustar', N'grupo musical de Uruguay formado el 25 de junio del año 1994 en Montevideo.?', N'rock, pop                                                                                          ', 1, 0)
INSERT [dbo].[Artistaa] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta]) VALUES (6, N'imagine dragons', N'Ganó el reconocimiento mundial con el lanzamiento de su álbum de estudio debut Night Visions', N'rock, pop                                                                                          ', 1, 0)
INSERT [dbo].[Artistaa] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta]) VALUES (7, N'wos', N'cantante, músico, actor y freestyler argentino.', N'rock. hip hop, rap                                                                                 ', 1, 0)
INSERT [dbo].[Artistaa] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta]) VALUES (8, N'tini', N'actriz, cantante y compositora argentina', N'pop, regueton                                                                                      ', 1, 0)
GO
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (1, 1)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (1, 2)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (2, 3)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (2, 4)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (2, 5)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (3, 6)
GO
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (1, 1, N'"piano man"                                       ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (2, 1, N'"vienna"                                          ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (3, 1, N'"movin out"                                       ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (4, 1, N'"uptown girl"                                     ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (5, 1, N'"pressure"                                        ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (6, 2, N'"bohemian rhapsody"                               ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (7, 2, N'"killer queen"                                    ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (8, 2, N'"dont stop me now"                                ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (9, 2, N'"i want to break free"                            ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (10, 2, N'"radio gaga"                                      ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (11, 3, N'"mariposa tecnicolor"                             ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (12, 3, N'"el amor despues del amor"                        ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (13, 3, N'"fue amor"                                        ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (14, 3, N'"a rodar mi vida"                                 ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (15, 3, N'"al lado del camino"                              ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (16, 4, N'"nos siguen pegando abajo"                        ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (17, 4, N'"promesas sobre el bidet"                         ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (18, 4, N'"no voy en tren"                                  ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (19, 4, N'"demoliendo hoteles"                              ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (20, 4, N'"no me dejan salir"                               ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (21, 5, N'"venganza"                                        ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (22, 5, N'"chau"                                            ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (23, 5, N'"cero a la izquierda"                             ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (24, 5, N'"a las nueve"                                     ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (25, 5, N'"esos ojos"                                       ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (26, 5, N'"poco"                                            ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (27, 6, N'"its time"                                        ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (28, 6, N'"believer"                                        ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (29, 6, N'"demons"                                          ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (30, 6, N'"bones"                                           ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (31, 6, N'"sharks"                                          ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (32, 7, N'"arrancarmelo"                                    ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (33, 7, N'"terraza"                                         ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (34, 7, N'"okupa"                                           ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (35, 7, N'"canguro"                                         ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (36, 7, N'"alma dinamita"                                   ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (37, 8, N'"cupido"                                          ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (38, 8, N'"oye"                                             ')
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre]) VALUES (39, 8, N'"fresa"                                           ')
GO
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (1, 1, 1, N'"que geniooo"                                     ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (2, 2, 1, N'"me encanta su musica"                            ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (3, 5, 4, N'"unos capos"                                      ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (4, 8, 2, N'"nefasto"                                         ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (5, 8, 2, N'"es malisimo esto, aguante la renga"              ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (6, 4, 5, N'"el mas grande"                                   ')
GO
INSERT [dbo].[Usuario] ([usuarioId], [nombre]) VALUES (1, N'JulianLifsch                                      ')
INSERT [dbo].[Usuario] ([usuarioId], [nombre]) VALUES (2, N'LucaList                                          ')
INSERT [dbo].[Usuario] ([usuarioId], [nombre]) VALUES (3, N'JuliLav                                           ')
INSERT [dbo].[Usuario] ([usuarioId], [nombre]) VALUES (4, N'tobigran                                          ')
GO
USE [master]
GO
ALTER DATABASE [TPFINAL] SET  READ_WRITE 
GO
