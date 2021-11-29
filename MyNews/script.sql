USE [master]
GO
/****** Object:  Database [myNews]    Script Date: 2021-11-28 22:06:07 ******/
CREATE DATABASE [myNews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mynews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mynews.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mynews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mynews_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[backups]    Script Date: 2021-11-28 22:06:07 ******/
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
/****** Object:  Table [dbo].[bitacore]    Script Date: 2021-11-28 22:06:07 ******/
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
/****** Object:  Table [dbo].[controls]    Script Date: 2021-11-28 22:06:07 ******/
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
/****** Object:  Table [dbo].[dvv]    Script Date: 2021-11-28 22:06:07 ******/
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
/****** Object:  Table [dbo].[employees]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[start_day] [date] NULL,
	[end_day] [date] NULL,
	[id_number] [varchar](50) NULL,
	[birthday] [date] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[languages]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_languages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[policies]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[policies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_policies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post_tags]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post_tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
 CONSTRAINT [PK_post_tags_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[body] [varchar](max) NULL,
	[image] [image] NULL,
	[employee_id] [int] NULL,
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
/****** Object:  Table [dbo].[roles]    Script Date: 2021-11-28 22:06:07 ******/
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
/****** Object:  Table [dbo].[tags]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[color] [varchar](50) NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_posts]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[post_id] [int] NULL,
	[date] [date] NULL,
	[finished] [int] NULL,
	[qualification] [int] NULL,
 CONSTRAINT [PK_user_posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[policy_id] [int] NOT NULL,
 CONSTRAINT [PK_user_policy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_tags]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[tag_id] [int] NULL,
	[finished] [int] NULL,
	[qualification] [int] NULL,
	[views] [int] NULL,
	[updated_date] [date] NULL,
 CONSTRAINT [PK_user_tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2021-11-28 22:06:07 ******/
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
	[deleted] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bitacore] ON 

INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (1, CAST(N'2021-11-25' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (2, CAST(N'2021-11-25' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (3, CAST(N'2021-11-25' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (4, CAST(N'2021-11-26' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (5, CAST(N'2021-11-26' AS Date), N'Cerrar Sesión', N'admin ha cerrado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (6, CAST(N'2021-11-26' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (7, CAST(N'2021-11-26' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (8, CAST(N'2021-11-26' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (9, CAST(N'2021-11-26' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (10, CAST(N'2021-11-26' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (11, CAST(N'2021-11-26' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (12, CAST(N'2021-11-28' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (13, CAST(N'2021-11-28' AS Date), N'Actualización Post', N'admin ha modificado el post 3', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (14, CAST(N'2021-11-28' AS Date), N'Actualización Post', N'admin ha modificado el post 3', N'Info', 0)
INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (15, CAST(N'2021-11-28' AS Date), N'Actualización Post', N'admin ha modificado el post 3', N'Info', 0)
SET IDENTITY_INSERT [dbo].[bitacore] OFF
GO
SET IDENTITY_INSERT [dbo].[controls] ON 

INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (1, 1, N'action', N'Action')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (2, 2, N'action', N'Acción')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (3, 1, N'add', N'Add')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (4, 2, N'add', N'Agregar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (5, 1, N'admin_bitacore', N'[Admin] Bitacore')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (6, 2, N'admin_bitacore', N'[Admin] Bitácora')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (7, 1, N'admin_copy', N'[Admin] Copies')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (8, 2, N'admin_copy', N'[Admin] Copias')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (9, 1, N'admin_employees', N'[Admin] Employees')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (10, 2, N'admin_employees', N'[Admin] Empleados')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (11, 1, N'admin_languages', N'[Admin] Languages')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (12, 2, N'admin_languages', N'[Admin] Idiomas')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (13, 1, N'admin_policies', N'[Admin] Policies')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (14, 2, N'admin_policies', N'[Admin] Políticas')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (15, 1, N'admin_post', N'[Admin] Post')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (16, 2, N'admin_post', N'[Admin] Nota')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (17, 1, N'admin_reports', N'[Admin] Reports')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (18, 2, N'admin_reports', N'[Admin] Reportes')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (19, 1, N'admin_see', N'[Admin] See')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (20, 2, N'admin_see', N'[Admin] Ver')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (21, 1, N'admin_tags', N'[Admin] Tags')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (22, 2, N'admin_tags', N'[Admin] Etiquetas')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (23, 1, N'admin_users', N'[Admin] Users')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (24, 2, N'admin_users', N'[Admin] Usuarios')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (25, 1, N'admin', N'Admin')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (26, 2, N'admin', N'Admin')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (27, 1, N'already_registered', N'The username or mail is already registered.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (28, 2, N'already_registered', N'El nombre o mail del usuario ya esta registrado.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (29, 1, N'april', N'April')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (30, 2, N'april', N'Abril')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (31, 1, N'august', N'August')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (32, 2, N'august', N'Agosto')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (33, 1, N'backup', N'Backup')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (34, 2, N'backup', N'Copia de seguridad')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (35, 1, N'backup_manage', N'[Backup] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (36, 2, N'backup_manage', N'[Copia de seguridad] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (37, 1, N'backup_description', N'Use this to create a new backup file with all the data gathered to the date.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (38, 2, N'backup_description', N'Usa esto para crear un archivo de seguridad con todos los datos hasta la fecha.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (39, 1, N'backup_error', N'There was an error creating the backup.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (40, 2, N'backup_error', N'Hubo un error creando la copia.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (41, 1, N'backup_success', N'The backup was created successfuly.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (42, 2, N'backup_success', N'La copia fue creada correctamente.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (43, 1, N'basic_role_delete', N'The basic role cannot be deleted.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (44, 2, N'basic_role_delete', N'El rol básico no se puede eliminar.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (45, 1, N'birthday', N'Birthday')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (46, 2, N'birthday', N'Cumplaños')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (47, 1, N'bitacore', N'Bitacore')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (48, 2, N'bitacore', N'Bitácora')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (49, 1, N'body', N'Body')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (50, 2, N'body', N'Cuerpo')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (51, 1, N'cancel', N'Cancel')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (52, 2, N'cancel', N'Cancelar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (53, 1, N'circular_role', N'One of the roles selected contains this role as policy, making a circular policy. ')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (54, 2, N'circular_role', N'Uno de los roles seleccionados tiene este rol como política, haciendo una referencia circular.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (55, 1, N'color', N'Color')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (56, 2, N'color', N'Color')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (57, 1, N'complete_data', N'Complete the necessary fields.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (58, 2, N'complete_data', N'Complete los campos necesarios.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (59, 1, N'confirm_password', N'Confirm password')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (60, 2, N'confirm_password', N'Confirmar contraseña')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (61, 1, N'count', N'Count')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (62, 2, N'count', N'Cantidad')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (63, 1, N'create', N'Create')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (64, 2, N'create', N'Crear')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (65, 1, N'date', N'Date')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (66, 2, N'date', N'Fecha')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (67, 1, N'december', N'December')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (68, 2, N'december', N'Diciembre')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (69, 1, N'delete_confirmation', N'Are you sure you want to delete it?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (70, 2, N'delete_confirmation', N'¿Estás seguro/a que quiere eliminar?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (71, 1, N'delete_myself', N'You cannot delete the user you are using.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (72, 2, N'delete_myself', N'No se puede eliminar el usuario que está usando.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (73, 1, N'description', N'Description')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (74, 2, N'description', N'Descripción')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (75, 1, N'document', N'Document')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (76, 2, N'document', N'Documento')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (77, 1, N'dv_update', N'[DV] Update')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (78, 2, N'dv_update', N'[DV] Actualización')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (79, 1, N'end_day', N'End day')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (80, 2, N'end_day', N'Último día')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (81, 1, N'email', N'Email')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (82, 2, N'email', N'Email')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (83, 1, N'employees', N'Employees')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (84, 2, N'employees', N'Empleados')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (85, 1, N'employee_gestion', N'[Employee] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (86, 2, N'employee_gestion', N'[Empleado] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (87, 1, N'error', N'There was an error.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (88, 2, N'error', N'Hubo un error.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (89, 1, N'errors', N'Errors')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (90, 2, N'errors', N'Errores')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (91, 1, N'error_try_again', N'There was an error. Try again later.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (92, 2, N'error_try_again', N'Hubo un error. Intente nuevamente más tarde.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (93, 1, N'february', N'February')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (94, 2, N'february', N'Febrero')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (95, 1, N'finished', N'Finished')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (96, 2, N'finished', N'Terminados')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (97, 1, N'forgot_pass', N'Forgot password?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (98, 2, N'forgot_pass', N'¿Has olvidado la contraseña?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (99, 1, N'from', N'From')
GO
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (100, 2, N'from', N'Desde')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (101, 1, N'good_count_paragraphs', N'The post has a good amount of paragraphs.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (102, 2, N'good_count_paragraphs', N'La nota tiene una buena cantidad de párrafos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (103, 1, N'good_count_words', N'The post has a good amount of words.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (104, 2, N'good_count_words', N'La nota tiene una buena cantidad de palabras.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (105, 1, N'good_title_length', N'The length of the title is great.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (106, 2, N'good_title_length', N'El largo del título es el recomendado.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (107, 1, N'home', N'Home')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (108, 2, N'home', N'Principal')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (109, 1, N'image', N'Image')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (110, 2, N'image', N'Imagen')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (111, 1, N'invalid_file_format', N'Invalid file format.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (112, 2, N'invalid_file_format', N'Formato de la imagen es inválido.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (113, 1, N'january', N'January')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (114, 2, N'january', N'Enero')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (115, 1, N'june', N'June')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (116, 2, N'june', N'Junio')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (117, 1, N'july', N'July')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (118, 2, N'july', N'Julio')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (119, 1, N'language', N'Language')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (120, 2, N'language', N'Idioma')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (121, 1, N'lastname', N'Lastname')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (122, 2, N'lastname', N'Apellido')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (123, 1, N'last_language', N'The last language cannot be deleted.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (124, 2, N'last_language', N'El último idioma no se puede eliminar.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (125, 1, N'login', N'Login')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (126, 2, N'login', N'Iniciar sesión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (127, 1, N'login_caption', N'Best place to read your news.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (128, 2, N'login_caption', N'El mejor lugar para enterarte de las noticias.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (129, 1, N'login_failed', N'The username or password are not correct.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (130, 2, N'login_failed', N'El nombre de usuario o contraseña no son correctos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (131, 1, N'logout', N'Logout')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (132, 2, N'logout', N'Cerrar sesión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (133, 1, N'mail', N'Mail')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (134, 2, N'mail', N'Correo')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (135, 1, N'march', N'March')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (136, 2, N'march', N'Marzo')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (137, 1, N'may', N'May')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (138, 2, N'may', N'Mayo')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (139, 1, N'name', N'Name')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (140, 2, N'name', N'Nombre')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (141, 1, N'november', N'November')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (142, 2, N'november', N'Noviembre')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (143, 1, N'october', N'October')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (144, 2, N'october', N'Octubre')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (145, 1, N'paragraphs', N'Paragraphs')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (146, 2, N'paragraphs', N'Párrafos')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (147, 1, N'password', N'Password')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (148, 2, N'password', N'Contraseña')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (149, 1, N'password_different', N'The passwords do not match.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (150, 2, N'password_different', N'Las contraseñas no coinciden.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (151, 1, N'password_reset', N'Password reset')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (152, 2, N'password_reset', N'Cambio de contraseña')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (153, 1, N'password_reset_error', N'There was a problem creating the new password.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (154, 2, N'password_reset_error', N'Hubo un problema generando la nueva contraseña.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (155, 1, N'password_reset_success', N'An email was sent with the new password.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (156, 2, N'password_reset_success', N'Se ha enviado un correo con la nueva contraseña.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (157, 1, N'permits', N'Permits')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (158, 2, N'permits', N'Permisos')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (159, 1, N'policies_manage', N'[Policies] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (160, 2, N'policies_manage', N'[Políticas] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (161, 1, N'popular_employees', N'Popular employees')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (162, 2, N'popular_employees', N'Empleados populares')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (163, 1, N'popular_posts', N'Popular posts')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (164, 2, N'popular_posts', N'Notas populares')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (165, 1, N'popular_tags', N'Popular tags')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (166, 2, N'popular_tags', N'Etiquetas populares')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (167, 1, N'post', N'Post')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (168, 2, N'post', N'Nota')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (169, 1, N'post_delete', N'[Post] Delete')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (170, 2, N'post_delete', N'[Nota] Eliminar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (171, 1, N'post_manage', N'[Post] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (172, 2, N'post_manage', N'[Nota] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (173, 1, N'post_qualify', N'[Post] Qualify')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (174, 2, N'post_qualify', N'[Nota] Calificar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (175, 1, N'post_read', N'[Post] Read')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (176, 2, N'post_read', N'[Nota] Leer')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (177, 1, N'posts', N'Posts')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (178, 2, N'posts', N'Notas')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (179, 1, N'profile', N'Profile')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (180, 2, N'profile', N'Perfil')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (181, 1, N'qualification', N'Qualification')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (182, 2, N'qualification', N'Nota')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (183, 1, N'reports', N'Reports')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (184, 2, N'reports', N'Reportes')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (185, 1, N'reports_see', N'[Reports] See')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (186, 2, N'reports_see', N'[Reportes] Ver')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (187, 1, N'restore', N'Restore')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (188, 2, N'restore', N'Restauración')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (189, 1, N'restore_manage', N'[Restore] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (190, 2, N'restore_manage', N'[Restauración] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (191, 1, N'restore_error', N'There was an error with the restore.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (192, 2, N'restore_error', N'Hubo un error con la restauración.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (193, 1, N'restore_description', N'Use this to restore the data from a backup file created before.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (194, 2, N'restore_description', N'Usa esto para restaurar una copia de seguridad.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (195, 1, N'restore_success', N'The restore was successful.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (196, 2, N'restore_success', N'La restauración fue exitosa.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (197, 1, N'search', N'Search')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (198, 2, N'search', N'Buscar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (199, 1, N'september', N'September')
GO
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (200, 2, N'september', N'Septiembre')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (201, 1, N'show_unemployed', N'Show unemployed?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (202, 2, N'show_unemployed', N'¿Mostrar desempleados?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (203, 1, N'signup', N'Sign up')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (204, 2, N'signup', N'Crear cuenta')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (205, 1, N'start_day', N'Start day')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (206, 2, N'start_day', N'Primer día')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (207, 1, N'success', N'Success!')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (208, 2, N'success', N'¡Exitoso!')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (209, 1, N'tags', N'Tags')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (210, 2, N'tags', N'Etiquetas')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (211, 1, N'tag_high_open_probability', N'The posts with these tags are usually opened.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (212, 2, N'tag_high_open_probability', N'Las notas con estas etiquetas suelen ser abiertas.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (213, 1, N'tag_high_read_probability', N'The posts with these tags are usually read.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (214, 2, N'tag_high_read_probability', N'Las notas con estas etiquetas suelen ser leídas.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (215, 1, N'tag_low_open_probability', N'The posts with these tags are not usually opened.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (216, 2, N'tag_low_open_probability', N'Las notas con estas etiquetas no suelen ser abiertas.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (217, 1, N'tag_low_read_probability', N'The posts with these tags are not usually read.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (218, 2, N'tag_low_read_probability', N'Las notas con estas etiquetas no suelen ser leídas.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (219, 1, N'text', N'Text')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (220, 2, N'text', N'Texto')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (221, 1, N'title', N'Title')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (222, 2, N'title', N'Título')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (223, 1, N'to', N'To')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (224, 2, N'to', N'Hasta')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (225, 1, N'too_few_paragraphs', N'Successful posts usually have more paragraphs.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (226, 2, N'too_few_paragraphs', N'Las notas exitosas suelen tener más párrafos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (227, 1, N'too_few_words', N'Successful posts usually have more words.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (228, 2, N'too_few_words', N'Las notas exitosas suelen tener más palabras.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (229, 1, N'too_long_title', N'Successful posts usually have shorter titles.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (230, 2, N'too_long_title', N'Las notas exitosas suelen tener títulos más cortos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (231, 1, N'too_many_paragraphs', N'Successful posts usually have less paragraphs.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (232, 2, N'too_many_paragraphs', N'Las notas exitosas suelen tener menos párrafos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (233, 1, N'too_many_words', N'Successful posts usually have less words.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (234, 2, N'too_many_words', N'Las notas exitosas suelen tener menos palabras.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (235, 1, N'too_short_title', N'Successful posts usually have longer titles.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (236, 2, N'too_short_title', N'Las notas exitosas suelen tener títulos más largos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (237, 1, N'total_reads', N'Total reads')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (238, 2, N'total_reads', N'Lecturas totales')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (239, 1, N'type', N'Type')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (240, 2, N'type', N'Tipo')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (241, 1, N'type_gestion', N'[Type] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (242, 2, N'type_gestion', N'[Tipo] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (243, 1, N'update', N'Update')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (244, 2, N'update', N'Actualizar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (245, 1, N'unpopular_employees', N'Unpopular employees')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (246, 2, N'unpopular_employees', N'Empleados menos populares')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (247, 1, N'unpopular_posts', N'Unpopular posts')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (248, 2, N'unpopular_posts', N'Notas menos populares')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (249, 1, N'user', N'User')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (250, 2, N'user', N'Usuario')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (251, 1, N'username', N'Username')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (252, 2, N'username', N'Nombre de usuario')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (253, 1, N'users', N'Users')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (254, 2, N'users', N'Usuarios')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (255, 1, N'user_create_error', N'There was a problem creating the user.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (256, 2, N'user_create_error', N'Hubo un problema creando el usuario.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (257, 1, N'user_create_success', N'User created successfuly.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (258, 2, N'user_create_success', N'Usuario creado correctamente.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (259, 1, N'validate', N'Validate')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (260, 2, N'validate', N'Validar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (261, 1, N'validation', N'Validation')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (262, 2, N'validation', N'Validación')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (263, 1, N'views', N'Views')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (264, 2, N'views', N'Vistas')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (265, 1, N'vd', N'Verifying digit')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (266, 2, N'vd', N'Dígito verificador')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (267, 1, N'vd_description', N'Use this to validate the integrity of the database.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (268, 2, N'vd_description', N'Usa esto para validar la integridad de la base de datos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (269, 1, N'vd_problems', N'There are problems with the VD.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (270, 2, N'vd_problems', N'Hay problemas con los DV.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (271, 1, N'vd_valid_update_success', N'The VD were updated successfuly.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (272, 2, N'vd_valid_update_success', N'Los DV fueron actualizados.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (273, 1, N'vd_valid_update_error', N'There was an error updating the VD.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (274, 2, N'vd_valid_update_error', N'Hubo un problema actualizando los DV.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (275, 1, N'vd_valid', N'The VD are valid.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (276, 2, N'vd_valid', N'Los DV son válidos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (277, 1, N'words', N'Words')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (278, 2, N'words', N'Palabras')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (279, 1, N'writer', N'Writer')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (280, 2, N'writer', N'Escritor')
SET IDENTITY_INSERT [dbo].[controls] OFF
GO
SET IDENTITY_INSERT [dbo].[dvv] ON 

INSERT [dbo].[dvv] ([id], [table_name], [dvv]) VALUES (1, N'users', N'-1803270082')
SET IDENTITY_INSERT [dbo].[dvv] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([id], [user_id], [start_day], [end_day], [id_number], [birthday], [deleted]) VALUES (1, 1, CAST(N'2021-07-20' AS Date), NULL, N'11111', CAST(N'1996-02-27' AS Date), 0)
INSERT [dbo].[employees] ([id], [user_id], [start_day], [end_day], [id_number], [birthday], [deleted]) VALUES (2, 3, CAST(N'2021-07-21' AS Date), NULL, N'22222', CAST(N'1996-02-28' AS Date), 0)
INSERT [dbo].[employees] ([id], [user_id], [start_day], [end_day], [id_number], [birthday], [deleted]) VALUES (3, 4, CAST(N'2021-07-22' AS Date), NULL, N'33333', CAST(N'1996-03-01' AS Date), 0)
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[languages] ON 

INSERT [dbo].[languages] ([id], [name], [deleted]) VALUES (1, N'English', 0)
INSERT [dbo].[languages] ([id], [name], [deleted]) VALUES (2, N'Español', 0)
SET IDENTITY_INSERT [dbo].[languages] OFF
GO
SET IDENTITY_INSERT [dbo].[policies] ON 

INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (1, N'post_manage', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (2, N'post_read', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (3, N'post_qualify', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (4, N'admin_post', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (5, N'reports_see', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (6, N'type_gestion', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (7, N'employee_gestion', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (8, N'post_delete', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (10, N'backup_manage', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (11, N'restore_manage', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (12, N'policies_manage', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (13, N'Escritor', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (14, N'Lector', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (15, N'Gerente', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (16, N'Tecnico', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (17, N'admin_see', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (18, N'admin_employees', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (19, N'admin_users', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (20, N'admin_copy', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (21, N'admin_policies', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (22, N'admin_bitacore', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (23, N'admin_reports', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (24, N'dv_update', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (25, N'admin_languages', 0)
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (26, N'admin_tags', 0)
SET IDENTITY_INSERT [dbo].[policies] OFF
GO
SET IDENTITY_INSERT [dbo].[post_tags] ON 

INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (3, 2, 1)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (5, 4, 1)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (6, 5, 1)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (7, 1, 1)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (8, 1, 2)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (11, 3, 2)
SET IDENTITY_INSERT [dbo].[post_tags] OFF
GO
SET IDENTITY_INSERT [dbo].[posts] ON 

INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (1, N'My post 1', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, 2, 0, CAST(N'2021-12-21' AS Date), 3, 69)
INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (2, N'My post 2', N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. 

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', NULL, 1, 0, CAST(N'2021-12-21' AS Date), 2, 129)
INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (3, N'My post 3', N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. 

Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 0xFFD8FFE000104A46494600010101006000600000FFE100224578696600004D4D002A00000008000101120003000000010001000000000000FFDB0043000201010201010202020202020202030503030303030604040305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108010401ED03012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FC77D3F4056DBF2D6ADBF85F7AFDCAF79FD8CFF621F137ED71E3A8F4AD1D16D6C21656BDD4255FDD5BA7FECCDFECD7EAEFC1CFF8202FC1FD2FC371AEB936B9AF5F328DF3BDD790BBBFD944AFAEC463B09879FB37ABF23C5C3E5789AF0F6AB45E67E1B43E17DBFC156ADFC26B332AECAFDCCF167FC1BF3F06F528DBEC175E26D2DD97E5F2AF3CC5FF00BE596BE37FDB1BFE08CFE2DFD966C66F10E8B77FF097785E1F9A792383CBBAB34FEF3A2FDE5FF696AB0F9861AABB6CFCC9C565789A30E7DD791F0E697F0F5597EE7CB5B36FE0148F6FC95E85A3F857F76BF2D6B47E13FF00636D71E2A9FBC793F583CD74FF0000F9D22AEDFF00C76BACD2FE1447710AE63DD5DA683E0FDD327C95DE68BE11F2EDF76CA9C1E16F2E6397118A6A2784EB5F085218BE58FEEFFB35CADE7817C966568EBEA2D6FC1EAF6ADFBBFF00C76BCE7C41E1168EE19552BEA303479BDD3CA9639A91E33FF0AF56F2655D95337C1B591BFD5D7AB689E0F66BE5F92BB8B5F02ABC2ADE5FFE3B5EAD1CB60CE7A9994A3B1E07E1DF852D1DC2A347FF008ED7A97827E0BACCC9BA3F97FDDAEE341F00AB5F7DCFFC76BD73C0BF0FD5553E4FFC76BBE38585389E562B349773CFFC33FB3FC722AB797FF8ED6FDF7C1DB7D2FC9B75855EE266DA8B5ECB716B69E0DD1DAE26DA1B6FCA0D796F89BE222E9FA925D37FAE67F97FE99AD7CCF1271152CB30FCFBCDECBF53EB381B85F159E62BDA4EEA92DDF7F23EA4FD8EFF0062FF000BF8561B6D6358B7B7BFD524F9D51D77470FFBAB5F6069B358E8B66891AC68AABF280BB76D7C2BF06FF6AC861B1B785DFE75DAB8DDF76BD424FDA62DDB6EEB9FBCBFDEAFC7A39A4B13275AABBB67EED5725A9878AA305682D91F4F2EB11EA0CCA36EDFBBCD705F17BF65DF03FC72D1E6B4D7B4AD3EE9665DACEF12FCBFF02AE27C07F191FC40DB6391597EEFDEAF67F07CC97B0ABC9B7FBD5A46B2ABEE9CB2C3CE97BCCFCA7FDAAFFE0DD7BF935CBED6BE19F8834B6B79374ABA5DE3797FF0157AF843E307EC93E38FD9CFC40DA6F8C3C3B7DA4CCADB52474DD14DFEEBAFCAD5FD36B4563340AACAACD5C9FC4EF817E0FF008D5E179B47F1368B67AA584CBB7CBB989597FDE56FE16A52A72E8CC6315D51FCCFD8F86D9BF86B6B4CF09B332FC95F7E7FC146BFE093E9FB39B49E30F0325C5F78459FFD2ECDFF00792E96DFDECFF145FF00A0D7CA3A4F85D4EDF92B1F696F74EEA7878BD8C1F0EF8476B2B6DAEEF41F0F796ABB96AE68FE1F5876FCB5D058D888557E5AAFAC1D51C3943FB15634F956B2752B455DDF2D7497CDB52B9DD5A6F9AA7DA5CD396C53B1B5FDF5759E1D877EDAE4ECE6569B6EEAEDBC2B0EEDB41D1873ADD1EDFF0076B5A525AAC91EDDB4CD1ECF6AAD68490AA8A5A9DDCC735A9692ACD9DB5992787D643F76BAABA872D5143A7EEFE1AC39AD23194798E2AEBC1A927F0551B8F01AB6EF92BD3A3D1777F0FF00E3B532786D5BAAD5FB439E544F216F87EABB7E4A21F04F97F36CAF599BC2EBFDCAACFE1B58F77CB5954A9233F6279AAF85FCBFE0AABA97877F876D7A45E68AB1EE5DB59579A1BDD4DE5C71C923B7DD445DCD58C65A995489E55AD787FF0076DF2F1597E1BF0AFDAB54DBB3E6DD5F527C3BFD80FE22FC64547B0D0E4B3B593FE5E2F7F751EDFF00D0ABE85F83BFF044BB9B5992EBC45E298564FBCD0DA45B957FE04D5EAE06A38D452E87978C8C5C1C7A9F25FC2DF85A2E248D992BE96F873F02EEA4B58D96C6665F5589ABEC5F82BFF04EBF08FC319A3B9556D4AE63E925C2EEDBFEEAD7BCE87F0DEC74B8D51218D57D96BED63C41387BB463F79F1188E1CC3D6D711277F23E20F08FC00D4AE157CBD2AF2455EE226ADE6F841258B2ACD6CD0B7A3A32D7DC167E1D86D576AA2AFD2A9EB5E1CB7BA8D964863997D1D7755C789ABA7EF24795538230138DA2E69FAAFF0023E2D5F866BF36E87FF1DA3FE15C47FF003CFF00F1DAFA8B50F83FA6DE4CCF0A496ADE88DF2FFDF358DAB7C196B76F936DC27FBBB5ABD1A3C4B465F1E87CF63380F130D70F513FC0F9D7FE15EA7FCF31437C3B8FFE79AD7B65F7C339212DB17E65ECF59B2782EE164DAD0EDF735EAD3CC2128DD48F91C464D8DA33F672A6EE792B7C3B8CFF00CB3FFC76987E1DC6BFF2CD5ABDA2D7E1C4D77F7559FF00DC5AB91FC22B8957FE3DE665FF0080AD44B38A30F8A67751E19CCAA2BAA6FE6783C9F0F6341FEAD6A8DD7C3F4FF9E6B5F43C9F0766DBFF001ED27FDF554E4F8372193E6B391FFE054473EC32DE4747FA9D9A3FB3F89F3A5D7C39F3B72A43B9BD96B96F117C19B8B8DCC966D5F6568FF08D576F991C70AFA05ADD87E0EE9B305DC9BAB9EA718429CBF771B9EDE0FC3D9CA37C4D5E5F43F3735CF813791B33B59B7E0B5E7DE2CF866D67BD5ADD91BDD6BF58AE3E01E95791B2F97FF8ED79CFC54FD8CEC35FD3E468618D9B6F50B574F8DA1525CB5A3646F88E039C63FECD56EFCCFC97D7BE1FACDA86DF2EB5BC3BF0BD19959A35FF00BE6BE89F8C9FB2EEA1E03D799D6DD9EDF77F76B13C33E0969E758D2367766DBB02FCD5EEC71342B43DAD37A1F198FA38AC2CFD8D556672BE17F8671AAAEE8EBB6D3FE1A4620FF56B5EBBF0E7F667D635E851BECBF674F75F9ABD36C3F643BEFB32EE99B77FB95CB2CE30D4DD9CD174721CD2BC79E1499E71FB1FFC13D1FE06F83EC747D16D56186355695C2FEF267FEF337F1357D75E0BBE61668BD3E5EF5E29F07F4D48ED519D957E5AF6DF0DC29F665FE2AFC970FACB9A7B9FD158B717EEC7A1D3FD96DEE991F7CD237F16176D677883C376FAA59C96F342D243326C7575DCACB5A565FBB5DABB997FDEF96AC79219BF87FEF9AEED0F379AC7E3EFFC1423F62D8FF67DF8BCF7FA4DAF97E19F113B4F6E117F776B37F1C5FECFF796BC83C2BF06AF3C5170A96D0FCADDEBF67BF68CF803A57C78F87B73A3EA10AC8BB96589C7CAD0BAFDD65AF15F877FB24F86FC0ABF359EF9A3F9583D774B36E5A2A0D6A783FEAF42AE21D5BDA3D8F8EFE1BFEC3EDA95BA4975232EEEC16BD09BF61B861B3FF47B89164FF6ABECAD2FC0F6308448EDA34FEE80B5D368FF000B6CEEFEFC7BDBD057974F30C4C65CD167AD5323CBF92D289F993F123F671D53C236F26F87CE8D7BA2FCD5E2BE20F01BFDA997C96DDFEED7ECE78A3F675D2B54B5659AC5BCB6AF3DD43F625F0FFDA1A64B3B793F8B12441ABE9F2DE28F631FDEC2E7CB63382E9D59F3D0A9647E4FE81E0165BEDCD1B7FDF35DC43E0D0B6EBF257E8DAFECB7E18B7F91F4BB55917EF0F296A96ADFB21F857568DBFD0634DDFDC5DB5EBD1E35C3FDBA6D1E4623807113FE1D547C0BE1FF0006A7DB3EE57A6683A25BE8BA7B5C49F2246B9E6BDE3C45FB0A7D9646B8D264646FBDB1FEED792FC64F829E32D0F4F78FFB2A69218FFE797CDBABAF1DC5B838615D68BBBEDD4E0CBFC3BC757C6AA15ECA1DCF03F8B9E3E9B5DD499636DB0C7F70579CEA8AF79223BFCDB7E6E6BACD7B47B9B7BF912EA1921995BE649176B2D616B56EB1DBEEFBBB6BF08CD332AB8FC43AB5BAFE07F54F0FE4F87CB70B0C3E1D59231EC7C4571A55D33A332AAF60D4BA97C62BF565559A4DCADD9A89A186F17CC8DBE6FE2AC5D43C2EB753EF56F97EF572468FF29EB5494652F78FB13F63DF8911EBD6B6FE649993E55F9DBF8ABED6F08F8A9174F8913E64FF00D0ABF26FE03F8FE5F87BE2A8E36959636EFB9BE5AFD1BFD957C750F8EB49866F3372AAFCA2BD8CB7957BB2DCF96CD7072E6F6BD0F77D0DA4D4BE645665ADA9BC3B7D35AAED8F637A86F9A8D1E68F45B387CCF9166F990FF0C95D258EA8F748BE5C333FB846AF6E3874F767CD56ACD4B9A0B43CE7C59E1F4D5B47BCD3754B58EE2D6F2268A789D772C88CBB5976D7E4A7ED71FB2DB7ECDFF17A6D3EDF749A26A0AD75A6CA7FB9BBE646FF00691BE5FF00BE6BF6AB5A852E97FD22D64555FEFA357C7DFF00053AF816BE2DF82726B7609F6893C3B2FDB55C2FCCB17DD957FEF9F9BFE035C78CC1C9479A275E0F10A52E567E6BD9E98B1AFCB565ADD563AB70C7F2AD2DC5BFCB5E1F31EDFB339BD6A4DAB5C7EB133166AEC3C410ED56AE3F528F3256F4E465523CA33458DA49D6BD2FC176BBB6579F787E1FF485DD5EA9E0BB7FBB5D51151D0EC349B1DB0AFCB535D5BED5AB9A7C3B635A75E47F2D1CA74731CDDC2E64AB1631EE6A5BCB7DB27DDA974F87E65AE3915B9ADA75BAB7F0D6943A7AB7F0D57D361FBB5B10C7F2FCD473132899D369BC74AA17562BB6B7EE0285AF4EFD9FFF00669BAF8937B1EA9A85BCC9A3C6DB9136FCD74DFF00C4D3E594B4899CB960B9A4731FB3EFEC8FA87C6ED492EAF1A4D374356F9A72BFBCB8FF00653FF8AAFB9BE0EFECBBE06F85D631A697A3D9B4FB7E69E44F36593FE04D577C0BF0A2FF004F8615B7B35B786345544FEEAFFBB5DDE93A3CD6ACD1DC232BA8EBF76BD0C3E0D43E347878AADCEFDD66C68DE1AB5F2D55638D17EEAE056C47E1986DE3F93E56F4ACED1EF24B390A372BFC26B566D4B6DB336E5AF4BD9FBB767915A32520B7DB6F36DDBF85685BDD2AAAB7CAD5CA5E6B4B0EE6DDFF008F532D7C48BBF6B3EEF9688D48EC652A3D4ECBEDCB556E3525F39AB9F5D799C7CAD556E35A68E4DCCDF2D152A04689B97178049B86DAAB7DAE7CBB517737A9AE375CF1F47FDA496B1C8BBBF89B7555D4BC6D1DAAA8F33EF3766AE78D43ABEAB23B8B1D264D7A4DB70CBB7D056A47F0EECE155668F77B9AE7FC0BE2A86E1936B7E35E99E725C69E8EACADBBD6BB28C9B8FBA79F884E33B1CCC3E1D8EDDBE455DB5623D255AB5E3B556A89BF76DC56DB13CD733FFB297FBB449A3AFF0076B4BCC5FE2A64972B5999C798CA7D1D3FBB4F87495FEED5B92E1596ABC9AB476BBB737E141A728EFECBFEED57BCB3D8ADBA992789999B6C68D504C2E350FBEDF2FA54F315CB6384F895F0EF4FF175BC91C90C6D232FF76B88F87BFB2BE95E1ED61EE9EDD59D9B764AD7B9C3E1E5DBB997EF55C874D48D7EEAAAD7453A95611704EC99CB5A8D0A93552A42ED6C63E87E17B3D361558E155DBFECD6AADBC607DD5A924B8B7B5FE35FA0A84EA2A7EE29DBEF5972A36E6933F3D7E00FED0D6DE26D2EDFF7ABB9955ABE9CF877E304D4214557DDBABF047F657FDB4AEB49BAB157B96F25B6EE05ABF55BF64BFDA0A3F1D69F6CF1CCAECC1777CD5E261F15EF72C8FABC66063C9ED61B1F70E9B79E6AFCBF9D69471ED8FF0086B8AF07EBCB750A7CDF7ABBBD2596655FEF7AFF00157B54E573E6251B4888DABF98BF2B3FF7BFD9AE53E21784FCBFF4E857E65FF5A07F76BBB68DA1DDBB76D6EE5AAADD2A5C5BBA3AEF561B5A9D4A778D829D4B4AE799D9ECDAB2375DB5D5785F5A8559155B6AAFDE35CACDA6B595EC967BBFD5BFC87FD96FBB4CB35B8B1B87F2E39A4F71F3570D18C8F42A463389E93AE6B16D756BFBB66DFEED59B65A92471ED65F9AB93B5D56FAF24D9E4B2EEDDF7D963FFD0A9D71AA4D670EC746668DBE6D9F32D75FBCE3CC63EC6DA1A9E2AD361B899644555DDF7B1FC559B6BA7FCDF776FA66A6935C6BCB78D59597CBED5A4B6EAD0A48AB587DA2A9E8BDE2CE8DA5ACDB5767FBC76D27893C336D241B648E36DCBDD6AC6977CDA7CDBB66E4F65A76BBAE35E46CCCDF77D6B58E84F34B9F43C37E33FEC67E18F8D5A2DC24D6B1DB5F6D668AE225DACA6BF2AFF6B4F03EA5FB3CFC40BCF0F6AAB868FE7825FE1993F8596BF6C2D75458E6FF007BB57E7FFF00C177BE08AF893E09278CEC23DB7FE1F7DEE517E69216FBCBFF00B357938EC1C1FBF1DCFA6C9736A90ACA9CDFB8CFCCBD43E327F61DE36D7F977569E93F1D6C356658E699636FF7ABE76D57C50DA837CCD5996ED37DA37C6ED5C7470EADA9F478AC75A5EE9F60685AFC7AC2B08645F3A356689C7F12D7D2DFB15FED18FF000EF5AB7B6B999BC96DBD5BE56FEF57E697847C6DAC6877C8F0CD22EDF996BDDBC23F1324D73494BA4DD6B751FF00AD41FC2DFDE5FF0066A71385A8973C0D7038EA159BA15BA9FB67E01F8F967E2A86365BAFDDAFDC4DFF0076BD53C3BE3CB3BA646699B6FAEFAFC33F06FED93ADF812E9516EA4645FE1DD5EEBF0C7FE0A8ADA7AC6B79332B7F112D5581CCA6DF2545A938DE105CBCF4649C4FD6FD67C510C91AB4371327D1DAB8FF00195C58F88345BCB1BF48EE2D35289ADE71B57E6565DBF32FF17DEAF8223FF82B6785EC61DD79ADE9F6E8BFF3D2E917FF0066A3C4DFF0537B6D534369B4775BA9244DD6BB1B746CDB7E566FF67F8ABDAAD52A7B3E6942491F2F2CAD5397229C7997F78F9C75AD25741F136A1628FE6258DD4B6EAFFDE5476556FF00C76A0B88F6C750D9DD3DE5C3CD2333C92317763FC4CCDB99AA7BC936C6D5F3D289EBC3E1F78E67C411FCAD5C4EB12AC7237CD5D8F892E3E56AF37F146A9E5337CD5AD139B11235F41D4156E17F86BD43C17A92ED4F9ABE77B7F172DBDD7DFF00E2AF40F07FC4058E34DCD5E846271D3AC7D11A7EAC8B1AFCD45D6AAAC9B55ABCCF4DF1E2C91AFCF5A96FE3059BE5DFBA891D71A973A7966F30D68E971EF7AE5ACF56F39BEF6EAEA74193CC65AE3A9F11BC64745A7DAE157E55AD058F6AFCD4DD363E169DAB5C7F67E9B7132AEE686267C0FF00656B2E6B447BCB94F6CFD9CFF65793C6D716FAB6BD1AA69FF7E0B792558FCE5FEF3EEFE1FF00656BEDEF87FE17B5D16C6DE1B5B385A38D554795B5957FE02B5F0BFECD3FB5769379A3DB23DC47E76DF98BFCCDFF007D357D55F0B7E3069BAA6C7492166FE2AF4F2BC65270BA38B34CAF149B723DFF004D8E1DBB553637F74D53F165BC72469B7EF37FB35534DF1B58EAF0C6C8FE5B2AED605F77E4D4DD73C456B6F3332C8ACAA3FBD5EBCAB45E87CBD3A7253D8AB1C8B6FB95BE6DABD6B3F50D5BECE8FF003FC9E9BAB07C4DE3EB7859FF007CA8BFEF5791FC54FDA3B4FF000EE9B36EB95448D7E6777F96B2AD522A3A9DD4F0B3A8F63D1BC45E3A8D246456DDFC3F7AB274FF00186E6F39A6DBFF0002AF8A7E2F7EDECBE1FD3E4FECB46BFBF9376C03FD5C7FED357886AFFB7F78CE6B76447D9BBD2BCB96323197BAAE7AD4F25A938EE91FA9F27C5EB3B15DAF711FFDF55CAF8F7F68EB1F0EE877374D731AC70A3331DD5F955A87ED85E30BC2EED732337DEC6EAF31F8C9FB5A78D3C55A4CD60F752470C9F2BEC6FBCB532C54DFD93AE8E431525CD247E8BFC3FF00DAC1BC61E24B8BC5BADCB24BB5519BF86BD1759F8C125C796E8FF27F157E6B7ECDFE3EBA92C6DD12655685577E5ABEBDF86BF13347BFB74B7BE93CE76C705BE5AE7C3C5A56933D4C6E16945A7047D43F0C7E39793246CF26E566F9BE6AFA1BC0FF00133FB7ACD1636565FF007ABE31F07EB7A6CC8B1C36CA8BED5F42FC1993CBD3E3D9F2AD7AD83A728DF53E4336A349EA9599F40E93AC34D1EE65A9B77992B6EAC9F0EAB35BAD695F48B6B6ECDFC5B6BB247CEF2FBC3669BCB6FBD546F2F847FC55C9DAF8E2E6F3C45796BE5C9E4C2DF2C87EEB56947E65FB7CBF35614EA732BA3A2547D9EE5DB8D51EE1311FCBEF4B67A3F99F349F37D6A4B3D2648F6EE5DDF4AD4B5B7DBF2EDAE98C6E73D490963A3AAFF0EE5ABD1E9E915496F0FCAB5CE7C5AF187FC21FE1891A3655BAB8FDD45FFC5554A3151E66631939CAC88F5CF1824778F6D6ACBFBBF95A4FFE26A8C370DA948AACECDFF02AF3BD1DAF24B7DCCEACDF79BE6FBD5D17872F2E2D6E119D5BE6F9B86ACF9A5CBA9DDF574A3EE9E8167E1746B7DEBF9FF0D3CE96B0315CE3EB53E9BAB2BE9CAADF7B1DE9B25D166E18FE35A1CB194BA9FC63F8675EB8F09EAC8E8EDE5B37CC377DDFF6ABF40BF60DFDB921F8571A47A8CBBE3F97692D5F9E575730C8BB98EDAEAFE0AF8923BAF1C69B63349BE18E5573F37DE55FE1AF031D87BC7DA43747D36578C57F635754CFE93FF65DFDA6ACFE2BF86EDEF12368D245F977FDEAFA3FC2FE288E68D195BE5FE1F9ABF2CFF645F8C0B67E1FB58D24545555AFB43E1CFC5A59ECE35FB46C93D0B7CB5BE17112504A7B98E6597A52E6A7B1F56AEA16D7167BB7C2AEBFED6E6AC7BAD52366655915BFE035E49FF0B816D6D7E6DCEDB7B7CD54ED7E30477375FC51B32FCC0D764B1513C9A7839DAE76DAE2F99E2446FF009E89D7FDDA354D22E21992448557777DCAAB5C6E9FE384D63C596D1AC9FC0CD5EA10C69A969AABBB77FC06960EB29CDD8AADCD08AB9C549F6C8E4FBABB55B6FF00AD5A4BABA76F91524466F46DCB5A77DA4ED91D51E355FF006D6AB5BE93B5999B6FDEF9B63577489F68995A4B36F2D59A49159BD56BB5F0FD8FDBB465DCCB95AC18ED432B6D66DBB7BD6E781D9A4B37FE2F99B8AC3EDA26A54BA2BDC19B4F999151997D436EA8AEED61B88F73AB27BEEADCD66D1176BB6E46F6AC6D49B31B2F98DB7F87E5AA94622A752E61DE59A236E8666DEDF2E0D782FF00C142B4FF00EDCFD9D7C4563729BD26B2955BF8BF86BDE2E6CDF72B2C9B9BFDDAF9F7F6F8BE6B1F83DAAAB48AA9F677FF00D06B9AA46E77E1E5EFA3F9D9B8D2E48F539A1DBFEAE564FF00BE5AB6345F0DDCC8CBB51AB364F12259F8E3524957722DE4A33FF036AF54F03F89B4968D1BE567ACA8D38773D4A98A76B95FC2BE0B93E579936AAD65FC56F88771E0D8521D3F74371FC2E3F86BDF3E1CF83DFC5D677175F67FF468D3729DBF7ABC5FE3F7C3593ED933ECAF72596CD61BDB2EA7CB57CF93C57B08F4395F0CFED012343B752D2EDEE64DBF34B036C66FF80B2B2D7AE7C09FD91F4EF8C5F16AF21F126AD736FA4C2C8FE5DAB7CF71BBE6D8A5BEEFFBD5F33C7A6C9672323AED65F96BED4FD9AF56B15F1B3C8D6DE61FB2DBB79BB9B732EC5FE1AFADF0C30342BE633855827A1F01E3471066987E1F72C2D6717E47DB1F037F65CF82FF000A7C1F35AE97F0E7419B569194C3AADE13733C40632087DCA73CF3F2EDCD701FB687C39D1F49D174FD6F4BB3B5B1B88675B79C5B40B12C88FBB6EE55F97E561FF8F57A2F836F13ECA8BE5AAFCBFDEAE2FF006BC6497E125CB6DD8D1CF0BAFF00DF6ABFFB3357EA5C5D93D1FEC8C4A51FB0DFCD2BE9DB6E87F0EF853C4B9B478F70156BE26726EA28BBCB7527669F7DFADFA7656F07D1EEBE55F9AAC5F5D663FEED60697A92AAAFCD53DD6A5BA36F9ABF91E47FAC11A86378AAFB6AB579378DB526567F9B757A278AA66915BE6AF33F1542D33356B44E5C44AE70B71AA4897BF7ABA4F0EF88248F6AEEAC5B9D1D9AE7EEB56B683A3BE6BBB98E3A74E5CC77DA3F8926655F99ABA8D0F5E7765F9AB8FD174FF957E5F9ABA8D26C5832F159CA47A14E8C91E83E19D41A6DBB9B757A17872E19556BCC7C2F1B295AF43F0FDC790ABB9AB8E5F11D1CB63D07499BF77F355BB899245DBF2B2B7CAC0D73963AA2AAFDEAB6352DC2B29480F1BF8B1F0F6FFE1869FA96B7A3EA91DAE97668F74E92BF97E4AFF7777F17FB35C77C1BFF00829F6A5E04BA8D65BCBA5855B736F4DD5D4FEDE5A84927C039A346655BAD52CA27C7F12B4BFC5FF7C8AF967E1FFC12B1D7AC95AF25BC5673FC0318AF3B1149FC50D0FDB3C3ECAEB67386942A479EDDCFD3EF84FF00F0590F0DEA5630C377AB5AC772DB570CFE5B67FE055E8FAC7FC14FAC66B3DD1B799B97E521BEF57E55695FB2B59CDABC3259DE5E4D246FBC45226D56DA1B6F3FEF6DAFA121F0F476B74F6F6F6D0AAC6EC9F7777F157561638B9AF8CF0F8EB87F2EE1FA90FADD27EFDED6F2B7F99F41F8ABF6F0D5BC50CCB66B22AC9F7496F96AE7C2CF09DE7C4AD412FB5A79B52666DEB1CBFEA97FE03FFC5579B7C29F84326B9AB432488CCABDB6D7DA1F057E18A69B650AAC7F757FBB5F5D94E58E6F9F11A9FCF7C59C611845D1C1AE45E5BFDE4DE1FF00D9F744F11682D6373A559AA4CBB58A40AADFF7D57CDFFB4AFF00C12CF585135EF85E692485B732C1FDDAFD07F09F84FC98D3E5AED74DF0F8F2F6B2EE5F4AFA7AF82A1523CA958FCAF0DC4B8DC2D5E7A533F9FDF1E7ECF3E2DF86B7CF1EA761A95BAAB75D8CCBFF007D5701E24D3E65859583337BAD7F469E22F81BE1EF185BB477FA5DACDBBFBF12D7E7B7FC152BF621D3FC27E11B9D6BC3BA5471CD6FF3B0853EF2FF001578588C9E5183945DD23F42CA7C4455270A5898DAFD4FCE9F83FE209341F115AB3B3796CEAAE2BEBAD23C277161358EA162D0BC3232B7F7ABE41F877A4BEB5E2448597636FAFBF3F679F0CFDB3C331D8DE36E650AC86BC2A74E2E4E07E9F5318E34A15627A17826D6F8F92EEF1AAB76AFAE3E0ADBF93A4DAAB32FDD56E2BC13C3BE0F5B68E15DAB5EF7F0AD7EC76B1AEDF97EED7A9463B9F2998623DA247B7E82DE55BAD637C42F17259325B2BAABC9F7BFDDAB1A5DF34766ACDF2FCB5F30FC7EFDA36D7C3BF11AEADE499552DD953EF7DD6ACB1D8854A0AE79B97E1655EA38C4F7097C456F1B2C6BF7BEF715D8782D96F0AAD7C4B6FF00B565AC97DB5AE959B72F46AFA0BE07FC72B7D5BCB65937FB9A9A78883B23B71D96D6A74F9A48FA39749410FF0075A9AB6AB1AAFF00796B1EC7C650DE46BB5F6BFF00BDF2D5BB5D5BCE93AFCDBABD03E7F9645D999638599BE5AF01F8B5E2493C59E3268D7E7B7B3F957E6EF5ECFE3CD6BFB27C2F7337F16CDABFEF578EE93A1FDB3F7CE8ACEDF33075A996B2E53A70B68DE645A52FD9EDD767CADB7A1ADDD1EF1A455F97E6A7C7E1D456F9563DDE9572C7C3BE4B6E54DBFEEB56DCB12BDB1D168F7D2476EAACD27F771F796B595B70DDF3AE7B1AC3D3E38ED5776D6565F56A75D788BC9936E40FA54C8CF7F84FE2AEE2E9DBF899ABA4F83370F0F8C3CEDDB76A7FECD5CFCD6FCFDDADEF866CB6BAD48EDFC2ABFF00A1579553589E9E1E569A91FA6DFB2BFC425B0D16D7F7CA8CAABB72DF7ABE9DD37E3B3D8DBC6C971B1D7E5C06AFCEBF80FE3092E2DE344660CABF2946AF67B1F1F5E5ADC2AB36FDDDB75654E9DE27D4D3E5A9F11F6EE81FB473FCA935C6F565FEF574FA6FC647D5245FDE2AA37CAA6BE36F04EB325EFCF27FBDF7ABB5BCF8C09E15D35E469153C9467C7FBAB59CA9F244A96160DFBA8FB27E0CF8E9B58F185CAA379896FB6267FEEB7DE6AFAA7C1B7CD369E8ACDFC35F0AFEC1F78FA8780E0BCBAF9A6BE76BA727EF333FCD5F6DF80EEB75A22FDDDD5595C779773E6F37A769F27637B508D36B776F52B505ADAF98BF2B2A37A7DDABB243BBFDADDDFF00BB52DBC2AB26DFE2FE2AF624787CC66DF5BB4303332AB36DA6FC3CBA792D9BFDA76FFD0AAD78897658BFCDBBE5AA5F0D6165B34FF6BE6AE797C68DA1FC36755A832CD16D65DCBEF585A869E9249FC48CBE95D25C5AF9CBF76A9C966A1ABA2473D3D0E56F2C1E36F919597DD6BE41FF00829B6B92693F08F5466F97744CBFF8ED7DB1A85AF96ADBBFBB5F9F7FF058EF133687F067556DDB556076C7FC06B391D98797BD73F0FE4F09C7A86A97170ECBBA6959FF00F1EAF4BF827F08E3D7B548D17E6F996BC7F47BABCD4AE91559B748D5F79FFC13DFF67FB9D61ADEF2E63665F959895AC30387F6F5D53823AB36C7470785752A33DA3C03F0663F0BFC3186111ED7917737CB5E1FF1C3E14ACC64FDDD7DDFAF784D6CF4B4B744F9635DB5E25F14BC0AB751CBF26E6FF76BF51FABAF64A91F83D1CDA53C53ADDD9F9BFE3AF85ED6775232A7F7ABDB3E01AFF67FC4CB7D8CD1FF00A15BF4FF00716B7BE277C375F3A4F92BE84FD8DFFE09EF63F19BFE11AD797C41A869B26A160BF6A4112491C7B199155176EEFE1FE26AD385B1986C9F31F6D5F44D1D9C6583C4E79934F0B86D67E6779E055F32C62EFF002D73BFB525BF99F05F5E6FBCD1DAEFE7FD9746AFBD3E1CFF00C1327C2BA6D846B73E21F115E32AF61145FF00B2B57987FC151FF638F0AFC1AFD86FC71E22D164D61F52B182DD3373741E3647B8891FE5C7F759ABEB33EE3ACB6B60EB61E177CF16B6EE99FCE7C21E08F12E138870B9955F66A14EA466FDED6CA49F447E5058EACDFDEDB56E4D5BF77F7AB95B1BEA9E6BE6F2FE5AFE62944FF452150975ABC59375729AA42B248D5AD7970D27FB559B70AD5AD38D8A8C79CCA5D1D1A4DD8AD5D2749D8CBF2D1671FEF3E6AE874BB746C7CB5B729E961F0A59D1F4D5555F96BA1D3ECD576FCBF2D56D3E158F6B56ADBB2BAFF768F667A31C3FBA5FD32F05AB56E58EBDB76FCD5CBAFCCF566DD5BE5AC2A5339AA51B1DDE9BE22FF6AB5ADF59F317EF5707A6CCCBB56BA0B199B6D714A3638E5A1C17EDB174D37C19B7DBFF00419B2FFD0DABC8BE1BB49F614F2DDBE5DBB81FFC7ABE83F8A5F08750F8E9E1FB3F0F697716B6D7526A36F70AF71BBCBDA8DB9BEEAB7CD5ECDF02BFE082DF15B5FD1A1BA6F12782EC6193E68FCD9266936FF0FCAA953F55AB563FBA85CFDCBC2BE34C9B24C35459A5754DB7A5EFFA23E6AF076F5BC7DAFF003AED65FF00BE5ABDEBC17E07FED4F115C7C9B97CF7DBFF007D57BC5A7FC1017E24D8C45D7C6DE09DF8FBA22B9FFD0B1597F08FC04D1EBD729246ACF0DC3C4DFEF2B6D6FF00D06BDEC9F03579ED5558F84FA41F1F64D9AE1E84F2AC42A8E1CD7B5F4BF2F74BB1DD7C18F85696FE5B7975F4B780FC22B6B0A7CB5CBFC31F09AC31C7F2FF00E3B5ECBE19D1D638D7E5AFB88C63089FC4B8AC64EBCDB917741D1D638D7E5AE82CECB057E5A7E9D63B557E5AD18EDF6D4CA438C7DD215B5DAB5C7FC60F86363F10BC27756B790AC8B246CB82B5DBB458A86F21F3AD9D7FBCB4465D0AE56CFC31FDA3BF675B5F807FB4E24362BB2D7509D99502FCAAD5F4DFC17B35D3E4B7DCABB1957F86A8FF00C1563E14DC683F10345F116D65861BC5463FEF55CF853A8C775A6D8BEE5DDB57A57C9E2A9C69E26A247EF1C358C9E2726A539BBB8DD3F91EE9E1F851A45F9ABD4BC0370B1AA2FF0076BC73C3FA9EDDBF77757A7782750DCA95A530AD4CF5F8EF3CBD3DDB77F0D7E3EFED9DF162E2EBE3778BACBCC6DD67A8B71BBEEAD7EBB69F22DC697F37A57E23FF00C14537FC3FFDBABC456327C90EB912CF167EEB3579B9C53BC637EE7B1C2328C2B54EF6FD4E56EBE2CEAD66CCF0CCACCBFED7CD5EADFB3CFF00C141354F06EB91C77CFB93E55C13B6BE6FD6AF1ADF6BAAFDEF96B91B8D5BCCBE57F3234656ED5E654C3C9A5283D8FBAF6B46ADE1595D33F773F67FFDA8ADBE2568F6F711DC465995780DBABE8CF08EBE9790ABEEFBD5F907FF0004D7F19493491C6D7D2327CBB9057EA57C3FD712D7414767DDB57BD7D0E1E4DD35CC7E639D616146BB852D8DAF8C9E2C5682CEC11FE691B7B01FDD5AC9D0750DD1AAAB2B2AEDFE2AF2FD4BC78DE3AF1F5E5C249B6DEDDFC888FF000FCBF7ABBEF08B4D1AFF000BEEEF5AE1EA73FBE79F529F2C12676B0C3E77FF00B357E1876AEEDD5474D9B6C5BAA69AF9638D8FE95D5CC70F2DE455D73515B38DD99B6AD78FF8DFE39DAE85AA794D711C79C9C138AEB7E27F89174FD366791F6C6ABF37FB35F88FFF000538FDBFB5CD37F68CB8D23C2974D2DBE92862B9287204B9191FA57998CC44A09729EF65B838545EF6C7E5E49675A1E1187ECFAB6DFF009E8BB6A9C9355CF0BCEBFDB56EADFC4DB6AA51F74E3A5F11F55FECE3A6B5E69A8EABBB6AFF0076BBFD53C40BE19D4912666699BEE8AE4FF66BD6E1D0747DECBBFE5AFA23F67FF80F1FC5CD51B56D4ADA1685A5FDD07F9A4DBFEEFF00769D1A72A905086E7D361E5ECEF39EC677817C4D75AC69AA96B6334CECBD92B90F89FAD6A91EA5F60B8864B792F254B7407F8B737CDFF8ED7E83F807E0AE95E19D3512186DE3555EC8ABBABE25F8FDA7FF00C245FB7336930A7FA2E96EB2B8FE156D8BFF00C5546332F9D1A5CF391D780CC2156A7B3823EECFD886CDA3F09DAA3ED548D55552BECCF07BAFD9D57EEFCB5F277ECC7A3BE97A1DBAAAED5F96BE9FF08DE7976EBFD6A7034ED13E7336973D56CEF63BA591972DB76D4AB751AFCDB99557FF001EAE7AE350DAAACDBB6AB6EC546BAAB5D2AAEDDADFC44FF76BBA523C7F66697882F3CCB19199BF86A6F87EDB6C6DFE6F976D61EBD75BB4B7F9BF85AB63C1CBE4D843FDE55ACF790E5A40EC9A6FBBF3D56B8BA58FFE055526BCF2D7FDAA8A6BEFDDFF008D69291CD18905F5E7991BB357E62FFC175BC40963F04758F9F6FC9B7EF7F79ABF4B357B8F26CDDD9ABF21FF00E0BEDE28F3BE1CAD8237CD79751458DDFED6EFFD96B3948ECC3C6F73F37FE00E8ABE29F1758DB226EDCEBBABF64BF64DF8736FE0FF0000DB32C6A8EC8BFC35F9B7FF0004EBF82AFAD78BADEEA48599159792B5FAC9E15B55D1741B7B7FBBB516BE9B8570F28C1D692DCFCFFC44CC936B0F0649AE59AC91B579AF8EB4159A37F96BD42EAE1648FE65AE47C550AC91BD7D844FCAE9D4B1F31FC4EF07AB076D95F587FC13563FB3F837C3B1FCBFBB8A64FF00BE676AF01F8996A9B24F96BDCBFE09E3AA25AE83A5C6EEAAD1DD5C45CB7FB7BBFF0066AF073E8A4A0FCFF467E81C2F55D4738F97EA8FD16F0BAE2D52BC13FE0AFDA7FDBBFE09BDF1597FE79E9314DFF7C5D40D5EE5E15D4236B14F9D7EEFF7ABC73FE0A8D0B6BBFF0004FBF8B56B6E8D3DC4DE1E9B6451AB49248CAC8DF2AAFDEFBB5F3B5BE167D661B4923F9FDD3E5ABCC8CD1EDACDD35B7337FBD5B9630EE5AF8B9E8CFD228EC67B58B48D49269BF2FCCB5BD1D8EFFE1A57B0DDFC34E9C8F4A89810D87CD57F4FB568E4AD28B4EFF66A68EC76FCD5D31A87AD4E5126B1F9556AFC31B3556B58D576D6A58C4ADFEED69ED3DD3A3DB1259DBB65772EEAD6B5B2CAFDDA2C2C776DAD8B3D3FEEED5AE7A950C6A54E620B5D3F6B7CB5AB636BB57EEFCB535AD9FCAB5723B7DAB5E75491E7D43A3F82F0EFF89DA2AFF0B4FB7FF1D6AFD8AF806BFF00148D8FFB8B5F8F3F05FF00E4AC787D7F89AF157FF1D6AFD81F80370A7C2163F32FDC15EFE432D248F8AE25D5C4F5251BE3FF008157E6B7C37D17C9F1A6B08C9F2AEA570BFF00915EBF49E0915956BE15F08FC39D56D7C69AC4CFA6DE24726A370EAE622AACAD2B735F49879454EF267E799DD3AB2A3CB4937E8AE7AA7C3FD2D5608DB6D7A768766AAABF2D71BE09D2DED6345746465F55AF41D2A3D8AB5DF29C5FC27C3C685483B548F2B34ED61558D6A5D8688D76AAD3EB0E63BA3119B7F869ACBBAA5A6EDF96A80F927FE0ADDF0ED35BFD99750BF8E35692C6549F3FDDDAD5F1BFC09F14799E1BB76666DD1EDAFD24FDB7BC2ABE2CFD9A7C4F6ACBBB759BB7FE3B5F947F057527B3B3FB337F0FCB5F2D9BFB98B4FBAFC8FDA7C39FDEE5D5697F2BBFDFFF000C7D65E13F1124D1AB2AFCFBBBD7A7F81F5E0CCAB9DAD5F37783F5E78E38FE7DDB6BD73C0BAD3493232B6DA54647BD8AA363E98F0CEA9F68B30BBBF86BF223FE0E06F05B7847E2E785FC5B6E8C9B5FCA95C7F76BF557C03AB2C91AE5ABE2FF00F82F17C254F885FB38DC5EC71EFB8D3DBCD52168CCA9F3D06FB6A72E495BD863927D6EBEF3F34750D59752D16399776D9137572179234936EFBA1AA7F85FAB36BDE01B5591BE78D7637FB2CB52DEE92D6EC776E6AF321AA3EB65539647D33FB02F8C1F41F165BC6CF26C6655C0AFD47B9F8A0BE1BF8377FA833EC586D5994EEFE2DBF2D7E347ECF3E2A7F0BF892DA65664557DCD5F5FFED3BFB595BF857F65B644B8FDF5D344BB437F0AB2B3574D3A9CB464FB23C3CDA8BAB5E9DBA9F53FC07F175B5F6870AC9B55DBE6CC9F2B33357D01E0FB858E35D8DB91BB8AFCAEF81FFB6B4DE0FB7B54B868EEAC64DACB9FE1AFB4BE0BFED5DA2F8AB4B866B5BD547F97746CDF76960F30872FB3D99C799E5B561EFDB43EB15BE5B7B75CB63DEA36BE8DAD5DDA48D7EAD5E5771F19ADAF2C7E5995FF00E055C56A3F1916E2EDEDA499BECF27CBF7ABD2F6C944F1E8E16724627EDFDFB57F863E01FC24D6F50D5352B5478E0758A1F35774D2EDF95457F3CBE32F8850F8D3C53A86AB74CAF35FDC3CEC4B7F78E6BECDFF008385BE06DBF8775CF0BF8E747D4B506B1D719ECEF2D1E766823951576BAAFDD5DCAD5F9A7146E57EFB579D2E6A92BCCF628D48D25680CBA68F6EE565AAABAC269F7092237CD1B6E5AC8DB232FDE6A3ECECDFEF5761E2F348FB7BF6335D37E226A1636D349B6DAF97E6F9F6EDE3E615F7EFC01D723F04E8B6F6B716BB523555DE8B5F8A9F0B3E2E6ADF09752F3AC24DD0B1F9E276F95ABE9BF85FFF00056CD6BE1FDAA2B5B7DA523FF9617112CB1FFDF5F7AA70B5254247BB1C642AD3B49DBC8FD8CD3FE23585D58FFA3EE91F6FCA817E6AF87FE195DDBFC41FDB87E265C4CFBAE74BD522B4719DDE5ED895B6D7CCDF133FE0BA1F1235CD066D3FC2FA5E83E19799193EDB1DBF993C7FED26EDCAAD50FF00C13EFE2737C33D626D6F52BCB8BAD4BC4D2B5C5ECF2BF9924CECDBB7337F7BE66FFBEAAB30C573D2F7BB99E5F53FDA2D4B6B33F6C7E0DC31D9E9B1AA7CAAAAB5EE1E1999BECABB77357C95FB35FC64B6F1368F0BACD1B332AF1BABEA1F06EA91C96A8CADF797AD2C3CA2E3EE9CF8CA7252773AAB891A6846E66DAB4EB5B8585BF8BEB55E3BEB799B6B2B3B543A85E46BBB622A2AFCB5D7A1E77DAE52CEBDA92FF67B7CDF2B574FE1CBA5FB1A2AB7F0D790F8C3C59F6392CE167566B89D571BABBCF0BEBAAB0AFCCBF3573C65EF9B54A32E43B19AE98FDDF9AAB4FA8328556FCAB364D5A36FF969F37A537EDDF2B337CCBFEED6C727291F8B35858749919BFBB5F8E1FF000598D43FE134F889E1FD2D1B72B5C34AC3FDD5FF00ECABF597E296B034FF000EDC32B7F0B57E33FEDE1E314F127ED4DA6D9FDF68559BFEFA6ACD46329729BFBD4E9739EEBFB03FC2287C33E19B7B8F2D55B6AB676D7D44D36D5AF37FD997475D3FE1DDAED5DACC8B5DFDC36DAFD3B038754E846113F9F73EC54ABE366E617175F2B5725E34BCD4A656B7D1F4D9354BF93E554DDE5C71FF00B4ED5D2C6AD777896EADB5A4F5FE15AE8E4F1069BE10B358D3CB575FBC7F89ABE673FE245866F0F85F8FABEDFF0004FB6E0BE08FAE258BC72F73A2EFFF0003F33C661FD81FC71F18AC5DF5AF1947A2ACCBFF001EDA741E5AAFFB3BDBE66AB7F037F62DF1E7ECCF7D7FA5CD6F75E24F0CEA171F6A4BBB39775D58CDB76B3ED63B995976EE5FF66BDB743F8E9676AD8F3A3FFBEABD1FC23F1DAC186DFB547E67F70D7C154C4FD666AAD5AAF9979FE9B1FB861F07F55C3BC351A11517D12B7E2B539FF02DBF8DB458D52DB50BC923FE14BBB7756FFD06BD53C2FA6EBDA87EF356B8675DBB5536ED5FCAA3B7F8EB63247F2AC2DBBBD4CDF16A1BA5F91D5B77A2FCD5E9FB49B8DA533CA8E57184B9D53B1F08FF00C15C3F60AF0FDAF82750F89DE15D361D2F58D2D967D66DED13CB8350859B699F62FCAB2A6E56665FBCBBB757E76E9D70BF2AD7EB87FC144FF692D2FC07FB33F8C95EF21FB75F6973D85BC6922EEF3675F2957FF1E6FF00BE6BF1D349D436AAAAFCDB6BCAAD14E5781DB1E683B48ED60656DBFC556A1855AB0F4DBCDDFC55B36B23571EC7753A859F27E4AAD71C355F863F33FDAA6CB63E6538D43A2352466ADD3472D6B69375B996AA2E92CCF5AFA4E92CA57E5A3DB1A46A48DCD2999B6D749A7C7BD56B1F49D3FA56F59C3B556B9EA542BDA16A38C28DBF76A4B5B69354BC86DADA369AE2E1D51234FBD2335432498A9FC0BE2E8FC2FE3ED2EE246DABE6ED53FDD35CEE5D642A74E5526A0BA9F4CFC27FF827FDF4D0E9BAC3F8B174DD6AD654BA8E38AC96E608D9595B6B6E7566AFB7BE1EF87EE3408D3ECD72B137F127CDB5BFDDAF05F82BF13AD752D3E1FF00485F993AD7D01E13F135BCD67136F5FBBFDEAFA0C1F2C23CD03C8CD30B6D268EFADF5ABF6B764578D5B6EDCED6AA365E1D5DDF3B3337F153B47F1259EDF99BE6F4AB527892DE3DBB59772D7A128F3FBD367811A7ECFDD82248F418E35FBBBA9B34CB62DBA3F9B6FDE4351AF88164F97754324C2493FAD553938FC06588C1D2AD1E4C446E8D6B1D5E1BCDAAADB24F47AB55CF7D9D7CCD8CDFEEFF00B2D5774DD61E39961B8F995BFD5C9FFB2B57A547197F7667C5E6DC35ECA3ED70BAAEC6A514E5F9BF8A9B5DC7C8CA128EE72BF1B3456F10FC2DD6ED517734D6AEAA3F0AFC77F0AE86FA0F89AFACE6564786E1D187F776B357ECC7C44F15D8F83BC2B79797D24690C713336FFEED7E40F89BE337857E2D7C78F123786EE61912DEE992508DFC7FC55F3BC434F9542B7C8FD4FC2DC72FACD5C27757FBBFE1CEDB43B178597E7555AF46F01EA7F67BC556919ABCA57C509A1C6ACC8CFB7AFCB5BDE11F898D71709B12387E6EAF5E7E17110703F47C760E77D8FB03E1DDE068636DCB5C87EDBDA0D9F8D3E096B567708AE935ABAF3F4AC1F01FC48B7B7D3D5A6B95593D15BE5AE3FF006A2FDA0B4FD37E1BEA11CD711EDF21BF8BFD9AF43DA4274F96E7CB468CFDBA92E87E307C3999741F18788B45DDB56C6F1F60FF00677575D7974195B76DFEF5793E9FE2E8E4FDA435878DFF0073A84AEC3FEFAAF4AD695A1566DADB596BC951B247D5A973DD96F49D75B4D9D591BF8B75627ED29F19AE7C49E15874D6919A38D7A66AADDDE7931FCBB976D79DFC44BA6BA67DD57CB78F29CD5AA5AD23B6FD9E7E352EB1E1DFEC7BC9B6DE58FCAB96FF00589FC35EC1E11F8FDAAFC39BC592D2E64555EC1ABE15BABEB9F0DEB097F66ED1DC42DBB8FE25FEED7B47807E2A47E34D1E37693F7CABB5C16FBAD5353070A9EF1A61B34E68FB291F747C39FF00828A5E7DB21B6B97644FBADF357D35F0C7E3569FF101639249B6AB6DE95F926D70D0CDBE16F997E6AF7AFD957E375F69FAF5BD9B3C8CBB976FCD5AD3E7A5EECF546B528D2AB1F73467D35FF05CAF04D8F8D3F60D4D4AD5195BC3FAA453A9FEF6F5656FFD06BF15AD2EF645D335FB59FF000526F187F687FC1377C48974BB9AE3C95407FBDBABF10ADAE1A28F055AB45AC99F37898F269FD6E4421514C91FCBA74F32AFDEAA9248D337CB5D4791290B24DBAA36F97A53B6EDA8A4932D408B7A4DAFDBAF923DBFC5F357B07857C41268F0DB2ABB2AC7E95E67E0ED3D95BCC65AEBE399957E56DB5CF5A3CC7760EB7B3773EF0FD8C7F6AA7F0FEA9636D34DC7CAB92D5FA53F0CFF0069CB76D3E1F999D5957945DD5F80BE11F165C68374B242EC9B5ABE86F863FB767893C0F6E91ADC33A2AEDE6B8E3ED69CB962B43E86A54A18982BEE7ED75BFED31A52CCABE6489BBD5596AD6A1F1F2D4E9AF2470DD48CCBBB846AFC80B3FF008299789A693E66565FE1ABBE22FF00829A7885BC3EE925E490AAAFCCE2BAEA6227CBB338BEA349CB9933F403C49FB4626A5F19B4FD35A658DADD5A578D9F732EEF95777FE3D5F4E7C2FF001C43A969F1EE6DFF00F02AFC17F833FB654D71F10EE356D56E2476BE7EAEDF32AD7DE9F007F6D6B65B345B7D6EDE4FEEC73B6D6FFBEAB8A9E23967EF1D988C1C6A515ECCFD34B7D6ACD957746AACBDE9CB7D1C91B34736DDDDABE2EB7FDB3AE9A68F64D67709F7711CEBBABAFD33F6CBB1B3D359AFBCCB7915777F795ABBE58E8A8EC7932CAEAAF78EF3F6A6F8996DE17F07DD3C932C6CABFDEAFC69F1878F6D7E2E7ED7DE742CAE96BB62C8FEF6EDD5ED7FF0541FF828725E68771A7E933334971B916BF3AFE10FC58B8F0578FA1D5A476776977CA7FBDF352A18A4EA4672D8CF19839FB0F671DCFDDDF82F6BF63F01DAAFFB0B5ADE24D723D16D77B7CCF236113FBCD5F0DE83FF00056CB0D07E1EDAD8693A2DC6A9AB6D555CFCB1AD75FF00F0D57A96A1E13B7BED7A4857529A1DED147F2AC3BBE6DAB5F7399F1261A8E1B930D2E69BEDD0FCA724E01C6E2B31F6F8D8DA9465F7F91EFB75F142DF43BA777997CE65DEC6BC23E377ED6896F34CAB70CBE5B32E4357857C46FDA91BEDD23A5C36D65DBF7ABE7BF895F1A24D7AF24DB237CCDBABF2EADCD55368FE84C1D1A1412BFD93E9A87F6C4B9599F75E32431FCECFBBEEAD5AF05FFC146F54B5D4957CBDF6FBFE53E6AF98ABFF0002AF892F3C517535ABAF98DFBEDCB8DDFF0002ABFE19B99A4D9F33572D1C96ACDF35CF729E6F85D99FA71E11FF00828D5CC8B1EDB76B87F479D57FF415AECA3FDB5354D4ACA49BED36FA7DBAC4D2DC4AEDB62B74FBCCCCDFDD5AF837E0AF83750D6BF7CAAC90C2BBE59E46DB1C2BFDE66AA9FB437C5A6D73C36743D16465D1236FDFDC7F16A0EBFF00B4D7FF001EFBD5EF617279C23CD51B3E7F3ACFF074A1FBA5766C7ED5DFB615E7ED15E334B7B59AE13C37A5BB7D8D1FE56BC7FBAD70E3FBCDF7557F857FDA66AE1347D57EEFCD5E5763AA34536DDDF76BA6D1F5FF00BBF354D489F231C439CB999EB5A2EA8ADB7E6AEA34DBB56DB5E55A1F88D7E5DACB5D968BE2056DBF3FCD5C35227A546B1E8162CACAB5763815FEEFDDAE6B4BD717E5F9AB5ED75A5DDF796B0E53BA350D8B5B15DDF76B52C60457AC0875C4DDF797EB56E1F102AB7DEA394D3DA44EBAC42AD682CC8A2B8EB7F152AAFDEA593C62857EFD612A61ED8E8F50D4942B7CD5C878BB54924B756B72BE742EAEA0FF001553D5BC66A15BE7AE3F5EF192B6EF9E88E1EFA339E58C74E4A71DD1EEFF00087F6ACB9F0CDC5BDADC3C91B47CAF98DB597FF8AAFA87E1AFEDB891C6B0C970BB95718DFB95ABF34EC7E2B4DA2CDB1A1B3D4AD5BEFDA5E44B2C4DFEEFF1237FB4ACB5D6786F58F0978D23486C6E26F08DFB7FCB0BB95E7B190FFB337DE4FF0081AFFC0ABB28E5F557F0A5F79EC478830589F73130B3EFD0FD4AD37F6D4D36C76F99A8C31B37F7E5DABBABAFD07F6B0D3F5064DD74BF37DD7DDF2B57E3B7C4BF09F883C2B1FF00A52B496CDF324D1B79B149FEEBAD64F81FF6A4F117C2BDF6B70D35D694DF75377EF2DDBFBC8DFF00B2D2AD4F32A5D0EF8E5B96E2217A55353F77341F8C11EA5B5E3995B77DDC35761A4F8E9678D77BFCDB6BF247E07FFC14056CE3852E6E99E1915595F757D45F0DFF006CAD37585575B98F737DD5DD5D387C774ABA33C6C664738FC1AA3EE98FC44974EACADFC55A50EA0970BB6BE74F01FC76B7D5ACD64FB42B7CDF2FCD5E91A2FC408EFB6959155ABD28D68B3E76B60E50F74F49D3F565B59163666556FB8FBBF4ADD86E1A48F77DFAF3B8FC409342AAD27FBB5D5683AA79D6EADBBE565AE9A75A4A5A33C7C56068CD7EF2099F27FF00C15D3E11FC64F8ADF056EACFE17DC5A99A6564B889DBCB9767F16CFF006ABF09F4FF000DFC4EFD897E2A2DFF0088344D52C5FCDFF4C49159966FEF36EAFEA763912E236575DD5E55F1EBF641F067ED25E1FBCD275ED26D6E7CE465590A2EE5FF00695AB8730A35B10F993F933D0E1DFA8E5B376A7CB777BADFF13F203C1FFB587863E2778363B9B6D4238EE997E78DDB6B2B5739AC7C5A4B3BA6787548D7DBCDAE5FFE0A6FFF00048DF147EC93E24BAD63C37F6C9BC3D33332C906EFDCAFF75ABF3EBC41A8788B4DBA6592FEF1595B6F2ED5F35469CB9FD9CFDD7D8FD66A724B0FEDF0EB9E2FAA3F4475CFDAEB55F0ADAB797AC42B1C7EB257CE5FB497FC140350F1469B35835FB4DBB70628DF7ABE66B8BAD575487F797970FF00566AC1D4BC3F2798DBF737D6BD6C3E1E31DE67CA63AB4F97DCA762C68FF1327B7F88963A96EDA8B3AEFF00F75ABECD86E935CF0FC3711F2B222B715F0B5C686D19F9576D7D3DFB34FC4A5D7BC1CBA7DC49FE936ABB181FE2AEEAD18F2AE53C7CAEA4D55942AF53A7D49555593F8AB80F1B47F7ABBEF1433236FF00F6AB81F1749E66E6FE16ACE27462A3F64F3BD62CFCEDDF2D53F00DEB7877C58ABF32C771F2B57413599B8665DBF7AA3FF84266BA9924456DF1B6E535BFB4E53C7A3CDCE7A85BEA11C0AACFB9936F5FE2AF47F823750D8F8A2CEF21915E3DEBB8FF0077FDEAF32F0EE8975A869AA9E4C8CEA3B5755F0D7C17AE69FE278DAD6DAE19646DAE3636DACABD68DAE8FA6C1C53F88FB2FF00E0A65E34D2A1FF008276BC6975E65CEA17312280DFDD56AFC86834FF00362535F507EDD9F16B55F1158E95E12DD22D8E97F338FEF3FF0015785E8BE149AE6D376C6AC255B9BDE38EAE039A7CBD8F343BA46A463B6A65876AD4370FB7E5AEF3E3C8A69296D63F3240BFDE6A85BE67AB568DE4C88FFDD6A0CCEF345D3C5BDAC6BF776AD5E5B57DCBB97E5A6E95AA42DA625C2AEF6FE11FED54DF6E9AF27DCDF27FB22AE9C6F13A99BDA1E909232ABD6F6A1A3DBE9BA7F99F79B6FCA2B074159A36DC8EC8ABEBF3555F1D78CA6D3EDFE7B856DABB570B5DF4E9A846ED19FB491A971E28B3D26D77BB6C3B7A16AE37C4DE369BC4D2B469B92D97FF001EAE764BE935AB8F3247675FE1156A15CEDDBF76B9252E734F6B236B4766876B2B32EDAECF41F1B6A1A4ECF26E26465F7AE434795576EEF96BA3B3B88635DCCEB597D5613F88E9A38CAB4FE0676BA2FC68F1169B70B226A174AABFEDD77571FB677892DF47F25AE9B6AAEDC96AF05D5BC7961A4C6CAD22BBFA0AA7E0CB5D43E2E78A2DEC6D924585A45E07F1572D7C2D25F09EBE171D527A48F48BD9AE7E2D5ADD6A97ED25C3FDD526A1F03FECF326B5AA43BD1B6C8F5F41786FE09C3E19F0FD8E95E5AABE15E5AEC341D06C7C33A842F22AAAC74A54EDA0E3523CDCC72763F0774BF853E04BAD56E218D5EDE2FDD657EF337CAB5E4FE34F8D97174B22F9CDB76F4DD5DBFED79F1A9356863D16C64FDCC7B5DF15F2EEADAC34CCFB9BE5AC6545397BA6FF005C94226C7883C7D36A1237CECDBAB10DF3C8DB9DB76EACA6BA656DCB47DA98B2AFF0EEF96BB28D18A3C9AD8E932FDC6A5E4C91BAB6D756F909F997DF75745E1DF898BA2B23B5B5BCCD1F612FCAD5CFD8697F6AF959BFDEAE9743D1F47D35966B94F3B6FF0007F7ABB69F3C7DE472CB11CC7A3F817C61E2EF8E1716FA6B49269DE1B8DF74B6F6EBE5ADD37F75BFBF5D47C56F0BFF0064F87E18F6ED658BFF001EAEB3F633D27FE128D6A6D52E9563B0D2EDE568221F2AAFCB57BE3B68EBF6165DBFC1FF00B2D7B196C7DAD0AB27AEC7CE67729529D25FCD73E47BAB86B5BC75FEEB55AB4D71A1FE2F96A0F165AFD97589957FBD58ED3346DF7ABE7251F7B94EFA72972A67A0E8FE2AF2F6FCD5D5E8BE2EFBBF3578CDAEAAD1B2FCD5B3A5F89197F8BE5AC2544ECA788923DDF4BF1A6DDBF3D6D5B78C57EF6FAF10D3FC58DFDEAD6B7F18305FBDF95612A27753C51EC0BE3655FE3A3FE1395FEF5791378BBF8B7D41378C5A3FF9694BD89A7D70F64FF85818FE3A86E3E236EDDFBCAF1793C6CC3F8EA19BC60CDFF2D1A88E1CCE58C3D6354F885E62B7CF5CDDF78C9A76FBD5E7D75E2C691BEF54BA5DF3DE4CBF36EAD6346C71CB1126771A7DF3DE495DA78634F69596B95F06E8AF70C9F2EEAF5AF07F86DBE4F96A6A4AC6D469B91F497C01F8431FC4CF004762B7975A7DE2A7FA3CF137CAADFDD746F9597FDE5AF92BF68CF84FE28FED2D4163B7699F4F9DEDEEA3B78922921756DACAE8ABBBFE04BF2B57DCFF00B274CBA7C36E9BB6EDAE67FE0A21FB3DF88BC31E2093E2778621BAB8D2AFA245D5D6D1774B62EABB7CD65FE28D976EEFEEB57D3E1F96A6191F3786CC6AE131D2A2E5BEC7E70E83AD6A5E138561B85913C9F957FD9FF66BB8F07FED117DE1BBB4F2EEA4DBFDD2DB76D62FC60F88573AB4CCD79636F26EFF00979B75F2D9BFDE5AF21D4B56592E1B6B32FCDFEEB57938CC2D16AC7DE65F9F6222FDE67E937ECE7FB644D74D0C324DBDBEEAFCF5F677C25FDA09354585BED2AAFB7A6FAFC33F877F11AE7C3F7D1BA5C3322F7DD5F577C13FDABA48638D37B332EDF9C7F0D783CB3A32F23E965528E2E175B9FB1DE1FF008A51DE5BAED9335EC1E09F122C9A4C2CEDF332FCB5F9BFFB37FC7A6F10491F9D3B32AFCCDF357D8DF0AFE207F6C46BB5D767F0D7A985ADCFA9F2D99617D9E87D11A7DF7DA61DCADF3355ED3E4DB3249FDDFBD5C7F87F5C531A7CD5D259EA2B246ACBFC55E94627CECBB15FE297C33D1FE2D7866E74BD5ACE1BAB6B846564917757E4CFEDB5FF00040D1ADF892FB54F06ED8619199FECE7F87FDDAFD7C6BE5623F95493DBC77D6FF32AB6EAC6BE068D7FE223D2CB33CC5E01B749FBAFA743F9BFF0CFFC11FF00C5B63E2C16BAA59B436F23B2676D70FF00B5C7FC1357C41F0297ED22D249ACD9776F0B5FD137C46F87B6371751B2C11AB2CBBB38AE1FF683FD9CB4CF889E117B7BAB38E449136F2B5CF4F2BA7C8E117A9ECCB896752AA7562ACCFE57F5BF08BD8CCF1BC6CACADDEB3F41D4AEBC17AB2DD5ABB237F10FEF2D7E98FEDD1FF04C3B9F0BEA979A8E896CCD1FCCFB02FDDAFCF7F1C7816E7C37A9496D730B2491B6D60D5C9CB3A6F9268EDAF4E9548FB5A2CE96C7E375B6B767B2E64F2E5FE2CD4775AE5AEA51ED59A36FF8157975F695F37DDF9BDAAA2DACD137CAECABF5AAE5479353112BF2B3DA3C39A05ADE4CACD711AFD5ABD73C03E05F0FA5BAB5FDFDAA2FDEFBD5F296951DD6E5DB7122B7FBD5DDF83FC17AAF8A98470C970EEDF74235615AB72C7DE3BF0385F68F63EBAF0FDF782FC2ABE647710BEDAABE32FDABB4DD06C648747B38E69B1B54A25799FC2FFD89FC6DE32BB8E186CF507491BA946DB5F73FECCBFF00047FB8FEC569B5BB7DD7122F42BF76B8A8D5AB5E7CB4D1EFD57430D4AF51A3F39B49D26EBE387C44926BE8D95E67F94357D23E09FD84AE4E92245B7629200C3E5AF76F8B5FF04F39BE09F8B2DB53B4B46FB3C72AEFC2D7D7BF02FC0367AAF80EDA468F2768EAB5D3878DE6E9D5DCF2F138C8D3A6AAD2D533F99BB891635DAB54E6FE26AB0CBBBE66AAB78DFC2B5EB1F0321B09F324A9B6EEA8ED63F97FDAAB96F6FF00C555224B7A1EB1269322EDF993D2BB3D0FC5FA6DC328999A16AE1F6537C9A232B7BC691FE53D5B5CF1D69BA569EA96D32BB6DDDC579878A3C4926BD74CDBBE5AAD25BB3547F65ADEA5694F702D68BA82C7FBB76DB5D159AA36DAE4DECD97A7DEA9E1BCB9B55DBB9B6D651901DBDBCF1DBC5BB756378A3C54B6B0B246DB9DAB13FB42E6E87CAF507F67BC922973B99AAA552E54652E84BA1E9926A974ACDB9DE46AFBEBFE09E3FB37AADBB6B7750FCB1AEE5DEB5F2F7ECFFF000C9BC4DE24B3564FDDEE5DDF2D7E9AFC3DB5B7F87BF09FCA836A3AC5F363FDDAC68FBF5399F43D4A32F67039ED40A36A5737585C6F655FF76BC23F688F88CDA1EEFB3C9B7FBB8FEF5777AF7C4C8EDF4A915A4557DCDFC55F2D7C6BF183EBDAB3AAB6E5DD58D4A9745F358E57C4DE229B5ABC7B89199D9AB9F9ADDA6DDBBEED5C8D777CAD534767BBEEAFCAD574E9D8E3A95A52312E21F27EEFCCDFFA0D247285DACCBF32D6B5C692D2337F0FD6A95D68EF0C85993F1ADE313988D7547FE0DD57FC3F6B26ADAA471336E566F9B0D54EDECD97EF7CACDF746DAF43F823F0E756F14F8A2C6C34BD3E4BFD52F1F6C1022FCCDEEDFDD5FF006A854E7525C91D59A467182F692D228FAC7F668F0FA693E078EC11B6DC6A1B7781F79625F99D9BFF0041FF00815657C7CBC4DD357ABF837E10C9F01FC0F37F6B5CC779E20BE45FB43C7FEAEDD7F8624FF657FBDFC55F3C7C7CF16AC8F32EEAFB3C3E07EA381B54DE5AB3E131D9B2CC7304E8FC10D11F3E78C9566D6246DB5CFDD5AD6C6A975F68D41DAAAC91EEAF8794BDE67D9538FB88C59A1656A5B79195AAFCD66AD50BD9FF00B34E26728962D6F9C6DF9AB421D49B6FDEACD86D7FD9AB50DBB6DA394B8F3171B526FEF54536A0CEBF3535AD9BFE034C36ECD47295EF11B5E39A8CDE3B55A5D2DE6FBAB572CFC34F337CCB413CB2653B1B77B8655DACD5DE781FC36F3489F2D47E15F03B4D22FC9F9D7AF7C3FF0000ED64F92B9EA54B1D387C3DE469F807C1FF00737257ACF867C37E4C6BF2D45E0FF092C31A7CBFF8ED77FA4E85B557E4FE1AF3E529391EDD3A7CB13ACF81FAA7F64EA51A6EDBF374AFB43E13EBF06A5A6AC370B1CD0CC9B1E375DCB22B7F0B2D7C43A2DAB69F709226E565AFA13E0BFC406863851DFEEFCB5F6191F328F2C8FCF78B3089FEF699F2BFFC158BFE09CE9F0C2FA4F1E78274F68FC23A936EBFB7891A48B4B9BF89997EF2C4DFDEFE1FBBFDDAFCF4BFF01C975B9B643247FC32413AB2FF00E3D5FD20F8475EB4F11696F67791C3756B749B258A555923915BEF2B2B7DE5AF07F8A1FF00042DF80DF1BBC48FAA43A7EADE189AE1F7CB169175E540CDFECA32B6DFF80D7762B2F6E5781E3E53C551A50F658A4DB5D51F83F2780A6B5FDF27971A6EDBF7F76EAE9BC1BAC5C785EE1248D9995B6F5AFD68F8A1FF0006DFE8FA5D8DC5CF803C5133BED664B4D562F319BFD9F357FF0089AF8BFE3B7FC1357E247C0BBA921D57C2DA925BC2DB45C41134F132FF00B2CB5E456CBFDDD51F6596F1561A52B4656F5D0A3F00FF006937D17528D647DBF357DE7FB34FED516BA95E471C93C6AADB57EF57E556A1E03D43C3775FEAE68E48FEF02BB596BA6F877F1AB54F01EA11B79927CACADF7ABC6A987AB4BDE47D647174B151B33F7EBC01F1123D52D11964565DB5E85A5F8B91A35F9EBF2C3F669FF82815B5CD9DB5BDDDC6D7DAAAD96AFAC7E1FF00ED3567AE42AE970ACBFEF57553C626AC7975B2F9A9687D60DE2458D55B7FCB576CFC4DBA1E1BFDDAF06B3F8BD6F79A72CAB36E5FBABF35749A1FC4059A346F32BABDA45C7DD38FEAF23B8F146A7E6DF5AEE6FF0058FB6B6B52856F34FDACABF76BCE7C41AFFF00A7695B9BE691DABACB8D7162B35F9FF868C3FC4C2B53D158F24F8D5F0F6CF56B5B95921575646EAB5F8CDFF0534FD9B6DFC2FE209EFEC6DF6AB166385AFDB7F88174B756F32B7F76BE15FDB83E11A78D343BA56877FCADB7E5AD3114FDAD2B1EA6575BD9CFDE3F10B56B1F26E1D597EED67ADBAEEAF6CF8D5F016F3C33AE5C6C8DB6EEFEED795DC7866E2D66C3C6CB5E2C7997BB23AEB53F7BDD0D0EDD5665DD5F74FF00C1273C0BA4F8CBE2D5BDB6A16D1DC2FCBB43AD7C49A4E972798BF236EAFBD3FE0911A1DC43F1AB4F9951B62B2EEAE7F69155A1EA77E1E9CBEAF39791FB75F0C7F66DF0FD8E8B6D25BE9F6F1B6D5E88B5E99A3FC36B5D3E355486350BFECD1F0C7E5F0EDBAB7F716BAE8641B6BE8AD18FC27C24EA5494BDE6789FED0BF036C7C55E17BA46B7566646FE1AF997E1CC8DE08B2BAD364523ECF2ED19AFBE3C45629A969F2232EEDCB5F147C6CD097C2FF102F23F2FE599B78C57CFE71FBA9AAB13DFC9EB7B48BA523F96293E556ACF9BF7926DAD0BCF9632D546D61F3A6AF52278B22DD9C3BAAE470FCB45ADB6D5AB71C759F30F5215869561DD53B47F2D3A3871F36DAA1959A1DA7A52C763B97EEEEAD086CDAEA4DAABBABB0F0DFC3D7BEB5DCC941518FBA79FFD97E6F996892DF727DDAEAB5AF05CD6374CBB1B6FFBB55D7C2B7122FDC6A9948D234CC3B1D37CCAD05F0EC92491B2A36C66EB5DF7C37F84373E20B845F2F72B37F76BE83D5BF6555D3FE14DC5FAC3BA48537E76D11A73A97E53A7D9C631BB398F82DA6C7E09B3B1B975D8CDB5B26BDD756F8CC92787E4B7F3BE564E95E15E30D423D3FE1ED83C6DB64555AE3350F88571716F1A2BB67EED67294A0FDD348CA3F68B7E36F88170D793469236DDCD5C3DE48F7F36F66CB355E9A37BEBADE7EF37F156A69BE176B9DBF2F0D55470F26635AB1CDC362D232FCB5B5A6F87E499976AFDEAED341F867F6C65F96BE80FD9C7F627D53E346AB1DAE9767249F32ABCA57F771D7A5430739B3CAC4636950839D57647CDFA77C3BB8D5556348DBE6F973B7E55AEBBC23FB16F8B3E246A0B6FA2E93A85F4DFDCB683CD55AFD6AFD9F7FE091BE19F03DBC375E276FED2B855DDE427EEE35FFE2ABE98F0FF00C39D07E1AE8E967A2E9B6B616F1AED51144AB5EF51C9EFFC43E2332E3BA74FDDC346FE6CFC7BF84FFF000445F885AF4915CEBD7563E1DB36DBBBCD55927DBFEEAFF157D55F0DFF0064FF0006FEC87E1D9A3D1636BCD5A64D971A9DCFCD3C9FECAFF717FD95AFADFC71AC7936EFF357CA9FB4878DBEC76737CFB5ABE8F2FCB70F41F3416A7C463F89330CC5FB1A93B43B2D0F9DFF0068CF884BE65C2ABFF7BF8ABE2BF8BDE287D42E9D55B77CD5ECDF1B3C5CFA85E4CAACCDF35787EBDA2BDF4CCE56B8B3894AAFB913ECB87F0AA9454A4706C1B7EE6A166DBF2D6D6A5A0BC6DF76B1AF2CDE16F9BE5AF87C460E503EF28E222E22FCACB4E10AD558EE195B6B55A864CD729D5B93476FBAAE5BD9AD32D5776DAD5B1B266ED53CC5462575D35A4FE1ABB67E1DF38FDDAD8D2F4569997E5DD5D4E87E1169197E5ACE550DA346E739A5F837CCDBF25747A2F813732FC9C576DA0781D9997E5AEDBC3BE03DACBF27CB58CAB1D51C39CAF83FE1DED65FDDD7AA7847C12B0AA7C95ADE19F068876FC9FF008ED771A2F87563DBF2D734A52948ECA74E302BE83E1D58D576A5751A7E8EB1C7D2AE697A3AC6ABF2F35AB0DA6C5FBB5E9E072F94E5CD2397158C8C22647F67ED1D2B5FC37AB49A4DD26D6F9691ADEA4B1D3FCE996BEDB0381B44F87CD318A7EEC8FA07E10F8E3CE8E3DCF5F41F81FC45E7469F357C7FE01964D2A6465DDB6BDEBE1CF8A19A34567AECA91FB27C1E2B07EF7344FA3B43D5BCD55F9AB69AC6D75887CBB88639A36FBC1D77579DF84F5AF3923F9ABB7D26FB72AD70D489CF18FD93C6FF0069CFF826CFC39FDA2341B8F3B44B5B1D536B325DDB22C522B7FC06BF1D3F6CEFD85752FD993C6D3586A16D23D9C8CDF65BB0BF2C8BFDD6FF006ABFA0DB3B8F316BCABF6BAFD94743FDA87E1CDE695A85BC6D33237952EDF9A36FE1656AE3A946333D8CB734AF849F343E1EABFC8FE7166B19BC2B78AF0CDE5EDF9B86AEDBC2BFB566BDE0F558FED522A7F08DD5DC7EDA1FB0DF8CFF00665F15DD26A1617175A4ABB7917B1A3346CBFED7F75ABE67B8B19A6BC7926DCA8BDCD7838ACBE127B599FABE539F46A414E0EE8FBC3E0BFEDD8F75A4DBDBDD5CFCECCABCB57D75F0D7E3B5BEB5A4DABADC2B3CCC157E6AFC55D0F5ABCB5D41648599238DABDE3E08FED7979A1EBD676F71337D9ED7FDAAF2651AB47DD3DF97B2C46B1D19FB21AB78D239354D151A45DDB377DEAE9B54F1B7990A6D92BF3A7E18FEDD96FE3AF8991AB5C6E86CD1517E6AF707FDA5AD6E9D156E576B76DD5E861EB45C5B386A616716933DF75AF1C25C33C7BB737FBD5E59F13ACE3D72C6E1245DCB22B57176BF1C2DEE6F1996656566FEF55E6F1E47AD2B26F56AED8D48F298D4A3CB2F74F9A7E317ECEF0F89AEA675B756F9BFBB5E23AA7EC5ADA95F3EDB4F9777F76BEEEFB2C77174CADB595AB5349F06D9B7CFE5AFCDFECD652A717B9B7D6A513E12F09FFC13DDF56BC44FB36DF9BFBB5F74FEC13FB19DB7C2BD4A1BAF276C9EB8AF49F03F806D9763AC6BBBFDDAF78F863E1D874F542AAAB4BEAD4BE2B19D6CCAAB8724763D6FC17FE8BA6C69FDD5DB5D14771F2AD72FA2DC2C71EDAD886E39FBD5678728FBC6979DB9ABC0FF00692F86B1EB9E28B6B855CEE46FFD96BDB9AEBE6FF6AB27C4D62BA94F1B15FBB915CB88A11AF4F9647450A9ECA4A513F8ABD48ED5A34BB5CFCDFC557357D3D966D9B6A6B5B2F2635F96B3E6F743949238EA7863A4F26A6857E6A922437C9F9AA4585836DA9157E6AD2D274FFB44CBF2D01136BE1EF84FFB52F15996BDDBC2FE0C8E1B354D9F36DAF39F03C09A62A36DDAD5EADA0789A168576B7CD5B53E55F11D74E373135CF8770DE4DBB62FDEA23F84B1AD9348B1EEDAB5D0FF006C24D78CBB97FBD5D6F83FC9D52DE68F72EEDBDEAA3CB366DCB6F78C1F82B6B67A7C8C8E155E36AFA77C2B7961E28F86B7F66DE5B6E819715F1CDF6B4FE11F1A5CC3B9957735751F0C7E3D4DA0EA5736D248DE5B6E5A284A54E48AA924E0793FC44BC92DE4BCD3599BFD16E1D31FEEB57356BA6B5D5BEEFE25AE93C6D751EADF112FDB77C978FBD5BFDAA2C7C3F359DD7C8BB91BEF0AD2387D4E1A95883C3B6F0DE36D7DAAEBF785755A4D9A5BC8BB177AB7FE3B5B5F0EFF00671D73E246B11A689617175349F7B627CB5F787EC8FF00F048DB8B89ADB52F16AEDFBAFF00671F77FE055EAE170756A4AD047CFE659D61B091E6A8F5EC785FEC8FFB22F883E3E7882D963B79ADB4BDCBE6DC38F976FF00B35FAE1FB3AFECF3A2FC07F06DB58D8DB2A3AA2EE7C7CCCD5ADF0BFE0FE8FF000A74586CEC2D61B78E15DAA1176D74971A82C7FC55F4B85C1C68C74D59F94E759E55C74F5D21D875F5E617EF5735E20D4B6AB7CD56F54D536AB7CD5C8788358F95BE6AEC8C4F0E34E5338FF891AC7976B27CD5F177ED31E227BA92645F99BE6AFAB3E286A5E658C9B5BF86BE55F88DE1B7D735491995997755CAB5BDD89F4593E5B79F3C8F92FC59E1992F2F1E4756FBD58F3782FCC8FEE57BE78B3C07E4AB7C9B7FE035CAFF00C22EBF7596953C3F31F58AB72FBA788EB1E0362ADF25721AD781E45DDF257D2B7DE0D59BF83FF1DAE6F58F876B26EF92B971196C5C4EEC3E3ACCF99754F09BAFDD4AA76FA6C9049B18357BF6A5F0C599BEE561DE7C2FDADF73E6AF93C765B287BC8FA4C1E2B9CF3FD1F437936FCB5D5E87E176936FCB5D0E8BF0FDAD995593E5AEDBC3BE07FBBF257CED4958F7E9D3E639FF000DF82D9B6FC95E83E19F02FCABF256E786FC17B4AFCB5DEF87FC2ABB57E5AE5948EEA746C73FA0F82D46DF92BB2D0FC20B1A2FC95BDA4F8756355F96B7F4FD1D63DBF2EDA51A6E7B1ACA51844CDD27C3EB1AFDDAE874FD2C47B7E5AB167A7EC5AD2B6B3DB5F4581CAF9B73C3C6661188DB5B1DAB561ADF0B53470EDA90435F6183CBE303E471D9A5CA3F66DDFED56B681A4F9CEBF2D456F6BE63575FE17D17732FCB5EACA31844F9AA95A55246A687A4EC55F96BB6F09C8F632A7F76B3F47D27685F96BA1B2D376AFDDAF1EB4BDE3AA34EEB94F4EF04EB5F2C7F357A3E87AB6E55F9ABC57C2F74D6B22AFDDAEFB43D6976AFCD5CFCD73CCC46179247A8E9DAA2FCBF356BC37AADF7ABCFF4DD687CBF356C5AEB5F2FDEACF94E3E5B12FC44F84FA0FC54D164B3D5AC2DEEA19976B09115ABF3CBF6D0FF00821A695E2C8EE752F033AE9F72CCCED6C7FD537FF135FA316FAC6EFE2AB4BA90923DADF37D6B39538BD248D28D7AB467CF49D99FCD4FED15FB2BF8B3F67FD41F4AD6347B8B37DDB565D9FBB93FDD6AF19D72CEE3C3366D27CCB237CAA3F8ABFA6BFDA37F661F0C7ED05E13B8B0D52C2DE67915B6B95F994FB57E2B7EDFDFF04F3D63E00F8CA699216B9D1199BCA902FF00ABFF0065AB8711835CB747DAE4FC452A8FD956D27F99F1CFC39F1FDFF81EE1AE7CC65766AF47D1BF6AED4966567B96FF00BEABCC7C61A1BD833AB0DBF36D5AE42E19E191B6B5789530696C7DA53CCA5D4FAF3C0FFB544AB708CF3FE6D5EC1E01FDA596FAE913CEDDBBFDAAFCE9B1F104D6BF75DBE5AF46F87BF11A4D3C2B348DBA9C63246FF5E53563F49345F8C11DE4E9B645DAD5EA3E17F1E2CD1C6CADBABE06F843F1124D4AE2DC4923357D4DE07D7D96CE1556F99BBD6B1E6710E68B8A3EC0F873AE24F691B16FBD5ED5E08D592454F9ABE49F86BE2E6B76B7467AF7AF00F8C1199555BE6AB8F31C7539798F79D2EF3EEED6AD986FB95F9ABCF7C3FE26468D7737CD5BD1F88138F9A8396513A39B50559BEF523EA1BCFDEAE424F13ABDF6D56AD58B530631F35674E4572D8FE3FF00C41A1E3566F97E556ACFBCB1F25B6D7A06B5A4A9BA91B6FCD5C8EBD6BB6465AF3632B9D5523632235DCB4F55C353A18FE765A9BC96DDFED56C724875BD9B4D27CAB5D3786F4592399372543E17D3566991996BD534BF0BA7F65A5C22FCD1FA56918DC664E9BA6C96F32232EDDD5AD6765736B79B3E65FEED74171636F36970DC26DCC7F7AB4AE6C63B8B186EA3FBCBF7AB6E5348CB94E4750BCB9D2EE91DF76D6AE8BC2BE3C6D3EF9195FE56F95AA6D7B478F50D35BEEEEDB5C3DD5AB69ACADB9BEF6D347B3B4B9917EDB43A0F8C8CB36A90DF47F2AC9F7B15C6DADF35BEA8AECDB55AB7358BCFED6D0F66EDDB6B0F4ED0E4D6248D51599D5B6F15D318FBDCC71D4A9D0DCBEF0EFF00C241710C96ABBA756DDC7F157D6DFB16FEC19AC7C74B8B6B9D4AD66B3B15C6E257E6916B57FE09F7FB0ADCFC46D4AD752D52DDBECB1B2B2875FBD5FACBF0B3E16E9BF0D741B7B6B6B78D1A3555E16BDEC0E5FCDFBCABB1F159F7103A5FB8A1BF7393F80BFB24F877E0CF87EDE1B5B0B78DD47CCDB7E6AF528E38EC515234555A9A6BCFDDFCBC5675C5D7DEAF7A3EEAB44FCDEB4EA4E5CD2D47DF5FED8DBE6AE7F54D6BCB66F9AA6D5AF76AB7CD5C778835668F77CD5B5389CBECE4CB7AA788376EF9EB95D6B5AF319BE6AC8D63C49B59BE6DB590BAC35D48DF354569451EDE5F83BB2978C95AF2123EF579A6A5E13F319DB67DEAF5ABAB3FB62B7CB5977DE1B5656F96BCD956BC8FB1C3D18D38729F3E78E3C1AAB1BFC95E617DA37D96E9976D7D41E32F0AEF85FE4AF14F1B7865AD6E99D576FF00C06BD8C2D4B98D48F29C52E86B22FDDFA54379E174DB9D95D058FCADB596A4BEDAB1D7A5CB1661195A479FEA9E1752ADF2D61DD78553CCFBB5DBEAD322EEF9AB12E2E93737DDAF0F30C3DE27D0E5F58C9D2FC2E8B22EE4AEAF43F0AA6D5DAB59D63709E67DEAEC3C3B327CA16BF3FC660E5CDEE9F7983AD1E534347F0EAC7B7E4AE9B4BD3561DB54ECAEA3DABF77754B26B896FF00C4B5C31C0CBED1D92C444E86CD516B52CF6B57130F8A9437DEAD6D37C44927F1EEAF7F2FCB7C8F171D8EB44ED2CE156F956AF476F583A4EA8AC17E6AE9F4FDB711AB57D9E17031844F85CC33090D8E1FEF2D4B1DBEE65AB0D0EDAB9A4E96D3C8BF2D7A1EEC227812AD298ED174569A45DCB5E83E19D07E55F96A9786FC3FF77E5AEFBC3FA1ED55F96BCBC5563B70F4434BD1F6AAFCB5B569A6ED5FBB57ECF4AF2D56AFC7A7EC5FBB5E2D491EAC699991DAF92372D69E9BAA342DB5A86B3F96A3FB1B6EF96B2E60A946323A4D3F5EDAABF3569DBF8936FF001D714ACD6EBBBF8AA0B8D61E15FBD57191E754C0DCF4BB3F152FF7EB421F1303FC55E3D0F8B9E17DACD57EDFC60CDFC55AEE79B5307347AE43E2256FE2AF3DFDA3BE10E99F1C3C0F7561776F1CCD2232F2B54EDFC60CDFC55763F186D5F99AAA264A9D48CB991F887FB737EC67AA7C1DF175D325B48F62CCCD1385FBAB5F256B5E1D92CE56DC9B5ABFA20FDA33E0DE8FF1ABC3B34735BC2F71B7A63EF57E607ED41FB00DF7876FAE2E74BB6DEAACDFBB0B5C388C1DFDE81F6B95E69CF0E59EE7C057162D1C8AB572CEEBECB711AEEAEEBC61F09EFBC377522DCDB491C8BD8AD70F79A2CD6F70CCCADF2D791528C91F414EA1ED3F057C591C3A9C2ACFB5576D7D81F0BFC6F6F79671BF98BF2D7E7378775CB8D0E4F314B2D7AD7817F688B8F0FD86C776DCCBFDEAC632E5DCF42352E7E83E87F18ACF4BBADCD32AEDFF006ABD53E19FED05677526E5B85FFBEABF29358FDA72EA46764999777FB55D7FC29FDA92E74DD8AD337CCDDDAB9E55A4A476468D3923F66FC27F16E1BA861DB32FCDFED576D6BF10124DADBFF87FBD5F98BF0C7F6C658DA157B8FBABFDEAF76F08FED5D6FAB5AB3FDA176A8FEF53956BC4CFEAAF9B43EBED37C64B75A8348B27CBBABA6B5F172797FEB16BE3AF07FED1F6D7178E8B70BBB77F7ABB3B2F8FB6FE57CD3F3FEF56346A68556C3C933F0475C648E47FBB5C46BC9E6CCD5B7A96ACD75236EAC9B88FCE6F9AB2A74EC73D495CC3F21A39B7568DBDBAC9FC352CDA5EEE9566C6C5976AD7446273C8BBA0C8B6AFFEED779E19F1C2DADBBDBC8CBB5976D70B0E9EF1B6E55AB0B6721F9B6FCD5A46325233948EA5BC71E5ACD6DBBE463B96AFF867E2232D9792EDB96B839ACDD5B7FCDBAAD69F6CF27CCBF2B77AD631913ED0F416F1C6DB774DDFEED626A1AB36A4BF2AFDEAAB63A1CD79F7177357B07C05FD94F5AF8A5AA4296F6B22C2CCBB9CAD74D3C3CA5A18D4AD1846E703E0BF03EA1E289161B5864999BB05AFADFF0063DFF827DEA9E24D7ADAFB55B664B6DCADB1C7DEAFA97F65BFD81F49F00E9F6F71756D1C972AAAC495AFA9741D0F4FF0ADAA25B431AB2AF5DB5EF61703087BD33E6B30CDA5CBCB4C9BE0BFC33D3FE16F86EDEDADE18E368D15702BB1B8D69777DEAE3AE3C49B7F8AAA5E789BFDAAF6632B9F155B0F29CB9A476CDAE2EDFBD55E6D5976B7CD5C2378ABE6DBBAA55F126E5FBD5673C70B736B5AD53E5FBD5C1F8AB5ADAAFF003568EB1AD7991B7CD5C1F8AB506657A9956B1D5472FBB3135AD759AE1BE6A3C3FA835C4CB5837DBE691BFDAADBF07DBED917FDEAE1AD5B9CFA2C2E0E34E2779A2D8F9D1FCD57E6D0F72FDDA93C376FB9556BA6874BF323FBBF3572F31D5CA798F89BC32B246FF25790FC40F05F98CFF257D39AD787FCC89BE5AF3BF19783FCE57F92BB70F5AC73D489F25F893436D3666655DB5C96B1AF7931B2B357BC7C4AF04B471BFC95F3A7C4CB37D26492BDFA35AF138FD99CEF883C58B1B37CF5CADF78E1639BEFFF00E3D5CEF8E3C48D6ECCDBB1B6BCC35EF884D0CCCBE65638AA91713BB0B7848F7BD1FC6C24917E7AED343F172F96BF37CD5F2FF84FC70D7122B6FAF46D07C69FBB5F9EBE7E585E791F494F1DC88F7A87C6185FBD54F54F1D6D5FBD5E5A3C71FBBFBF59BAD78C19A36F9EA63978E5991E9ABF1182C9F7EBA1F0FF00C41592455DFBABE63D43C78F0CDF33B5741E0FF890D24C8BBFFF001EAF630746313C8C762A5389F60F847C50B70C9B64DD5E9DE1BD496445DCD5F307C37F1979C1373FFE3D5EE5E07D73ED4B1AEEFBD5EE38C54743E66A464E5791EA5630FDB245DBF35761E19F0FEE65F96B17C07A7B5D2A36DAF52F0CF87BEEEE5AF1F1558AC3D1F78B3E1FD0B6EDF96BB3D1F49F2D57E5A668BA3ED55AE9F4DD336A8F96BC1AD52E7B5469D8AF6FA6ED5A95AD54569FD9B6AD4725BD72731D5CA67FD92A26B7D957E48768AAF26D5A44946687E5AC7D42D54FCD5B37570AB595A849B95AAA2073BA92F97F76AA4378F1B6DAB9A90F31AAB2DAEEDB5A44CAA44B96F7CDB7EF54925F48CBF2B5476B67B6B42DF4FDDFC35A7318FB0466C97D70BFDEAE7FC5DA0D9F89236FB4C2BE637F1EDAEDE4D2D5BF86B1358D27F78DF2D546447B151F7A27CD9F193F635D17C7F6B2B35AC3E632FCAE16BE1CFDA0FF00619D53C037533DB5B3496CACC7207CD5FAD96BA5FF00B3553C55F096C3C69A7BC7716F1B337AAD454A719FC47761F153A67E0CEADE036B1B86492168D57B15AC7BED0FC9DCCCACABFC35FA8BFB4A7FC13BE3D4249AEB4D8555FE66C05AF8D7E26FECB7AB78635068EE6DA4455F6F96B82A617DD3DCA38C8C8F996F2D5E6B8F9559556A7D36FA7B293E5DDF2D7A46B1F0B5F4F7DBE5FCDFEED635F783D6CD72CBF3570CB067A11C45BE12AE93F10AF34DF99646AF46F05FED0975A2E96FBA6656F4DD5E632680CDB9997EED51D42CDE1870B5CF2C1FDA3AA9E3ACCF6AF0CFED597DA5EA4D279CD8DDFDEAEB0FEDB179FF003D9BFEFAAF96B6EDF999BF0AA5737ED1CC4237CBFEF573C7076EA76FF6937D0C1B8569A4F96A4860F393E655AB0D6FB688E365F9B6D6BECEC795CDCC58B7D2FCC8EAF58E8ABE72EEAAF6378D1ED56AD4B3B8F324565ADA31899F317EDF405936FCB5A363E0FF00B56DF96AD6870BDD2AD767A0E8ACC576C6CCCDD2BA69D38B33948E32EBE1BBB6DDABF7AB43C37F02752D62E916DA36666ED5F417C2CFD99F58F1F5C46CB0B470EEFEED7D79F02FF63EB3F09DBC2F730ABC95DD4F037F7A470D6C64607CCFFB35FEC0336BD756F75AAC2CABF2EE4AFBD3E12FC05D27E1BE970A5ADB468CABF7B6D74DE1DF06DBE876CA91C6ABB57F856BA0861F2557D2BBA9D38C23EE9E3D6C44AA162C66F2615445DAB4DBEB97A9ADEDF3F32D3A6B1F33F86AF98E395389CDEA533AFCCB59F717CFE5D74B7DA4EE5E959F7DA1FEE6AA35248CA54627312EA4EB27CD4E875C65FE2A76A5A5B47237CB597242D5AFB49111C3C4D69350F323EB587AC5BF9DBBE5FCEADDAAB6DFE2A7DD5BEE5AE794A4CECA74E28E564D2796AD2F0E5979371F76AF5BD8F9D232EDABDA6E8FB665E2A4DF53B0F0AC3B956BB6D36C77AFDDAE5FC2366CAAB5DF68F6BB556B390A3133EF347568FEED72FE22F0B8915BE4AF4CFECFF317EED67EA5A2AC8ADF2D11A84CA9DCF9CBE2378156E2DDFE4AF973E3B7C35658E6654AFBEBC5DE15F3A37C2EEAF0AF8B9F0D85E5BCDFBBCD7A985C41C55299F965F17B439B4BB891586D5AF02F1B4324723B257DEBFB457C176FF48658EBE39F897E0F9B45BB74756DBBBAEDAECC4479E3CD12E8CADF11C6F8575A7B5DAACCD5E89E1FF113B2AFCD5E7EBA6EC6DC9F2D6E68170CBB5776DAE3A7292D2475C8F448B5E665FBD55EFB567957EF56559C8CCABF35596837AD7446461231F5C99A4DDFDEA8FC33AE49677CAACDB7E6ABDA85AAF96D581710BC772ACB473494AE1CA7D1BF0AFC55E6797FBCAFA87E0AC8D7F2C7FC55F18FC17DF75710A7CD5F73FECE3E177923B76615E94AB7EE8F3EA53F7B94FA4BE1868FBA18DB6D7B0787F4750ABF2D717F0D743F2E18976D7ACE83A6FEE57E5AF9DC556B9D987A3627D2F4BDBB772D6EDBD9ED5FBB458D9ED5ABF1C1DABCD948EF8C4AAD6F95A864B7F96B49A1AAB75B5775497CA665C43B6B235066F9AB62EBE6AC9BE15510326466DDD2AA5E0F96B49AD7735326D3D996A8CB98E4EF159A6A92D6DF76DAD2B8D37F79525BD96DFE1ADA26522386D7F76B5A1670EE6E942DAE235AB3630FCD5251235AAEDAC8D4ACFCC91AB7E66DB15665C2F98D4449919B6BA6D6959D8EDDBF2D49676FB96AF436FB6AA4112A5D6876FA82EC9115ABCFBE267ECCBA378DACE4592D616665FEED7A9C30FCD4FA9E6B147E777C7AFF008275B5BB4D71A52B237DED9B7E5AF8D3E317C0DD5BC0779225F58C91AAFCBBC2FCB5FB99A86970EA11B2C88ACAD5E43F1B3F663D17C7BA6CCB35B46ECCBD76D12A7199D74719387C47E1BEAD6FF65DCBFC55CDEAEFF796BEE9FDA63FE09F373E1DBAB8BAD2E16D9F336C0BF2D7C95E30F8577DE1FBC923B8B792375F55AE0AD4E71F74F5E8D6854D51E5F716EF248DF2FCB55E5D319DB3D2BB29BC36F1B36E5AAD3686CCDF76B8A513BE271325BBF9956EDEC5997EED5C86CF7495ADA7E94ADB7E5ACB96F216C61C3A3B48DF2AD741E1DF06CD7532FC9F2D6F68BE1F46917E5AF44F03F84FFB42EA38618F7C927FB35D74E8DCCE52E5337C1FF0F5DB62246CEEDF7405AFA67F66EFD92EE7C47790DCDE5BB2A7CAD82B5E83FB2EFEC96B7DF67BABCB7DC5BE6E56BED2F87FF0AED7C3362891C2ABB7FD9AF5A8E1E30D6478B8AC75FDD89CAFC2FF0082763E11D2E344B755655FEED7710E84B0ED5D8BB56BA4874A5897E55A97FB35597EED6FCC79BB9CF2697B7F86A46B1DB1D6E3E9BFECD35ACBE56A5CC6665D8DBFF0D5E8F4FF00F66AC5BE9FB5AB4ACECFCCA92B94C59B4BDCB556F347FF0047FBB5D5BE9BF2F4A82EB4DFDCFDDA7CC4F29E67AC68FF007FE5AE66F34BD927DDDB5E9FAB6939DDF2D735A968ACAFBB6D6919199CCD9E96BBBA55CB8D17743BB6D695AE9BE5C8BF2D6C47A5F990D448DA2717A7E80DF68FBB5D3697E1F56DADB6B434FD19639BEED74BA7E8A3E5E2B391A6E53D074768D97E5AEC747B3F956AAD8E93B76FCB5D069F69E5AAD63291A4622C76BF2D32EAC55A3FBB5A0B0FCB492475994721AD68AACADF2D79DF8DBC1AB711BAECAF67BEB1F315BE5AE735ED0D6656F96BA29D4B18D4A773E2FF008D9F085750866DB1EEF95BF86BE1BFDA47E05F92D332C3FF008ED7EB2FC40F04ACF0BFC95F2EFC7CF836B7D6B37EEF77FC06BD8C3E239BDD670CA9D8FC98F11787E4D0EF1D5959555AA9D9B6D9B72D7D05FB447C217D26E269047B76D7CFF3235ADD3237CACAD57529D99D14EA5E2749A6CDFBB55AD689B72D735A6DDEC2BBAB66DEF976D5D30912DE2EE5DB5047A0B5D32ED15342DF6BB850B5DE780FC2ADAB5E4615777CD5D34E8DCC6A54B1DE7ECD7F0DDEE2F2166466AFD03F807E03FB1D9C3F25786FECCBF0A5635B76F2FE6F97F86BED2F85BE0F5B5B78D5536AD73632A4547962634E3CF2E63B5F04E83E5C29F2D7A168D63E5C6BF2D65F86F47F2E35F96BA8B1B5D91D7CF5495CF529C7DD248A1DB526D55A6C922A5579AE19AB23424B8B858D6A85C4DBA96E1B6D5532511880D9BF78B59B751EE6F97E6AD067F96ABAC3E63735A1994E3B5DCDF354CD6BFBBFBB5720B55DB537D9A8039E9B4BDD23522E9FE59AD892DFE6A8A486AB98CE512935AED8EA3B78FCB6AD2FB37EEEAAC89B1AA80AF7927CB54256DCD56EF1AA8B1CB55440D0D3D372D682C3F2D67E97F356B462A64011C3F2B53597E5AB0176C6D50C8CAB1B5005193E5359BA84DBBE5AB97D71B55AB2E493CC92AA2064EB5E07B3F125B3A4D0AB6EF515F3CFED09FB0CE8BE30B7B8916CE34765DD90B5F545AAED8F7556D5234BA85D1D776EAD752A32947589F8D1FB407EC9B7DF0DEFA668E367855BA6DAF13BBF0E3C53B0295FB11FB437C17B7F1469B71FB9566656FE1AFCE5F8D5F03EE7C37E319A1823644625B1B6B9AAE0AFEFC0F5B0B985B499F28D92A83F76B72C605514515E2523D4B9D2787A3126DDDDABEACFD8D7C0BA6EA9A94734F0F98FBF39268A2BB70F27CC71E20FD14F863A05A69B610AC50AA85E95E876D0AA2AD14577734BB9E372A2FC71283D29CF1291D28A28E661CA88FCB5F4A6C90AD1451CCC3950D48541ABB66A0514567CD2EE1CA8BF22295E9513A298BA514567CD2EE1CA8C6BDB4423A5606A5671BF6FD28A2BA39A5DC5CABB199E52FA55CB2C05FBA28A28E67DC395763460B650DDEB774C1B168A2B9F9A5DCAE546EDA63FBA2B6608140A28A5CCCDF9512EDA63AE4FFF005A8A28E665F2A23788552BEB2461DE8A28E6667CA8E3BC4DA7C522F2B5E37F133C3F6B75149B93F2A28AE9A3395F7396A45763E2AFDA6FC2D64F6F3661FBDD6BE05F8C1A543A2F885BC85C7B1A28AF78CA9C57630AD2765AD082E5825145113A3951AFA0FEF2EB2C6BE8AFD9D74682F6EA3322E79A28AF4299CD5631BEC7DF3FB3E6856DE4C788F6FD2BE9CF01D8471C0B85E94515F2F8B9CBB9A518C7B1E8DA559A46AB8AD0D94515C1CCCEDE5457906454663CD1451CCC39515E7841ACD77E3A0A28A3998B9503BE569B03D1453E6663CA8D24B6511F7A84BE7FFD7451473336E5457F33D854727D28A28E6661CA87AE3CAFBA2AA4DCB351451CD2EE1CA8CDBB19AA320CD14569CD2EE1CA8BDA68DA2B5A0908A28ACF9A5DC395133C84C754EEDCF974514734BB872A316F6463DEAB431FEF28A2B7E67DC39513BC8C53FF00AD55E524F7A28A7CD2EE1CA8E67C4AC2E6CE456552A7DABE6DF8ABF0FF004BD5FC43E74D6F97DBD8D145775193B0B95763FFD9, 1, 0, CAST(N'2021-12-21' AS Date), 2, 129)
INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (4, N'My post 4', N'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', 0xFFD8FFE000104A46494600010100000100010000FFDB0084000505050505050606060608090809080C0B0A0A0B0C120D0E0D0E0D121B1114111114111B181D1816181D182B221E1E222B322A282A323C36363C4C484C646486010505050505050606060608090809080C0B0A0A0B0C120D0E0D0E0D121B1114111114111B181D1816181D182B221E1E222B322A282A323C36363C4C484C646486FFC200110801BC031303012200021101031101FFC4001C0001000301010101010000000000000000000506070403010208FFDA0008010100000000B8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000166AD7C000000000000000000000000D96915100000000000000000000000166DCF2BCE80000000000000000000000097DD3BB0382000000000000000000000004B6E723925000000000000000000000000131B9F7E539D800000000000000000000002437B90CAB39000000000396338FC3CDE9D1D921D87CF9FA0000000000D434BA56320000000001E31F1905CE1D1DDC3CDF5D72B63EB000000000D72FF0086D580000000003CE3E3E078C003EDC670000000005EF60C0608000000001F884838CF8000F59A90FDCDFD000000003DBFA071FAC000000000E7AE407980004BF7494A7EC000000002CF29440000000023E03C79A3C00007EA6ECBD8000000003AF90000000003CEB55CFC800002C76AFA00000069D2C0005668200000045D379C00003E4FFB45CA5A8000000DDEC800050F2000000056EAA00FBDFEBF38F9C03D2F9DDCFD00000006EF640002879000000054EBA48E95214FA23B341B3FA88DA5535EDA54E57737FCF6683F40000006EF6400028790000000AB5686B93AF2C524F55E8015CCB2CBA899ED21719D0000001BBD90000AA66903E000001190523D9578CDAFB940A56D1D800A367FAF4DA9B9C25AF00042F2CFFA800377B20000785132EE700000F1A5C5AF77EF987DB744003CB11B2E9DF9C8619FAD2FE8033581D6FB4001BBD900008687B474C1E19C600007850F90583AAABB2D023C01A752EAB6B808DFDFE1A1F58033581D6FB4001BBD90000A1E41DBB25AA978C00003E51234090DA725B1E07FD034526ABBD7297EE3CA47EAD957B94B0033581D6FB4001BBD90000A1E40E8FE8191FE7F85000082A7767182C5ABA72E956859FE189BEFE683E51D8B84F5A7C3B81C3F82830DA6759D9EA00DDEC800050F2034ED3727CF00002893DD54407B6DBEC49DE3D51749F12999C8347F70324E200D2A7801BBD90000A1E405EB61CD72E0001F88C96A8D7C0BD5FDD97DF711944FCF9E2BC80B55900A1F390BCB3FEA5C64C01BBD90000A1E40699A7E539D000019DF281FAD965AFB5DFE64AE7A68BFD4D5AAA67949024AF80066B03ADF6800377B2000143C81EBBFCBE03040000F1CDC02D3BE593F14AC4B51BFCAFE332C1FE01F74CFA00CD6075BED0006EF6400028790746C372A9622000046D0C02C1FD4FF00A304DA648CC70400D0BB0019AC0EB7DA000DDEC800040C05BBBE2709E0000021A95F7E017CFE8D23FF0097B50D84A9FF003107CFD7C5E654019FC4699D6000DDEC80001F9A5651C4000020E9B6CA9816EFE9B30FD568562BB2B1FCBA0B4567F37698000000377B2000157CF2BDC00000086AE5D73803D7FADBB806398C82C7254ABC4B0000001BBD90000A1E4000000233CBBB3B01ACEE0050BF9DFCC13176A559FB8000000DDEC800050F20000001E3E9E59C0069FAD4F7E9199264BF0096BC47F67A0000001BBD90000A1E40000000F999747B7080EA92FC4300276E20000000DDEC800050F2000000033C9AE7820000F5F3F8B5D8C000000125EC00072F080000015097E5A9800074CA41342EC00000000000000000047F9F467A7EBF2001DB6DA2F7DFC000000000000000000797AE7FC290E4F20012F76CDEDB38000000000000000000081A7A5912002C96AAD593E80000000000000000003E67FC52F295449C6FC3D7F1F92ED30000000000000000000008FA1485DB39F960F5AD12139537DD27D00000000000000000000086A869150809FB5E7FCA93BD50A3E5AF000000000000000000000119DBF33C96BA45D13EC9DEE3A85709E00000000000000000000010B5CBEAAF5990BF2976FF0050000000000000000000000AED87EA9D15A33CFD000000000000000000000001F2AF67FD00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFC4001B01010002030101000000000000000000000004050103060207FFDA0008010210000000B80000000000000000000000000000000000D3B3D0000000000018AD9FB0000000000018AEDF2C00008D0BC6C97298C80000AFF734000079A4E574A46AF32FA5BC000056CFF6000087CED36902E6FED40001A3DEC0000D755CD4000CDBF552C003C6A033BC00237195C31E3DE4CF4361760011A001B6CC0045E1635047E8E920336969CDD8DDFD0F7800468006CB2F40057C3E4F93959AD0BCACDBD075BD00419B9046800673BE7802BB86F1E3CD3F5F0A05B6394BBF76165D6855D9E411A001B6CA06D9601C844AC6BE5ADE459D5D7C6EA123BEDE42C4691999E8468006DB3D30EC80635F0510A3C771BA2F09656476D6E68C419B9DF911A001B6CE368B000D3F381E2CA56ED15BA4749D4855D9E411A001EE642B1DA010B8B867BB5F5B74F8A9265876211F7E411A0019912B6802242E285AFB22C13B087D4800468006DB30018F3F38CEB7B91EF4E8C1D9DB6C0008D000DB66000E5205600990FE852C0018C00F40008B49CBEFD00EAE9FBA000000000347CF6E28F769CB1DEEE9400000000028F4F3BD1F2DBAEA8BE8D9000000000069ABC69E73E81CDF50000000000011A4F31D3E320000000000000000000000000000000000000000000001FFC4001B01010002030101000000000000000000000004050203060107FFDA0008010310000000E3400000000000000000000000000000000025E8D60000000000065D373F1C0000000000197470A9C00009961B754085EBC00001D06AA4000019F47DC6F45DF9C0E3B9A000074B41A4000161D6743200E7F95A400004FD11C00036DE7636601E50711040037C93DF0C210004CFA15B801C9D5736001697C046E58004DFA6CBD996ACF330C36E1A3E5114002D2F808FCCEB002D67F77331661AF2F35F0BCA05ED2620B4BE031C20D0F8016DF4BD9EB0A491221AF31F2B69F840EAF97C01697C046E5FA1895001DF4FB87BBA0EA892E4C9D28BF2D8C5DE5655DE536B1697C046E5A5DD734032DBF509C6C8F458E7D0E581F39A02C3DBCA5C60E02D2F808DCB594FE78037FD787947ABCCA65A8E43890EAF97C01697C068A8B9E7620058FD1679AE8BCF32CEF88155F3E0B2AFC41697C0615D5714013ACBE8A28B593ACCE067F12001697C046E580065EFD7F1DAC2161BE60F9E51E9000B4BE02372C000EE2D6E0057D87CA6000032C806B0004DE93B48F201C3DFFCCC00000000095F57E7BA5D1BF1F7DF97C6860000000003A591D6F21DBC6E7BA5F926200000000009175948EB7E59D7716000000000012E2767C6BC0000000000000000000000000000000000000000000000FFC400511000020102020404100A0805040301000001020304050011061221311040415107131620223035526171729192B1B2D1141532364255607481931723505473A1C1D208243334625382D3E125638090FFDA0008010100013F00FF00F6BE8FD905EE9AE51AEC9A258DE26E4CF6E6BF8E19591991810C09041D8411B083F68B41EDCD456A35120C9EA5838F200C971A6D42292F4F2A8C96A104BB376B66437DA1D19B0BDE6B433A914D190656E7E64C2A84500000019003600063A22329A9B7A7D211C9E627ED0596CD5379AB58620420C8C926598518B7DBE9AD94B1D2D326AA28FC49E7382CA8A5988000CC93B00031A4774176BACD3A9FD52E51C5E48F7FD9FB359AAAF354218464A32324846C518B65B296D54AB4D4CB928DA49DEC79CF0696694FC2CC96FA17FD48394B203F2CF30FF8FD9FB2D96AAF55421886AC6B9192423628C5BADB496BA64A6A540A8379E563CE7C3C1A57A57D3FA65BEDF27EAF6896507E573AAF83ECFDAEDD35D6BA1A4876173D936F0146F2716EB752DB29569A9935517CEC79CF0696E95194BDBA81F24DA269472F3A8F07EC89EAE9A9BFD5900F393892FF0044BF255DCF38000C36919FA14DE77C369155FD18A11E304E3E3FAEE68BD1C7C7F5FDEC5E8E06915572C517E198C2691F7F4DE67C477FA17D8C1D39C9198C435F473FC89D093C84E47AC2CA37903C78E989DF0F38FD95D0F68D443595846D2E225F000031F58E0D33BD35B6885340D94F5198CC6F541BC8FD94F4F4F2FCB851BC6A0E25B2DBE5DD1143CEA48C4DA3AC33304E0F81C658AAA4A8A360B32644EEE5072E623AE86B6AA9F2E9533281C99E630D7CB832E41D41E70A33C495B572FCB9DCFF00DC40C1249CCEDE0562A73524788E588AE15D0FC8A87196E04E63CC714FA433290278C38E75D8714B5B4D58BAD0B8246F53B08FD8DD0F9C1B554A728AA24F88AAF0699D4B545FEA173D912A463F019FACFECA792389759DD54739200C4B79B7C5B3A6EB91C8A09C49A4518FF4E9D8F85980F5678AEAF9AB995A4C805CF5546E19F6E491E260E8C5586D046C38B5DD855E50CD90940F107CBF62E8157AD3DC66A463B2A1015F2D38349BBBD71FE31FD8F24B142BAF23AA81CA4E431517FA58F35855A43E6189EF75D36615C460F228C8E19DE46D6762C4F3924F6F869E6A86D5863673E01BB10E8F54380669550730DA70BA3D483E549293E0200C0B0D2290C924CAC0E6086198230010002733EBFD894F3C94D3C53C4DAAF1B0653CC41CF169B9C376A186AE2D9AC3265E5561BC1C6994663D21AB3C8E1187E2807EC5A8AA829575E69028E40779F10C55E903B66B4C9AA3BE6DA712CD34EDAD2BB39E7273E2505EAA69D022450841C8148C47A4677494FE8B621BDD04BB19D90F330C2491CABAE8EAC0F28208FD8DA317F366ACCA524D34A409077A7BE18D3C8D5ABE8EAA320A4D4C006077EA93EFFD8954D706CD296355E791C8FE4061EC771998BC9346CC79D893EAC3586B977188F898E24B4DC22F954EC7C9C8FAB0CAC8DAAEA411BC1191E291CB2C4DAD1BB29E704838A5BF54C592CEA245E7DC714D5F4B583F5520CF954EC23F62C95B512D24348EDAD1C4CC63CF7AEB6F00FEC69658E142F238551BC9390C565FD8E6948B90EFC8DBF80C492492B9791CB31DE49CCF16562AC1949046D046C231417D65223ABDABB848378F1E159594329041198236820F1CB1E885AAE36AA5AB99A7E992292DAAE00D87C58EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8D2AD19B6D9ADD15452994BB54043AED98C8AB1E395F758288151D9C9DE8E4F1E2AEB27AC7D799F3CB728D807161967B71476BA1AE4D68EA1C30F94A40CC624D1C703F575009E62A4627B4D753825A22CA395768C586B1B59A91CE6322533E4238E6897CDFB7F90DED1E21D103B8D07DF53D86E3772BD08F5A0A539B6E693907806199989662493B493B493DA9519DB555493CC06670969BA49B5286A0F8E32063E20BCFEE5260D8AEEA3334337E033C4D435B00266A59900DE59081DAA19A5A795648DB2618A0AE4AE8438D8E3632F31E034B4E6759FA58120CFB21B09CC65B72E39A25F37EDFE437B47887440EE341F7D4F61B8D5DAEE64D6829CE49B99C7D2F00EB2D76BA9BAD488611901B5DCEE41CE7145A3769A3500C0257E56906B67F81D83125AADB2AEABD14047F0C038BD689AC71BD45BB3C9412D09249C877BC3436EABB94DD2A9A32C47CA63B0283CA716FD11A1A70AD544CF2736E40710D3C14EBA904488BCCAA00EB6AED16DAE07A7D32163F480C9BCE3175D119A9C34B42C6551B4C67E581FD7041525586446C20EF078296966AC9D2081359DCE407AC9C5B7456829515AA544F2F293F201E60306DB6D2BAA68A9F2DD974B5CB174D12A4A8467A21D2A5DE1733A8DEEC4D14904AF14AA55D090C0EF0470505635154AC836A9D8C39C1C2B2B2865398233047283C7744BE6FDBFC86F68F10E881DC683EFA9EC3719BCDD092D4B036C1B2461EA1D6E8DD12D1DAA020767281231E539ED1E61C33CD1534324D2B6AA2292C4F2018AE9A3A9AB9E78E3D4577242F3027163B24B7798924A4087B37E527986292929E8615829E30883906F279C9E53DA6F5A3B4F730D3459475006C61B9FC0D89A192095E2954ABA12181DE08C689D7535257B24CA019804493BD39E797E3D6699D12A4B4F5AA322F9A3F848DA0F0D86A8CD4A61639B44721E23C7744BE6FDBFC86F68F10D2CB555DE2DD1414A14BAD42B90C72190561FD712E87E90C433F816B8E74653FD71514B5548DA95104913720752A78B5CA6AA11F49A58D9A471B586C0A3C6710E8FD53ED964441CC332711E8F52AFFA923B9F0640605A6DB102C61190DA4B3123172A9A695FA552C4891A9DAC1402E782D722CB6DA2753983047E700023874C6E44B476F8DB60C9E5F093B8629E092A668E08866EEC154784E2828A2B7D2454D16E41B4F2B13CA7B5E985AC145B8C4BB464B2E5CA3703C1A3F72372B723B9CE58FB0939C90361FC7874D6451434B19CB59A7D6FC0023FAF0D966E935C8A4EC7057B6565FA8686A1A0944BAE002725046D19E3AA9B6734DE88C432ACF0C732E7AAEAAC33DF930CC67DBF44BE6FDBFC86F68F129A186A22314D1248877AB0041C5E341692A034B6D6E9327FD324943EEC55D1D4D04EF054C4D1C8BBD4FAC1E51C5A69E2A78CC92B0551CA7D43171BB4B5A4A2669103B1795BC7C3A27798D17E2E9DF2DA4C4C7CE5781995159D8E400249E60369C56D4B56554F50FBE47276F202760C686D074C9E6AD71B221A89E511B4F9BB654431D4C32C120CD5D4AB0F011962AA99E92A66824F951B953E1C8E3442B0C1726A727B09D081E52EDE09658E18DA49182AA8CD98EC000C5FAEBF1AD7174CC428356307D7C314862963906F56047E073C0218023683B476BD24EEBCDE4A7AB82DBDCEA2FBBC5ECF6FD12F9BF6FF0021BDA3C42F77982C94A953346EEAD204C932CF3209FE98A5D38B14E72779A1FE227F6938A7A9A7AB8C4B04C9221E54398E0BE59296F74C639405914671C806D53EEC57D0D45BAAA5A5A84C9D0FE047211C52A6A22A585A590E4079C9E618ADAE9ABA5D673928F92A3728EB68B49EEB46A135D6541B00901240F01073C55E97575553490086141221562332722382C947F01B65342464C5759F9F36C5D7A30689D9EE5596DA98EBCCD4F3189F52252335E6CDB1FA72D0BEF2E3F92BFDD8FD39685F7971FC95FEEC7E9CB42FBCB8FE4AFF00763F4E5A17DE5C7F257FBB1FA72D0BEF2E3F92BFDD8FD39685F7971FC95FEEC7E9CB42FBCB8FE4AFF763F4E5A17DE5C7F257FBB1FA72D0BEF2E3F92BFDD8FD39685F7971FC95FEEC58EF349A4169A5BA5187105429282400364095DA013CD8D32A2E9559155A8D92AE4DE52E296A24A4A88A78F2D78D830CF712390E0E9AD7EA6429A0D6FF00BB15F78B85C8E551312A0E6106C51C114324C5846332067AA3791E01C340FD328A9DF94C4A0F8C0C8F6BD24EEBCDE4A7AB82DBDCEA2FBBC5ECF6FD12F9BF6FF21BDA3C43A20771A0FBEA7B0DC14172ADB64C26A499A36E503730E620EF18D1DD25A7BDC4636023AA419B47C8C39D7834C2CAB72A135312FF0098A752473B20DA47132400493901B4938BA57B56CE754FEAD3628E7E73DA2D34BF0CB952C04661A505BC4369E0BBF419D17BD5D2B6E5515973596A67795D52588282DCD9A1C5B3FC3268057D143506E77D05B7E53C1FD61C5FBA0369FD0E93D45A6DB669EAA91A7614B599AF4B30F2348FB94E17FC2F681414624ABBB5F3A62440CA526802663981871FA05D0FFDFEEFF9B17FE2C7E81743FF007FBBFE6C5FF8B1FA05D0FF00DFEEFF009B17FE2C58FF00C3BE835CAA5E19EE37A04266BA9343FD62C744CFF0DF5161A2A3ACD0B8EE372DAE2AE099E379877AD18444C7439FF0D62F1679AB74D3E31B7CEF2814F4F03C4AE1072CA1D1F179FF000F3A0F4159D220B8DE5804058BCD0FF48B160B2D2E8EDA292D348F23C34EAC11A420B90496DA4003971A554C2A2D123E5D944CB20F51F5F5B0CAF0C89221C994E60E25A1A5BB53AD4C39248C3691BB31BC1C54534D4B218E6420FF002239C1C595B5ADD10E62C3F993DAF493BAF37929EAE0B6F73A8BEEF17B3DBF44BE6FDBFC86F68F10E881DC683EFA9EC370D2554F4551154C0FAAF1B02A7FA1F01C5AAE115D2821AC8F6075EC97BD61B08E0D21A016DBBD553A8CA3D6D78F9B55B6E5C4AFB5661A71021C9E5D879C28E0A6B6D65500D1C4429FA4760C32EA92B98391CB31B8F8BAED15282F50EB6F2B205F370D9EF52DAD995975E163995CF683CE30BA4D6729999D81EF4A1C5E7480D74669E9D4AC44F644EF6CB9314743515ADAB1AE406F63B00C2E8EC3ABD94EE5B9C00062AAC353102D0B094736E388269E8EA1258C95910F2F21DC4118A4D2AA19507C24344E06DD8594F9B15BA55491C65690348FB8120851896592691E5918B3B1258F393C17865169AF2E401F07900CF9C82075D61ABE9539A773D8C9B57C0C31534B0D5466399731FCC1E718B7D235142F116D61AE4AF3E4475ED73B7C6CC8F5508652410580208D841C7C6D6DFDF21F4C63E36B6FEF90FA631F1B5B7F7C87D318BF4D0D45CA592275742A9930398D838282E76F8E86911EAA10CB046082C0104000838F8DADBFBE43E98C7C6D6DFDF21F4C63E36B6FEF90FA6310CD0CE82489D5D0EE60731B3676BD12F9BF6FF21BDA3C43A20771A0FBEA7B0DD6743CAC256B68D8EE2B2A7A9B83A21D385ACA1A81BDE174F408FEEE2571792BAE4EB182C41D4503C18A0B2434E03CE03C9BF23B42E2ED53F06A190A9C99FB05FC7AFA5A89292A22A88FE5C6C187E0714D511D5D3C53C4735750C3F1E43D65B6DCF5D2EDCC44BF29B10C31C11AC71A80A06400E1B85B22AD52DB16503630E5F01C4D0CB4F2B4722E4C3ACD31B808A963A243D94A759FC0A0FBFAE5664657539104107988DA314B38A9A78E65DCCB99F01E51DA2E5DD1ADFBC4BED1ED5A37DC887CA7F5F6BD12F9BF6FF21BDA3C43A20771A0FBEA7B0DD6743FEEC547DD1BDB5E0E88BFE8DBFCB97D4388CCFD2E291C0CCAA93E619E2D76F14916BB8CE67DAC4F267C83834867D69E2801D88B99F19ED1A1F74D566B74ADB0E6D113FCC70D151C95B308D360DECDC8A310C31D3C4B146B928190F79EB6E56F5AE876642451D8B6195A36656043039107782382A278A96192795B2445258F8062E15B25C2B26A9936173B077A06C03AFD1DA8D68E5A7276A9D65F11ED159A37709EAEA26530EABCCEC33639E44938EA5AE5DF43E91F763A96B977D0FA47DD8EA5AE5DF43E91F762B2926A1A86825D52E00272398DA33E08746EE13C31CC861D5755619B1CF223319E3A96B977D0FA47DD8EA5AE5DF43E91F763A96B977D0FA47DD8B4524D43431C12EA970589C8E636927B5E897CDFB7F90DED1E21D103B8D07DF53D86EB3A1E52106BAB08D9D8C4BEB3C1D10E70D5543072A46EFE99C87B3C52BE6E9F593BE7982E40F12ECED114AF0C89246C559082A46F046D07168B925D28639D720FBA451F4586111A4754519B139003949C5BE8968600836B1DAEDCE71A71A4955A2B617B8D2D1FC224E9AB1807E426B0F96F97262E3D11B4CAE4CC5EEF342BC8B4F94207A1B7125F6F531CE5BA563F95339F59C41A45A414C4182F15F191DECEE3D471A23D12B4C7E34A3A1919AE51CB2AA189901932E70C382FB42197E1718DA36480728E7E0D2EBB74C905BA16EC5083291CA79BB459E6E935F16DD8F9A1FC7B6692775E6F253D5C16DEE7517DDE2F67B7E897CDFB7F90DED1E21D103B8D07DF53D86E182096A668E1850BBBB00AA37927165B6A5A6DB051A904A8CDDBBE73B49E0D25AF171BCD54AA738D5BA5A7893666389D449D260964EF118F9867DAB44ABCD35C3E0EE7F5738CBC4C36838B1D06A2FC2A41D930C901E41CFC0CAB22B2BA865232208CC10790838AEE873A177062F2D9E147E7859A2FE4840C744FD0DB268AC16B7B624CA677983EBC85B628523168E85BA1868A9279A82595DE18E43AF338DA467F448C5B6C968B3214B6D053D38232263400B78CEF3C0C1594AB0CC119107941C5FC8B2A55C8C3358D4B267CB9EC5189247964791D897624B13BC927327B42318DD5D77A90478C1CF0AC18061B88047E3DAF493BAF37929EAE0B6F73A8BEEF17B3DBF44BE6FDBFC86F68F10E881DC683EFA9EC37052D254D6CCB0D342D2487914667C67986346745E3B3AFC22A355EA986F1B901E41C1A597916AB73471B655138291E5BD41DEDC52ECDA96EA83CE00F3903B5689D09B8E915B69F32019C3B78A305CFAB000000032036003ACE8E7FED2C5FC59FD4B8B4F72ADFF758BD81D6745185CD8E19D06EA84593C920F6AB7BF4CA1A66FF00EA51E61976BD24EEBCDE4A7AB82DBDCEA2FBBC5ECF6FD12F9BF6FF0021BDA3C42FF665BE51C74CD318C2CA1F30B9E79023FAE29B402D7110D3CD3CBFF1CC28C515BE8ADF1F4BA5A748D797547ACF05D6ED4967A533D43F38441BD8F30C5CEE55175AC92AAA0ED6D8146E50390714BEB656F61CEEA38111A4655419B139003B474355074A21246E82523CDD65CAE96FB3D1C95B70A9482041D93B1E5E61CE71A67A4F70E8875C905A6D933D3512CB228542F211CAEF963407A25DBAED1535A6E5AB4B5888B1C6C4E51CD96C00733759A6D4E2A7456E8847C98C49E228C1BAE033200DE70C8D1B14652186C20EC2386CADAD6D87C1AC3F99ED77EB7D7545CA5922A691D0AA64C1491B063E29B97EE737A07140AD1D0D2230219608C10778200041EDFA25F37EDFE437B47893B84059C8006F39E400C5E34D6DF421A3A322A26F01EC078CF2E2BEE35973A86A8AA94B379828E61C56FF00FEC07F15782D54029A95EA645FD63212A0FD119768D03A914DA556E2C720ECF1FE2E840EB34A740B4A74AF4AC8ACB80169401E26FF00A60EF454EFF9DB161D1EB4E8DD0AD1DB69C469B0B31DAEE7BE76E538D37E86141A43D36BAD9A94B70DA5B9239BCAE63E1C681506915BAC11417FA83254063A88C43346836052C3E570E994C20D17BB31C8034E53F17217AF82963BBDB918E4278C6A6B73E5B81C4B1490C8D1C8B9329C883C16327E2F4CF919B8E6897CDFB7F90DED1E21A5177AAB25045534CB133B4E2321C12322A4F211CD89B4E6FB28215A08FC88F3F689C565D6E3703FE6AAE6979722C721F80D9C5EFCB9D013CCEA7169A3F85D52EB0CD13B26F0F30C557FB59FF86FEA3DA29AA24A4A986A22393C522C8A798A90716FAE86E5434D5909CD268D5C6DCF2CC6641ED3D13EFF00174A8EC903E6E59649FC000CD57AFD1D9489278B3D854301E23962EF6E1570F4D8C7EB507A439B82CA08B6C279CB91E7238E6897CDFB7F90DED1E21D103B8D07DF53D86E33785D7B74E394053E620E2C94FD2688391D94A758FA862B333475396FE92FEA3DA7A1BE94A52B7C4B592011C8C4D3B13900E77A7E3C9DA34C74CE0B044D4B4ACB257B8D8BBC443BE6FE83134D2D44D24D339791D8B331399624E649EBEC2756BC0E7461C17BA314F53D3546492E67C4716C5D4A0A61CE80F9F6F1CD12F9BF6FF21BDA3C43A20771A0FBEA7B0DC66A22E9F04B16E2E8C078C8CB088B1A2A2EE5000F101962A4674D301CB130ED5A37D126AEDE894B7647A98464165073957C7DF62DDA5160BA2A9A6B8C058FD076D47F45B2C0208CC70DC6EF6CB4C7AF5D591423780CDB4F8946D38D21E89B2CEAF4F644689796A240358F90BC9877795D9E472CEC4966249249DA492779ED16304DC633CCAC4F05CA97E174922019B0DABE3188D0471A20DCAA079865C7344BE6FDBFC86F68F10E881DC683EFA9EC371B650CA54EE2323860558A9DE0E5E6C51D3355D4C708DC4ED23900DA4E2EB0886BA6441928D5C87808ED305757530CA0AA9E21CC9215F561749F48933CAF15DF8CCE7D789749348275D492ED58579BA730070CCD2316662CC76924E649F093DAB47935AAE46E4588F9C9E3FA25F37EDFE437B47887440EE341F7D4F61B8E5C62E935B509B86B923C4768C68EC2339A73C9920C69047AB568FC8F10F3824712A68D66A88A26390760BE2CF66244689D91C64CA483E31B3874761D5866948F94C00F101FFBE3F05E6EB4D12C30574E91AEC5557200CCE78EA82F9F5954FE61C75417CFACAA7F30E3AA0BE7D6553F9871D505F3EB2A9FCC38EA82F9F5954FE61C75417CFACAA7F30E3AA0BE7D6553F9871D505F3EB2A9FCC38EA82F9F5954FE61C75417CFACAA7F30E3AA0BE7D6553F9871D505F3EB2A9FCC38EA82F9F5954FE61C75417CFACAA7F30E3AA0BE7D6553F98715574B8D74623AAAB9A540DAC15D890080471CD2180ACF1CE06C75C8F8C62C49AB6F46EF998FF4C69143AD4F0CA3E83907C447FEB8950FFBDA5FE327AF17EA6E9554B328D920FE6386820F8351C3111910B9B78CED3F62EE54BF0BA474519B0EC97C631653FF00C6C03946B83E962BE0F84D1CD101992B98F18DA3AC891A5911177B3003C64E5DBAD8BAD5F4C3FE60E2F14FF08A09321D927663F0E0B5537C26B63523344EC9BC43EC6C50AC3AE1360662DE22782E74DF06AD9540C949D65F11DBC3695D7B8D38E6627CC09C54A74AA8993BD761E63DB6C69AF7046EF158FF002CBFAE0804107683B0E2A6134F512C47E83100F833D87163A5E914BD35864F2EDF101BBEC7DFA93A75389D476516FF000A9E1B18CEE0879958E2F70F4AAF73C8E030EDBA3B17655129E401782BADC6A6ED1E43B0750CE7C9C0000000C80D83EC7B2AB295619823220F2838B8D1B5154B47F40ED43CE0F0588E57041CEAC31A4306B4314E06D4391F11E1B5522D6493C6DB3F52723CC73191C488D13B238C994907C63ACA785AA268E2539176001E6CF12C4F0C8D1B8C994E447596487A5502B1191762C7EC9DC6856BA029B038DA8798E1D1A37647043039107908C5A1B52E34E790923CE08C5542B530490B6E7523C4790E1D5A3665719104823C2367068E8FF3139E6403CE717EA1DA2AD0730900F303D65A575AE34E3C24F98138BE5074D8FE1518EC907660728E145323AAAED2C4003C2766218D6289235DC8A00FC065F652EB6B5AC5E9B1E42603F060390E212D4D551B3820A4AA483B08C8F05FA93A5CCB50A3B17D8DE061C1A3A7FCCCC39E3CFCC71246B2A3238CD58104780E2B695A8EA1E26DA06D53CE0F0D90677284F3073FC88C1008208CC1C5CE88D1549551FAB6DA8782CB074EAE462331182C7ECB57DB21AE1ADF22403630E5F01C402458635932D70A0311B4120659E2A69D2AA1785F730CBC4790E27864A795E29064CA723EF18B03EAD711CF1B0E0BAD08AD83B11FAC4DABE1E7182082411911B083C165245CA11CE1FD92782E9462B295828ECD76A78C705869FA5D2B4C46D91BF90FB3377B77C2E2E9B18FD6A0F4862D2FD2EE3013CA483F882386F56DCF3AB857C3201EBE0B49D5B8D39FF911E70470DDA84A57AF4B1B273D8F944E44621896189234DC8A00FC07D9AB95B4ACCB5B4EB9B2306751CB91CF318041008DA0ED1C376B51A7267817388ED603E81C5136A5653BF2095785A2491919D41287353CC7223ECF9008C8ED07171B2B231A8A3198073318DE3C230AC1D5586E201F3FFF00C9BFFFC40042110002010202050905070106070000000001020300040511122131415110131420303261719122335272810623404250A1B1C11524626370823443537392A2D1FFDA0008010201013F00FF0042667D04CC6DCC6548C1D430DE3F502428249D552C9CE3780D9512958D41E1FA79214124EAA9A6321C86A515041964EDF41F849AF2D60244B3229E04EBA6C6B0F5D9213E4A6BFB7AC38C9FF8D2E3587B7FCD23CD4D457B69364239E32786972820FE16E1C96D1DC2ADE107DB61E5F8570841D3008F1ABA1811CF9C3103FE0DBFFAD4E2012BF3058C79FB25B6F2A5DDD46BA293C80700C69A47739BB163E249E486FEF2020C733F91398F43587E32972C22980593711B0FE0E7044AD518C914780FC1DD5FDADA0FBD90697C2359AB8C7E77CC40810713ADAA6B89E739CB233799EC2CE3C1C646E26766E04155FDAA0B5C26619C290B791D7F839E2D35CC778544738D3CBF052C66452BA6CBE2BA8D3E0B6191662FC492D57B1D8C4DA36D2BBEBD79E5976409520824115698D5D5BE4B27DEA703B7D6AD2F60BD4D389B58EF29DA3B679163199AE93178D7498BC6BA4C5E342E62F1AE93178D7498BC6BA4C5E34B711B30519E67B6BABB86CE3324ADE4379F2ABEC4A7BD6209D18F720FEBD56655EF301E75CF45FF00513D681076107AB87261B7CBCCCB005946F52406F1151611D12E639ADA52003932B6F53DB5D7707CDD843EF57CFB5BBBB8ACE132C9F41BC9ABABA9AEE5324A75EE1B80E4BBBC91E464462101CB56FA86E6789C156275EC3AF3A791638F9C7F646599CEAE31096524467417F735AC9CCF22B321CD4907C0D5B62246493EB1B9BFFB533B244EE83488198A79E691B49A46CFCEAC2EDCB88A46CC11EC93B454723C522C887265398AB59D6E608E65FCCA091C0F6D75DC1F3761110245278D0756D8C0F693E1B0DD4BCE4ECED96A55CF202AEBFB2F0D4FF878CB91ECAE599A9A669E4691B204EE1A80F01573134333A91BC91F5AC361124A6423520FDCD62539690440EA5DBE7D6C367D38CC676AECF115790886760361D62B0F899E70E06A4D79F8F27D9F98B412C47F2B823EBD67B8915D80CB51A1AC03E1D7BAEE0F9BB000B1006D3455936822A2B82A407D638D02080476588DF2D941A4322EDA9054923CAECEEC4B13992791E38E5193A861E34A915BA31550A0024D59361F24D2B62064D12331A1C73A8BECEE13346922194AB2820E96E357D86E01879413B4F9B8246473D9597D98F8AE6ACF04C16FA11340662A491ACE47555E60D825843CF4E660BA41751CCE66ADE48E3BEFBA24C65D82E7B744ECA92086520C880914AAA8345400380AB6B33788E22239D4D7A07F30F03580E94779344E083CDEB07C08EB4BEF1FCE97BA3C875EEBB83E6EC21F7ABE7440232353C5A0735D86ADA4CF343F4ECAE21B8C5AFE4E6FDDA1D00C760CAB12B482C9E38518B3E5A4E4F2CC86489D06D65228820E4751AB2C72FAC62E650A320D81C1395416D738BCC6EAF1CE86C196ACC0E1E15261162EBA223D13C4139D09710C05CF34C1A273BC66A4F8F0357F89DD622CA6761A2BB100C80AB64324F1A8E20FA72DA5C35ADC4732FE53AC7114B1C323A5CA805B43530DE0F50DD3039688AE94FF0008A63A4C4F1342E580EE8AE94FF08A43A480F11D5BAEE0F9BB087DEAF9F24E3389AADCE52AFD7B1209040391CB6D410C76F12C518C95455F4DD22EE7933D45C81E43575311B7D07E797636DF03586D89BC97DAD51AF78F1F0A8A025405C828D42BA31F8855CDB2BA34528055855E5AB5A4ED1B6B1B54F115875BF371F3AC3DA71ABC0753049B9DB155275C64AFD37750DB46493AEBA345E3EB4E02BB01B8D0B68C8075ECAE8D178FAD0014003AB75DC1F37610FBD5F3E4B970134779AB65CE4CF80ECAE1F9B8257F8518FA0EAC9173E8D1FC5A855A5B25AC0B12EEDA789A048D848A677E6A33A475E75AF79AC4AD16E6343BD187A6FEAFD9E9327B88F71556F4D5D697DE3F9D2F74790EBDD7707CDD846C15D49D80D3DCA0EE8CCD12D237126A18F9B5F13B7B2C44E56373FF006CD595A3DE4DA0352819B9E03A91FBC4F3E4550C759C8569C6DEC10401B0D1191233CE9FB8DE47A97368F02C720D7148B9A37F43E35801FEFAC38C47F91D66B65662748EB340643AF75DC1F3760AA5880369A16AFBC8151C291ECDBC7B3BF5D2B3B81FE53561B6A2DB0E6623DB910B37D46A1D58DC48A1BA93CBA8A2FD7A985C69778573328CC0665F2DE2B07B67B7C46E237DA9191E6091DB5D7707CDD843EF57CFB5650EACA761041A64050A01AB472CA9119DC228CD89C80F1A96330CB246DB518A9FA72A3B21CD4D2DD1DEB5D297E134F70EC32032EAE02B95867C6463FD28448266940F699403F439F6D75DC1F37610FBD5F3EDECED7431B95586A42CE3EBB3F9AC5E2E6AFE6E0D930FAF6296FCE58C938DA92647C88E4B087A3D9C319DA175F99D67B7201DA2B417E11E95A0BF08F4AD05F847A5682FC23D2B417E11E95A0BF08F4AD05F847A568AF01E9DBF4602F16E46D31146F5041AFB4306A86703FC0DFC8E4311E8EB37190AFEC3AF835B8970E9D1B648E47EC2B0DB369EF951C6A8CE6FFEDDDFA45D40B730490B7E61A8F0352C6F0C8D1B8C994E46A3879DC0E4206B49B4BF61C8D0BAC51CA47B0E5803E2BC8AA5982A8CC939014415241191E4C2E2E66C205DE5748FFBB5D41691C124D22F7A47D227F49C5F0C37239F847DEA8D63E202B01C9EDAE2171B1F583C18655776ED6B71242DB8EA3C4558DAA5E60E223B7498A9E06A44689D91C64CA4822AC867796C3FCE4FE6B1DB1D06E9483531C9FCF8D5BC4679E3887E6602800A0003200643F4B5822499E655C9D800DE358C581BA884B18CE441EA2B006CEC997E190D63587F38BD2621ED28F6C711C6AC8E5776E784A9FCD4D124F13C4E3356041AC1EC5E2BE9CB8F75EC83C4B7E9D15B4704B2BC7A8484165DD98DFC988614D1482EAD5730183320DDE2286B00D6401240DBFE9D7FFFC40041110002010202040909080103050000000001020300040511122131410610132022305172911533344252536162711432405081A1B1C163237082167392A2D1FFDA0008010301013F00FF00626CA113CE15866B9126A58CC52BA1DAA7F30556760AA332760AB4B616D1E5EB1D6C6AEA412DC48EBB33FCBD559D82A8CC9D82ACED16D9733ADCED357F7D9E70C4756C66FEBF090585EDC8061B79187681AA9383B8B38D7085FABAD7FD3389FF008BFF002A7E0EE2C9B210DF475A9B0EBE83332DB4AA06FD124716BDC28823683F85C36054844A4749FF008AC46ECAE7021D79748FE150C8187265836ED1DBFB5591E12AE5C8898AFF009367FEF56A6E0C09F695412E5D20BB38E5B0B299C3C96D133769514914518C91154760195100EDAB8C2EC2E8112DBA13DA0007C4562DC1F92C95A7B7264886B23D651F83B070F6B1FCBA8D5C1267949F6CFE0ECB0BBDBF239188E8FB6DA96AD382D6D180D732191BD95E8AD41696D6C3286144EE8EA2FE5E1012C2D608D53B43067FDEAE2F71D809FB4493A6ED6321F83B0B9E424D163D06DBF0ABB1A37328F9BF9FC1432885C3F268F96E7198A8F8478A02A88223B8284FD8655874B894C9A5790C718235004E978754CA181560083B41ABEE0ED8DD02D10E45FB5767EA2AFB0EB9C3A4D09D751FBAC361EBA0824B862A9966067AEBC9973F2F8D7932E7E5F1AF265CFCBE3470EBA3B747C6BC9973F2F8D7932E7E5F1AF265CFCBE352585C448CEDA390199D7D75958DC5FCC2281733BC9D8A3B4D61B835AE1CA0801E5CB5C87FAE76BEC3CEC5E5C630C7E5E1B92F013EB2A9D1F81D55363E2FACE5B6BC80124741D3730D9A8F5D8579F7EE75179E8D2F77ADB0B19B10B858621F166DCA3B6ACACA0B080430AE4379DEC7B4F12AE54403596672A0A0730A7650AC80A65DE2A68A39E278A45CD1810455E5B3D9DD4D03ED46C81ED1B8F5D8579F7EE75174ACF6F22A8CC95D429E2953EFA30FA8EB2D717B8B180C56C91A127367CB3626AC7CB58C49E952AC40F4DF32A3F4032CCD5BC096D0AC4849037B1CC9F89340E6298EAA41BF9CE35D29CC531C87170AE0097504E079C42A7EABCE830FB7922476D2CCA8275D380AEC06E279F8579F7EE750CCA8A598E406D3492C337DC756ABAC392405A11A2FD9B8D105490464475584618D895CE89D5126B76FEAA28A382358E350A8A3200710245664D5C7DA42AFD9F473CF5E953627768CCA74330723AAADEEEFEE4318C47D1CB3CC6559E2BD9154F7F7B6F218E4080E5D9505FDF5C49C9C623CF2CF58A018C634F2D2D119E5DB5991C579880C3E48CCEBFE8B9CB941EA1F9876570A024D616F323061CAEA23582181E75AFA3C5DC15279C7EF1E7E15E7DFB9D45E7A34BDDA04A90549046C22AC2ECDC2947FBE078D6290052B301B7537556B3DA603864226D72C8BA6506D24D60F7F738924B3C88A91E968C6A36EADA49E31A88E2B8C3EDEE1F4D8303BF2DF4F2C3629C8C0A33DFBFC696F6E14E65F3F811452DB1251A608751B8EBAB6B486D41E4C6B3B49DB44E438EF6D52F6D6581BD61A8F61DC69A6B88A392D198840FAD0EE65E6261711556E51B5806BC9517BC6A8D0468A80EA000A6C2E26627946D673AF2545EF1AA5411CAE8362B11CDC2BCFBF73A8BCF4697BBC562C56EE2CB79CAB1000DA49F0C8F52A406048CC67AC55CDC4B7533CD2B66CC7C3E02B0CB7FB2D85B45BC4609FA9D679887755D5C081357DF3B2892492759359D23B230653911504CB3C61C6DDE3B0D39DDCCE11DB08312660354AA1FF005D8798312B95000D1D400D95E53BAF97C2A1732431BB6D2A09A7C4AE55D80D1D448D95E53BAF97C29DCC8ECEDB49CCF370AF3EFDCEA2F3D1A5EEF161B0979F9423527F3589C812DF477B1EAAD63E5AE608FDB9557C4F34B6802C760049A96569A42EDC59664F1594A639747736AE6F0B22CE2B5972D8CCBE3AF9D6BE8F1770549E71FBC79F8579F7EE751728D2412228CC91AAA2C2E562395214789A448ADE2C864AA2AF2E4DCCA48FBA3528EAB0919E2767FF00796B11BF8EC20E51B5BB1D145ED279930CE2907CA78F23C51E7CA265B748732CEFE3B979616E8CD1310E9FD8F8570A4678721EC9D7F83CE8F1292345408B9280298E9331ED39F3F0AF3EFDCEA24758919DB60199A7C56103A08CDFB55C5DCB707A4725DCA3ABC31B4311B46FF327EE6B17BD3798B2A83D08A408BE3ACF3668CC52152356E3F0E659C04B09586A1B3998D4B2586362E2139368237D77106B1FBC8EEF08B4963D924A0E5D9929CFAEC2BCFBF73A8BCF4697BBD6A3147575DAA411FA52B9120727321B3A92448A3695CE48ABA44FC2A0956782299763A2B0FD467C7246928C9C674D603D57F115F607F6C547651A1CD8E91FDB9BC2760D89E5ECC4A3FBA33C8D02404F415D9C7D5BAEC2BCFBF73A8BCF4697BBD7E217BCA707217075CA1233F51B7F8AC026E5B0AB7ED4050FE87A97BBE4B128ED98EA921257BCA73E2C4EE05D5FDCCC0E60B900FC1750EBD5994E6AC47D0D72D37BC6F135CB4DEF1BC4D72D37BC6F135CB4DEF1BC4D72D37BC6F135CB4DEF1BC4D72D37BC6F13465948C8BB11F53D78BB26C1ACDB6098489E04115C14BA00CF6A4EDC9D7F83C4B38376F6FBC42B2789239FC21BA68317B59136C28A7F7272AC62FD6DB0D6951BA52A811FFC8679FE516774F657515C26D46D63B45432C73C492C6D9A38041A9AE390E1242AC754B6E13F7247125CC6F3CB003D38C2961F06E27654567639050493F014AC180652082330471635372F8A5CB03A83688FF8EAAB9BD96EA2B689FEEC31E801FDFE5380E302CDBECD70DFE931CD5BD83FFCAE13868EF2D2E50EB318D161DAA73FEEAC6ED2F6D229D7D61AC7611A88AC4EF64C3F840671B0040C3B548A8A449A349636CD1802A7B41AC44E8E1F787FC127F15C19C4B9443632B7494131F77B2AEE75B5B69A66F5109A662CC598E649CC9FCADEE67920481DF4911B34CFD5CF70F85707F14165398266CA290EDF65BB6B8509A388237B508FD89AE0E62A216165337418E719EC3D9588AE9585D8ED824FE2A09E4B69A39A339323022B1FC4D27C36D8447CFF00488EC0BBBC7F2E9EF25B98608E5D6620555B7E89DC78B0AC712784D9DE3E44A15590EC39EE6A208391A2490012721B3FDBAFFFD9, 1, 0, CAST(N'2021-12-21' AS Date), 1, 77)
INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (5, N'My post 5', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0xFFD8FFE000104A46494600010101004800480000FFE2021C4943435F50524F46494C450001010000020C6C636D73021000006D6E74725247422058595A2007DC00010019000300290039616373704150504C0000000000000000000000000000000000000000000000000000F6D6000100000000D32D6C636D7300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A64657363000000FC0000005E637072740000015C0000000B777470740000016800000014626B70740000017C000000147258595A00000190000000146758595A000001A4000000146258595A000001B80000001472545243000001CC0000004067545243000001CC0000004062545243000001CC0000004064657363000000000000000363320000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074657874000000004958000058595A20000000000000F6D6000100000000D32D58595A20000000000000031600000333000002A458595A200000000000006FA2000038F50000039058595A2000000000000062990000B785000018DA58595A2000000000000024A000000F840000B6CF63757276000000000000001A000000CB01C903630592086B0BF6103F15511B3421F1299032183B92460551775DED6B707A0589B19A7CAC69BF7DD3C3E930FFFFFFDB0084000506060709070A0B0B0A0D0E0D0E0D1312101012131D15161516151D2B1B201B1B201B2B262E2623262E264436303036444F423F424F5F55555F7872789C9CD2010506060709070A0B0B0A0D0E0D0E0D1312101012131D15161516151D2B1B201B1B201B2B262E2623262E264436303036444F423F424F5F55555F7872789C9CD2FFC2001108014D01F403012200021101031101FFC4001D000101000203010101000000000000000000010203040507060809FFDA0008010100000000F7ED3BAEEE66DE6F378DCFE65CF3280950A801615212480AE8F8DC5E36FE45ECB9BB59DCE94080582C2A0245C520535EB9B73C78B77E7573CA1442C0B2C149088020056649825CB3284B2A428A1110A840422E65B09232C90A96584A1615000809214B545205962C2A0A452162CB2A0882B5972B42CA4A952C1628082820088383BAE795CAC4A4C66592BCD7D2C4149400080C71079FFD076DBF2B9498EB9C2E264C797CECB3E3788FBDD280000885498C94794737B8EE79DBF2A6BE3717A7D39EEDFCBE7727A5F17F7DE46CB402CA10228C66211E71B77F3BB3E765B263AB83D261967B366EDFC8F9FF003CF54EF37EC932CF0C73CB28B4B02A5924807C3E51C8D77633E5E8E06BD9C8DBC8C2EEE379B7D8FD9B2972B75E3BF6C96E372CA8112492CA9E61B37632B2CAE595CF6EDDFC8CB2D9B7CE3BAFB9CED664C376292A6CCD445924902796E5B33B95CB2B965967B366CDBB77EDE07C37D07DB6DB93252593199E56816224C70656F9665B33CF76EAD5965B366596DDBBB76EF92EABBDFB6CA84C636D31C2B2C955180C26BCB2C9E5F967B36EFEC33D7C6D59E7B32D9B76EEDDAFCF7B1FADEF72A249192156D5218CC74F59A76F277677CEAECCB2B9E572CB3CF3D9B36EDDDBBE4FA5EEFECF999152626371B9E4501249A78B3667B3179EE5B361F0FE65EDBF1BEA99679EDD9B76EDE3799F6DF47F639DA120A282CB1098C858F3CCB6675E63E25C8E57EA1ECF3CF6ECD9B76F9870BBBFB3FA1CAD022485B6A9046331523E072CF2B7E47F3F7CEF03F50FA5E7B33D99ECE97C87B9FA2FBFED2E5422498D55CAA9088C718A3E1EE76E57ADFCBDE63EFBFA4367CE7C96DF49EC3C97E5BBBFA4F52D9964A8481925A045830843E36E595B72F14F37F45F58F91F1DE8793E85FA1BF3C6FEEBEFBD036656AA2C00150B0930C7298657A0D977EDACFA5FC39EABF39A389CDF91FA0F66F3EEF7BEF6CEE73CB3A0231A2D29098A30C325CA69D973B63AFF00C0BF41E7DCDE4713B0EEFE95DCFDD7BDE7950B0638E395B54B2A263249265532B498CC7F00EAF88E47698F63F67C1ECBBAF7CF4B1420049680892263461B850FCB3F9F3A2DDCBE5F79C8DFDAFD07EC2E5000150820B09182CD5863CBA50F04FC91D56EDDCDEDF3E6F69EF3EFB548B01448848A89263109378A1E01F90B85BF3ECB9BC8E477BFB8BB428014A9049098CC71490CA63CA91293F2FF00E5BD7BDD96DE5F27F41FE985141651621022638E33192DCB1BBB12C5E2FE3AF03CB639D9F2F97EEFFAAC5052288011124630A2D54AE9FF002D7E69E431E767BF7FD27EF0EF028B2A5400962082418E65A8F99FCF5F9536E58F2B76FDBCCFD01FAAD5710A8052004444115561F11F98FF003C6DC9B79796DDBDD7EEEFB3404A25B2502C811110990A347897E2DEAB1E4F22CDDC8E47B17ED7428258B640B6411248028A4EBFF1178A71377372ADFCBE5FF45FBD00B01525B8D4222489126E2AD4D5E67FCFEEAF66FB9ECE467CEFE8C7D154B484258B14448891211B6619E40F91FC2FE6ACEE5967CBF42FE84D85880094088849131930E54A5A5E0FE49FCCB72C26F9CFFD1FFAEC100112A58319319AF061AE638E3877ACA503E77F99FC2CB1DD37F27F4D7EB0A104309242632E298498EBC31D78638EA9A70FB650132FE657CEF1EDBB77FBF7ED098CC724C7198C48426331C70C98EBD58E3AF0D5AE69D797DF549226384FE7A79EE3ACDBC9F7DFD8A404318930C265AB1C31D7AD932C38F8E1C6EBF8FC5B72F4D4B52127E0AF35D58E194E57B87ECF4C5B1131930D78ED9AA5C74699CB7078BAD861C5EBF5618E59761D3FFFC400190101010101010100000000000000000000000102030405FFDA0008010210000000E9AC624BA0580B089016C4D6A0B955244082DA8A025B2A02408B6895CBB45004323D1C225D6B39C787E95B0A42120F46324ECC4E3F23ECD45552B3217D7089899CFC4FB5425682443D933CF57324F2F9FE8C25168C90F4C9E3E9DE499F9BE9F5A216A16483A1F0F87DFE99793C7F4BA9592D85920A4F8FE870F7F931F5ADA828248316BC1F3BD1EBE7CFBFD0AA92356A48CAA0F270F4671C7EA7508852222455F263AE70FA000CD0448917C3D77397A3B9500A2248CDAF97ECD6739F75405524488CDAF07A6E663BF7445968889125BAC79BD7CE73BEA8205224910D571EE989D12028492216EA9B9CF1A93245AB124CA4EB6EB575B63CF31248965A9313330FFFC4001A010101010101010100000000000000000000010203040506FFDA0008010310000000675B66640002CB42C9A490000558A242A0000028D491447A3CE0002979F691A674BF53E3A5802A6833771AE1AD5EFF006BE044B9420B43CFBACAF4D6BA7DDFCF652C5920B5638DD6F32DD6FD9E8F8E949520B6EA38E9F438F96DD74FAFE0F04A2C40B6895FA2F47E6796EFBBDFF1384A2A40B43A17ECF99DFC1EFDFC1C8040AAB3ACCBE97D3E1E3E9DBCBF2E216A416B733517DBEBF3EBA76F8DC405052CDDC8F67A386FA63E6404340AD5AC53E84C6BAF8FCA00055D5248FADE797A4F9A96C15016DA44FA3CA6B5BF279C00945D5219DFB7CBD35BCF841425AB6AD8C9DF0BBCF0B28505BAB571244E99BD1CEADB40A5B6DE3132CC6FBB76AD908AD6EEAEBFFFC4003E100001030202060804040406030000000001000211031204210510133141510620223050617181143240914272A1B12333435215242534537063C1F0FFDA0008010100013F012C7200A0E29CE29AE2A4A027726E48E632567926F8ABA885F0EC4FC2E7915F0D53926E15C8D384C626841AA1478AC2856A8508B415B2567FD011FF005A0A814A9EE254EB952A7ADA3310FA98BAD3CBFF007E12CA9E6A9BD03DCE69D5085B72B6EB6AAF29AF2AE53AAB3EDA4F77269581AC69E21AEFBF84841E4265629B5821501572953AA51211A8D4E7B4A746B0E41C9A5052B1EE8C2D5FCB0A9C0298EEC8F441DE0E292B506A0135AB2EA4A84EA7E69D20E7D60AE283969177F978F3080585A92DB792081572B95CAE528928394853F5B214852AE5B45B62B6E50C41471050AEB6C11A89CF275420D5615B245B0A3557A77D3704066B0C7B4DFB28EAC6A951A86A8EA4AB94FD2DC55CAE53DE4AB8A0F2A758440B8C735432210EA46B80A350D52A54EB851E1589AB633D4AA213613770EF23547D24A9EE442B5BCD5A39AB3CD46A85055A7AA35E35E1CE0DE49AA8B25C3C0654AC8F722102CE49A2928A6A51EEEA3C3185DC9664C94C0B0ADDE7BE953F424A79CD5CE401E6BDD02A54FD2E3AAE6183DD31302A4D860EEE3A91F4309ECE4853C90620C0A3AB0AD2A35694AB8A6336945CD2D6E551AB07A55F8670825F49DBDA77B7D154B7158476C9D21EDC8F9AD0B8F79270F57E66FCBEDC3B90ABD66D36171F64D74BA5337AA2D93E1F8EC3D4C3D476268E63FAB4F810AB8A5B4269B486EF83C256171B5F0EF9A6F8FD8FAA7E32ABF13B6C83A672C961AB0AD458F1C47738EC4ED2A40DCD54D31611BBCF7D2A7C0319A3DCF7ED68BECAA38F03EAB1CC736A9BE9ECDFC470F6D5F14D190CFD17476B36A60723987191CBAB1AF1D88D9502789C826EF54D3561C4531E171D5C4E168D7A76546C8FDBD169AD1B530D5053A66FB84F9C2D85468CC10BA27892DA8FA05BF3E61C3776542855F4850A66D99779669DA4F998E499A405D170CC2A551AE98331AB4C579AEDA7FDA3F74C298A8E640E68081E23D27A0FA629E25A46F0C702153AD41F4DAD78F65A2A9D318AA4E6988955F1CD6540C6893C56371E38D481FDA3295531961EC348CF79CD6D0BEA4BBE63C53AA16B8E7DA3C392C0692AA2ACDD901F754AAB5F4C3C6E21626B6D31351FCDC98530AD1CC979772F079D7B028502B628526AD93792D8B56C4214D691C252AF84AAC7891693EE335870E7170E2B0D5DD40073E45B9CAABA65CF790389CC1CA7EC8E20926EA0C74F9669D4C93BAC55AA50C3B40A7DA7919BB926954DF077266922DD1EE1C5DD909A734C29842C1D2D9D168E2733DFCFD446B035428EAE23F9157F23BF657186968F5858BC5D6F8420B85AE23D534DC336CFE8B64E8CB30B6B51ADB67228194D54C12E006F552A4C31A726A63930AD1D48D5AEC6F0DE7D02B54784C7704488E69F4DF86C69617105AF8CBC9695AB7387EAA54A2647A20A9E66020CD8373FE61E1C820FCD34A638C2D0342289A87F1643D07854F75D27C1B59A499540FE6324FA8C962DDDA4104D29CECD618D8EBB8F05792E24E69A535CB0AC7D4AAD6377B8C05469369D36B06E688F14E970FF006EEFCC162104104C12535D97A6A0E2131C657463092E7D723E5ECB7D7C1A54A9EF7A6046CA8BA7F1382ACECD31041337211CD37729585A2FAB598C6892E3016130ECA14194DBB9A3EFE132A54F75D2EABFC2A0389738FB04E4DF94A0A734C3A814D7792E87E1DAEAD56A9DED6E5EFE031D7850A14774F2BA4CF2FAB7FE11D867B6FF00D538AE1A826ABB34094D2BA298CD9E24B09CAA437DF8783C75E3AF524C81C574BE9B18CC34113DBCBDD1DE822B8AE59A0567BD0392C2E21D4CC8E0E06560316DC4E199547119F91F14A98763CF6A73F385D27C060E8E8F0F631AD71AB973211DE81D437A054AB902A9BBCD74574A6CEB9A0E7765FBBD7C531D5EA8365265EE8FFEF65D27C1E300156B3CBDD96EC9AD1C805C754EB0EC9084D720E546A5AEC9687C7B7178363E7B4327789DBBF995D28A351F85CE0861BDC1B3F2AAD4366ECF9EA94D2B96B2503B90279AE8C693387C5B419B1F93BC52B5361A6E69121DBFCD69CD16FA355ED1B98D0E8F2DC51D41D9210A55DAA56F392A793BCE568EAFB6C150A933753693E29A6301B5AACAA0496B0823982772C4B432A3DA0C80E201435484D215D09AE4465B9040E63395A3291A580C330EF149B3E29A5F69F0555ACF99F0C0795D94FB2E91D0C3D2C75947E40C6C7B2E0A164B729928159C269C802B4260CE2B4851A7F84BA5DF94667C1E54AB95DDDD7A42A532D3B8AE96E0DF4F0945EF68BDF5EA39CE1FA0FB2050DE894730B24D6823501C5741DA3E32B1E54B2FBFD6CA90AE0AE57ADA2BD5CAF0AE0AE0AF0AF0B69DE691D1F471B857D1A8323BBC8F02AB532CA8E69DED247D91844796AC903BD01926EECD741C8189C409CF6432F7EF655CAE572B95CAE572B94A9572952A54A952A54A952A54A952A54AB95DDE0DEB1E5BF155CC7F51D1F747E59449D5EE810A614E4BA1B7FF008982065B27077A295215C15CAE570570572B95CA4A9EEA55C14AB94ABC2B95CAE08BD5CAE572952AE0A5172255CAE6F30A54A95215C15C15C15E15E15EAF2AF2BA454E953D2D8A0CC86D37799CCA9CF2089F2532B2539AC97AAE853E348BDB3BE9394A953D5952A54A952A54A952AE572B8A92A54A95729D772B94A352392DA79A351BCD6D1BCD1AED4EAD9A355E54ABFD55E38CAFE1F272952A54F5E757491C5DA4F127FF00211F65E9AA72D4EC9076689F25D0D3FEA623FE372952A55CAE53AA54A952A54A945C819EB4A255C8390129D923588E08D672DA15738F145AA027EE409288F3530AF283E0A0FED2308BC03B97FFC400291000030001030304020301010100000000000111211031514161712030819140A150B1C1D1E1F1FFDA0008010100013F10A3222DE36167D4AA91EE291B9E82595C1B6678E059E5BE466B02581212FE49F1432607EE24E435E4EA10C5CA781C9D8D511B510B6D0B4A17F2677D04569AC8D0D16C2442C7A57F250825E884268D084BF935EC4D11890BF0213F0E109EE42FF3308426B75A5FC2ABF86A5D1CEBA50BE9A5D4A5D0D44A2652EAD47A9B34E4A942FE09B2FA68C4D063EA204F4A529463A50AB1B8F8CB68A62E90B6E2562A133BF03E90B16D27727B8994BF9CDFA694A331F605E51A5936E6246410544097512EA26DD19F0C4C4C62D06BD877C8945656FF00B0C8709214E3B44FA10CABD74BF8AF59A4F433A89574164C5753017910C780D1DDD0F7B65DC471242898842198B90697645BA84DDB7684259E53F4C61088D13C1224621D0E43BC2A294A52FE42D01A8A59696E3E42227D06BA0DEA84C42D2AB414B9123E443EA2E9644DCA18D1882484EEB8ABCAC910C4CE32F0CB4244210B1383765132209689A5D30247EF3F604C6D2CA5289E88A26C421362629D451411DD89083EF6AAA7819BC354BB9049704D088B49B2D88260751276154A45A548BDD7EB5A2D21084208488412121212121212122135BC3E06CCF24BA8BF521226934C694C111081A1684265F798C68242EA8484410AFBB7F070B7D09FD3F438D9194242617110DD090909090824242CBDEDF77D0427FBFE84884F5BA513F439E85EC529594A34E481AEA189109A455A42090874DD53A861D591A36634D90A89915108424242424243C5D18F3D04DAC8DBADF7656094BA9B22690842109AE34A46A888C8427AD934A2E18D3838469AB0249846C9B7A2B91220910841192C1090908484848484848484B71B67C845451E619FB17B3344210412213DB9A41D8F73632511264441D9A5AEC42104CF4A910CCC2B31A8FAB99FF51630B2ABFAA6E78E8C676960958F07C3E509E924B4CF77596EEBA090909090909090908318EC9CB18E6CB6DB6F9A2310D090BD89A422FC365193D13484109BD20B7F164CB1BB69747FADCA6870DF4E8AB74BA32835EEB7F01E18E7975A584D7536EA5B6B87D57D89090909090909090B6BAD92EEFAB195581327C029A2F6EA1E852B297D193267D88345F45290824421052716C742BA047D4CAED3E7B3B2C0EC1B6D0DD6F4A215299237ADBEC484848495DD7D8BC04844A1CFBF7D7E067B86A3ECE9DF4F3A2F6294C6B358C9E9EBED3446421358410824420D48F4B96E5BA31CE6A44962AE469757D86F27A986A6FD98E72D258A8D329AE9509851D07948AD5913E18EB656F634D35DD915EC86DD6924FF0064525B7412270AAA3F397F4547C215ADDD921484B64A085ECC2090D0B4835EFC197D14A4209108412123156240F0EB4D5FA62116D5AA893F8D990686C1A8E34D47C8D28F5592A92EEF09771859BA2DBF3EB3E85B12BA698955EED550C9CDB1544DFEB918CEAB7A92ECFB885CA1744E31D4729B8F1C99230E6BC6CBF467D27BCD97F6C42FCDBA51B1B294A30B471DD0F6EE18F56FE08F3745D86360D5D57D092F03CA4C35F286252CECEFBCC0A6158238D9646AB9CA7FE01D8D3A9DA79AD96092DD788A78E09E4EF73770BB8E6EB7D4525AEAE44E3985D397F47942DB9F4498B4AA6C7C8C5AA5ECD2A18C908244F6E9757A220935EE13BEA4F45E2DFF00DC2CB76B7554C6D84A24C2663427208BAAC90A075E4CAF823F70CE5FCEF06B65B6C7AD0A7AB388DD4625DDF57F23EA7728EAE1902EFF00DA684A444F6A0D10C94A52FBEC7A25E94F464ACAF810C658469F8781F760EB746EE44DAF76DAB7C89854D56DF912B76BC1F82B62D08ADEC8741D45D4FEFE5FF42362DF6EC29AE1D301BA9F4391B2DFDA7EFF0002227E0CD1935A520A5F628D144EF7F61CDDB772FF00430C31656E529751746C5E3E46C838B96F3E484AB0646E32EB357E410EC453E3AFCFE1CD694A52FB4D9746C6D8DB33ADD6FA10A52A5DECB4C6FDB63E5E86C96EECBF665617FA5B09B4934CC66C3089BAA7436B2C87D5965FC2F6E6B7DCA52FA294A528DAE08D6A8F822D30545297D086F0905F0B251970365F61C6993177BE79197193DBF46C37373761F8EC397A744EAFFE1D178DE5BB6FCBD294A5F7DFAA698294A52946CA3A4460AB83C0AE0AE34C7A294A371096E35F1EC06D6346726DF8152212A638F81E1E37DE09DA358C2DC4AC2AEE208C358E2BC6FE9697F0694BEDC2084D20D1342EF3C8F23E35BEAC0D76A732EBBCA9B4F03342B8EECB113552946B25649468B2B6F396572DE3A4152E91C4ABFF001E8A5297D14A5294BEBBECE0C1F07C6906910421088A47A213D105AA69B4ABA242214487D729A706190DFE09B6234A299BCDE173FE0DBAA73FD1B1BC2C769A0E0D6CC6EABA5E1DD3F7D7B77D984F6A97D145654BD936CCF4F06694756DABD5BAF937084F2363F40B4DAEDD4E6AEF8425A9BDD2DBFC1D1E334D858C59E04ED54D9BD970B3FAF4427E55D2974BEC42109AE46861AD76958B38CF1C9FC0A5412384F1C555CB2D0DC86E33D04DAEB3033A17C60A2ADD7C77249ABE58BAF1BFF43D6DBBF8260412BBAD9FCEB7F0294A5294BF9108244D92583F4584E13543996F6FED8E6A4992E536B87C0DCA6E305A378A8BA7FE89B78AF6C2EC2C637F06C24863A6BE1753A8F04C6B782AE8AECFE1FE14FC0A5F5DF452B33ABBCA10C90695F44CFE8A3ED2774790F113F1A6E472EA312B6B456E9A5FD14D4584277176C213655DDE6EFF00FC1353FE823536DA4C20C65478EF23FDFE052EAF5C9594A5D2974A5294A5294BAD297D150DA2575FC0AE03FF005C9B7C370491450EA6938989D59628382AF2750FC51430ED198594221F57563A6F74B02539F56ADB617644FE4D57FD94A528994A51B294A5294A52975A5294A5294BE9A5D6EB46F4452E90822D895ECD92BE0AC70A4FADF097E65EE341534FFD45ABD3912A4F13ECE83CB1ADE2F036ED6CB86C650DB8DF24DB8586CDD387142F18297445294BA52E94A5294A5294A5F552946CA5294A882791A724975BA5294A529BE0B37C3B83CE91A892F1A4C21893432495C5D714434D6303346224268A0E1BDBB41E1A49E397910F26AB72593FFA5D92785A72A9E975BAD294BAD294A5294A5294A52948E47CDA4D47E078196CC7CD8F90EF0F987C83E61F611935BA5F4D8226B755EC7862968CBD9B470D98B232CC31738FEC56AAF1724AC2C70B2FE4EEB38372DC76EC614C9DFAFD9D788AC3091A5D2EB4BAD291C8D0824F13C4F13C4B1BB13A1B17C97CEBD0C32CB0C30CC8D792C6588E74BEAA52E9B1E50E20E93E54CFFA116C636C3DFF00F0B6F274CB4E6DD0D9B71F032A3F8DE09DA44BEFFC14A271B71DB99C19709EA29B134FEC83BC306A78EB123ED28EF15C94A5294A529747709187DE7708E48E7507DA32FC897D58D10F986F45A5DCDDCA2B488E449C91C9DE3B877B58EC0D381875050AD0CDF042876AC94ADBB610D69AC3BF529224925DC697ADF38136EE9C604D9EEEF75B91C6DA2A96D92915B2DA469DF9F40A5297D900827459DC3B83E4C88363C86F77637E44DA18CFA13308526C865D0610EC041ED466490AB2DCECA1BDE46EB64DF0C6E5D3FA137DD85145145294A51B286D980A9396785F2E1B3C9A85CC797D3B16B0BF62DD512E126C515161B5114498DE6F42CBD2DB813528ACA28A1B9450DC62181AD1B6D91F257C8C3D31B0CAEA11D8224D219D8582EEE0CCCB2CABCB6CC92742133C8D32C6BB5871885C83B613A62A8F3DC58D90F0B3F93FFFC4002B11000202010303030304030000000000000001021112031020213031044151226171133240913381B1FFDA0008010201013F005A885288DA1BFE25F6A8A2B75D9BE37DD5BD15D8AEC51456D5DAB2CB4596597B696A671BAAEBDFBE5280D35C52312B69BA8B7F63D1C9FD4BF0CB13DAFB3D4AE7931DB31661230624C43686D1D0D48DC2497C1A12C757F3D8B2F93E548AE4CADA4E93634F2E82F1D85C9F61B32FC89BDAF86BCFA57C9A71B6B6A2B950B9D70B322C9FAA519D38F4F91EBA538AF692E8FEE5F06D2564A5949B345797C1A2B7AE75C68B2CB3D5465197EDA4DFB7822E7254ACD2949E9C5BF35D76C95F95B6BCFD8BEA69AA82170BE0B93E565963A6A9A35A52D193C61F47DBC9E9BD5C1E9B6DD53AA64FD5397487F6C5A6DBEB26D9A5A97F4BF26A4AE4D9059492D970A2B8D15C6F6B2DED5BFABF0BE5FB9A3A1945B9579F6F0474527F4B44638AF3D7E492FA93448F4B1BB97FADAB8DEFD38BDDEF7C7D525FA6DB3D346B4D21A257451234A18C12FEF6BECA6597CECB1165EDEAFF00C2D7CD7FD34D5416CC66942E77ECB6B2F6BDAFF89EA25728A17810C668358BFCFF000AF8F4E12C9CEDA5FD9EC2DE12C277ECFCF1B2CBEE5F6270945E4DB7D7C7B09A7E0AAD9A24ACD19DC69F95CECB2F6BE37B5965F2924CD1B52947E3C0D1450CD2BCDFE36BDBA168B45A2CB2C4CB2CB2CB2CB2CB2CB117B58EFF00513F6ADD8FC1A7EEFEE59659659659919165965965965965965A2F6B2CBDA2F6A1A20FA3FC9664646464646464645965965991664368C91919A2CB1316EBC6ED753DDFE46C7243664646464666466645992331CD19A3333331EA519B3FFFC4002D110002020102040504010500000000000000010211120310042131412030405171226191B113053281C1E1FFDA0008010301013F00C071909311686C7E9178AC722CC8BD9FAFBF5165ED5B57868ADF5F45E94F16EF927E8EB68EA1699456ECC8B28846E715EED1FD4629E12F9457A4C50A9192324651F71B43EA24C49EDA4EB522DF668E2219697C731D148A45148ADA8AF32CBD9EE96C9B1118B6D22D634C7D5ED7B5F9B5BD6C918FC0D217811C342DB93EDFB3567516F7BF05793451451451894438272D3C9495FB0B876F4E6F9E517CE3F6F02126DD2210C74D23899745E3B2FC9B2D96595BF0938CE3FDF724B9DF27FF00493D383B952EC6B462B524A3D2F96D8BAE8238687597E07D0D695EA3F4B456C9B4D35C99A318EBC5394FEB5EFD0E278492D5492BB57669F0AA3CE7F81CD57249235B4ABEA5D0D28D45235258C1BF643F0D97E5D6D5B36646464CE05F395F45D8D6D6C64947DBB92D6E5F54592964C8BB8B4D106719A9551FF2CBF4298DF8F826FF009525DFFD1C4BBD562646B2FB16459AD3CE6DFE3D26262BC3C172D78BF9FD1AAEE6F64246BEA630AEEFF5B515B57995B2456F456DC8E12356C975633B08E253CD7C72F2ABC95E0E673DF4F151A4DFE0EE3DF5219C2BBAE6BC95BD6D5E1AF234B513FA524B975EE34D752C5C84C8BA35E152B5D1FA148AF222E8D469C232F7EA262916266BD60BE4A28ADA8A28A28A28A28A28A28A28A28A195BC1AFE36BBD95CF6562EA6B3E697B2DE8A28A28A28A28ADA8C4C598B31313131D99456ED6DDC546AAFA97C189898FD8C59833030314628C5148C514514514533166262CC0C4C51456CF96C84D50FA47E048C4C4C4C4C4C4C4C4C4A3128C0C0C0C0C10A262607FFFD9, 1, 0, CAST(N'2021-12-31' AS Date), 1, 91)
SET IDENTITY_INSERT [dbo].[posts] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (1, 1, 13)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (2, 2, 14)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (3, 3, 14)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (4, 4, 15)
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
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (16, 16, 15)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (17, 17, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (18, 18, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (19, 19, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (20, 20, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (21, 21, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (22, 22, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (23, 23, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (24, 24, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (25, 25, 16)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (26, 17, 13)
INSERT [dbo].[roles] ([id], [policy_id], [role_id]) VALUES (27, 26, 13)
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[tags] ON 

INSERT [dbo].[tags] ([id], [name], [color], [deleted]) VALUES (1, N'Deportes', N'#c91d1d', 0)
INSERT [dbo].[tags] ([id], [name], [color], [deleted]) VALUES (2, N'Politica', N'#15ae0a', 0)
SET IDENTITY_INSERT [dbo].[tags] OFF
GO
SET IDENTITY_INSERT [dbo].[user_posts] ON 

INSERT [dbo].[user_posts] ([id], [user_id], [post_id], [date], [finished], [qualification]) VALUES (1, 1, 4, CAST(N'2021-10-31' AS Date), 1, 0)
INSERT [dbo].[user_posts] ([id], [user_id], [post_id], [date], [finished], [qualification]) VALUES (2, 1, 1, CAST(N'2021-11-21' AS Date), 1, 0)
INSERT [dbo].[user_posts] ([id], [user_id], [post_id], [date], [finished], [qualification]) VALUES (3, 2, 1, CAST(N'2021-10-31' AS Date), 1, 0)
INSERT [dbo].[user_posts] ([id], [user_id], [post_id], [date], [finished], [qualification]) VALUES (4, 1, 5, CAST(N'2021-11-26' AS Date), 1, 1)
INSERT [dbo].[user_posts] ([id], [user_id], [post_id], [date], [finished], [qualification]) VALUES (5, 1, 3, CAST(N'2021-11-22' AS Date), 1, 0)
INSERT [dbo].[user_posts] ([id], [user_id], [post_id], [date], [finished], [qualification]) VALUES (6, 1, 2, CAST(N'2021-09-10' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[user_posts] OFF
GO
SET IDENTITY_INSERT [dbo].[user_roles] ON 

INSERT [dbo].[user_roles] ([id], [user_id], [policy_id]) VALUES (1, 1, 15)
INSERT [dbo].[user_roles] ([id], [user_id], [policy_id]) VALUES (2, 2, 14)
INSERT [dbo].[user_roles] ([id], [user_id], [policy_id]) VALUES (3, 3, 13)
INSERT [dbo].[user_roles] ([id], [user_id], [policy_id]) VALUES (4, 4, 16)
SET IDENTITY_INSERT [dbo].[user_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[user_tags] ON 

INSERT [dbo].[user_tags] ([id], [user_id], [tag_id], [finished], [qualification], [views], [updated_date]) VALUES (1, 1, 2, 1, 1, 1, CAST(N'2021-11-22' AS Date))
INSERT [dbo].[user_tags] ([id], [user_id], [tag_id], [finished], [qualification], [views], [updated_date]) VALUES (2, 1, 1, 1, 2, 1, CAST(N'2021-11-26' AS Date))
INSERT [dbo].[user_tags] ([id], [user_id], [tag_id], [finished], [qualification], [views], [updated_date]) VALUES (3, 2, 1, 1, 2, 1, CAST(N'2021-10-31' AS Date))
SET IDENTITY_INSERT [dbo].[user_tags] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [mail], [name], [lastname], [password], [dvh], [active], [failed_attempts], [language_id], [deleted]) VALUES (1, N'admin', N'admin@admin', N'Admin', N'Admin', N'nRy/sK5Z7ENvGsSwfcmLzw==', N'1349830567', 1, 0, 1, 0)
INSERT [dbo].[users] ([id], [username], [mail], [name], [lastname], [password], [dvh], [active], [failed_attempts], [language_id], [deleted]) VALUES (2, N'lector', N'lector@lector', N'Lector', N'Lector', N'nRy/sK5Z7ENvGsSwfcmLzw==', N'445673493', 1, 0, 1, 0)
INSERT [dbo].[users] ([id], [username], [mail], [name], [lastname], [password], [dvh], [active], [failed_attempts], [language_id], [deleted]) VALUES (3, N'escritor', N'escritor@escritor', N'Escritor', N'Escritor', N'nRy/sK5Z7ENvGsSwfcmLzw==', N'-126231715', 1, 0, 1, 0)
INSERT [dbo].[users] ([id], [username], [mail], [name], [lastname], [password], [dvh], [active], [failed_attempts], [language_id], [deleted]) VALUES (4, N'tecnico', N'tecnico@tecnico', N'Tecnico', N'Tecnico', N'nRy/sK5Z7ENvGsSwfcmLzw==', N'2021753014', 1, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[employees] ADD  CONSTRAINT [DF_employees_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[languages] ADD  CONSTRAINT [DF_languages_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[policies] ADD  CONSTRAINT [DF_policies_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[posts] ADD  CONSTRAINT [DF_posts_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[tags] ADD  CONSTRAINT [DF_tags_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[user_posts] ADD  CONSTRAINT [DF_user_posts_finished]  DEFAULT ((0)) FOR [finished]
GO
ALTER TABLE [dbo].[user_posts] ADD  CONSTRAINT [DF_user_posts_qualification]  DEFAULT ((0)) FOR [qualification]
GO
ALTER TABLE [dbo].[user_tags] ADD  CONSTRAINT [DF_user_tags_finished]  DEFAULT ((0)) FOR [finished]
GO
ALTER TABLE [dbo].[user_tags] ADD  CONSTRAINT [DF_user_tags_qualification]  DEFAULT ((0)) FOR [qualification]
GO
ALTER TABLE [dbo].[user_tags] ADD  CONSTRAINT [DF_user_tags_views]  DEFAULT ((1)) FOR [views]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_failed_attempts]  DEFAULT ((0)) FOR [failed_attempts]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_language_id]  DEFAULT ((1)) FOR [language_id]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_deleted]  DEFAULT ((0)) FOR [deleted]
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeRecommendationForUser]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeeRecommendationForUser] 
	@userId int, @employeeId int
AS

SELECT e.id as employee_id, e.user_id, e.start_day, 
	e.end_day, e.id_number, e.birthday,
	u.id, u.username, u.mail, u.lastname, u.name,
	u.active, u.failed_attempts, u.language_id,
	COUNT(uv.id) as views, 
	SUM(uv.finished) as finished, 
	SUM(uv.qualification) as qualification 
FROM employees e
JOIN posts p
	ON p.employee_id = e.id
JOIN user_posts uv
	ON uv.post_id = p.id
JOIN users u 
	ON u.id = e.user_id
WHERE u.id = @userId AND e.id = @employeeId
GROUP BY e.id, e.user_id, e.start_day, 
	e.end_day, e.id_number, e.birthday,
	u.id, u.username, u.mail, u.lastname, u.name,
	u.active, u.failed_attempts, u.language_id
ORDER BY views DESC, qualification DESC, finished DESC

GO
/****** Object:  StoredProcedure [dbo].[GetPopularEmployees]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPopularEmployees]
AS

SELECT TOP 10 e.id as employee_id, e.user_id, e.start_day, 
	e.end_day, e.id_number, e.birthday,
	u.id, u.username, u.mail, u.lastname, u.name,
	u.active, u.failed_attempts, u.language_id,
	COUNT(uv.id) as views, 
	SUM(uv.finished) as finished, 
	SUM(uv.qualification) as qualification 
FROM employees e
JOIN posts p
	ON p.employee_id = e.id
JOIN user_posts uv
	ON uv.post_id = p.id
JOIN users u 
	ON u.id = e.user_id
GROUP BY e.id, e.user_id, e.start_day, 
	e.end_day, e.id_number, e.birthday,
	u.id, u.username, u.mail, u.lastname, u.name,
	u.active, u.failed_attempts, u.language_id
ORDER BY views DESC, qualification DESC, finished DESC
GO
/****** Object:  StoredProcedure [dbo].[GetPopularPosts]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPopularPosts]
AS
SELECT TOP (10) p.id, p.title, p.body, 
	p.employee_id, p.date, p.words, p.paragraphs,
	e.id as employee_id, e.user_id, e.start_day, 
	e.end_day, e.id_number, e.birthday,
	u.id, u.username, u.mail, u.lastname, u.name,
	u.active, u.failed_attempts, u.language_id,
	COUNT(uv.id) as views, 
	SUM(uv.finished) as finished, 
	SUM(uv.qualification) as qualification 
FROM posts p
JOIN user_posts uv 
	ON uv.post_id = p.id
JOIN employees e
	ON e.id = p.employee_id
JOIN users u
	ON u.id = e.user_id
GROUP BY p.id, p.title, p.body, 
	p.employee_id, p.date, p.words, p.paragraphs,
	e.id, e.user_id, e.start_day, 
	e.end_day, e.id_number, e.birthday,
	u.id, u.username, u.mail, u.lastname, u.name,
	u.active, u.failed_attempts, u.language_id
ORDER BY views DESC, qualification DESC, finished DESC
GO
/****** Object:  StoredProcedure [dbo].[GetPopularTags]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPopularTags]
AS
SELECT TOP (10)
	t.id, t.name, t.color, 
	SUM(ut.views) as views, 
	SUM(ut.finished) as finished, 
	SUM(ut.qualification) as qualification
FROM tags t 
JOIN user_tags ut 
	ON ut.tag_id = t.id
GROUP BY t.id, t.name, t.color
ORDER BY views DESC, qualification DESC, finished DESC
GO
/****** Object:  StoredProcedure [dbo].[GetPositivePosts]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPositivePosts] @tagId int
AS
SELECT TOP 3 p.id, p.title, p.body, p.employee_id, p.date, p.paragraphs, p.words, SUM(uv.qualification) FROM posts p
JOIN post_tags pt
	ON pt.post_id = p.id
JOIN tags t
	ON t.id = pt.tag_id
JOIN user_posts uv
	ON uv.post_id = p.id
WHERE t.id = 1
GROUP BY p.id, p.title, p.body, p.employee_id, p.date, p.paragraphs, p.words
ORDER BY SUM(uv.qualification) DESC
GO
/****** Object:  StoredProcedure [dbo].[GetPosts]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPosts] 
	@text varchar(max) = NULL, 
	@from datetime = NULL, 
	@to datetime = NULL,
	@tagId int = NULL,
	@employeeId int = NULL
AS

SELECT DISTINCT p.id, p.title, p.body, p.employee_id, p.deleted, p.date, p.paragraphs, p.words
FROM posts p
JOIN post_tags pt
	ON pt.post_id = p.id
JOIN tags t
	ON t.id = pt.tag_id
WHERE p.deleted = 0
	AND ((@from IS NULL) OR (p.date > @from))
	AND ((@to IS NULL) OR (p.date < @to))
	AND ((@text IS NULL) OR (p.title LIKE '%'+@text+'%'))
	AND ((@tagId IS NULL) OR (t.id = @tagId))
	AND ((@employeeId IS NULL) OR (p.employee_id = @employeeId))
GO
/****** Object:  StoredProcedure [dbo].[GetTagRecommendationForUser]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTagRecommendationForUser] 
	@userId int, @tagId int
AS

SELECT *
FROM tags t 
JOIN user_tags ut 
	ON ut.tag_id = t.id
WHERE t.id = @tagId AND ut.user_id = @userId
ORDER BY views DESC, qualification DESC, finished DESC

GO
/****** Object:  StoredProcedure [dbo].[GetTotalReads]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTotalReads]
AS

SELECT DATENAME(month,uv.date) as month, COUNT(uv.id) as finished FROM posts p
JOIN user_posts uv
	ON uv.post_id = p.id
WHERE uv.finished = 1
GROUP BY DATENAME(month,uv.date)
ORDER BY month DESC


GO
/****** Object:  StoredProcedure [dbo].[GetUnpopularEmployees]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUnpopularEmployees]
AS

SELECT TOP 10 e.id as employee_id, e.user_id, e.start_day, 
	e.end_day, e.id_number, e.birthday,
	u.id, u.username, u.mail, u.lastname, u.name,
	u.active, u.failed_attempts, u.language_id,
	COUNT(uv.id) as views, 
	SUM(uv.finished) as finished, 
	SUM(uv.qualification) as qualification 
FROM employees e
JOIN posts p
	ON p.employee_id = e.id
JOIN user_posts uv
	ON uv.post_id = p.id
JOIN users u 
	ON u.id = e.user_id
GROUP BY e.id, e.user_id, e.start_day, 
	e.end_day, e.id_number, e.birthday,
	u.id, u.username, u.mail, u.lastname, u.name,
	u.active, u.failed_attempts, u.language_id
ORDER BY views ASC, qualification ASC, finished ASC

GO
/****** Object:  StoredProcedure [dbo].[GetUnpopularPosts]    Script Date: 2021-11-28 22:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUnpopularPosts]
AS
SELECT TOP (10) p.id, p.title, p.body, 
	p.employee_id, p.date, p.words, p.paragraphs,
	e.id as employee_id, e.user_id, e.start_day, 
	e.end_day, e.id_number, e.birthday,
	u.id, u.username, u.mail, u.lastname, u.name,
	u.active, u.failed_attempts, u.language_id,
	COUNT(uv.id) as views, 
	SUM(uv.finished) as finished, 
	SUM(uv.qualification) as qualification 
FROM posts p
JOIN user_posts uv 
	ON uv.post_id = p.id
JOIN employees e
	ON e.id = p.employee_id
JOIN users u
	ON u.id = e.user_id
GROUP BY p.id, p.title, p.body, 
	p.employee_id, p.date, p.words, p.paragraphs,
	e.id, e.user_id, e.start_day, 
	e.end_day, e.id_number, e.birthday,
	u.id, u.username, u.mail, u.lastname, u.name,
	u.active, u.failed_attempts, u.language_id
ORDER BY views ASC, qualification ASC, finished ASC
GO
USE [master]
GO
ALTER DATABASE [myNews] SET  READ_WRITE 
GO
