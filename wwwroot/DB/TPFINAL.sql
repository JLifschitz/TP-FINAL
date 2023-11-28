USE [master]
GO
/****** Object:  Database [TPFINAL]    Script Date: 16/11/2023 08:18:54 ******/
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
/****** Object:  User [alumno]    Script Date: 16/11/2023 08:18:54 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Artista]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artista](
	[artistaId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](999) NOT NULL,
	[genero] [nchar](99) NOT NULL,
	[gusta] [int] NOT NULL,
	[noGusta] [int] NOT NULL,
	[foto] [varchar](999) NOT NULL,
 CONSTRAINT [PK_Artista] PRIMARY KEY CLUSTERED 
(
	[artistaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistaXUsuario]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistaXUsuario](
	[usuarioId] [int] NOT NULL,
	[ArtistaId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cancion]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancion](
	[cancionId] [int] IDENTITY(1,1) NOT NULL,
	[artistaId] [int] NOT NULL,
	[nombre] [nchar](50) NOT NULL,
	[fechaestreno] [date] NOT NULL,
 CONSTRAINT [PK_Cancion] PRIMARY KEY CLUSTERED 
(
	[cancionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[comentarioId] [int] IDENTITY(1,1) NOT NULL,
	[artistaId] [int] NOT NULL,
	[usuarioId] [int] NOT NULL,
	[contenido] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[comentarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[contraseña] [varchar](99) NOT NULL,
	[gmail] [varchar](999) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Artista] ON 

INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (1, N'Billy Joel ', N'cantante, compositor y pianista estadounidense. Ha logrado más de 40 hits desde 1973', N'rock, pop, clasica', 1, 0, N'billyjoel.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (2, N'Queen', N'banda británica de rock formada en 1970', N'rock, pop', 5, 3, N'queen.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (3, N'Fito Paez', N'músico, compositor, pianista, director de cine y cantante argentino', N'rock, pop', 1, 0, N'fitopaez.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (4, N'Charly Garcia', N'na de las figuras más importantes y vanguardistas de la música popular argentina.?', N'rock, pop', 8, 0, N'charlygarcia.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (5, N'no te va a gustar', N'grupo musical de Uruguay formado el 25 de junio del año 1994 en Montevideo.?', N'rock, pop', 1, 0, N'notevagustar.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (6, N'imagine dragons', N'Ganó el reconocimiento mundial con el lanzamiento de su álbum de estudio debut Night Visions', N'rock, pop', 1, 0, N'imaginedragons.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (7, N'wos', N'cantante, músico, actor y freestyler argentino.', N'rock. hip hop, rap', 1, 0, N'wos.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (8, N'tini', N'actriz, cantante y compositora argentina', N'pop, regueton', 3, 0, N'tini.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (9, N'The Kinks', N'banda inglesa de rock formada en 1963 en Muswell Hill, banda muy influyente en 1960.', N'rock', 1, 6, N'thekinks.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (10, N'Lo'' Pibitos', N'banda de funk y rap combina el funk con el rap y el rock, mezclando con otros sonidos', N'funk, cumbia, pop, ritmos latinos', 7, 0, N'lopibitos.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (11, N'Los Helicopteros', N'banda argentina de rock integrante del movimiento de la música divertida', N'rock, diversion', 1, 0, N'loshelicopteros.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (12, N'Virus', N'asa', N'asd', 1, 1, N'virus.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (13, N'Berduras', N'banda de verduras', N'rock, inventada', 3, 18, N'berduras.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (14, N'Michael Jackson', N'cantante, compositor, productor y bailarín estadounidense', N'funk', 163, 2, N'michaeljackson.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (15, N'Gramatik', N'productor de música electrónica esloveno, residente en Nueva York', N'hip hop, electrónica, trip hop', 26, 10, N'gramatik.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (16, N'Sly Stone', N'Un artista que junto con sus hermanos logro desarrollar un nuevo tipo de musica', N'rock, soul psicodelico, funk', 26, 10, N'slystone.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (17, N'Vet Stone', N'Cantante de Soul, Hermana de Sly Stone, parte de la banda Sly & the family Stone, y tambien Little Sister', N' soul psicodelico', 16, 2, N'vetstone.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (18, N'Marcus Miller', N'Músico, compositor y productor de jazz. Se destaca como bajista.', N'funk, groove, soul', 5000, 500, N'marcusmiller.jpg')
INSERT [dbo].[Artista] ([artistaId], [nombre], [descripcion], [genero], [gusta], [noGusta], [foto]) VALUES (19, N'The Internet', N'Banda estadounidense de Los Ángeles, California. Su música es considerada como una mezcla de R&B, hip hop, jazz, funk y música dance electrónica.', N'hip hop, jazz, electrónica, funk', 265256, 10546, N'slystone.jpg')


	 
	 
SET IDENTITY_INSERT [dbo].[Artista] OFF
GO
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (1, 2)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (2, 3)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (2, 4)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (2, 5)
INSERT [dbo].[ArtistaXUsuario] ([usuarioId], [ArtistaId]) VALUES (3, 6)
GO
SET IDENTITY_INSERT [dbo].[Cancion] ON 

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
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (11, 3, N'"mariposa tecnicolor"                             ', CAST(N'1994-01-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (12, 3, N'"el amor despues del amor"                        ', CAST(N'1992-06-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (13, 3, N'"fue amor"                                        ', CAST(N'1990-11-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (14, 3, N'"a rodar mi vida"                                 ', CAST(N'1992-07-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (15, 3, N'"al lado del camino"                              ', CAST(N'1999-07-27' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (16, 4, N'"nos siguen pegando abajo"                        ', CAST(N'1983-11-05' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (17, 4, N'"promesas sobre el bidet"                         ', CAST(N'1984-01-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (18, 4, N'"no voy en tren"                                  ', CAST(N'1987-05-28' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (19, 4, N'"demoliendo hoteles"                              ', CAST(N'1984-01-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (20, 4, N'"no me dejan salir"                               ', CAST(N'1983-12-05' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (21, 5, N'"venganza"                                        ', CAST(N'2021-06-22' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (22, 5, N'"chau"                                            ', CAST(N'2010-07-04' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (23, 5, N'"cero a la izquierda"                             ', CAST(N'2010-02-17' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (24, 5, N'"a las nueve"                                     ', CAST(N'2012-09-26' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (25, 5, N'"esos ojos"                                       ', CAST(N'2019-09-02' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (26, 5, N'"poco"                                            ', CAST(N'2006-07-02' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (27, 6, N'"its time"                                        ', CAST(N'2011-08-12' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (28, 6, N'"believer"                                        ', CAST(N'2017-03-07' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (29, 6, N'"demons"                                          ', CAST(N'2012-08-12' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (30, 6, N'"bones"                                           ', CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (31, 6, N'"sharks"                                          ', CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (32, 7, N'"arrancarmelo"                                    ', CAST(N'2022-06-12' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (33, 7, N'"terraza"                                         ', CAST(N'2019-01-30' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (34, 7, N'"okupa"                                           ', CAST(N'2019-02-28' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (35, 7, N'"canguro"                                         ', CAST(N'2019-06-12' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (36, 7, N'"alma dinamita"                                   ', CAST(N'2020-07-25' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (37, 8, N'"cupido"                                          ', CAST(N'2023-09-05' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (38, 8, N'"oye"                                             ', CAST(N'2020-10-07' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (39, 8, N'"fresa"                                           ', CAST(N'2020-10-07' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (40, 9, N'"you really got me"                               ', CAST(N'1964-06-03' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (41, 9, N'"All day and all night"                           ', CAST(N'1964-06-03' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (42, 9, N'"Waterloo Sunset"                                 ', CAST(N'1967-09-18' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (43, 9, N'"A well respected man"                            ', CAST(N'1965-08-06' AS Date))
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
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (54, 12, N'"Sin disfraz"                                     ', CAST(N'1985-09-11' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (55, 12, N'"Una luna de miel en la mano"                     ', CAST(N'1985-07-11' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (56, 12, N'"Pronta Entrega"                                  ', CAST(N'1985-09-11' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (57, 12, N'"Dame una señal"                                  ', CAST(N'1984-01-06' AS Date))
INSERT [dbo].[Cancion] ([cancionId], [artistaId], [nombre], [fechaestreno]) VALUES (58, 12, N'"Amor descartable"                                ', CAST(N'1984-01-06' AS Date))
SET IDENTITY_INSERT [dbo].[Cancion] OFF
GO
SET IDENTITY_INSERT [dbo].[Comentario] ON 

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
SET IDENTITY_INSERT [dbo].[Comentario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([usuarioId], [nombre], [contraseña], [gmail]) VALUES (1, N'JulianLifsch                                      ', N'84950', N'jlifschits@gmail.com')
INSERT [dbo].[Usuario] ([usuarioId], [nombre], [contraseña], [gmail]) VALUES (2, N'LucaList                                          ', N'odlfigh515', N'listin@gmail.com')
INSERT [dbo].[Usuario] ([usuarioId], [nombre], [contraseña], [gmail]) VALUES (3, N'JuliLav                                           ', N'POlofJd1', N'jlav@gmail.com')
INSERT [dbo].[Usuario] ([usuarioId], [nombre], [contraseña], [gmail]) VALUES (4, N'tobigran                                          ', N'MLKOOMK', N'tgranovski@gmail.com')
INSERT [dbo].[Usuario] ([usuarioId], [nombre], [contraseña], [gmail]) VALUES (5, N'eduardohose', N'12345', N'ehose@gmail.com')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
/****** Object:  StoredProcedure [dbo].[AñadirComentario]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AñadirComentario]
	@art int,
	@userId int,
	@cont nchar(150)
AS
BEGIN
	Insert into Comentario(artistaId, usuarioId, contenido) Values (@art, @userId, @cont)
	Select * From Comentario where comentarioId = @@IDENTITY;
END
GO
/****** Object:  StoredProcedure [dbo].[CargarArtistas]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarArtistas]
AS
BEGIN
	Select * From Artista
END
GO
/****** Object:  StoredProcedure [dbo].[CargarSeguidos]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarSeguidos]
	@id int
AS
BEGIN
	Select A.* From Artista as A inner join ArtistaXUsuario as AxU on A.artistaId = AxU.artistaId where AxU.usuarioId = @id;  
END
GO
/****** Object:  StoredProcedure [dbo].[CargarCanciones]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CargarCanciones]
	@art int
AS
BEGIN
	Select * From Cancion where artistaId = @art
END
GO
/****** Object:  StoredProcedure [dbo].[CargarComentarios]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarComentarios]
	@art int
AS
BEGIN
	Select * From Comentario Where artistaId = @art;
END
GO
/****** Object:  StoredProcedure [dbo].[Gusta]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Gusta]
	@art int
AS
BEGIN
	update Artista set gusta=gusta+1 where Artista.artistaId=@art
END
GO
/****** Object:  StoredProcedure [dbo].[Log_in]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Log_in]
	@pname varchar(999),
	@pcon varchar(999)
AS
BEGIN
	Select * From Usuario Where nombre = @pname and contraseña = @pcon;
END
GO
/****** Object:  StoredProcedure [dbo].[NoGusta]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NoGusta]
	@art int
AS
BEGIN
	update Artista set noGusta=noGusta+1 where Artista.artistaId=@art
END
GO
/****** Object:  StoredProcedure [dbo].[Registrarse]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Registrarse]
	@use varchar(999),
	@con varchar(999),
	@mail varchar(999)
AS
BEGIN
	Insert into Usuario(nombre, contraseña, gmail) Values (@use, @con, @mail)
END
GO
/****** Object:  StoredProcedure [dbo].[SeguirArtista]    Script Date: 16/11/2023 08:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeguirArtista]
	@art int,
	@user int
AS
BEGIN
	if not exists(Select * From ArtistaXUsuario Where artistaId = @art and usuarioId = @user)
	Begin
		Insert into ArtistaxUsuario(artistaId, usuarioId) Values (@art, @user);
		return 1;
	End
	Else
	Begin
		Delete From ArtistaXUsuario Where artistaId = @art and usuarioId = @user;
		return 0;
	End
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarUsuario]    Script Date: 22/11/2023 15:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarUsuario]
	@id int,
AS
BEGIN
	Select * From Usuario Where usuarioId = @id;
END
GO
USE [master]
GO
ALTER DATABASE [TPFINAL] SET  READ_WRITE 
GO
