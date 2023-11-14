USE [master]
GO
/****** Object:  Database [TPFINAL]    Script Date: 7/11/2023 12:01:41 ******/
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
/****** Object:  User [alumno]    Script Date: 7/11/2023 12:01:41 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Artistaa]    Script Date: 7/11/2023 12:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artistaa](
	[artistaId] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](999) NOT NULL,
	[genero] [nchar](99) NOT NULL,
	[gusta] [bit] NOT NULL,
	[noGusta] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistaXUsuario]    Script Date: 7/11/2023 12:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistaXUsuario](
	[usuarioId] [int] NOT NULL,
	[ArtistaId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cancion]    Script Date: 7/11/2023 12:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancion](
	[cancionId] [int] NOT NULL,
	[artistaId] [int] NOT NULL,
	[nombre] [nchar](50) NOT NULL,
	[fechaestreno] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 7/11/2023 12:01:41 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 7/11/2023 12:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[usuarioId] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[contraseña] [varchar](99) NOT NULL,
	[gmail] [varchar](999) NULL
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
INSERT [dbo].[Artistaa] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta]) VALUES (9, N'The Kinks', N'banda inglesa de rock formada en 1963 en Muswell Hill, banda muy influyente en 1960.', N'rock                                                                                               ', 1, 0)
INSERT [dbo].[Artistaa] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta]) VALUES (10, N'Lo'' Pibitos
', N'banda de funk y rap combina el funk con el rap y el rock, mezclando con otros sonidos', N'funk, cumbia, pop, ritmos latinos                                                                  ', 1, 0)
INSERT [dbo].[Artistaa] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta]) VALUES (11, N'Los Helicopteros', N'banda argentina de rock integrante del movimiento de la música divertida', N'rock, diversion                                                                                    ', 1, 0)
GO
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (1, 1)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (1, 2)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (2, 3)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (2, 4)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (2, 5)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (3, 6)
GO
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (1, 1, N'"piano man"                                       ', CAST(N'1971-01-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (2, 1, N'"vienna"                                          ', CAST(N'1977-01-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (3, 1, N'"movin out"                                       ', CAST(N'1977-02-02' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (4, 1, N'"uptown girl"                                     ', CAST(N'1983-01-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (5, 1, N'"pressure"                                        ', CAST(N'1982-01-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (6, 2, N'"bohemian rhapsody"                               ', CAST(N'1975-01-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (7, 2, N'"killer queen"                                    ', CAST(N'1974-11-08' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (8, 2, N'"dont stop me now"                                ', CAST(N'1978-06-05' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (9, 2, N'"i want to break free"                            ', CAST(N'1984-04-15' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (10, 2, N'"radio gaga"                                      ', CAST(N'1984-05-25' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (11, 3, N'"mariposa tecnicolor"                             ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (12, 3, N'"el amor despues del amor"                        ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (13, 3, N'"fue amor"                                        ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (14, 3, N'"a rodar mi vida"                                 ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (15, 3, N'"al lado del camino"                              ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (16, 4, N'"nos siguen pegando abajo"                        ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (17, 4, N'"promesas sobre el bidet"                         ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (18, 4, N'"no voy en tren"                                  ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (19, 4, N'"demoliendo hoteles"                              ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (20, 4, N'"no me dejan salir"                               ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (21, 5, N'"venganza"                                        ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (22, 5, N'"chau"                                            ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (23, 5, N'"cero a la izquierda"                             ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (24, 5, N'"a las nueve"                                     ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (25, 5, N'"esos ojos"                                       ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (26, 5, N'"poco"                                            ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (27, 6, N'"its time"                                        ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (28, 6, N'"believer"                                        ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (29, 6, N'"demons"                                          ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (30, 6, N'"bones"                                           ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (31, 6, N'"sharks"                                          ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (32, 7, N'"arrancarmelo"                                    ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (33, 7, N'"terraza"                                         ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (34, 7, N'"okupa"                                           ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (35, 7, N'"canguro"                                         ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (36, 7, N'"alma dinamita"                                   ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (37, 8, N'"cupido"                                          ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (38, 8, N'"oye"                                             ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (39, 8, N'"fresa"                                           ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (40, 9, N'"you really got me"                               ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (41, 9, N'"All day and all night"                           ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (42, 9, N'"Waterloo Sunset"                                 ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (43, 9, N'"A well respected man"                            ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (44, 10, N'"el ritmo de la vida"                             ', CAST(N'2015-11-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (45, 10, N'"A punto caramelo"                                ', CAST(N'2015-07-30' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (46, 10, N'"El cielo espera"                                 ', CAST(N'2015-12-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (47, 10, N'"Envión"                                          ', CAST(N'2015-12-06' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (48, 10, N'"Pin pun"                                         ', CAST(N'2015-12-06' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (49, 10, N'"Magico"                                          ', CAST(N'2015-11-06' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (50, 11, N'"Fuego y Cemento"                                 ', CAST(N'2021-05-13' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (51, 11, N'"Triste y Vagabundo"                              ', CAST(N'2021-05-17' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (52, 11, N'"Comestible"                                      ', CAST(N'2021-05-25' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (53, 11, N'"Y qué Será"                                      ', CAST(N'2021-05-25' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (54, 12, N'"Sin disfraz"                                     ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (55, 12, N'"Una luna de miel en la mano"                     ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (56, 12, N'"Pronta Entrega"                                  ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (57, 12, N'"Dame una señal"                                  ', NULL)
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (58, 12, N'"Amor descartable"                                ', NULL)
GO
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (1, 1, 1, N'"que geniooo"                                     ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (2, 2, 1, N'"me encanta su musica"                            ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (3, 5, 4, N'"unos capos"                                      ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (4, 8, 2, N'"nefasto"                                         ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (5, 8, 2, N'"es malisimo esto, aguante la renga"              ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (6, 4, 5, N'"el mas grande"                                   ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (7, 8, 2, N'"158.24.156.15"                                   ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (8, 6, 3, N'"Este es un clasico"                              ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (9, 2, 3, N'"Por fin, un sitio que les hace justicia          ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (10, 11, 2, N'"y estos quienes son xd"                          ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (11, 11, 1, N'"me sorprenderia si no lo escuchaste"             ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (12, 11, 3, N'"decente"                                         ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (13, 12, 5, N'"Vaya nombre"                                     ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (14, 12, 3, N'"Apropiado para el hoy o mejor para el mañana?"   ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (15, 6, 1, N'"esta bueno, mas guitarra seria mejor."           ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (16, 6, 6, N'"Best one i''ve seen so far."                      ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (17, 2, 6, N'"Could be better."                                ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (18, 8, 6, N'"Disgusting."                                     ')
INSERT [dbo].[Comentario] ([comentarioId], [artistaId], [usuarioId], [contenido]) VALUES (19, 1, 3, N'"Che, este tipo quien es?"                        ')
GO
INSERT [dbo].[Usuario] ([usuarioId], [nombre], [contraseña], [gmail]) VALUES (1, N'JulianLifsch                                      ', N'84950', N'jlifschits@gmail.com')
INSERT [dbo].[Usuario] ([usuarioId], [nombre], [contraseña], [gmail]) VALUES (2, N'LucaList                                          ', N'odlfigh515', N'listin@gmail.com')
INSERT [dbo].[Usuario] ([usuarioId], [nombre], [contraseña], [gmail]) VALUES (3, N'JuliLav                                           ', N'POlofJd1', N'jlav@gmail.com')
INSERT [dbo].[Usuario] ([usuarioId], [nombre], [contraseña], [gmail]) VALUES (4, N'tobigran                                          ', N'MLKOOMK', N'tgranovski@gmail.com')
INSERT [dbo].[Usuario] ([usuarioId], [nombre], [contraseña], [gmail]) VALUES (5, N'eduardohose', N'12345', N'ehose@gmail.com')
GO
USE [master]
GO
ALTER DATABASE [TPFINAL] SET  READ_WRITE 
GO
