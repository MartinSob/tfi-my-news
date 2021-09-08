USE [master]
GO
/****** Object:  Database [myNews]    Script Date: 2021-09-08 15:01:54 ******/
CREATE DATABASE [myNews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mynews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mynews.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mynews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mynews_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [myNews] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [myNews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [myNews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [myNews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [myNews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [myNews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [myNews] SET ARITHABORT OFF 
GO
ALTER DATABASE [myNews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [myNews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [myNews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [myNews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [myNews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [myNews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [myNews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [myNews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [myNews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [myNews] SET  DISABLE_BROKER 
GO
ALTER DATABASE [myNews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [myNews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [myNews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [myNews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [myNews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [myNews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [myNews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [myNews] SET RECOVERY FULL 
GO
ALTER DATABASE [myNews] SET  MULTI_USER 
GO
ALTER DATABASE [myNews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [myNews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [myNews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [myNews] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [myNews] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [myNews] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'myNews', N'ON'
GO
ALTER DATABASE [myNews] SET QUERY_STORE = OFF
GO
USE [myNews]
GO
/****** Object:  Table [dbo].[backups]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[backups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_backups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bitacore]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacore](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[title] [varchar](50) NULL,
	[description] [varchar](max) NULL,
	[type] [varchar](50) NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_bitacore] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[controls]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[controls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[language_id] [int] NULL,
	[tag] [varchar](50) NULL,
	[text] [varchar](250) NULL,
 CONSTRAINT [PK_controls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dvv]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvv](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[table_name] [varchar](50) NULL,
	[dvv] [varchar](50) NULL,
 CONSTRAINT [PK_dvv] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[languages]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_languages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[policies]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[policies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_policies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post_tags]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post_tags](
	[post_id] [nchar](10) NOT NULL,
	[tag_id] [nchar](10) NOT NULL,
 CONSTRAINT [PK_post_tags] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[body] [varchar](max) NULL,
	[image] [varchar](max) NULL,
	[writer_id] [int] NULL,
	[deleted] [bit] NULL,
	[date] [date] NULL,
	[paragraphs] [int] NULL,
	[words] [int] NULL,
 CONSTRAINT [PK_posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[policy_id] [int] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[user_id] [int] NOT NULL,
	[policy_id] [int] NOT NULL,
 CONSTRAINT [PK_user_policy] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[policy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_tags]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[tag_id] [int] NULL,
	[opened] [bit] NULL,
	[read] [bit] NULL,
	[qualification] [int] NULL,
	[updated_date] [date] NULL,
 CONSTRAINT [PK_user_tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_views]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_views](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[post_id] [int] NULL,
	[date] [date] NULL,
	[read] [bit] NULL,
	[opened] [bit] NULL,
	[qualification] [int] NULL,
 CONSTRAINT [PK_user_views] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[mail] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[dvh] [varchar](50) NULL,
	[active] [bit] NULL,
	[failed_attempts] [int] NULL,
	[language_id] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[writers]    Script Date: 2021-09-08 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[writers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[start_day] [date] NULL,
	[end_day] [date] NULL,
	[id_number] [varchar](50) NULL,
	[birthday] [date] NULL,
 CONSTRAINT [PK_writers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[backups] ON 

INSERT [dbo].[backups] ([id], [name], [date]) VALUES (1, N'bkp_20210825.bak', CAST(N'2021-08-25' AS Date))
INSERT [dbo].[backups] ([id], [name], [date]) VALUES (2, N'bkp_20210828.bak', CAST(N'2021-08-28' AS Date))
INSERT [dbo].[backups] ([id], [name], [date]) VALUES (3, N'bkp_20210829.bak', CAST(N'2021-08-29' AS Date))
INSERT [dbo].[backups] ([id], [name], [date]) VALUES (4, N'bkp_20210829.bak', CAST(N'2021-08-29' AS Date))
INSERT [dbo].[backups] ([id], [name], [date]) VALUES (5, N'bkp_20210829.bak', CAST(N'2021-08-29' AS Date))
INSERT [dbo].[backups] ([id], [name], [date]) VALUES (6, N'bkp_20210831.bak', CAST(N'2021-08-31' AS Date))
SET IDENTITY_INSERT [dbo].[backups] OFF
GO
SET IDENTITY_INSERT [dbo].[bitacore] ON 

INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (1, CAST(N'2021-08-26' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (2, CAST(N'2021-08-26' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (3, CAST(N'2021-08-26' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (4, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'pepe ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (5, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'pepe ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (6, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'pepe ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (7, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'pepe ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (8, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'pepe ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (9, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'pepe ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (10, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'pepe ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (11, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'pepe ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (12, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'pepe ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (13, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'pepe ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (14, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'pepe ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (15, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'asd ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (16, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'asd ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (17, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'asd ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (18, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'asd ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (19, CAST(N'2021-08-27' AS Date), N'Inicio sesion', N'asd ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (20, CAST(N'2021-08-28' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (21, CAST(N'2021-08-28' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (22, CAST(N'2021-08-28' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (23, CAST(N'2021-08-28' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (24, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (25, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (26, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (27, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (28, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (29, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (30, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (31, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (32, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (33, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (34, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (35, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (36, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (37, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (38, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (39, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (40, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (41, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (42, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (43, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (44, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (45, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (46, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (47, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (48, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (49, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (50, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (51, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (52, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (53, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (54, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (55, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (56, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (57, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (58, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (59, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (60, CAST(N'2021-08-28' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (61, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (62, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (63, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (64, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (65, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (66, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (67, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (68, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (69, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (70, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (71, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (72, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (73, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (74, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (75, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (76, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (77, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (78, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (79, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (80, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (81, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (82, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (83, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (84, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (85, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (86, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (87, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (88, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (89, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (90, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (91, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (92, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (93, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (94, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (95, CAST(N'2021-08-29' AS Date), N'Error DVV en BD', N'Error DV en tabla: users', N'Error', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (96, CAST(N'2021-08-30' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (97, CAST(N'2021-08-30' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (98, CAST(N'2021-08-30' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (99, CAST(N'2021-08-30' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
GO
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (100, CAST(N'2021-08-30' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (101, CAST(N'2021-08-30' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (102, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (103, CAST(N'2021-08-31' AS Date), N'DV actualizados', N'Los digitos verificadores fueron actualizados', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (104, CAST(N'2021-08-31' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (105, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (106, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (107, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (108, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (109, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (110, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (111, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (112, CAST(N'2021-08-31' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (113, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (114, CAST(N'2021-08-31' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (115, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (116, CAST(N'2021-08-31' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (117, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (118, CAST(N'2021-08-31' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (119, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (120, CAST(N'2021-08-31' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (121, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (122, CAST(N'2021-08-31' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (123, CAST(N'2021-09-01' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (124, CAST(N'2021-09-01' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (125, CAST(N'2021-09-01' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (126, CAST(N'2021-09-01' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (127, CAST(N'2021-09-01' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (128, CAST(N'2021-09-01' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (129, CAST(N'2021-09-01' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (130, CAST(N'2021-09-01' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (131, CAST(N'2021-09-01' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (132, CAST(N'2021-09-01' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (133, CAST(N'2021-09-06' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (134, CAST(N'2021-09-06' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (135, CAST(N'2021-09-06' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (136, CAST(N'2021-09-06' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (137, CAST(N'2021-09-08' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (138, CAST(N'2021-09-08' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (139, CAST(N'2021-09-08' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (140, CAST(N'2021-09-08' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (141, CAST(N'2021-09-08' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (142, CAST(N'2021-09-08' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (143, CAST(N'2021-09-08' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (144, CAST(N'2021-09-08' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
SET IDENTITY_INSERT [dbo].[bitacore] OFF
GO
SET IDENTITY_INSERT [dbo].[controls] ON 

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'admin' , 'Admin' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'admin' , 'Admin' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'already_registered' , 'The username or mail is already registered.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'already_registered' , 'El nombre o mail del usuario ya esta registrado.' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'backup' , 'Backup' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'backup' , 'Copia de seguridad' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'backup_description' , 'Use this to create a new backup file with all the data gathered to the date.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'backup_description' , 'Usa esto para crear un archivo de seguridad con todos los datos hasta la fecha.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'backup_error' , 'There was an error creating the backup.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'backup_error' , 'Hubo un error creando la copia.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'backup_success' , 'The backup was created successfuly.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'backup_success' , 'La copia fue creada correctamente.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'bitacore' , 'Bitacore' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'bitacore' , 'Bitácora' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'confirm_password' , 'Confirm password' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'confirm_password' , 'Confirmar contraseña' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'create' , 'Create' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'create' , 'Crear' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'date' , 'Date' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'date' , 'Fecha' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'description' , 'Description' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'description' , 'Descripción' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'employees' , 'Employees' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'employees' , 'Empleados' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'errors' , 'Errors' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'errors' , 'Errores' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'forgot_pass' , 'Forgot password?' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'forgot_pass' , '¿Has olvidado la contraseña?' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'from' , 'From' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'from' , 'Desde' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'home' , 'Home' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'home' , 'Principal' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'language' , 'Language' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'language' , 'Idioma' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'lastname' , 'Lastname' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'lastname' , 'Apellido' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'login' , 'Login' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'login' , 'Iniciar sesión' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'login_caption' , 'Best place to read your news.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'login_caption' , 'El mejor lugar para enterarte de las noticias.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'login_failed' , 'The username or password are not correct.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'login_failed' , 'El nombre de usuario o contraseña no son correctos.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'logout' , 'Logout' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'logout' , 'Cerrar sesión' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'mail' , 'mail' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'mail' , 'Correo' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'name' , 'Name' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'name' , 'Nombre' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'password' , 'Password' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'password' , 'Contraseña' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'password_reset_error' , 'There was a problem creating the new password.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'password_reset_error' , 'Hubo un problema generando la nueva contraseña.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'password_reset_success' , 'An email was sent with the new password.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'password_reset_success' , 'Se ha enviado un correo con la nueva contraseña.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'permits' , 'Permits' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'permits' , 'Permisos' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'profile' , 'Profile' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'profile' , 'Perfil' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'reports' , 'Reports' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'reports' , 'Reportes' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'restore' , 'restore' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'restore' , 'Restauración' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'restore_error' , 'There was an error with the restore.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'restore_error' , 'Hubo un error con la restauración.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'restore_description' , 'Use this to restore the data from a backup file created before.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'restore_description' , 'Usa esto para restaurar una copia de seguridad.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'restore_success' , 'The restore was successful.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'restore_success' , 'La restauración fue exitosa.' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'signup' , 'Sign up' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'signup' , 'Crear cuenta' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'text' , 'Text' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'text' , 'Texto' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'title' , 'Title' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'title' , 'Título' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'to' , 'To' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'to' , 'Hasta' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'type' , 'Type' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'type' , 'Tipo' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'user' , 'User' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'user' , 'Usuario' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'username' , 'Username' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'username' , 'Nombre de usuario' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'users' , 'Users' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'users' , 'Usuarios' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'user_create_error' , 'There was a problem creating the user.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'user_create_error' , 'Hubo un problema creando el usuario.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'user_create_success' , 'User created successfuly.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'user_create_success' , 'Usuario creado correctamente.' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'validate' , 'Validate' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'validate' , 'Validar' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'vd' , 'Verifying digit' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'vd' , 'Dígito verificador' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'vd_description' , 'Use this to validate the integrity of the database.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'vd_description' , 'Usa esto para validar la integridad de la base de datos.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'vd_problems' , 'There are problems with the VD.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'vd_problems' , 'Hay problemas con los DV.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'vd_valid_update_success' , 'The VD were updated successfuly.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'vd_valid_update_success' , 'Los DV fueron actualizados.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'vd_valid_update_error' , 'There was an error updating the VD.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'vd_valid_update_error' , 'Hubo un problema actualizando los DV.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'vd_valid' , 'The VD are valid.' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'vd_valid' , 'Los DV son válidos.' )

INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 1 , 'writer' , 'Writer' )
INSERT INTO [dbo].[controls] ([language_id], [tag], [text]) VALUES( 2 , 'writer' , 'Escritor' )
SET IDENTITY_INSERT [dbo].[controls] OFF
GO
SET IDENTITY_INSERT [dbo].[dvv] ON 

INSERT [dbo].[dvv] ([id], [table_name], [dvv]) VALUES (1, N'users', N'-148066665')
SET IDENTITY_INSERT [dbo].[dvv] OFF
GO
SET IDENTITY_INSERT [dbo].[languages] ON 

INSERT [dbo].[languages] ([id], [name]) VALUES (1, N'English')
INSERT [dbo].[languages] ([id], [name]) VALUES (2, N'Español')
SET IDENTITY_INSERT [dbo].[languages] OFF
GO
SET IDENTITY_INSERT [dbo].[policies] ON 

INSERT [dbo].[policies] ([id], [name]) VALUES (1, N'post_manage')
INSERT [dbo].[policies] ([id], [name]) VALUES (2, N'post_read')
INSERT [dbo].[policies] ([id], [name]) VALUES (3, N'post_qualify')
INSERT [dbo].[policies] ([id], [name]) VALUES (4, N'post_search')
INSERT [dbo].[policies] ([id], [name]) VALUES (5, N'reports_see')
INSERT [dbo].[policies] ([id], [name]) VALUES (6, N'type_gestion')
INSERT [dbo].[policies] ([id], [name]) VALUES (7, N'writer_gestion')
INSERT [dbo].[policies] ([id], [name]) VALUES (8, N'post_delete')
INSERT [dbo].[policies] ([id], [name]) VALUES (10, N'backup_manage')
INSERT [dbo].[policies] ([id], [name]) VALUES (11, N'restore_manage')
INSERT [dbo].[policies] ([id], [name]) VALUES (12, N'policies_manage')
INSERT [dbo].[policies] ([id], [name]) VALUES (13, N'Escritor')
INSERT [dbo].[policies] ([id], [name]) VALUES (14, N'Lector')
INSERT [dbo].[policies] ([id], [name]) VALUES (15, N'Gerente')
INSERT [dbo].[policies] ([id], [name]) VALUES (16, N'Tecnico')
INSERT [dbo].[policies] ([id], [name]) VALUES (17, N'admin_see')
INSERT [dbo].[policies] ([id], [name]) VALUES (18, N'admin_employees')
INSERT [dbo].[policies] ([id], [name]) VALUES (19, N'admin_users')
INSERT [dbo].[policies] ([id], [name]) VALUES (20, N'admin_copy')
INSERT [dbo].[policies] ([id], [name]) VALUES (21, N'admin_policies')
INSERT [dbo].[policies] ([id], [name]) VALUES (22, N'admin_bitacore')
INSERT [dbo].[policies] ([id], [name]) VALUES (23, N'admin_reports')
INSERT [dbo].[policies] ([id], [name]) VALUES (24, N'dv_update')
SET IDENTITY_INSERT [dbo].[policies] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (1, 1, 13)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (2, 2, 14)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (3, 3, 14)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (4, 4, 14)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (5, 5, 15)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (6, 6, 15)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (7, 7, 15)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (8, 8, 15)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (10, 10, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (11, 11, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (12, 12, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (13, 14, 13)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (14, 13, 15)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (15, 13, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (17, 16, 15)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (18, 17, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (19, 18, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (20, 19, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (21, 20, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (22, 21, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (23, 22, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (24, 23, 16)
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
INSERT [dbo].[user_roles] ([user_id], [policy_id]) VALUES (1, 15)
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [mail], [name], [lastname], [password], [dvh], [active], [failed_attempts], [language_id]) VALUES (1, N'admin', N'admin@admin', N'Admin', N'Admin', N'nRy/sK5Z7ENvGsSwfcmLzw==', N'1965758046', 1, 0, 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
USE [master]
GO
ALTER DATABASE [myNews] SET  READ_WRITE 
GO
