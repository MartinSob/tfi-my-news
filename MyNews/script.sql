USE [master]
GO
/****** Object:  Database [myNews]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[backups]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[bitacore]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[controls]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[dvv]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[employees]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[languages]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[policies]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[post_tags]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[posts]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[roles]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[tags]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[user_posts]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[user_roles]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[user_tags]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 2021-12-11 23:40:10 ******/
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

INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (12, 1, 1)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (13, 1, 2)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (14, 2, 1)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (16, 4, 1)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (17, 5, 1)
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (18, 3, 2)
SET IDENTITY_INSERT [dbo].[post_tags] OFF
GO
SET IDENTITY_INSERT [dbo].[posts] ON 

INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (1, N'My post 1', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0xFFD8FFE000104A46494600010100000100010000FFDB0084000404040404040404040406060506060807070707080C09090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D222A25252A34323444445C010404040404040404040406060506060807070707080C09090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D222A25252A34323444445CFFC2001108011801BC03012200021101031101FFC4001D000100010501010100000000000000000000050102030406070809FFDA0008010100000000FBF80000000000000000000000000000000000000000000000014D5C666BF06CEBDD9EF00000000008EE67475B252DA5D5BAAB34F5F664E6E73700000000105F2F78D6E66D9959C93BF6373723A1380E3B7326F4EF55F4576D300000000A783FC8FCC4344C4C2B5EEE8BA0EFFBBF38E33A1E27D42737E4BCFF00A4F67F509B9DE93700000053E5CF25F3DE7E0E2F46360F3E15933F53F9924FA6F3CE87BB9390DDF1AF65BFDCB4763D6A40000016F9BFC5BCEF23CE4246E9D30E7AE5BBEC1E0E9B92131CA447B56E6FEFC5CB76533254D9F4F0014A00C1F377CD3C3F3111A3A7AB8ACCB7E4D9FA4F6F3CC609690E779AF6793959096DACF2DA7C543FD4A0B400590D19A56F92F89F9779E73D89AECB9367D13D8FE5DEFBD0E57B99597D9ECA62576BCABBDE9ECE3BCAA33ECF000511B05159752CB70C7C6C7F27E75C371DCFC06B4EFD3BE2BE4DEBBD87A6FA1F4D3F74EE5C1ADE59DB62F8BE33D0F43F4385450A10DC3C7658F8FC18716B426A6C6E59647C1C36BE0CB8391F4EF7DE925F67E43F50F5ED489E6B4BBDFCF0E4B7647D57F43EE2A052DF37E033C543E0C16E08AC7259B6B523A23531E2B7B0F519DEE77A9662C301ABAD03CBF25E9FE75F3059E8BE41F6DFD49756B72FA28A795F8DDFCCE9D95948ED2CBB3B986257E4763E8DE812F743CA62C1A9A11509CC4473713E8BE9DF0DF8EFD39C477BF73E7C992FBAB9A8530786796F3711667E8E119FA4CF83764B2ED4546751EBF3AB60F723E2E1A16161A1667B5D4F1CE3BC53E9FE7BA6F66F5490DAD8CD9326D294A73BF1CFCE3D675F296ED6F4AFA9EFEC69EBEB749C9F1DCEF9CC47D37EBBB1CD563626263E47B0D2F3AF0AE265B94E67B7F56E67E95F44EAA6377673E4DFB694B74FF3F7E6DE8F8ECD3DF414BF9CF63E7D39D66A7D4BE87F3F7CD7E653315C27DF1DBDF9F5363A2AF99F85797F4AE6BCDA2643A9EBBD63DFBB39F93DEDACF977EDB6DB63FE11F14E4117D17DFDE2BE15E9FD46EFA373BF556BFC37E1FEBF01E5987BFF00A4BD3BACB3CC3C2BC97A9BE23CBE0E425E627BB4F67F599B92DFDBDACF9AFDDB71D98F9DF933E7191CD03BBF66F9144F45DD779D9F5D7F0DF9A521A7E91D6799719F79C5791F92755A71BE55132DD2F71E85DF75DD0CBC96FEE6DE7CF97264BF3598B0EBF37E67F124047E4F79F5AE234E5FBFF4BEEB629F1B7CE9EF521ADE6519E73EC309AFABE5B6CBF4DDD7A1F7DD5CECB48EF6DECEC66CB9325F92EBE9875F563E0FE6DE9F89F37E13ED6D6F9C23F6676412BF5CFE74733D2F53DBC4F15F3D48E96ECD753DE7A1777D54D4A48EEEDECE6CD9725F92FBAFBEEBB5B06A4740F11E33E39CB777DCF45F31794D2BB7DFC57D7FF437E5FEEF6BF497C21F4BFCFD1B3DD7F7DE83DBF4B3127BFB9B5B39F364C97E4BAFBAEBEB75D5D2D7D48E83E3FCCBC9FCFB95858FE8F670D73EFCEFB978478E74DD1FA6F05A537E8BE89DA7412D25BDB7B5B19F2E4C992FBEEBAFBAEAD6EBAAD1C3ADA9A113CFF21C079D70FCC42C6E960C54A52DA6E6FE7EC7E80F56E8A5A477B6F6B3E6CD9325F7DF756FBAEAD6EAD6B5AD74F161C3ADADA51D1505CA71BC6F290113A74CF23313DD2759E81D86FEEEDED6C67CD932DF7DF75D75D756B5BAB5AD6AAD5AF663B31E2C3875F5F534F423A374B0D766424B7F6B67633E6CD932E4BAFBEEBAEADEB9756B556B5A95AB15B6DB6D96D965965965B6DA2B75D7DD75D75D75D75D5AD6E5D5AAB5AAB52AAD458B694B56D296ADA1415A95AAEAD55AD555C56A2B55455552945AA29428A001554A95A8AAA5454A856850A285140002A5454152A15150A050A0000002A02A150320052B4A000000542A000B80000F269AE5A676B477F2B43A68BE5377360DFD8F44000000000703AF9F770616EE8E1EB37E1232DAB67B100003FFC40017010101010100000000000000000000000000010203FFDA000801021000000000000000000000001BAB0599C8001AE9AC99DD964CCCC0035D532D351232990156EA59A4A9926B5C4175A2966B3332AA9C81D745C862175492650BAB779CD9A925D42CA99992F44D5CC9B88A298466AEB377AC65A9454660CB4DEA3259A94994090B5AD54950CA0880552841080002840000000000000000000000000FFFC400160101010100000000000000000000000000000102FFDA0008010310000000000000000000000012005A0004CCB46469540098B432AA37002400153599B0242544B6D9026C19902D9AB110A6819B336AC008A3419945B9B04A8A5A24D664D56684A2A8499D160229540248050AA000800A0000000000000000000000000000000FFFC40029100000060202010305010101000000000001020304050607111213000810141516203040501770FFDA0008010100010200FF00D0844CF824BE7FCE4E48F26323F5807E57A9AC03FE448CA9EEA7B09A50B3E6B17D7FEBA133F56094FA8FCE51F1E746DC9DF1B5F9B5BDB3FF00F0A7AC96ECF09E420CCE5CEE967D4331B6BC04C04D927D3B185957BD4ADBDEE48FFAE7DE649E46C2D72057B39C3DB23E7007FB777ECD93D3CE9EAEF1572EDD3A708267222F99DEDB65DAA6437AEA56F644D83270DE3CE42244451B8C15650AC64A2ACD6C4DED8D5FFF00418722E675F252A672E9770A2CA2EB2A272ABC3AFCAF57918F93729306CC19B3B7B0A8F88B349911A119A449480A4DC1CB6DA468A77FB77BDEF7CB972E5E5FF264C9DD4C3D967330BC9AAE4C6517DECA7D91B55EAB20E138F4E3918F66D32731A21C8D5341BB3FA5CE5423A0DBB76EC819196A1D87F2DF2E5CB97211FD0BBACB798DF3894B0B874B2AA1CEA18E3E0F9C7881089E1FA6D9A7A3A0CD5521104924B25465768C44104818B782243A0DA29A7C0559CD48E2779CB972DEF7FB145169D524008E119FC4731E9E65B0EC94099D0C81D731CA968A9152C6F49CA37989B52599E3F368E716AA240461F6D37816CC138E0617CC99016864DD6566DEC9C8E3391FDE22F65969E50C758EFF00EA632677CBACA956092AEC9E157FE9FDEE0D71899C53938A8BA8C2B2C8B5342B15F8C638A6071CB3AE34866F05270E0C8CA19432D61AB4441E40BED8735C1E6E917D00E77BDFE3BDF9BF372738EACA928ABC3CC9E48D22322322B4D2D71F9E8B4EE173B72EDC4CACF36474622D08EF1FD0B12B2A6B7AD24C0C6C912D46F1458EE1CC9BC9D8E78EDEDDEE0F967315093981586F7BDFB6FF000D9D4B25D3B85DAF613CA1A4C64BE7B89452488D1357E6108AC8AB6271225299515C8DE1E9B118EAB34A6F17E6C4E2A196938C987EE661CCC3E9B732F456B9DED1172D99A9B90CA829E9AE9207E5B0301B7E6F7EC26BE5BCAE4B22F2786445F039320BC994C0E500F0F32B2C46E56E2D918F8EC71158998D6FC0342889C5532E776B482F2EE25A5A55D4DBA9A2F95DC70F5F642B35A05FD4A1AB984B12A6A82A0A01C0FCB7E6F7ECE4B351D23E3E54E3D8DC01F98DA6ED908151A84316B48D654821AFB939EDD03628C9915C1432B16E0EE96905E517935E4DC4AAF24ECEC2A2D71DC8E42B1E632CAB67FF006DD89D4CE44C53E24F9370458AA01C0C06F6D88EEC2B7A8E96825DBE6A63685504964D403C546B04CA8FC6096FB8909B490B0A5110B3B9324B3FB6F5278F731C74D3A918F9059F2CF177AB3B3159D65A502666AC39E272FEA4AB465376260A5AEE9606128D619FB078D9749421CA60101F3623BDBA0CF5620F08838724629CC56DA39857D90A18F679BC6D8FA1310CA618C715D5109C6790327711AD3F6EA96A579465239450C6490816B4A7B273D9DA7F2B3C9D87C7EEE2DEE5597B08A882F17332376C7B4D8C8568D104D204FC2785F00762223B1373CFA8BFAABBA2AB3A3375886422F2A3C46B709796CDF1FDFA6727D660D370F5CE78BCA4D9953BD5830A74ED821BD3A4AD29686886F587EFE773A58F31BAB1C4E31710EBE6AB15B53608C2A152431BB4C3117E9F6B1889AC622CD26E9A444C85002F81E08888984C279771EA1A15ECCB69331E49A61689B7D8E62C290B008E8D8EA930A626529B2359A3156EE8979C92E31AE15C89398357A40C966CB1E665AC2DB162C5719DE7ECE9306F0EC6AF1B448CC7CC29AD2BA844231C9B24DA9102A45201400A001A130984E650EAD997BED4E4D0908B6DE488FA6C8494A6B8A5053D95662E2E2126C6541337AA4B30F88E04C6F8D6F38DAC5912D9078B5DBFB51E30F65759CA45EA4C1BC3B1AB46D0E3280C2A2D60508B49824CD36A46E544A902605028140A000000226318EA2AB387CEA2E8EFAE2BE11B262D6D4EA2D77325B57BA0DED0C8EDB2A86723FA9AC7F969A8E7199957171BAD0A771DC1C540E71B0C2BB5A68AD928E6D06C6A51B8FE331F30A9B683422D28F4D9A6D48DC8815204C0805020140A01AD6B461389CCB28F17957D619096749CEC3675619F253D45D8E6D63F1E4D851B5AF62F4C34CBA495BA4BB994F54E41F581CDBE7DDA116D6BF1F4C8CC771B4265576D0A8C624C536646A56E540A9153020100804E205D680003401A3787F14F162BB46458CD414BC03F87731CB333A15EB21D4FA3055C94C4294D9832F54591339A0B3359B3FC8B688C89999C8CA7C563E8DA434AE3788463526246646A56E540A8826098100805E3C78EB8EB5A00F03CD08180C5391641C337717215C93A6C9535F561CC1AD14AC79D919A8B7F8C2D7E1FC2F868780B26FA0A9358C46C6AC844251A9312342362372A0088260981008050281788178EB5A00D006BCD78206298A74CE91D051AAAC17897500FAA0FE86FA82EE8CBD354A91AA815425491A4A18F1B62D6986986148AA025149C6A6C08C88D4ADCA815104813027002710271E201A00D71D006BCD7B6B425128944864CC99913373353B23C72912A412B58569E7A40D0C2829D192A7255A4E14B1658F2B22B406C0DC110441204C1304F80100BC78EB5AE3AD6B5AD79AD6BCD6B421C44A24120A6298A4290A0280B616A2D7E27C3F89F141A83606FD00802209025D5D7C008040271028175C75A00D6B5AF6D6BCD6BDF5AD6840438F1E3C049C053EBEBEBEBEAEAEBEAEBE1C38700271E005E3C78EB5AD6B5AD6B5AD6BCD6BDB5AD6BDB5AD6B5AE3C4435AE3C78F1E3C78F1E3C78F1D6B8F1D6B5AD6B5AD6B5AF35AD7BEB5AFCB5AF6D6B5AD6B5AD6B5AD6B5AD6B5AD6B5AD71D6B5AD6BDF5AD6B5AFCB5AD7E3AD6B5F8EB5AD6B5AD6B5AD6B5AD6B5AD6B5AD6BF46B5AD6BF3EBEBE1C3870E1C3875F4F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F0E1C3AF870E1C3870E1C3870E1C3AFAFF008E5B20B5C8AEF2806578EC8D13919BE40C756E1C82BE5482B44FDC3EF491BFC6DA56B57DE348BDFF008C38FE4319AF8EDBD39C5154C7ECB1D4153071E9F1A47C23D67F6A496378EA24551A431B4053BF8FFFC4004A10000201040003060206060706030900000102030004051106122113314151619114710722526281A11523303292B1101640425372C12043506382A21733732554607093B2C3D1F1FFDA0008010100033F00FF00E6100366AC109125EC4A478736DBDAAD4FEE195FFCB1391EFAD52F8DBCFECABFCCD0FF000587CD97FD0D44A39594AFA8EA6AD9B4399C0F955B7DA6AB2FB4DED569FE37E46AD4FF00BF5AB763FF009E9F811408D83B1E9FF09C6E22213E4AFE1B68DBBBB570A58F928EF63E801350C8C7F46D8C8E9E12DD6E04FC1482E7F102AEE4D99723C83ECDB4613FEE7E66AB163B9B9E63E733B4BF93122ADA31CB18083C94003F2A88F7B9A8BED5467B89A43E2694F89A1EB487BF7509A8506CC9CBFE6200AB08B7CF7B16C7806DD63223D2FBF87756CBA0B7CE4791D30FCEAD8302791FF0D562651A7E6427C48E61F95585D81F0D771B93E00FD6F6FF0081E17866C9AFF39908ED6000EB98EDD88EF0807526B359449A1E1203138E3B032370035C4A3CE14AE26B7B97BC8EF96EA723ADCDFC2B34CFFF00513CC0571543D26B0C6CFF0022F19FE66AE93ADDF0C9D79C3720FE4C2B87A5D0B9B0C841F82483F235C1B7440FD30603E53C2E9583BFD7C1672CE6F20B3AEE9C8DA4BB1E60EC54A3FDE54ABDEC68F4D9A8914BCB28451E24D20611595BBCD213A05B6013E8A3A9AC859A73667316989423612570B291E9128690FB561C3116EB95CA484E831D59C24FCE42CC47E1592BA9638EC3078EB30E58037225BA75646E521B9980D8F415C6B2F76745BFA5AD8DBC43DF949AE3493A9E32CB8FF2B4607B05AE3B8F462E35BD6F4B9820987E2196B8FEC4069ED30B978C77A989ECA53E80C6796B83F21D90CBADD60E72E50B4FFAE8524074433A00508F55ABA16F6F756F750E46C1F45244915D587DC91760D63F22BA8AE045201D61948561F2F023D46E810083B1FDBF15C36ED89E1C44CA665838023FAD0C647B07E5FE11595CFDFCB93E21BF390BD63B0AC776D175D85034036BC06828F2A676324B2177F363FC87851EBB34493D68852A0F523D8524BC8B1C6AAA8BA27A73127C4D4454161CCFDE41A85892516AFEC581B2BFB983FF004A675FE46B8BEDBA47C4131006C09D56507F886EB8960205D4161723CF91E23EEB57BC517C9630E01D081CF34E2706289077BB6C0356B6907C7E56E8C56A18A21039A599C77A429B1CC7CCF70F1ACACE24B5C2838CB52082606DDD38FBF3EB637E49A1523C8642A79D9B6CE492CDF363D49AF8A9844F1900A1029AD2FEFA13B062BA120F459D41FE64D2CF6F04DAEAC809F9F71A0141F4E808A5E9B14875D2A4C45C7F5AF18A0C4081908B9411CBDC2723C478483C475AC85A40B9FF00A3CCB1C54EE75738E7265B095C77A4911DF2EFC08AC667AE9387F89EC7F41711E872C133EEDAE7C39EDE5357B8F720997941D6D58AB8F9F76EB20A39A2BE3203DEB280DEFBADE92F6D07AC91753EC6ACEF5435B5C2C8DAD95EE2BF307AFF0069E5563AEE04D6571597B9E1AC3A017EBD3E1E200CBCA47EFCAC76228FF335C6999E1B8787133045940664BCCA12CFDAF3B96102B13B9CC60F2F97DB3505AC72C56E1C0720CAEEDCD34C477195BD3C00D015BD8144EFAD13BEB4880B330AE4B66909FD6CFF00BBE880F7FE34589275B27BEA551D1B5B1F8D39D90D52F4A23981DF4D83591E27CADAE2717073CF31EA49D2A20EA59CF82A8EA4D60F80B06B636CA6550FA9181E49AFEE82ECAFDD45076C7B916AFB3376D777B28790A8401472C71C63BA3887F7631EE6A3E9D052F3A1D0EFA517309503A36BDC57C3F10DC460685CD9123FCD14847F27142EECE543DE8CAE3E520DD1EE22874E9400000EBAEB50C886395032B290C186C15234411E208E9AA97E8DF8A0591E76C1DE82F6E7A9D440F54F5787DCA562B88B1BD864624B981D56582456D32123A3C4E3AAB68F422B31C399DC7702714DC4B95C6DE2B0C5E4C4664B9839081D95C2A024A8DF7D4704B28046D58A9D1DE883A23F034DBD0DD4D1BACB1BB2BA9D8653A20D1BEC7DB5CB91CE5795FF00CC0E8FF2DFF68E1DE04B0964C84EB2DEF26E3B556F3EE321D1E553EE7C054F98BBBDE23E2B8BE0E3BCE56F804022B9BA5450A9F1257AA46000026F9C8FDE34268D246ECE28D579618500558A31D155547451E8055B8E6DCA09A53BE4426A66DEB4BF9D4CFBE690FBEA8F8B5349AD9DE9401F215B22BC68798ADE854B713A41044CF34AEAA88A09258E800078924E80AB3FA39E1E912EE444CC5D41DBE4AE75CDF0D0A75ECD75F64FF13D4F97BC6BB9A331AF2F670C04EFB18B7B09BF1727AB9F16A1E228F78A90104015209E224740EA4FBD7C3E57017607EF9B887DE35703DD282653E10F74A92C407AC679C528236297C0741525C1E5B689E66F11123391F3E50755321D4F2C16E7ECCB2A97FE08F9DBDC561B892C531F929EEA4549D2647B58D6178DD0F464797988D83A3F53A8356586B382DECACC1B2813445D48F74E8BB279C162ABA1E23974054AABCA8EEAA468AC6444A47CA30A0FE22A52815534A3B801A0292150F7122C6BE6C401EE6AC11761F9879A8247BF7526472BC5B8507631F3DA4D0FAC575003EDCE8DFD9ADAD8735C4E918FBE4027E43BCD71260AF62E0EE07E1CBA97337F02B5BE42E212203CFDE61E6E8C63F12DD16AFF00079583319DBAB5CB65963679275ED25104EFD4B22B13CCE074ED4027D28E4AEAE7B5B82D32369C124E890187CC1077BAE6D80C4D752091BF7A1D49343C0D1F3FE8F0AD0000EA7BE89001140E8041EA4D05D129FC26A1C5D937D2167621B1CCB8A89C788D833FFA254991CEAE0C10E636EDEF9BBC0B80098A0F5110EAC3ED7CAB217E776364F281FDE0A79775C456C39E4B1240EA770B81EE09A920629756AE84779505C0F98D061ED513A2C9132B230D86520823D08A11B736BFBBFEB5739A8306986B596FAEA2C8425A1B5469A408E922124202401B1B35C45659986E6FFE131DD8CB15C94BA9D4CA508E520450891B6746AC01EB2DCDC9F28A35813DE4E76FFB69BA7C3636DE323B9A45370FEF292A3F05AC85D285B9B895D0772163C83E4A34A2B94001743C80D0A58979A4011478B1007B9AB7240891E63DDA8A32E0FA73745ABCF8488416912A0691636B89093C88E5576A9BEA00D77D5DBF5B8C8CBAFB1022C2BEFD5BF3AB1B4DCCB6EAD28EE79099189F9B926A465605CE80A6FF00C4BCBA73E96E700032F9BDBCE08F6121AF4FEC51C639E59151477B39000FC4D5A83CB691C973F7947227F11EFAC84FB26710AFD987A37E2C7AFB546AC5C2EDCF7B312CC7E64F5A8EE61782E2149226041475054EFBFA1AE0CCB99241673D9CADB3CF693328FE16E6153C12DC4983E2A0F1CC79CDB64602406F349223B535C7D61CC53111DF283DF657684FB4814D67F1248C960F2D6BAEF32C008F72145469B2581D77868483EE09156E64E4899241CA0ED481D7CB4DA3BA1A3B8C8F9AF4F7151BF705A1BD9FC051A27C280EA4D3F1A67D219F9A3C4D9813DF4C3C2307F754FDB72342A3C1E341C72244916AD31D0A8D2232000381F663157B86C834D711BDC912486422450DCCE082DB3BD9D9AE22B64863B7CD10151472B43CBA3E2072E85496D7104590E3AB59E12A4C8F0595E3043ADEB4C6326B852F2782394DC642E4CFCA91DAE244B23A8EE2BF13311CED56D3F6B7D772DE9B8BB95AE64B748618CC464EBD9BC9A0A4A8E84A2689A32685B62611E4F725EE9BD9F483F82B2F788229EEE5317F84A79221FF004269685B1B4B92005499239001A1C929087D8906A0880665000EF27A0A80E8451BCA7FE5A123DFBAA6E9AB78E3F595F67D93FF00DD11FF009B74FAFB3105887BF56AC1701DF5AE2AD3876EF3B9B9D3B416B67A9248813A06566E720B78002A1CD59CF73263EF71F73696F14F73657D188A687B442E01009D8FAA451B7B1B489FF7920407FCDCA0B5228258803CC9D0A444255C100778208A47E600D2DAFD2A61CBC8145DDBDD5A6CF773143201EE9FB715ED56161A17370039EE45DB3B7C80EA6AF6E3A59DB8B64FB7369E43F241D07E24D2C8FDA5D4ED3CBE72B737B0EE14A8BB76083C367A9F90A886C282DEA7A0F6A5A5F2151B03D052C835A140EE82A9E66014F99D035C3396D8BFC363AE4F8978109F70375F47D7ED24B1E2A5B395BBDED2E1D3F262C2B1DD4E33896EE2F259E1493F34295C530926D72F6174BE44BC2C7F1656AE35B7D918E493D239E36FF5AE2EB26227C0DF803C522671EEBBACDB3F67FA36F7987F77B07DFF002AE22CADC0B5B5C45D3487458BA18C22F9B17D0028F0A606CF84AC2DE37BAB9612DF5E412060F21E9D430521507400571566F213DDB6325B3C55BEEDAC9AF9D2DCBA277CA11C863CE7D2A580A8BCC847CA83402A93A1BEEDEBA8AE0EC95BADAC5C298F9EF797F593CCF70E09DF7A45CE1547BD70F4EFCEFC3D6DB276761F5F80DE80AC362C892C7156B6CC468B4512AB11E23756F1804A0A07421B767F555247BF755D36808913FCC767D97751A632FBB5999888FAAA80A3F786FCCD59C52315810B063F59FEB9EFF36DD786FA0AEFA00EC9AE29BCB9278538FE5E1FB79E495EED61B1B7799DA43BDA4C155FF889A830F85B3C4453CD732CF2416F35DDC90D7372C4F3492CCDDECC541AC3703E326BFCA5C843A1A5D733167EE4451D59DBC057D2267A791B0305A62AD893C86E505D5CB0F3727EA2FC80AE26C6DEC38BFA44B5866C7DC9E4190B78844D193E242E8151460BC7844A1D0A868DC1D86471B0C0D349C71C1F05A4845E4B99B31172F781DA0258FA6ABDBFA47EC80EA4D63F15176B753AA8274A3A92EDE4807563593C8EC5BEECADCF731D19987F25A8A066641CD2377BB1E6627CC93D4D08F46E66E4F109DEC7F0F0A0362DC041F689DB1FC7B856C92CE493E6766879D7AD1F3A82D8133DC2AEBC09D9F615B252C6D1E66EE0CE7957F2EB59FBEEB25E0B78FECC0A01F73B35121E795DA593C5A462CDF99A451A5D50F0A924FDD4247E55696FB13DD461BECA9E63EC2A1EA20859BEF3F41ED53CDBDB6B7E0A34298779228C7784464ED6021C83DDB60403EBD09ABAB8133C3CDDAF2314209079802468D4B91852E402C254570C7A921C6C6CF79ABEBC94ADBC4CC49EE5527F9564B1F28BA9AD5CB11570A076A63880FC4FB0DD59C3A32CAEE47900A3FD4D5941A31DBA6C78B0E63EE775A527448009D01B2743B80F3AB4E26BD327137D2D5B70BE2042862C463E4B9B8BB23C5E558D50191BD855D49C2C6EEC33995C8F0C9C418AC64CC728BB94C6FA12850A0A47A1A5E6249A1CCDD7C4FF003A001A8A207EB03AA239806029EF6EA38C1276C2ADF1A65BEB86510632CDA462C74A66B81A504F8691493E40D5CF1B710DC672EE477B38A464C7C3F749D1975F6E4FC86856331974F619ACBCF05F2B157B1B2B759A581BC5662EF1AAB8F1405883DF425B0892EAE0DDE0F205A182E9A1789A29C0DF23AB6F9645EFE84822AECF0D58DADD1DDE63259B1AE4F7F2C44143EBA07429F31F4A787B8941916C61BABE727CD10C6BF9BFED56352CC685ACEF8BC62ACF7C3A3FF8507AC8477B7DD144CCD797D70D7176C346573D40FB2A3B957D06856D0CD2CA22801D1763D37E407793E82826D2C8141DC656EAE7E5F66892497249EA493B268F9D1F3A248009EBDC3BC9A5B6D895806F05EF6F61DD57D75B5889890FBD444869DCC8DF78EEA18B415451EE5AB975ED194247E2EE42A8FC4E85632DF624BB33B7D981763F88E8538D8B3B38E21E0D29ED1BDBA0ABDBBD89EEE471F677CABEC34289EE15029239F9D877AA02E7F2EEA98F48E0083CE46EBECBBAB8B970A679189FEEC4397F96DAB2977CA2DF1AE149DEC8206CF89F126AF55A3372D1C5D47CFD86EB1698BB479F9A420CC02E8000099D42ECECE80AC75A0020B38948F12367DCD0EEF61FD0050F3A1E7583C9DCC17994C4595EDCC0BCB14D73024AE8BBDE94B8240A8E3C65E2290018B9001EA4280078500CFCBF68FF003A241DC9D3D8505074F4657D03D49A044B91BA3CB14485CB1EE0A06C9FC00A9ECF0167C330314BECE4CD35C81FBC9138D91FF4C6152ADF856FB19C4D2C104C2CF2102DB412A734656270D3B907ECA9D2F9134B73F4851CDC3681C66AECC6117C26D2B873E8F1B873569C358CE16FA2EB20AF325AC93DF4A40320B9E4E68FA9EE6E61441BB7EBAB9682E08FBC610AC7DC55DE271D90E34C944627CA4296F628DD18DAA9E7329F490E82FED0004923406CF90152D95BDB63F132117D7D1F3A3F8C101EF97FCC7B96931F1F66849624966276C58F7927C493E350C101BFBF63D982447129D34AFF00647901E27C2AE2FA5ED266000E888BD1117C947FAF79A27C68FDAA79182282589D0006C93E4052D9A893273F66C46C409A329F9F82D4926E3B4416F11E8794EDC8F563D6953AF793DE4F7D1EE1571393D9A9D0EF3DC07CCF755ADB8E6B898C8DF6621D3F163D3DAA54D8B3823847DAD73BFBB741F80AB9BA7E79E5795BCDD89FE7DD52BEF954E877903BAB648525C8EF118E6D7CCF70A9477848C7AFD76F6E8054F7F2082D6DA7BC977D1154BEBFE951CA2B3B79CAB7725B63E3FB32C8A5FF008137AAC0C3CAF7F773DE37791FF969EC2B058C50B678C813D4A827F3A503940007901A14068D05B2962FF0EFAFA3FC05C3914050F3A03C6946FAD469BDB8A51BE5A2DBDBF4F6140DB98F9BF7E5857DE4143A9E6F5A73B0093590C848238237724E86813591B92973900208BBC973A3AAE1AE1DC75B5A5C6461481E65131DECBC7183214503AB16202D3F13F1BE7F2F213D8D947F0D0A91B01DFEBB7C88DD4F7394C6E2206DCB0436D6A89E1DB5C01348DEF27B0AE35E05E27E06B2B2CEC17F92CBC16497D099216B664B2722009CE0128CA8093BD9AE21E29CC65B8A73961736D716D9A9E09A1B9044B00B740C524D8079BC58F89A838AD2CF8B388F91B0901E482C81D9BB9623D7B5F2857DDA955555142AA80005000000D0000E8001E1FB432413C60F568D87E46956E2F3357D2856B893B3855B64F2463955140049D014A6572B203A3D541D30F9A9EA3F1152CAE0C84FD55E555F055F214451F3A92791624D6CF7927400F327CAA0C64461C68DDC11A92E587D63E613EC8FCCD492B97724B1EA49EA68D4F75208E08D9D8F90DD18406B91B6FB3DFAA99872246794770D741F87755C4A7AA1D9A9154493911A13A05BBC9F251DE4FA015291B4B7E45FF1271A27E480EFDCD5AC4076EC6623B836826FD146855C140F70D158DBEB61AE0F2923EEC63EB1AE1CC6ECC76B2E4A71FDFB9631400FA4687647CCD5E15ECBE27B0B51FEE2D11618C0F50A06EA462BF0B8CB8946FF007C2337E7AD576E144F04B1311FDE4205291B52281F1A001EBE1402E5177DD95BDFCDC37FAD0F3A45DEDC577F2EA98EF99CD01BFAD5DFA352313CA4D5CDC3DAA28279A707F814B566B28476703F29FEF11A158AC6A89F3D9144206FB353B35C13C268D0626DA292741DFA0EFEC0EBDEB3F96E74B6905B45F8337E03B85340B2DF646779AE994BC8D2396655037CBB3E5E34F796D7D3CA0992E669266E9A24C8C5BBEBE8F38362BACEDD64C4B9CC9C1F131BAA89AE62EDE30C044BA61185DF79049F4A38A9B05C6BC7F80932387B79B157F606D665315E5AC89D22D3820766741D6B0F71C3F9CC87095FE42DF1B3D8C8871D9385A628D3A1857B19BA90003D0134985E02E17C73684A2CC4D20FBF70C6523D9A8301A6ADEBAD777ECAF523B086C580925BC8436CE83461BEB027C877F4EBA158ACB5DE23867237F758C3696B25EB95B63731895DC4416508CAC546890541AFA44C14D0DE709E7ADF8971F1EC9B4B7BA3769D91EF57B6939264FC145629E536DC4DC337B8DB90791CDB309406F58A5E4615C299A21719C4566F293AEC67636D2EFCB9660BB3F2A9A2D73C6C01EE24743F23DC68A06E53D0F790763DE94EB66A255D9614B9190497737616A0FF00D6FF002F21EA6B11690AC3691A46BAEA41DB1F527BCD593F5250D63E352F2BA2281B24F4007CEB0C06E0BBB5822FFDE266405BFF0049091BF99D0AC1C2E5AD2E209A6234667995E43F8EFA0F414325318E37FAA0E8B0049F901FEA742A60A3E061E47235DA91CD2FE0DFDDFC05458A824B9BE94BCA7B813B24D5CF10BBDCCE792DC37AF28F1D7DE3E82BE8E783677B1C5DABF1065E3254A5B059111C78348DFAB523D031AFA43B927F4570F62ACE2EF559DA5B87FE682B8FF113A9CE603197307FC9125B9FC18335607E90ADCA62EE9EDB271273CB6174476AA0779523A491D25CF34727D4950E9D49EE348808DF5A6D6508D75C9DD9FCC53B6F6C68F5EB47AE8D39D804D4F31D006B277EC39207D1F12342A28104D94BA8E141D4EC81F99AE05E14F82B8324534B04E09563A2CB2298CF28EF2416DD49CAF0612D444836031FA83D8753598CB349F179190AB1EA887957F102A59D8AC40B1F21DC3E67B855F243FA4658C88C7513BFD5853D433683355B7C35CDA5B4FDB492298F9D7B803D0914511541001D03FCAAEE1C66360B5B01BB8B3406E4BEC196202365E503F78687BD4FC41C11F445C1E6708A968D7378EC7B9037F326B1F3E5F1FC1D84D1B24995EE9D7B8A45DFDDE5FCCD4DA8C0E8A00000EE03C054AC06C9A2DADD6C0AEEFD8AB184B004A6C827BC13D2A0C7FD2266AD323618FBBB46B0B40AB7B03E838321D24F1149233F26AE02CB3ACB6D7592E1EBC1CEC3B4FF00DA5680F98923093A0F2DAB571D4B046969798FE2FC746858A23C79360BDE3F552017310AE1897B48731C357989BB2C449F0331D02347AC175B23E41EA13D9C583E3708B09E616F74F3583820F52092D106F9357D24E123F89B8B77C85BF849C82EA32BE27B6B73BF76ABDCFE0B1B99F87680DC870D193B01A362A794E86C55DDA42F34F22A468BCCCCE4050075D9DD5A63DCA5BFC4DE30F18D7950FC99BA915F499C49C31FD6DC0616238D170F0369FB4B8050EB6118A83B35F4A38A82DAE2F3252C16D72651118592227B3201E8BD477D71BFD2A6333592B6CB432BD9DCADBBC591B99886578F9FEA81CD5736FC5769C3FC6189E7B1B9BE7B16BAB360CF0C9C81F7CDA04A1046F986C778AC3F0FF10A584F987BAB54690B1D0DF2A11CA4D5AC7C2B8ABA7B52A27592680484975B691C984313F73550DBC6CC14000135371266AE27BB9BB0C4DA6DA69490A000365549E80E86C93D00ABAE2C91F85F83E47B2E1983F54F2C3B492F47710A7BC43F9BD5962A248624065040E551E3BE83A78FA0AE3193B099F053DB24CA1E1172F1DAB489BE8C8B3B2120D5EE3E46C7E7F19340CC9B315CC654953E2BB1F597D4564384733619BC1DDC90B45289AD6743F591C77A9F31E041A878B385F13C616C163949F85C842BDD1CA340FE009057D0D7C4BF283479323E7FA4AEFF00FBC531DEAA493A006AF6EC8E589A82A896F6648D4753B207E66B82B86232F75711348074E6206CFA6EAD6D83C385B5F40DAE41EEC09ACF6519CC9917407C22241D7F98926A7B990005DDD9C13DE5891D7A9AE3CE2480DEDAE1A586C00DBDEDE32DB5B20F59262AB5F46BC33BFEB2F1D1CC5E277D870EC5F10037935CC9CB17B7355A59030705F06E3F16A3A2DDDE8FD257BF30651D921FF2A566B3B706EB3594B9BD97C0CF23301E8A0F451E82806E6F7AEF5DF434B1A1B6BB856680B062A46F4DAD730F2E875D2AEAF0C10E3ED9125112DB422156D8404E91398B11B27AD5D5AC06F2EA32F7B73A323778451D4203E9DE4D344ABCC35AA09AD0AD01D28F4A3FB104B2B1FAC0915D87D214E4FEEDDA63DBD080CE2B0990E6692CC4521DEDE03D99FC40E86AF607EDF19900E546904DB471E5A65F1AE3DC7C51DB6595F23651F7C79085323172F903206651F220D709DF730C9F0B3594ACDA7971576D17BC573DA8F622B177795864E1AE289D258B942DBDD42F68ECEE79517B480C8876C7D2AFB118BB580FC1BC5616B1422495A4324AE146D9828036CC49ACCDB70F446796DA2192BAEC51CA34712A20ED0BB3316D0ACC42905DDE64F18914A824025B95562A7A8243853D451C1E1AE706DC4F1DAE2DF9DDEDB1AE1E491DC00767986F7E55F469C53040C78DA04B9890B25A5FC66D2345D01C91EC94E9AFB551FD1DF10642DACE06BEC6DC848AE4D985740D193A9622068D457E5EFAD63BBF8B21D225689C2C48FD365980E66AC9F1CE46E222B28B69CA8BDBB75FAA96E3BE34D1EAEE072535BA243358B46A8A154DBA99620A06800147320006B446A849048A2DAE8AF2925BB12A00D753B72B525C4C9F47F84DC11CA166C930604F64FD52162BE2FAE67A9AD85A63B1D6ED2E42EDD6286141CCC5DFEA80BEAC7D855F703A6033D6392B47BA4C8D89BEB9119794AC932AB476CEDD23897C5C0E693CC0A820E33C6656D62411CF04D6E5428E5062226FFF0035493DA7E83C8A4B79849090F6E36EF68E7A09ED89DF66E3D9BB8D4F67FA5B0577A696DFEBC4DCA406D28757507A80EA4100D3492717F0B4921ECAEEC45E44BE5244790FB87152E436C4124681AB899B28813F7725700FE211FF0091A074666AE13E1B42F93BFB68980DF2B382E7E406DAB0F621E2C2D934A7B84926A35F63B35C41942E0E40C287FB90743EE766AF2FA722332CD339F0E67727F326BE90F8861F8E38B38FB0D6DAEF2520B58557CC9722BE88F85493C51C7B2E7AF53BEC387A2ED539BC9AE1F4956588061FA3BE00C561B5D16FAFC7E92BEF98320E4535C5FC633F6FC4DC417F9220EC24F313127A24634A053B6868D4B26B4A6AE67D0119AC85C6B509ACC5D6B942A54B2B29C8E6DD17C5618C13EED5C2DC3CEB3C162D717206BB6B9632352460058C003B801A028003A56B5D3FA3D2BBABBBF60F66F15EA92631F56451DDA27F7AA6BCCBF07E5A2BDB680C914B6C4DCCC21492488F3C6399FA063C875BABDC1CE2DB89B097B8E2CC44733C64C328F3461B047AA922AC6F5435A5D45283E0ADD47CC778AD6EB1D7714A6EACE290852798A80C3E4C3AD4779F48B8D82CE3296D0735E5C0DF30220E89DFF79AA0B19A0C78D318904920F02EE3A03F2156F9A022CE5B7E90446DA2DC90EA9E1F5175A5FC0035C20343FAA98EF4DC286B86642047C3D8D8FD45AC47F98AC4CDA0B1C5083E1141127FA5602E742737527A19CAA9FC100AE14B62248F056ACE3A8698194FFDE4D45146B1451A246BD02A0000F901D056C8AB4E18E1ABFC85D3011C504B3C9E04C710D951EAC74055D666FB27C4796626EAF6792E6663D41E73BE51E40770A9F1B8FBAE24119F8ABF9E6C7D8B770486240D73229EE04861183E00B567F3775638F9EEDBE1C4D115851542158DC3776893AD6F64D1FA596CF5970C46D7B3E2AE52F5594851D99DDBB905C8DAF314AC4F085A3F11F185DC13DCA02651BDDA5B6873941B204D301F82F79AC5F14E622E26C4412C56B2BCD65B958B1905B1003F500852AE00146CBE91540EE3657A87E416B85F853146EF2D94884F23BB88976F200589034A0D63B1591CCC585C699566EC27125CB7200FC8626D2AEC904462B89325DA23655A088EFF00556A3B21F22475AC8E52730D9453DC4EEDA0B12B48EC4FCB7BAE3BBDB7191CEFC270EE348D9BACCDCADA8E5F30AC4135F423C2DB396E27C9F175EA77DB622136F685BD6696AEF1A86DBE8F782B09C391770B9310BEBDFC64946AB8B38BA7371C4B9FBFC8B93B02E662C83FCA9D147B53368006A4723486A794AEA2353C9CA5A2A8D794BC756D16BF543DAA08F97510A45D69452AEBA501AE9406A874E943CA8797ECBBEB20B85BC97156E973770B2482DA42144E80FD68B67B8BAEC29EE06ADBE90783A38A0804F7D8D9FB64B5B82F1C81C2F58A6101E6571DCC054DC3B7F2DA439BC8F0D4F7243498FCDC2B778AB93DC42CB0234720F578FF001A8D2017F9EE0868EDF5BFD31C31701AD8FA95533423E40A524AAA701C736B374E96B988CD94BBF2E7632427FF00A82B8A2C2D9E5CB70ECE2D5908F8CB6FD75B1D8EF12C65D08F9351B7FEB0F13DDA011C89147137FCA40656AC8E444999C84A2137AC66018E8857EA07E029031D64A2FC5A914F5CA41FC556F1905B336C3E720AB184A839BB5FC6502ACD0A15CB5AB6BECCCA6A221425C44E7C02BA9269928F793520B3B4C04526BE36ED6361E70DB01237BB91431F841181A2CA3654EC11CBB26AE73BC3FC337F264B291C6F83B5436D6B6F6EFA6989B8908ED678CEDD9EB03C39F486711718FCAFC45DE1EFA39E5CDC30C222B4950445EDFE1A5720BF372F3D63F23C6D88C67D1DE16CA0B1C60B786FAEA19268B691273133042C080ABA620731ABEFA4FE2BB2E11E1DE7187432A9E48BE1D258A205C2450827B1B7523614ED9CF5735270F6130B6B709CB249797B368F7F2ED23DFBA9A5B4E2FBAC8311C9159DD1FE3216AEAFE42968924849D01182454A647BACFF0011E330D13AA822E6632DC10093F561883393F315F45183EB1E3B33C5576BE370E31B65FC239E523DAB8C5216B4E14B4C5F0BDA11A0B88B4559FF001B8979E4ACBE76E9AF73391BBBFB963B32DD4CF3393F37248A76D743523E804353CC40111A9E5E52D19151AF2978EADE103510A8935A8C52AEBEAD01AE9406BA50143CA87950F2FD9F7D77D01BEB41E19A2EDE58B9D1979E172922EC6B99187730EF07C0D5EFD1FE5EE729C2DC7D7A905CCA64B9B4BF845C2CA49D92CEAC879FEF570B66C4B8CE35C45BCA929D35C22A10E7CE4570558FA915C257D3364BE8EB8AE7C3DF303A16772D01FC6291B47F0715F4838F91CE6B87F07C451FF8EF11C65E91E7DB4662563F367ABFB2BB03118CE34E1CBC7E81A1B76BFB73E9DB5AF64C17F06ABEB6C0D8E2F27729717976EA9733A2801D01E795F602923946B66B1D6335A5924F2008A438895422B796C91D4562764B5CBFFD52C63FD6B0087EB4F19FF34E9FE95C288476CF6DEA4C8CDFC857D1AC3AF8AE790F9416D231F72057D165B685B7055FDFC9F7B923F70643525923A70DFD1DD858F780D3CA7F31122D7D257D26719C3C3ED91B6C5E3D6096E6E5EC2D90CAA918EE0D2992A5B1B60B35D493145D99252093AF13A14D96E3DB484BED6DACD4FC9EE1DA434B3D9B8006B4FD54681FC3C2B8B2DB896EE0E11CE64EDA3B4B2B6370B6D73214E628BA262248D015C79C5B8AE2ECBC9797D92CDE2ADADA3B3862B588996DE7979A61218943165ECC14A5CC7D23E0DDF8B2D305968318F7B1DAC13B8BC9CDCA76F0825BEACDD1C348AD563C07F4A19DE229EC22B467865864B14D98EDAF253CD2F65BEBD848073C5E8C5692FF003022808E5B1B248401DDDA105DFF00EF7A9716679900ED6550836A09037BF1E9BD8ACADC6C7C5CAA0F4215C8DFB548E4B12764ECD3B11A5A964D6A3AB998AEA2353BF2978C8A863D178EADA103508A8900D462946BEA8A035F5687950F2A1E543CA87957A7ED7BE8F5D511BEB52206D135392FF58F8D4EE5B649ACBE31F9AC6F248C03BE5DF32FB1E95C55880229E595E3FB8FFCD5F75839DD4E571769CDE2CD6811BDD435602DAC644C35B3F6EE9CA5A3DCB2FC94B05082B33C4D34FC4994490C011CC10C676238D090547AF8B134D752B4EE06CF5551D401E1A0280D680001F4F3F4E83F1347A7AE8020F8F7743FE82AC8477124E4FC4A80618D87D427A1E66F5F000D707FF5530D0BE0187125A5DCDF1377B510DC5B3B6D4329EBCEA3B8D497E3715AAC119E9EE080C07893BD6855EDA62B2FC61776E53F4895B5B4D82098603B623D0B54780E19CA646E5C20117671ECEB724BF5428A194E31CB5E862544B1C4A7EEC4A128CD080DB208D7D6D6C9FC2B0B8196DB3396B298A652D2181EEE150E63B8B2410B23AF43A650AE0FAD63385F8033DC5BDAB5BA646CDEE125652922C12A98223A3DCC543C82B299AE2ABBE25B62D6F3B5CACD1F21205BC71E96240475D468A00A9F3D87B2CDF1186FD236B1AC0973CA192F5232085908234D113B07F0A9B2B772C858BB48E5DC9EBF2152391A53534A40119AB99F5FA93523729912ADA1E52D1826ADE1D0108A8D00D20A51AD2D01AE9406BEAD0E9406BA50F2A03C2BD3FA3D3F6C7AD1EB458351707A533F310A6A452DF50D4885B6869977F568827A5329D8D834D858EE6D2F2D0DDDA4C77C8180647D6895D820823BC1AFA3EBCD996C6F6D18F7945D81FC26B8126D18B88AE61F21242E45709BF54E34887ABC6C0FB915C2AFDFC716817FC9FC86C5700C6435CF1CC475F6234DFB926BE8A31BA639A7BA607679848C3F8628D41F7AC2F0EE32DF1D638896FC5B42B0C2A238ECA14441A00005CD712FD20CF17C6F656D63012D6F636BB1121235CEE58EDDEBB591A47FDF624B7A93DF4BCA3607303E5ADFFF00DAB37B79F1B908BB6B0B8219803A6471B0AE87C186C8F2228718E1B1982C2858B1C1965BA88C89080224114502863D51152B098B11CB7E6296388F30B581BA3B7FCC97B80F96CD5FF13DF2410AAAC48A1238E35E58A28C772A01DCA3DC9A967E5FA84EFBC91D4FAD6F94BC756B0E898854110016214ABA010501AFAB407F7680D74A1E5FD03CA87957A57A7F63EFADEFA506DF4A56076B514A08318A0FCC563A950B6A2352A6FF00546A44276869D77F54D30DFD534C09E869BC8D1F234FE1BA63E0698F81F6A93C8D4C3454106AEE3D6E3D81D3F0A6E9A041EFD1F3AB84FAA84924F70DECFE02B8C7895C1B7C74E96E7BE69D4C6BAF31CDA26A3C6449F1728790E8BF2F524D5ADA8023807B6CD2AEB482946BEAD01AE943A74A1E542850AF4AD7F66F4AEFE95BF0A077B14A77D295B7F56A39361A31504BBFD50A56D958C54A37A88D5C2EF509AB8527F527DAAE06FF00526AE7FC23573FE11AB93AFD49F6AB97D7EA4D5CC9AFD49F6A9E4EF84D2CBA328D5601086BA80C9E9580C5729B2C45B230FEF98C16F734A35F57A0A035F5680F0A035F56874E943CA87957A57A7F631FB1F4A1E543CA879529DF414A77D05236FEA8A8DF7B8C540FBDC42ADDF7B847B55A36F700F6AB23DF00AB1F180558AFFB815649AD5BAD5AA6B50AFB5449AD462946BEA8A51AE8287950A1E543CA87950F2FE9F4FEDDE9FD1BA143CA87950F2A143CA97C852F952F90A5FB343CA850A143CA850A1E55E943F643FD8F4FF60FF64F4A1FEC0F2FF67D28797F47A7EC47FF00048FF6CFF6CF4FF809A3FEC0FF00871A35EBF957AFE55EBF957AFE55EBF957AFE55EBF950F3FCA8F9D0F3FCABEF1F6AFBC7DABEF1F6AFBC7DABEF1F6AFBC7DABEF1F6AFBC7DABEF1F6AFBC7DABEF1F6AFBC7DABEF1F6AFBC7DABEF1F6AFBC7DABEF1F6AFBC7DABEF1F6AFBC7DABEF1F6AFBC7DABEF1F6AFBC7DABEF1F6A1E7F957DE3ED43CE879FE543CFF002AF5FCABD7F2AF5FCABD7F2AF5FCABD7F2AF5FCABD7F2AF5FCABD7F2AF5FCABD7F2A347FB249718937F82B0C8225BF1263B1ECE63B676BB47BD16F3471273B1562011A90211587B85BDE7B0C95BDC595864AF6EADE558BB4886364114B13159181936C0AE8F29F3ACCC51712CF67C1F7B3416195C3DA412EED395E3C80B73A706E41E7613ED3C3BB9AB85C7111E1798CB0E4C1313C6D2DA968EE041DB981A3598C8580EF70A63DF4E6AB1C9C9C3B141C3D9847CCC3F176A2616B19F84FA9A9C8336F93F583EA8064006F96AE6EADA6F8DE15C9FC73E6F218DB1B4B7F85692E459CB22B95267213B358FF00585CA827A2D63B2EAC982C764EE985989AE278E28D63B0690B2AACE24753CE19086540C4547C5FC398ABE467BB952C6C85DDF8445B79AF5E10D3227291B64274FA01413AAC7FC34F7B1E172B2D9FC5FC1D9DC2C50F25FDC76DD87676EA640DFBDE3205520120D616D525EDB0F98125AC17B71908443097B086C1D16779FF005BCA4209037D4E6D83B5AB5CD459676B2BCB19F1D22ADC417A8825557884CB20ECD9C15646D8F1F3A8ACF846CF8AB093C1259DE3D97657B74922DBC105D3AAFC4CCBF5184681B641E5AE28BBE14C8F12E332F8231D85DDCD92C898CB8BA8B2932C82284DA6AEA2E4ED1CF66012C39AB2B8ABDC1DB4D69693C1076D6F9EBB8438417B163A6BE686CC127F74C3F58B13A040AE3469AD2C6F31D8AB9BFCB609B2B8E8EDDE4812031C90C72C372F2194B84170ADCEA01201016B8AE7FA3EE1EE36B3BFC45ACB7386B4BB9ACE5C6CF7666BCBB54E48602B7507273BB045DF3565E3CEF0AE1E482C5E06B83619DBD5E610A5F8C7CD7AD15AEC9E8861DB96DE8102ADB8C2E327C84411EFB7C75BC96B7104F35883C82E8BCBCAB2248DD57906941009FF0083E31F217594BBCA64AEAEA6BDC7DC89256814A0C7DC1B88A21D9C6BCC9CC744BEDF5E3588BC92F668F2B95B57BC6C8ADCB5B491032C19228D2C2DCD1B693680AEB4DEB58D9E1CC40995CAC51643F473BC71BC1A8EE71E22115CA168C9E70204077B43E550DADF5DDDC19FCB086ECB497767CF07C3CF3BC22133B0ECF983B6B642B0427AEAB1F718FE19C41C9643F47E192C912DC1808B8F8128D119098CB060506CC6549AB059269AD33997B59C656E727692C4D6FCF692DE17338843C4C0C721909224E6F4AC562E48DF1394CA59446DA382EE18A58CA5F766CCE1E73246C79C97258A15DF8D5870D20870991BEB788C38E8A58C185965362A22123868CEA49514248575B001158D5B696CA3CD6612D7E2FE2ECA0596111E3EE3B7F88ED2D898F6487EE1273000900560DA0CB432DFE4A697278BC9E3AF6EA492232CC32653B598EA30A2502301343947955B6372196C940F319324D6ED32B952AA6DE2108E400023606CD497D63756A9793DA34F1B46B3DB155962E71AE742E19411DE0907AD62921E1BB589648ECF0B3ADC5ADAAB0EC9E544288F2EC1662A58B024F56EB5C0B97C9DA662EB85715F1D05F3DEBCE965073DCCAF13C67B76284B8DC9CE3EF806ADB12921B3E20CC7C52D82E3ACAE659209A4B0B40E1BB2803C45482546CC8198815658BC670BE1E4CB64AFAD301324B64974D00DF63118A112F611461845BDA7AF535C0F94CA5A666E785F182FEDEF9AF9A74B280497123C6F1FEBDF909600BF38F2700D59602EA2BB8F2790BE782C463ED05EC91B0B5B4E60DD8C5D922120941B672CC75FD93FFFC400221100030001050002030100000000000000000111100212202131305140416061FFDA0008010201013F00FE0D686CDB0843690DA6D369B07A7F036B1694B1782C3C5C3444353E45A6FA785E5E14A3294A53526D55F0C21055171DF0EFF4778A528B1213AE69516921084CCCB691BC7A9BC23D121A88D2A2A26DFA373473442138529D8DBFDE61098BF446FD18BD357642704316A68DC7A3C743789F63EBB26691B3A2970863E284D48CDABF46D8FB1220DFD952F042E86BE8469F08D912F4BF4762548745452F084111B3B4277D1798708219FE8BC34B88AD9088A8A52FC28597D9B591A18BEB12BA42245294A5E3782C51316A3A64369B4DA6D3C294A5E34BF052E294A5373294A5CD297F0694A52FF4DFFFC400251100020202020102070000000000000000001101102021303102036012132240415171FFDA0008010301013F00F61B1D31D318C63FB064CBA8C378EE98F926697040B1F4E7C63E6479FE7C7E9FEBE27C8842BEC7C0F066E98E91F08AA709A8EF391E0A91B3442A63B62FD8D7571AE042A8B5C1A81C8855BE0918D8CDD2AD9153D8E0722A633782C5E136C645CC5319B15A16537BAE878B36310AD0B895236318C63C90B9D08421084210BDFF00FFD9, 2, 0, CAST(N'2021-12-21' AS Date), 3, 69)
INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (2, N'My post 2', N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. 

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 0xFFD8FFE000104A46494600010100000100010000FFDB0084000404040404040404040406060506060807070707080C09090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D222A25252A34323444445C010404040404040404040406060506060807070707080C09090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D222A25252A34323444445CFFC200110800EA01BC03012200021101031101FFC4001D000001050101010100000000000000000005020304060708010009FFDA0008010100000000E3E96FCA2720ABC1DA709DCACB67E829A279E7001448F1A6A2953CFC16233295B42FED3B51B337F23DF3C4468C0ABB4F5D94DE3FD5C339D69F24F4AADA0D92BA8B8F7F39A4161BC9B4026F8E886EC2F4771FF5A8F22F5A269360747411F064C8F1336443C9E9DA2596B7A39203C9377B905CFF00E94F7B44811AEBD156A9F5BE436180B1ECF64FA24A20F3174DCEC129B7BC8F1D45D2AFBE438D0B8275CC92F04D60A09528347B43F3AC92AA9FB7ADACAB7CEB934604D5AAC7E429841DD076122B50DF9DAFB042F325BF1B61B71D6BEF38DFA0EEB37EAEA0935EA4A42A5702033B7DD8B492B99E3912BE3AC9625FA5485936FB778301D1C288CE346B268B767E1B0FCC7EAEBB0A3F1FFB23A1ECCA0F0195786131E27E78E7850D7A5F67A73B06AD572760286AC452B85F6A374DA98DC782C2D7B46D6F426449D96E86AA933CF7E30E87DB3A7BF1CBC38EF966E18EE09A4DAEAB59E83D7F2E1506A95A927CBD8EC6451CDA53483FB7687F659CAFA8EB1A4DE6811B482ABA5A24147FF146D7D5D7A2D33512ACA65481E27F3F29BBCD7B2ED5363CCEB4C051F24C1226467B9895CAF3A9EA7679FF0072B89D76D965E3A09B4EE07EAC524B359FC843FB5D92D073A2AC7EC77A7315FF00CDE2BD454FCB764DCB9BB276A2364494B53C4272749F355BA977BECEB04D3AD768E0E01F7675B11637EBDC2BCDC47659D663DD4F61721109D1EABF9AFD21ABD6B3CDFB68E41C1149F244F912A64A95D47ADE0576B44FF7C89C7F7FB6DD78AA830BAC8FDDECC9C2783AB0476ADC99FB7F37E20ABED51BF3EFAFCD0AA06A3B9F34F35CD73E5BB3084C93EF4DEB997584E4AFBE4F1F92B8E85CED80B5AED7F57D4E272CF3447F3A037EA1E97AC17F9932B6B2CE6EE844C6905EDA6F8BA9F29D6DB9C5C8AB45DA6DAF3AC3B23EFB9883D8745A071A90FA857931AEC7E3085F3E41DE93E9FB4FD5AB74D460148D862362ECD618DC8E209CD73E9A4E547B66DF6B98EC85BF2A2F0ED999B3E6DCF169135062E764D3B8FD0D25276C3BF5FE553B72B13BC5D7EBF5472DA52AFE169C64D159AFC897F0C0D6A9E6750BB1F23264736F385642513CD80256055A4FDA70B0BE25F3920B3B0DAD1ACCBC42CF6EAAD619396EAB0A246CC4F795EB62C54BD17384691B469163B13B53E03CE4481B9CC125AD87336238FA1B2869D255B60910F2768765C501F8B29ACD3696A9C5272D0DB31665AB5D8D85D72F9B86CDA29A9312819C717D15A9274DE82437BFCDE8FF003C5CD8418465C2474ABB93D563F8F11DEF38A147F254AF50D7D2EE179BBECFCC98B22E1BB6FF00739AFC05E27C31525DE7BCF4FACD47F2E595BDEFCDFCE293ABED59BE61F218FAEFAFE3B596DA53CB4AA5596F56C29A0E859D5271617AB6F3702528953B93F9FA2DEFF4B2E7130EFCB9664B8AFBEF7E709EB3F67D1A597B5E8D78C6F2485F7AE3CFC92662D76A39224E89A358D782F26797BDA6FD3C350B2781A5F521EF73CFC8744C73E70D2A359EF3510AB2FA1F4C5F6BD89E175E1B095266933678FD84CCFF005563BEDD0DCBE7AE430363D32F32263A7AF17320A8FF008A8EBEEFB3F4298B9171C45C2BA875AD8455370CA1C714146CB3960B29D304A63DF4CB09BB758493F59E5FE700F3AC97CBB5F743B610F3DFC67F54B78ED8669AAF363AE9D0FB73F04354B3DAB8F6468E4993C78A4C96EB8B367C81134465C8F79EB8E6B3E5935FD26FB7630C90FC931C85983F3BE86E0FD57AFECD1C588163C4D5EACF451A830625BF3083EA2363352BD5CA5497D5CE5CC15EF341BE4BD36ED20AFE6C81664D8CBAA408F2FF00D91636E285ACC629E00A30A1C1FC324D9495B1199961B01273C4B105A7DC6B39C332D8A94DA6EE5CE72E8E44990AF6696DF7752F1D2D84ACBB6A9E329D9FD1AAACD967C28161BF5C6DB63332BC4B7187C175FF0060B19DE0D4F86CFCCA04A9F9729FFAF3D0FA1A60C66DC862A45A8CB75FCF715CC0759883220DE9DAE68678938DB30A3C3624CA7617B24564B8BD3058F6A3FD2E69BB26ABAC197FE8B106A1D65FB0D81E1F53C7F05AA4D2AE434EBBBEE86664A99890D119B7DD7A2BAF38DD6F02C543B619E78F5F37EBBBAB71EFA2078B2992858CC9603D2312C3C69494D4DDDF70B8115B71D98CB434BF12C4A796CC78548E7CA0D5E717D1FA1EDEEA7C54A54713065384A7CF753181E7B81E3EECC91A1F4169475D6D96929790DFCDC762649FA3C25A695CEB8FCE39D2BAC4D751E7CFBCC8F1CB93388CDF9281F53C779B84C92BB76F3772294351FC71D691F35159952BC851568199CFFFC4001B01000203010101000000000000000000000304000102050607FFDA0008010210000000E99176BA8CABE1EE6249894377ADB68D59C3E2F2E799E933E639CCF4174CC418F6C9E8718A92E73DEA92B2A6CCE710C418E39AC036E8C9BC693A8D5CA0F67B5D0F971B4308F7E8994D13F39D2EF0B403B72F5E95547CF13716DF53A18AE3B3CF314CA14A22D4AEC37C21F366A80D3E439386DAB423C350095B9E8BCBA4F601543311839B8F6D60B582CD10191CD32D73C58BBDBC9AEE6D799A06DBBDD4C4C16FA9C6D4995FA874973C32417916F3733233D0E923C81E70263B865D7E78D9BAB1E2AF736D748D360E22197FB4D243ACA8B6AEF0BEF7BD3FD0DE16799E4F218ED1D34F3ADC5960E71A2E8AE324C08667D6CEDE539E397B9AC08229B68F2EF358A68D9D9105E6AEE6B379584D9AA55DE3134E10A3E6D4B97A957B2FFFC4001C0100020301010101000000000000000000030401020500060708FFDA0008010310000000582A2CB2E7FA486A724B3D4A512C65729461867227DEAC2B6729EDF7B3F1997025B70D05A2F74A2D34B6B6558D4E2ECC07CDFAB524D66B2A93A94C0815180E81449C50CE79CF2BE0BF4A84E5AFAF73E178FE83D5656F632F173EA170294BD3C1EB33ED5A6E55B6178062FF004443D0A994B69A6FC2103B798C8F6E6D464BD447151CB17D252709C1554B3BD2B4F89F7FB79F9EC97A1A1259F95EC8D9AC21A2AE6412C4609220E5B2C1B85416D17203AFC2AE987CF45BA4C6183B1F5A97E97B0D4DC75389D0264B49775896853031FD06CDEE52D70B0A9A5EA8C2E84AD35B1AC1CCF2C9EABEC6C3C5471B38CA8AFE8B42E31F105D35C8F3427F5454D9D5160E6B4D4056BEC3AC5EEA52B443304577A826894479B2D7A910C36630EABA54EADEFDC09BC04C59AF0ED13C77ACBA3DDD5EBDFAA02528CDBA935EEEEE9FFFC400221000020202030101010101010000000000020301040005061112131014072015FFDA000801010001020115C2BE4081AD15D750A91578ADFC29A68A034355AA40FD2D50DAFF009DDED28A812B50810F4A8089820954A26BFF003FC494C5D74D1A08D48EABF93F97F9BF9BF9BF9A6BCD73A4CD6BA8BABAAAAAAC55E35C591C52CF0BDCF18848A16824B50A47F3A2BA5166C53D90EE2AEC2B97AB35790F1B050861CF698089C9881F9FCBE5209D7D6E1F5388D6D70AE45899A6553F9869FF000CD18A235BF95BAED968D54AB69634B414A9CBF499A9A9A11D3D9D1B3501A62A294DB716141B34D6EAB94128BF4ECD4E8B0F07110305183911D4C6BB515D6113105EE4E4FE8BCF9F9F3E7CF5D4E32174A0729B1451F962AC428095FCC49F8B751778D5AAA4DEC0B417C581879CAA8F47078188C1C2FC1888CD66995425238464D174B2CDFF00EBAD6C1B1F9DFA93EFC79F7EB34FBCA56427AE98027F7861CC0AF0F37BAFB4F8B89D953BD4B9257DDCECF915E8C3C6CC310E177D22432235988686330CDF6AC6D59C8CF941EFAB5A46526AE667EBD8C44636CAD91F942EF1DDB566849458C91ECB227AECB08B9526316AFB059D7C2B42E1ED92F226A9E1601CB25CE593A7CA69F213DD59DFFDEE71FB2939495775676BF178F308587888BAE56060164E695FACBAAB6770EC2F087CF4A9213C39E624804A36284669880F699E984EC3158840627173E8A4C42B2F2AD6A151497EAF63C3AD274C35D14704AC6C15B0ACFF007DD9C15880E7B93D41EBADAF671B08B554CA204B2BC9C48D8CE5395EBEB286C29B2B6A7179B9C83323C9000001102164324AB627129A14EBA40220839768F542A8AD8457B601B6D3F22AF6658B28C88323BBD519A6F5D85375D62A4E443B2BC4C48DECDFB749502BDBAF6AB69B8D2B8D734A9EA66723020623F23067359C30380D7A3512A081EB390D5D54A89059B0C61546E95B7ACA3027BB8DDD727EABE550AEE78F1BCAD913E9D29CECA7645B13E354CE1EBB69E3B819FE8D119D79F230391111030311C6F231C158423F5CB4E21A862CB9929B2ACE3D61B6EB9C17D395F202B195A6A4EBB5FC8E38FA2BE7A8264AF3B99DCB2AD7A09996E5D2E3B717639FD31C88EBCF518382303D671D3126D14A87FE766093AECAE7FE855473CE9AF8EEB5DC897B53BBFE874FA9307696DD47F29D96AA5139D998177DF237F1EAB193255D5C7AAF1F56B255C9288CC7E4FE06064677A9D753A81101D4CC1FEF23AAB844D6672DCA4C929B1FD416D5B6D6EDF9CC44F5D037FF004691E8F714AD4389876947DC972CB1C60673D3F601BC46F476AEDCEE368043319D40000C614EA767536417BFAE1F05D8976F76FB970346EAB79C8B7FAB71C371D159F05AE3E565D64CFE262BD8D67208E407BFABBBA7B41D8BEE72ADD719B25B2B1B2BFB42D822E55B3B5DA0181818944C4C141CB0DBF44DD9E455393D4DCAAF03E1806C5EEBFCEEC633913B7962CD169E331906082A8EE4DB48199FC58C40C08413AD57B35B902392DDE42F551A8362C5F36FB4185CB70260D0703A1DF6FBFF0044D93B12E49A13B05D5D953DFD2DC22E25D05DEEB4BBCE20AD4D9A12BA974CA4134D1ABFE5B62BD4E4FE233B09269BA3032209941234FD3DF25EA0568D7A3621DC18B45D0FFB7DFF00A25F2E5E217A68E455ED4FD75DB3A5B8A36D2C89EDA86E9F90F1AD8EA483E82F55C5B6871F0D123593F91912B684D8784C64635C8550A0E9B76CB3AC83AF091D8E4C6770507EE4BD7A58D74A554A501CA38F95715D4B7ADDB52B80DFA43584E0DDEAF65526063549D5F1D4EBF6DACAC793919D7E75D417A81D153BAEBF6A67A909081D4D2785D6675E62223AEBC02515EBA16B11A363C37FCF6FFF009E5AD481EAB7F5370175764984777390EB5B5A034E1A8C8C703C27F223ACEBCF5D08A915197EE1B3C8AC2B55E3757824D5D959717EF511E054285564D752843CACA93D0C02657E41C39D5957A8EFE96CFF00A0EC31D7D3634E3C7B51C7698C4E5EA65831119D748AEDABFCD4B5F6F5D69B262B5D7D569A8717F164F6D62C112497311318220A5A175D55D6A0081E8451959AA312CE49C42EEBBAA9B3A1C87FF64363F7084AEB2D7313D94160C7E7495A166A8AD518F79E795E6A345ADD694B0AD9EC30ABCD76563AF285A96952148048A84223AE96000AC498189FABFA8DE709B358082FA3695B6756DD5757601C17BF461D7E0C2A16DFB21AF94D858EBF51ABE1E941191B0ED4B10E47CC90558AB0D65D75A56B108188EBA884AC0205720C164320E679471AB95E62250FD7350CAD615621DF6861ACA3221495A2146A13B2419A6D1EBB593932666D2630493653E7C9090C0AC446260C4873AE96B52C43CF513F4FB43E1C47C938F5AA520054AF4ED2BEEEAED82FAEE45B38388C11AE5F45BFEAC98CD369B5D4BD491130D8C121195BD2E4FA6309A2D5B61C4F8B0B728E30014B5840F5D753059EE19F523D869F61C75B57C918353B0ABB846F3FF78CE63CC4464C8CC657ABA8E355AA7D65BF52634CC938B8F0D5584595BD8CB0BB2B7FDD8F8B55ECD76A714B5800F5D7E4E1E751103E08653B2E3F6F54757E1E3BF5F69C88F02B857F3C55D7E975BA70C299223F7ECF24570981135B9376B5E558C5316DFA11915575465214800C475D4E4CE1E464444792181F2FD7EC38E5DD7109E4E79EB2083002BD5A1A24548888919030988FCE841303122C5D946CA95DADE17319D1C2735A3496A011EBA9C9C9CE88607A189C9C88EB262D6BF6BC72C53957CFA8115A6BD2D6EBF550AF1E463CF83030F3E3E60B58047442D55BABB3D7D84460CE4C211AAAB554B188C99999CEA2247CF593F919D64E1492F61A5D969FE50222B0D66BE8EBE03CF9F30303E4C0D7E04600004223AE885CABB5369418233E971AFAB42B25631F93F939D7531D75313F83F93853331859B0A7675839188CD2C0647FC8FE16164E4646060E47FC1E58CDA66C323F119AACA98BFF0089FC9C1FC9FC8C9C2FC1FC9C2FF86E3E3FFFC4003F1000020102030702040305060603000000010200031104122110132022314151056130324271142352154081A1B12433436272C10616257391E13492D1FFDA0008010100033F01DB7ED0789ED01ED05BA4B76818CF69ED01ED1145C89431153795FE51DA50A08169A80BED01982C6A94C45256BF91293BBD6F4EC464BFF86C3498EF4BA9BBC5D02BE1BB1E2D78FDB86ED1AA1B225CFB4AFA7E4995946B4A5BAACFF2C1E20F107883C41E208CDF4C73F4C64EA935B5A0F107883C4FDA457118CBAD0EC07569E8494828F4EA67EFA99E855D582E1774DE50DA57F46A8194EF30EC747F1F7E0D3A4D6734F69AF4800B983555E823513ED06504B4DE9D1A5D41314F6985C5D334B15415D4F6220F4BA82BE16E70AE7FFA9F1C3AFC2C562CDB0F459FEDD2622B007155720F0359E9943E6CEE7DCCC2E1D72D1A6008BE208AFF00328312DCB00865F67DA5BC441F4CA7FA650A83E5994E7A42542F9326B1C8E789053455416503A4D04F6129E370D570F5579584AF4713530CC86EA7AFB799D19D0CA36B6EA684D3533145AC29CC5A9FEE6564F9A919AF4811322C26FB1C7799582B199D572C2DD4CBFD5171187A987ACB74616FFDC6C2622AE1DBAA35BF879E0D7669C62B95AB891C9D97CFDE53A48A888001E203070FBC0C62DBA41C404CFA5A22366CB2DDB62651680816DA8CDBD0BAEC116D29B6B944086D68ADA15942B76B1F6950F351ABFC0CAD847295D0A98AA4F888D323865EC62D4E563AC1A0532FDFF94EDFD66EEAD1C6A747E46FBF6E0D7E03D62B5AB8D3B2FF00FB140D66EFED2DD2692D2F079894ACB9B531727580DB58AC9C4CD3CC03AC584F686238452D05403597D83A4DDBFB1E908225F4BECCD69682D35898EC055017F300BA9F78C8EE8DA329B4A8860CC33CDC15AB4DB494BA3B6B2838D1E516FAE51AB841455AE5AA036FB77E0B183603C1437D7AA2EC3A5E2740A2DED79A032F02C5A635330F475A952D3089F2BCA16F9A7E3318590F2AC3590012AAF71188E69A4B02629E92FC01DC81D0404C19763D07517949E92E7ABAC5700AB5C4065A0B7F19A03101E901FF00D4F69A030469CAC0F8830FEB389CBD1F9B6663D22E1139BA7894EAEA9575F1DE7ACE35D93096500D8B39D04C72A537C47ACE627E8A49D3EF79529577A559B3329EB34DA73705F6E230F5457A372B6D6D376F96AE930F554115661EDFDE8E9288BE56BCC4FA81B06DDA7F3959D37B4EAB547F7988C3B157A247DE661AACDD54B8F32A6ED6A21D2160A759741349F4F98A9CAB2FB77548A8EA66904D06CEE233E2514B728EA27220BCF78A7EB80ACCC90DE5F65D04B186108D7107ED5B9F129B778AC72A46B996AB4FFD43FACCAF56CFF59D2D0DBE696C69F74134DBAC3C5A4AD8AC4D57CDA9633D429DB77588FB34ABBB40F5189CA3FA46A8E3C4CA0693DA61714B6AB481984C8F528DC19F87C43D12355368C5376DD0CCAA04B281348A2B38CDD0C42FF34565EBB77B58F85D96D821856ADFDE6545D632E99A0612F975EA44BA883659672097D96A4D37DEA6DEC231602F32502E7ACBDF4996A0D3BCB56AA3FCD349971348F94FF7DB78382DC1A9FB99AACDE30FB0FE900B69001B4302A62A37E329687BC1BAA6D3413B4B536FB4A86BD4B374769568B0689572A37CD0540358150B13DA5CDFC997D996F15588BECC86FEF1B25C18CD320BDE7E231C07D34C7F3334DBC8672EDCB41FED19BD52BDBB4A988AABF7829515503B4BDF49624DA2D77DF7E288570ADD3CCC381AE22A18980F52C350A4494387CDAFFABE09DBEA98C1BCA752805F7267AA0D7F1587FE71F0D5DF0F52C5E91C8C47912D3A701C460EA05F12D4429EC668365E99FB4347D531F876ED533096BC295D6CD6D666A54C96ED2C1292F56FE90E9DF6E446266287A8D75C29BD3536D9CD0EE6F18D4CA8A4CC4AD2CE52C23339A9FA9BF94D04D209CB34DB6C354FB4CFEA98AFFB968A9455CAECBDE0D67E4D2FFB69FD2692DEA9E9EDE70A7F93FC4FEC94FEC2693FEA98ED3FC63341C22A53653E26E3198AA3E2A34D365D67E17D729D61D2A0B1D96A825E92899F1ECBD7280229D565845B125A60F0383AC82B29ACC3285062312C4EA75D9F9919E9A515FAA52A6A0E5D60A5E98F97A92A264A5484B0134979A4D36E5C2D5FB18717EA351BCD5266E2822FB6D4404BB003DE50FC3E1DB782C56D7FF49B4A4468C26231553078DC3D22F4A8D275A857B6B7F88AB85A573D5441E6546C6E26B69667B88CBD4716E7D63140776BECE9AECCD428E2946A8D3794D4FB4B19B8F98E91DF1B89657B367BC53C95BAF994DD746976F6946F83F50A69959EE8FEF6D8264756F06619E9EAD6371631C8E56575F20CA0B4F0B85DF29AAF5D3F2D4DC803CC40896F6DB69F2FDE69B72E0EBFFA4C0D533DBBCB0B6CAD5C723E41FABBCF4D71F9EA6A39FA98C4C3665C355BD2637C8FD8F910A7D761F78A899653F4FF005474A3614EAAEF157F4DCFC2C3565DEE2467BF45ED30F87A7BBA2964BF4B9FF79DAE601043DA5FAF0352F53357B3882C258C5B45ABE975C1F13351B7836D8D4D5AC63D0C46F87F182A287A6D31148819F482BE5CDD60AFE82B57F45516E07A46F4D8898DB585761F6D21DFEF5C927C9F335557315D01BCF78358BBF44065C691A692D84AC01D6D3F2C36C17B44A22D2983F34A4DF588A75CF282233671A09FB4F1F5311F480113EC3E10A60231E92930EB13CC53DE030183A4CBA1D8987A6D51CD80129E2BD54534D70E86D9A07A61E9B6968B4DB9C9987A6B6CD29D4C2BD246F9840D52AD3BFBCB19A19AC6A0F97E92666B464AEBAC6FF976DE5D61E1CA2352604194D5152A3DA61FB62A61777FFC863F6895F1AEEA7946825264176945B40F1169B316ED057ADB846BEBACA2680E702619B3A52AA19878E822D3360D18B359A380D66D6545370C655723530B2FE168B72DFF0031BCFB0F6E21B06D0189CC56629006A76751DD1BFDA57A63E4FF00C999F47E57F1E652AC3E68ADF5407BC07BCED29D646A6EB7561A8330389CF5703F9350EB6ED3D5BFE1C76C2E250B531D3ED2FF00E142E3969CAD58EA66E3148C7ED032E61E26866BB0B531E665A8A1BFF337DE9B85C15F9AF98CD382ED2D2F1AD0F76840CAADACAB4482AD313485AF7976FCC59BCA5929BB4AAF50B1D4998B22C1D8031702868A9D6FA9F78CC7E685CCF3D2511ABD4B082B8DC6110AA7D750F5332B7C0F79EF3DE5E3AB664620F91A47F50A473206A83B8E5260C3B150AF707EAB095502F39BC7042B345AB979A66B6B03375DB85F57C3B52AA8335B43EF31BE9F5DF2D22F4FB1131551B20A4D79570EC56A21065BA41937753A880F49731AA69696F9BA4C0E1F9EA3EA27E3B12775D255CA390F073451F7D9953A466D1760D8883AC7C5D6BFD0202C5AD296130E5F4BDA33331F276968BD6A369E20FC2B540B945C0513AECB71984CCDB3291F79B8AE311B90D42B0D6FD334C3DFF2C143E0C653A18D4DAC4CBE519A5C06BCBC1B2956073A8330A95159290EBE251C5D32C8966B4AF82760E9A5E5A545FAA5598AFA4CF50736D66371E33550D6F78F80C52675D09949A929CA382C6E229F9A530336612FA2EDB42340758D59D57AC5C260D4DB99A0A54CC6A974BE9797DB6E91AAD4507CCC98744ECA2E7EF3AF01E2B9DB91C4A18AA068D740F4D86A0CFD995C35105B0D53E427B1F10FE9223A99BAB5E2D9758B51458F05DD6075946BD0A975179F86AEE9DAFB52AE26923F426607708FBA17B7894A90B2A094EA52660BA89969053DB4F82C231EF2ED03560EC3481169AF69CA6C6126FB4ECC4622B04A09CDDC9FA47BC5C2D01481B9EE7C99727E01D9D349EDB2C65AC0CC3E3A8B61F134D6A536EA0EB3D22BB96A55EBD31FA41D26270E85F07577E076E8D3178562B5A83A5BC8956818D4795CC4AA059A2B0F9A5FBCE7A53499D1A672CEABAC743D218C7154ADFAA7F65A57FD23607423DA6EEABAFBFC33BC4D3BC186397DA6741AEB19FA9D84C67E8263B1B6DC512479ED1D6CF8CC4587E95984F4CA068E19328EE7B9FB997BEB0B31E3BEDF6E02865EDB685752B5692B0F7179877A6F88C0A656EB94749BA6607461DA56C3FCAFA4A8A2CED16A22F3758379485FB4F799C45AA3A40C7E5973F2C4A3515CACDDA2AED0F5CB5BB71E68418D0D422F16850A555474225AA2E58CF797EB2F1F1D502535FE3303850AD55778DEF1292E5A6A147813433AC351B6196E0BCF69EDC6578030D62E30B62B05A54EE3CCC5612A9A788A456DE635F4E8255A0EBCDCA21AB5CB31D00B446FAA06EF16A0EB15A2931470026FC5730002298A54DA0A775F11311E9D517BDA66D65B984BDAC262F1ECA4AE5A7E4CA1E9F45529AEBE76F298D5188963C0470FB7C02A782F305EA28C95E929BCAB8657A9813993F4C7A17461668D43A19517EA8C3BCB8D4CCD35EB3A41B35D9CDC3685749A88BD0C34EBB7BC701D2FD6739433118CA816924A340AD5C47334A54142A281C1712F732DB2F3DA09ED3DBE0F4DB6E156163ACA7880D8AC3AF3F7F78D45D9586B7D9630DC097025B59F2EB06CBB6CE6278334E5F7975BCBADC465333E568730B4ABEA355599797CCA182A6AAAA2F68382F336DB18360820D96DB7F816E15A8A55BA4156F5E82CA9418865997B4CA604CA2F1140E69CFF003456039A211F34527AC1B35D9AC0A44546F6316ECA62EA20ED0B0B4AB8BAAB74E5BCA583A2AAABDB8759732FB3484132DB441B3DE7BCBCBCD3E09E00E32B74943120F289569666A62E2321B1119758E3BC653D63A5B9A358DDA598DDA27EB9797E0630DE31956BB05452668AF5C4A1845011788DE6BC1ED32DE5AF2D2E7699AF5979D3599BE3AB8B3094EB06645D656C3937431BB8DACA3AC6F31FCF1691C9D04AD8822EB6128E11574D665161B0C3B6FB35E0EB3468C84E90C236DE5A1BCBDB5970269F1C1946B8399603734A55C392190CCBB4F0DE54AC42A2CB59AA889480CABF0759AF0692E0E92F9B48509E221E162B2C1669F134E1BF594710A732899497A2254A4D665E12763D76165D225051758074F83A4D765B82F0303A4F9B961A4C782F0B3896CBA4B01FBA2BFCC261EB83C82361892BD38046C43A92BA4A745472CB7C3D78EF7D20607496CDA428C46DB99998199557496FDD96B2369196B38036F308322E9FBB68D3F336EA27CB3459A7EEDA1837ADA4FFC400251001010101000202020203010101000000010011213141516110718191A1B1C120D1F0FFDA0008010100013F1037390F348CE690BD80EB039900361565349001963C93741F6B386AB2606C100DF4F9FEFEA33B8000043704C879E314161DEFB153B9C3CBA7F232F397734B3CE4203911E8833C172214F10779027885F50EAC01EAE3D5CB32E2F2E36776228F7037207F47990553FC2CEE09BEC4C641F900C3E97E13A80201CE5B7B29CAB90E575B712CE5E2C2716F0DFD193F7CDCFF0022B6B1EF0F43384C6CB15E8AF99968F8B91C955F493785AF847043C6FB596300DB5E0B4FBE4D8A1BE5B1FC507C02CC188FE7F750FEAE6D281EADD1C0670B0CE4885E4808B6CB89C840B6B1AF248F8907A8CF058027B4711846EA3A8C11EEB810AFA38847058BC5C223EC9BA08FEF4B71C3C4E983A49E67F6C6BAE7F9607C1196E62CC1D5AE699089ECE90C9D778F39165E1F0108377FB8E79400C0243434B8EA74FADB5F4B3F4FA4FD33D7ACC0E3E83E9BCE6337A641E1F1644AE6E4A52F73C65B0558D873EACB0E33CE9327EA62C1132018BC63505E2F2EDB291C10E0B193573C5D7569CF1F03EC80DEA1EB7C8FE4467B7233758E8DF9BC7735C6CEF48F8B609A66F2724377C2FECF8841F600C0FEA2078904D03484F7EE07A79163D813ACF284035560820BDC103F1459B3EF23EE210BD0CD09D7AC400FC00E876409E1D7640F4400A931D3548DE870F168143EDB1577C48D5B7CE1721E7AE127C18FD118E6EF7C310E84E91E94A34E3FA612534D9B44676F9E48F325CE578E89E193CEF73D461A91F9066C4739FE926A8E2E11EB030FDD9E76C61FAB19E6C178DE2B91B77C059C308B9EFD30D6DF1EB841D8EAB497C1EB0F0798FC9E0C2036C3D85AF4E13990624904C605364238DBD5273BD9F4D8C70EB3E1721B932AA092F02BF45EB66EFAADD30E13D1AD391E323D9B2105B2060EFF00D1093B9B386A8668F3720D07A9680CBA95FF00B63DA1C9AFD801A49528A1E7472198B9B6C0BAF1FB2D385F4CF8B019BDB6208EA7C96D39F1ED23722E1DE156786D9C6117B1756C8760C319F62353223970E4130E54AC0FBF9D9C00FD813FB59011E3C4DD9703CF76AF7B35406C0169C061B34720A5CCC82641B334F89277CDC0761C3DCE488B4880EBD96B978548BD97035E1EE527BE1F6FCC0C6D8329B2C188F23723ECE30D44F11B8A76F63737E39045F809168070EFABA01F3BF3FEE40B877C6B33F8904C59B6D29EA1B860C77A07D63264FB6C2071B3FB62B8B6062DD9644ABA87BBF57008BC3E6BE31848DB3082E63D418BE1E196C607C13C89F0302062D8AC4C0BE6703AC9875997AB6C18A3C79B60464F909F3F4C04EE389BDD88A0E7B99B75FB160B77AC756DD423E7CA99921A9939F01393C73CA461CB92B9858AA066B84C75A86DB6BBD6CE3610CBDFF02CD4E2EBDDEC004232E658E16E0F59FAB60506F0A1125F8E113EC65323EE89AFA210BC8058038FD8F2E03D66CFFA74B18A1D3EA2A3177F5096A63F65E3B872E9BE20470F992CC271F43B1881D712288B86B9AA44C870F1699ECFE341621CDE0C5D115D3DF27FAD23226466BA48CF813E0C512499098C78F617FF00CFF3F52AC6B6AE7B425310A1D3DA772D94747BDD4316A3FCB60F7D844011F6BBCE86DC7B85025521AB481972E4B99C1B4D2C66FEA4F1DC88918D6398243EFDC045B902A984A026E48B46398A89657C98F97341321F490CE88A3A2A4A8BC1007AFCCFB3E095AB9B6DB847653D4AFE9D816E24BD449ADCF4C1FBF4245D6333A8C360D62B3C33EBEEE3B38F2D756333AE3F78E4E6A428C4529D84CE45C8883397DB78A547BEA6EE06BFEC6D2C86E69CF7A4CB4F2FFD8B40C25CF5001C8F3C444189927201DFB97303390A26661600FB48FDF0D3FA9D1F44C96141807E62C03871F3B1B8C1369335462013CE4DE630B6781E4F9721F951015BEFBC9E05777AECA4FD3757653DDFE0FCB00724D061DCB9C1F5FF002408FC5EF83384B49E46C2ABCB276452784275FD4460C09982CA65748A11FF00E2F0878C3795D509C88EEDB7D43A6C3CE4463963391B30ECDC6153CF5E441F75D3F977E2C2E9FE729FDD06220A7D400E40182CBD44C8F6EEF2247D61FE2CFA7A2DB270EFB47F897B08FD0CF964F3DC66735C6DAEBAF73E1E64B5A713674E92416151804AB7129F2326398FB1B10F8CDB922B9F3B396E66AF2DB9E3BBEF1C260664201702C3BBE2D5ABEA787BE891DECB981F5121F4E2CDD543F872E83120479EA21C4E38F52DAA38BEBBBFDD35096DBF71F5651BD24F99FD913E49B9CB0807D8D7A3EACDDF27FEFB0F8233202CFC119E59150E043D7B63469D0C1BB86F6DF17D4A4B2E320E79929DC46759E8041FBE4EE2F9E45886FF00516AB2200C9FEAC42EA40494577E5D958B027AD8713504AAD645701F1F161FC0BF3AB93E4740D9A0FA9F2292E45E79B423ED0FF3707BEA5E993BC589FE8AC6AA31FDB11877171CB28D910DE5040470AF454440D7597BE3976665CC6D3F12E4EB64F51182F17EE33387FB613C941303064575BFA6B9C20420F8FF00C271DF8BD51FF2894CEBF36CEA6C032B0E256434F909FD423C3C3014E236678187EA745C3C21107724E0EBE211F5EDDF5E8B1A25E24C41CD1FB2238EB2673E98CB94CC2CA65C2267AB8F0462CF0A0C0BD7CC2F33990E8F2A237725F72CD6F26EF28ABE9D58307032F2767269F1C6E3E0DF13D7CB8F5DB3F7565BF22160EBF805925789998F77F717A109F284CF468A4386C872022DDDE5BD360C6407F117D2DEAA03EC1358838D204CD778A525C0659F2CE78F7E6C0D3213A33E7E18D01C7D3EBFF192F4C8CC4B0F021057A59007B4FD9656BACA2E7BD90BD492322EB87E47CD95CD34C6DB0431018F03ACAA0D6E3E131B89D8B82D21FE996CDBC3AD7F8B2C487A2AFCBB61E2981068E3D8B983250967F780AFFA945F049E9A1918BBEB6CE83525D077F073B79EFF00F915280420F946012268E1F2CAC4D17B801E55F89055ED1F7E3FCB0B9D81C8DDFAB5602F1F2F03182419B52100E7B96EC0DEA8496F329E613704A0D13D3EC80C379656C2A45FDF721B8B089D8C0EEFF10560FA58E52A10C3C9C1FB9392E49419559006BE37D30159E63D10287F98434E1963E498370FC7970F2B00CEC307FD4865986DC02E9F38DA8A8CF182F01AC9F2FCB7085CF7C98C2BB1F43344A339F1DA5B83BA84DE1E8AB74867C8DB64716424D70FF4C4747F693F3A7AD5E7DCB9ABE17ACF1F43DC7CBC7D890EC5843ED811103DC78F6235DB3442EA869FC91346EBB1FE71A5893A3D708DED91BDE83E98868D8ED059E9E4722018C3A7C788D13003444912E970F76DB78C69A7C318522E49B8B2E5B3E3664D82EBF9901347521D3C9CB47FB95D41D3A5E41C1290E8E9FF000C2269642743969F85F3116F82C0727631F42917AB9BF33A72CC98A090F788707B31267CA5B1B4981B296AF5D7607EBB0A6DCAC576EBF691752C5591A00F473B92E083BF2B3D09C3817E03D13B61CDE58E3B783B1731830D62F98CFB83F36721630BB1960C003DE22BFC4E5E37C05FBCC587D5020411CC517C4898101BC28F08CE3E308CEA093E16D80CE91F897DD7DB311C6F366EB29F4C50D7C9932D1D3BB30BE060CF2A3199F0D9803990B05E6C9F30089614387BE4ADA01B11E6CE87CB214F3104C0FD4882C9C5F0DEA3F8159186B6E130642759E3C0E12CCE1C1EF6562EA3FDCCAAB7A07CC91973BF3DC3D7EA78D5207ACD5B359F2DA37268E676F1F6E1E6DFCCB3CB2FC6CADD7921E6DA191071B2D9E62A213B1C131EFA522BF787B1FC304BEE877C32201BDC81B1AF0B20EFA9DDD81823091899D3760A355B808AC8E843271F8C0E7244E6E91E12423BA3130C5B3C5EF0E3243F3A1AB6C730B7917120C09F9607998D3A76C11E2C8564175B7D58B8B11C983748CDDA9A8A964267127A0042F5ED12BC4E4D6338A78938F696A731108E7E88B81FBC2439BC99226E4218C1D93E657CCBE75B7E6D2F990B8CCE69661CBF9A1609E4711FFE3374E7C1F737C6974F71F5BFE4E41B743C9BE6443C8CB24F661218BA459E48383A458E3743ED9A89EA0DDC1C66C270B218763C8C431C6F8BAC184073032161E413EA00BD6FF4BEDBB7081CC8C5977305C99BF3079AE599CE270DEAB0AAC3A44B4C3FF234BB3C98AF6C6FA48C4EA49E3317C10A441A6E7C9F693380AFE7D8C661BC922FD2FA64B56984F048A727D4C1036661CF73921D198B24DA3C183B32C7B8542C107C06309EA5DD42388A676607F925D1E9ACE5341E7B0019A6CF9D63E37D4007B76F9F02CCC5C4E23662740DA307631318F330F3C3BC1BCB728987E06BD4E7C93B3C5BE7269AB1E22238C761B0DE7C4617C59185982B283E8CCFECCD97CB715CF8D624786EDAFF003E46D04F693AF10ED8441F884DC1C8DF5689A4662C1039199A5FAC0519405B7076DCEB262C620710EF317E64C696A2BC89E608DC1207F67FCEA025D474DC7E7E30A032B10BD27C87AC45A60B1A2422700B812EE8C06588BC2DB6C2C8D309C25ED2D90427A900736F76DDFAB64FD4E057264620CE96B741EAF047E711CEC183C34C03094ED20117DCD09BAE46D93C06D22B92B36393B93E5806721339199CB099A2722A24980B6D9DBEE9D20D1B251CDF5D6C1B4E38FD8C695A401695DB83B0210F3E229C33A08DB087239C2C8708000BC179F9B76C8BC32CC39041C8887A736CE824119907425D83545B4C68EFB24B17AE4300C0216433A0A59A40B001B8EAE438C7DB3E9EACB3726E85B69979306737092D091E233B9CBC7C84CE59E42339019199BF9594D2E4580F6E6761E439D6C70E595559B2D63EABCCFAA2E2262432B6AF643AAC517309E59738C6F70D3ED3020E49FC0A32339645A2173B62A91B36E73C4E4283C5A425D0325C5F2E9BF734745EA9C27972073D47C80C30C808FBD8FB3B87C4ED0EEDBB72FD6C0991BBB3AB0844CF6B2CD99E72133483978B9F84FA7E0AB2624BC0E4FC65F3BC1D839D8A1F999181F315608A08A140B449CD7260EF86EDDE1914B6513080990C607318D22C39EAF10F764B072D9C9FB0EDA3CF0B109E3CD81E5210BA63C800F938C865D190105161B901AE4870B33CD96EB61BD81B8C812E4F25C5B3825CA23D487C5B0E4CCD223183DA2F985CC90023DF2178B4473B659CB30E460F13F49F1D84797B047360F6C3F3768118CF91A8AE4B18CFA664AC7D3EED826482272F04749D58D20F1385F7B1792315BB323E4B00C98CEC8F18C873D401A4BD57BD89F2B3AB03A58D6098930B1979BB66B1B99B61DCB71E5B2E4C813E1480D8C5ECA4EC407603DC443D868C6E4765A39328E5E1E4386978B9F8B5131B961BD8638B25A0F3391D5C49014D885455256931F664310C575DBC56DE74C2132E6462B0B936B96CD842724CE490C36301591A176404E85522F750718C1887A09F4DB1F71BF7683377B314142DB072CA6E448F2D058DA03261B3AC59031F7723B78F9846EC80FB5A0EFBB786E2DF39621CB10E5FA4C467267E0EB66B49136FF3360BA644DFDCC8EF11B8E720EA92BCA78963812902C8374520E6ED6F2D71C8D6722B44E5A75914DE4F6D25ACB9F3960470097B19FC0196DF738BAF2CC5E0B43C408F214E3D4AE04E22B25498EBEE6C3B0FE660CCB4600166C48B11C72F0F23098C38334BB6BB0DB9DF548B45E7BBC3C8222691D0BA7D58DB20C607C83976724665A543651F1711A6617A99BB93634958BBCB901F0C5C065905EC2D3D5BBE27EE138DADF72691BC65909F0B9E429B90AB90C18911BF39DB03A12186CD43B30739301F7F8D3749EAE4E7AFC47A4CCE37BC776DB7CB74F11CDD2E20D6F0C4CC0886022876C5ECBDC254F12417495BE2DECA9E250C27E2907A5690D81C0647C09E2F4C7D66737979DC83EC8DF843F5878E498B8D98D1E401E443E48C2E8F94600E5BDD2F111D2D3996063E6C4DF8588CF5661CB0CB8439F83C565436DEAC91CC18CEF7139F827E3843A0A24ACEC91B2A5942996D1FC5B8E4B802D898D08C005F73F17CB901124DE0F2D3796F5E4198C1D640872C33967F83E51BB088FA053A478EB2947CF27323E905EDC7B8A01072C725CF04ABF8AFE01F8B104C06320DBFC78C17978BA36CE5C9AC844731B623D1989E0FE1E27E2F813C1789787E58BD27C9F8FF00C5E5FF0089E9F83F87C378BFA898C4F0970F3E5FC4F5F88084AF17E19BC5FCBC89FC1BC2F2FC3DDE11F87BDEFF000FE3F882FFC4002D11000202010303050000050500000000000102000311041221103132051322414206142052621523435172FFDA0008010201013F007D5D15B6D55DD135155831E2D1D3994D614711690C1498B42AF3359ABAB47533BCB3D41B556B3D916C16710A99BB13DC99CF469BA16301E669D8D762B983D42DEC9F18BEA568F389EA28DC1F8C3ACAD7FE49FEA3547F550BE0BBA0F5973C357F189ABA2D5F7036D87D46853E52B23EE6EC7225DA976E25575D59C8683D5F50A146D595FACE7CEB9EA7AABF556E5BE2BF98144A185670D145665F580321A662CC461398A8CFC089414E4ACDB81CC568ED8EF05820FF00B84F51903CA6045735B61E29044B1411150E232C0389600CBCAC4AF0659A7DE32268343AED4B3252BBB6CD7FA6EAF474ADB76DDADF1E89D1CF4AB53ECB36E83575B7EA7B9EE715AEE8F5DE9C9F8C757230CD1541E22F6C09925B88B3B09838E972075E62B1511EC6C4A9B35AC6ED14FC611980E1BC62E94369B3FA9FC2D595BEE56FED9FC53583E9ACDFE62622F026630E218EBB87334DA74738DB34BA7148E236D6F25DD353A75D9B91620E17333C45BC8DC4CA6D162E44CE4AF46603BC61C438512CE768DB2BE123768BE3D34B4FBF7E0B7C5605006D8FA8BB456AB50DB774D7EBB55A8A596DBB72F458008C047C4D3D29736D69A7D2D7559F08D91D1BC1845683958A30CC0CA70A58095B6598EE99E332DF99E23769A764C7CA6A086B571076C46E04FA844F4EA02A339F269A8D455A55DCED351AF7BDD4AD7FEDCB2CF7131B630C40D37C678CD99A5CA36E9EF367291750FF00B8AC1B91D3C6D653FDD10F38962E2D6314E0E66CB14EE489616186F29F7C74C4B01CE6577031EEFA8960C72D0D80F694DF5D3A4DECD359A9B3516339887559E3C620BD972F1843D1B336B4AFDE4ECBBA1D53A706B95DC1C662B95E4345D41C73352D67BBBD976C46B8ED220566196820C08F8C6667EC750B98CB5AFE63561A1D3851E5026D11839E3744AC7DC5F8FE615DDA6DD0AE61AE6C9EDC15CCECED2B54B69C9F29750ABCA4572870D2B3B84640C30D3F94DA7E367C6323547FC677E63360733DCDC76AAC4E7BFC7A18ADB63313DE6EC4639E239DBC455FB80454B2C6DAB2EAFF0097D32D67AED988C71198933439C60CB74FCE44B74DC78C1BEA3CC5B55A13383C18CA51B11C81112B5C1559AA1B5F227D4CF5E4F1194AC55673932BA1D8E257A31FA9453553CAACD629B8C7A8A1E85A178CC5BB4A74ED6364CD3E9F688C3EA3096561878CB34F83958ACCA70D15C661C34F6D0FE7A3207EF33C741376078C2B919136960B99569DDB6E2554AD7FFA9DBBC2FCE22D6184BB4CAC3C66A28F6CF118C00B1C4D3E9771E653A60BF98D8511DB999CCC42A1BBACB681DE7B7B7B400E6018E8A629CF45C4C2C55FA9A7D3EEE5BC60E3B45963E26E39CCA5E11913574E61D2F329D2F329D38510FC04B6C8C66603D386E0CB28FB13DB20C60F093DA2B6204810C5AE2544CAEA09C981A6E11AC10B13D2B7C457C8E258771C19EDAC55092B6CACB9E3367A8FE820346AA3563136A8FCCFBC45532BACE32D381DA1E8211D09818CAACC4750DC88B36E62E504B5F3FD03FA446AC346A883CC5E4CA944DD3333098A66E84F5532A638C74597B9ED09EB999E80C2666033262A861CCFFFC4002F110001030303030206020203000000000002000103041112052122133132104206142341515220821591073343FFDA0008010301013F001A29487222C54D4F2C2D9790AEA3A965764F50F6525515BC969B4751AA540471F8FB890694F4B10C51F8A284E3DDD30FE450C6C9A3B7A0F8A7DD38AC113594F89090B792934EA693FECE44A4D169A46E190AA8D1278F788B2151E975A6FE18AFF0754FEE150E824EFF005A4C516850B37D298B255347554E620FC906955F235F1C54C9F9362A0A28437C72535353C9C5E34FA35316CC44A5F87438F4E65A250D250C3845E68CBF2AAA0CF9B23CEF92A79327B3AC51774CFB7A3B222106BBA925691ECC885EE9E351C2E4F661450108DF15BB775BBAC7F2B64ECC5BE392B3A900668B30F244CE2EA377674F67756DEE89F251938B8BB178A3A8CC05D455A3116327892D5752D0E820F98ABA8C05691F13E85ADD5C949A75411491F2FEAAFB290ACE84933A7743A6BD5C79425917EA8F4DAA8A4B3C66A485A9C73A82C4553CDA74DB349C9423083DC454ADE4ECA6B644845AD7744486E476566B593359529B81DBDAA6A7EA3DD97CAD917122593F64EEEC56424B2B87929B507F9CC32E22BE3C209F4A1765FF00181F4BE24B37BA22596C9DB2751C4B1C7D3E11A71A9AA904BC57C6CC3A5410CD4E58E45C96A7AA49526572C90998BE4058AD2755942A0629A4C8494F23B11591EE62874D128C79725554674E76240D8EE9C9EE86323DD44FC85445764423D3275279216DD179A1F25A8D57CAD213B79121988A4291FC934106A34E50D48F50568FA1E97415633D2D18849FB21DD460CE8599133226516B357A3652D216244B5FF8A353D5699A2AD904847C71142F93DDD7D944F8C804DED34639451C9FB23E242E826778E326FD16A24F2442EFED4418C6299AEEA9F88EE809988548F70B028A4FA32322EE85AE9DB741DEEB5DAB733185BDAA86827AD3C231FECA93458A9602BCF9485FE9414AF1964E481D90959755677444AB227906CE8E8A291B19549A385AF01624A682481F1314DDD52134D414E4DFA2A81D9529BBC02CEA46C8085D0F4240C093D23035C7922721EE9D6656B64A9482D8BFB94B4FBF1250D37D9D49095FC50C6EC05C556D254D56A3D308D69BA6C54710037F65F2F4A4CAAFE560D80B92192EF7424C99D964C88ECB2A5A9016793124FA5B936405929690C36C54F4C3336262A6D2A22F19315A44310528D3849963FED54434F7B12791A331011E2A4D964ED2286E4A4889CBD1BBABE29A6243506CF7C90553BBD9C51133BA178C327605254BFD93CC6FD894F217CC083A13764332EB2EB32299D0DC9D47A84F4F5251397150EA1D4DA5152C31C8D946A70C5D472C90975222E42BFCAB4C1F561FA887A550390F92391C78928E3690D0C61186448E408F9F9649FD3BFA5D45DEEEB2BEE8A47ECDE8F247137524F151CFF355653378A765C9725BA1077751862CB558BFF58FC952EAA2238CDE42A975588B6624785435C53C262983F2A272075258D85D9402ECE4A69A523267254D2750312F6FF0B2114CECC88DADB296A238988E42E2AA75CC768051D655D6C989C9C7F55442D088DD0C8C5D95AE986E863420C3BBA9666165553B16CEA4877CD932A3AF9207C4CB8A82B4241DF90A28C0B7125D3D90910B22A8919ACC8B77BBA12C7B2B274C9AC98985D11FE1556A10C0C591644AB2BA5AA7DF88A107375474EC3C9D751D94550EA03C90832D854F52C2CAA2ADDD39BC8E986FB3A922C5F64ED6514F2C2F70254B5BD50BB7926A824C77EE893B5D62EC8FD7276444ABAB1E202102E4A46390AEE4BA4EEEA9A9FEE84716B226B217B3AA593C534ED652D46CAA6A2FEE57727B3A8C1335910B122819D153D9459C257651D431774268241ECEB1127450DDF6444AE9C93C8C3BA9A732D851C4E4F775D1DD053B210616D95910ADAEA22C5B65D63452B929077401774236FE1F75664CDBA094C504F96C98C9BB2690FF006F592561D9911B977FE03E8C9C510A02DEC9FD24DFB28C537F2B7A76ECA399C76741201EECAEA627B12B5F75656565656F4B2B22644DBA6644C85B742DB2B2B7A3B2B2B2B2B2B2B21721ECEBFFD9, 1, 0, CAST(N'2021-12-21' AS Date), 2, 129)
INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (3, N'My post 3', N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. 

Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 0xFFD8FFE000104A46494600010100000100010000FFDB0084000404040404040404040406060506060807070707080C09090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D222A25252A34323444445C010404040404040404040406060506060807070707080C09090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D222A25252A34323444445CFFC200110800FA01BC03012200021101031101FFC4001C0001000105010100000000000000000000000601040507080302FFDA00080101000000009E0000000000000000000000000000000000000033B8200000000000007D743E89C60000000000000AEEA91F39FC80000000000015DD726E77B500000C747AD3EAF32B7F64BFB90000095F4272ED9000003C30F0BB002493CFA0000247B9F9D40000530317C200AC8A5792FA00001B675300000C662A21680066267970002EA4957A7954A44A8000C76BFC7000CEE4253780009474C5407227880061B5DF9ECEF6D5924D8D93F8C06B2F9DA716846CDCA000128E99A80E43F10016B0DA58F40E0B58EEAA8B0D21BDFCF9CA45B00186C85C8128E99A808641F567980189D77E1B5E3335F70FB8AFAD9406E76C034E6C0918128E99A80D03B4317CFE00B6D59E25EEEBC0FC61D96B8CD6885E6726FF00629A776048AA09474CD407227D751F3D4600231ED00F97B743DEE7B6059EBDC742B4D93F91963A656971F72CD90128E99A80E43F1E89D79AE403CE3B0313EDD720E6CCA74EEAFE7DC519DD8A7CD83544E73DEF74128E99A80E43FBEA3E7A8C0020D161F5DBF9AD37B62F7497380B8DB40D39B024604A3A66A03416CFC56800035E632CCF4EF6A73E4B36D6ACE562F2CF707D043A41910251D335010B836AEF30021573091D8D36A55CE1A4897E13667D000251D335029C8BE00016D80828937464B2DB4AE9412A936480009474CAA0A72278800303808D003D3CE6B2D000192D97F20353FC0003C30D0CB00093C6368E440000000001F1118764F1806C5C04F000000000005BEAC94447218E5D5AB6CFBFD00000000000613138DF74665F8BF0D9C000000000003CADE1D38D612191E1656000000000000B1BEB08E4CBE7E80000000000002950000000000000000000000000000000000000000000000000000FFFC4001B01010002030101000000000000000000000004050103060207FFDA0008010210000000BE0000000000008F20000001024EE0052723BE4E7AA9C01AE2CE00D5C6731824F4DD5EE03C635ECCFB039EF9F69D3166E66FD22D40AC882F721E389F9FEAAD66C267D37A668DBE8AC8825CEDA227CF6B296DE4408971F45B8D10B64CD8AC882F20588C7CE69B44EE8398F1EFBAE9B10F7EDCAB220B4D738382E7179BA2544FE9BAB78F592B220B4940ABF9EC5DFB63F8B7FA1ED0204716D9079E6B8BD45D5EF5200001E38DAA872EFBACC800003CD5EAF3652C000000000000000000FFC4001B01010002030101000000000000000000000005060204070103FFDA0008010310000000A080000000000048478000002763F480162BF6B69E34A8B00FB4AC2007DBA1DCF234E9749D703EB9EC6BB5C0B674CFBFAF3DD3E4F06059664F28B8067D1EEE3D63CBE9EDFD5F91669810D0BA8243AACCE50B87DA5FE3C92037E675E235966983CA34F5747BD6EC482D09696734A66731A1A9E2CD307958FB41874FB7AAF86D586329B467DBE78966981558CF026BABEEEB6AEF6705C9BE204E490AA600CEE3D0FEE576B54800000CFA1CDC8685628BE00000329AFBE70FA2000000F7C000000000001FFFC4004E10000103020204060D08090303050000000102030405110006122131411322305161710710142032557273819193B2D1151617364050C1D208233435525694A1B133536224427025828492A2FFDA0008010100013F00FF00C3543A1BF5B4D4931EFC2C68C5E4003529408E21E923663A0EA23EF6482B504A412A26C05AE493B319272F1A1D2CAE4A6D2E5596E8FE0006A4FA37E2B486DBAC5550D780996F04F35828FDEA0124000924D801B4E324E4AEE30DD5EACD8326D765956B0DF3157FCB19B733B197E1A9B410B9CF24865BE6BEAD2573018528AD454A515289B93BC93B49FBD0026C00D7B3A7192F2577186EAD5668192402CB2A170D73150FE2C669CD3172F4523FD49AE27F54D03FDCF3246274E955194ECC9AE971E70DCA8FF81CC06E1F66932E5337E0A9CEBC3710B4007D009389198EA0C92174DE0B9B84D2F80C7CE99FFEC31EA57C709CD5307851D93D5A43F1386B35A3507A1ABAD2B07FB1030C57E98F5817CB6AE670587AF66173E0B602972DA00EB1C706F8557E92936EEABF525447AED815FA4A8DBBAADD6858FC30CCD892353125B59E64A813EAFB364984D4ECC901A780521054E94EEBB692537C5567B74BA74C9EE782CB6A5DB9CEE1E938A8D42555263F3A62CADD70DCF301B923980FB3BD2A346177DF4206DE3280BFA37E1FCC34B4029056F6E2129FCD6C54A54696F8762C40CA40B10355CF390350EF3AF16ED02410A49208D841B118A66617A3A90CCD25C676691D6A4FA778C21695A52B4105245C11B08E7FB2653A8229B9829D25D2036565B59DC12E029BFA09C76402AF9AD3B44EA2B66FD5A63ECA480093B0739B626E628316E964F0EE0DC93A8759C4BAFD4251500EF02D9FFB5B163EB3AF04A944A94A254779249E405AE2E77EB36BE202F2EB4070E1D5AEDACBA8E2FA0249C465D224002308C4EE484A6FEAB5F0842109096D21291B001603D1F658B5E4E60C9B54A5CA72F3A346D3D7B5C43442828748B58FD966D344FE2BF29F0DDFC041094FA751BE1CCB34F4A4A8C8750902E54549B0C4D662B2F6845925F48DAAD1B0F46BD7C9EBDC710AB93E1948E14BAD8DA8735FA8ED18A75662D42C849D07ED7D051D67C93BFEC10A1C9A8496A1C46F4DF74D909B84DCDAFB49B6C18F9899A7C587DAB7F1C7CC4CD3E2C3ED5BF8E3E62669F161F6ADFC70D64ACDCC2C38CD3D4855942E1E6C1B10411B76118F98B9A7C587DAB7F1C7CC4CD3E2C3ED5BF8E3E62669F161F6ADFC71F31334F8B0FB56FE38391734F8B0FB56FE38525485292A1650241E8236F2F50A946A737A4EAAEB3E0A06D3D3D03A713EAB2EA2BFD6AACD83A9B49E28F89EFAE3BFA543A6540F00F3AEB5237718595D5AB6E1FCAEFB7FAC87282940DC0571483BAC46202E4AE2B465B650F8042C1DE4122FE9E5F267D67A479D57B871BB1618B0C5862C31618B0C58614058EAC49FDA6479D5FBC796ABD59BA737A29B2A42C7153B80FE23D187DE7643AA79F595B8A3724E002484804926C00D64938A4643654C36F559C738558BF02D90023A14779C54F21442CAD74B7968780B843AA052AE8BDAE0E1C42DA5ADB71252B428A54922C411B41C50F2B4FACD9E3FA8897FF5563C2F206FC44C95428C91C232B90B035A9D51B7A9240C272F50D22C2951BD2D83FE70E65AA0BA2CAA5B03C94D8FF6B627E43A6BE95180EB919CB6A4A895A3FBEBC54A973692F98F35A2856D4A86B4AC73A4EFC5369D26AB31B8715375AF5927625236A8F40C46C87486DA024B8FBAE5B5A828245FA06331E4F34B6173A038B763A3C34AEC5481CF70358C254A4282D0485037046D079F1489E2A10D2E1FF551C4707FC86FF4FD83267D67A479D57B87036720BD9893FB4C8F38BF78F2B31F718614B65853CE9D484245EEAE9E618F902AB31D53F296842966E4A9573EA17C4CA1314F60BF2A76BD894A51AD47986BC500366B54B0EDB47BA1BEABDF563A7198AAC28D4C7A4A6C5E57119077ACEFEA005F195E8E6BB5271F9975B0D1D37893E1AC936493D2759C25294242500048000005800360EF6A54D8D5588EC4948052A1C555B5A15B9493CF865D9B96AB0A2353B1DC285A7605A378EA231164B72E3B1299376DD425693D045FD789E1A5419A97C5DA2C39A7CDA3A26FDACB524B338B04F15F47FF00A1AC77F27305261BEE46912825D45B493A2B36B8BED031125C79CC224C65E934BBD95622F6241DBC864CFACF48F3AAF70E06CE40D8EA271272265893A6A553B835A8925485AD26E715AEC66EB295BD44925FB6BE05DD4B3E4A85861E65D8EEB8C3ED290EA144292A041046E20F2955AAB54C6C5C69BCA1C447E24EE18952DF98F17E43854A3B3980E60370C254A4292A492140820EF046C38A467A86B610DD5B49A7D0900BA9495257D240D609C671AE45ABC88ADC174AD8650A24949175ACEBD47980C51554CCAF97A2C9AB4E8F090F282DC7A4389693A6E6B09BA8817B63E7DE4AFE6DA3FF005CC7E6C7CFAC95FCDB47FEB99FCD8F9F592BF9B68FFD733F9B1F3EB257F36D1FFAE67F363E7DE49FE6DA3FF5CCFE6C359DB273EEB6C339A692B75C504210998C92A51360000AD64E3B20D3821D8954427C3FD4B9E50D60E32AE68A740A5887519050A696AD0E2295741D76B81B8938CCB9C51518EE53E9A95A585EA71D50B1527980DC3001B1363606C4DB56213A589915E07C07524F55F5E39BBECCFF00BF27F5A7DC18CA9FB8A1F5B9EF9E43267D67A479D57B87036720ABD8DB0DF645AFC592E87B8090D071434548D12003B8A6D8CB99BA9B981B2DB77665205D6CA882AEB0778C677CAADD5E219F11BB5419493A86B75236A0FE071D1C94C94DC38CEC870F1509BDB793B80EB389525C94FB8FBC6EA59BF40E603A063D1DBA6C64CBA8418AAD8EBEDA0F925401C664CAF45CDB4CF91EBB18BF0F8543BA01C53674D00806E820E11FA34F629CC79767C2A4C472975F282199864BEF06D57D4A2D2DCB28621FE8C5D8CB2C65666366664D62BE6FA529B7DF8C95159DCD217B1230D7E8FBD8E1F04B396242C0DE99527F3E19EC0DD8B5A92D09796DEE0C2D3C224CC920DBFF00BE2B7FA23E46ABD6A8754CB35334EA12020CF824B9254F80ABF11D5AEE82A18AA760DEC474AAB467A8541710E445A1C0E77748580EA0DC784B38CD5184AA0D40102EDA3861D1C19D2EDC09222C80A75216CAB8AE208B8283B7D5B462A597D4DA7BAE9C4B8D11A5A1B481B6E9E7186D5A6DB4BFE24A4FAC779AB9F1718CCFFBF277949F70632A7EE28773BDCF7D58B8C6ADC7BEC99F59E91E755EE1C0D9C82F6624FED323CEAFDEC4496FC194CCB8CB2875A505A08E71F87F9C51EA0DD5A990EA0D8B079B0B23995B08F41C671A70A6662A83084D9A70879000B0D1705C81D4792AF2244E7E2D3630D6470AE6E0137B02AE8C2299068F11D94A6C3CEB6824AD601B9DC003A8616A538B538B37528924F393DB8EFB91A43125A3C76969713E5208231026B351871E6B0788EA41E907783D20EAC254A490524A48D841B118A4529CA9B9C3C952CB093AC9D6567985F773E1A65A65096DA404A522C00160313A9B1A7B652F37C6B6A58F087A7F0389D165D31D530E2D410AD614924058C1E6C676AA0874B3090AFD74BE2F486C1B93DE65A985F845859BA98361E41D63D5DE5514A4532A2B41214233C411A882126C41E7C7CA753DF5095ED978F94EA5E3093ED97F1C38E38F2CBAEB8A5ACED5289528F59386E74E65096D996FB6D8D612871400BF4038F94EA5E3093ED97F1C64F992E4545F43F29E7521851016B5285F486BB13DF64CFACF48F3AAF70E06CE417B3127F6991E757EF1ED763BD2195E2E97FB8F5BAB4F1D936DF2FC6E7EE247BEBE483484B8E3A071D7604F381B063343E5B84D300EB75CB9F2502FDEE47ADF734934A90AFD4BEABB44EE72DB3FF7629901CA849434924246B5AB993F1C66EAFAF2665E554A1D1244FE09686C30C6AD149078EB201210379C4AFD21B37ADD508D49A6308DC9521D7143ACE98C507B3DE6E9931A8AF6588D512B2006A0A1D4BDAFD2BC4C888AAC04075A534E2D09712176D26D645F4556D5AB61C4B50801F54A3C186028B84EE08BDF15AAA3B58A83D35CB849366D3FC2D8D83F13DE65D9059A925B278AEA0A0F5ED1DE2D09710A6DC485256920822E0822C41C7C8F4AF1745F649F863E48A578BA37B24E33132D31599AD32D250D852404A40007106C03196A9D02451A23AFC261C70972EA536924D9646D231F2452BC5D1BD9270C40851565C8F11A69445894212091CDA877D933EB3D23CEABDC381B3905ECC49FDA6479D5FBC710E23F3E5330E2B656F3AA09481FE7AB148A7B749A6C2A7A0DC30D2504F3AB79F49C670A8A6A5986A0F366ED215C0A378B3634491D6793CD4E5E5466EFA92D697AC91F877A85A9B5A1C4121495020836208370462830550A9D183C9024B8DA56F742CA45D3D4316DB8ECDB0E20C9132488AD07C4B8803A1034EC5DE7C418D1E3C76911D86DA4E82459084A46C1B80ED76634AE2D3233CC8204B792CBA47FC0150BF5DBBD88E166546741D687507D4A07BFCCFF00BF277949F70632A7EE287D6E7BE790C99F59E91E755EE1C0D9C82F661BEC735E9525D53C5861A538A3A457A46C4EE0918CB994E9D97D05C6B49E94A1C77D7B7A80DC319DF3537488AB811160CF7904714DF82411AD67A79B94CCA49A99077348C2A13A88489ABD495B9A081BCEA24ABABBC64A52F32B578295A49EA07092149490751008239B0EB81A69C708242125442412A200BD801AC9E818A9A735F66343B12034689951A70A91225357912DD6CF14846AB201C651CD79921D599C939D296B1530DA9512A3192551A534D8D65440E291DAECBEDB6BCA2B52FC244C6168F2B5A7FC778B84E2623735BE3B0494A881AD0B0762BF03DA41D2420F3A41EFAA59493519CFCD54E282E1074783BDAC9036DC629703E4C82CC10EF081B2A3A56B5EEA2AD973C864CFACF48F3AAF70E06CE40902FAB1273E658602C77795A924829434B26E3AC5B15AEC96F3E85B1458C580458BEF58AC7929171875D75F716F3CE296E2D454A52892493BC9E52AF05532BCC471701C6D249E648BDCE333250D4188DB6004A5CB003600127BDC815E6EBF96A9EF69832232131A40DA42DB00027CA1DA000B00074003161A8DB58ED765ECD91AA0F319760381C446778592B49B8E140B040F241B9EF32BA92F353A23A029B3A24A48D46F707155A72A9F28B42E5B5EB6CF38BECEB1848D14A40DC00E5F267D67A479D57B870360E415B0E24FED323CE2FDE38EAE57B990661967C2E0B831D57BE3350FFA38C47FBC7DD3800AB5004EFF00ED7EF32B66BA9E539C6640214DAC00F30BBE83A91B01E6237118A47655CA9536D1DD329501F235B72126C0F42C022D86B3465A785DBAFD3CFF00F25B07D57C4ECE795A9ED972457E1EA17D16DD4BAAF425172719BFB2DBF3DB76065B4AE330B052B94BD4EABCD8D7A231724924F49E7EF32A5FBA659DDC1A47A6F8A9404CE6D9040D26DD42C1FF008DC5C7D83267D67A479D57B870360C5F1A58D2C69634B1A58D2C29571893FB4C8F3ABF78F2F991A2E5316A035B6B42FF000C65D8299226BCA1AF832CA7CA583738B58916DFDEEBE7EF4B4A0C891B505651D440075FA0F6B2A32A0CCB7C8D4B5A500F9009FC7EC347A92A915289520D070B0A2A08BD81B822D7B6AC7D2BBFE2645BCF9FCB8FA557BC4A8F6E7F2E3E955EF12A3DB9FCB8FA557BC4A8F6E7F2E3E955EF12A3DB9FCB8FA557BC4A8F6E7F2E3E955EF12A3DB9FCB8FA557BC4A8F6E7F2E0F6557AC7FF004547B73F970E2F8471C72D6D35155B9AE6F6E5E4B09931DE615E0B88293D171B7197192C427DB58B38242D2AEB0062AB1FB9AA129A038BC21527C95EB1DA00904806C081EBE429D0FBAA8539205D61E2E239F49091AB1D4314A8BDC7023B27C2D1D25794759FBAD2DA10A71491AD6ABABA4D80BFA86334C337626A46AFF4D7FE41ED34C15D265BE0780FB40F56891F8F21975AD0A5B6A235B8B5ACFA4DB10E92555C7DA22ECC770B86FB08DA91F76CA8EDCB8EEC773C15A6DD2398E24C77623EEB0F0B290AB758DC4746282C0954AA9453B56AB0EB29163820A494A85940D88E638A6C133D529A49E3A182B6C73A8286AF48C6B04820820D8F6A3437A53725C6B5F028D222DAC8BEBB7560600248006B3B0621B023C56181FF00636949EBB6BC25B4254B58480A59049DE6C2C3EEEACD213516B846AC99081C53B028731C658E1197A74579250BB24949163AAE0E330C031A617D0086DFBABA02F78C6563FF005AF8B6D60FBC3198E9C587BBB5A1FAA74F1EC362F9FD3DACA601EEF247FB63DEBE2B94EEE19654DA6CC3A4A91D077A71468DDD5518E822E942B84575235FDE25868BC24680E1424A74B7949DC79C62A109B9F15C617A89D69573286C38A136EC3AC98EF0D15E8AD04756BC4861A94CB8C3A2E858B1F88E9C4F82EC090B61D1AB6A15B949DC7194C8D39C9E70D91E826F8AA4113E1B8C6AD31C6413B94360F4E32BC32DB6FCA7124296AD01CE0236FDE7260B6FC88D2C592FB2AD4AE749D4527B551A7B35160B4E8B286B42F7A4FC3A31428B229F547E3484D8AD9241DCA008D60F69084B62C9000B93A85B593727EF620120902E36123FF297FFC4003F1100010302020507080807010000000000020103040012051113202232420610143152627221303341718191A1244043535461B1D115235051608292C1FFDA0008010201013F00FEA2D3DA471C14DD1FADBCF2B8BA16A9865191CB8BCDCF3CAECB15D0777C94E62B8836E10B7348C478BD45F1A679458836BB64263DE1FDA8F95125771801F8AD37CA79377F358021EEE695071062785CD6F26F0FF6F34F67A32CAA18A5A45C5E69D27043369BB8BC59562EFE2E099BCE036D970B654A444B992EA4593D15CBD19073C439D42E51B22B93F1747DE1FDA9890CC90171872E1F304603E452AD2B5DB1A056814B2706D2AD2B5DB1AD2B5F783E6317C6821DCC47DA7BE435367A0AE9653971154794CCA4256CB76A46231D85B54AE2EED7F1867EECFE551E6B123C805B5D9A913588CA2865B5502630A62FD82EB7C6255874488DFD261DE20E86EDDB3E6267A51F0EA8EE86B382A4042256976AB146F0C85700A13D24BB45BBEDAC562BAF2838D0DD6F0D001C4879007D21ED9EF57429BF857BFE56BA14DFC2BDFF002B4312736B7A46786DEEAD4B059919992D8DCE6E95B585C67596C94C6D22E1AE4CBEAE457195FB32FD79E438AD08A8D01290892F16A4CF4A3E1D5FA433B575C34CBA8E8E69BDAB39E3623386D0DCE6E88FE6BD5588C27622B6725CB9E736887B3EDE6C509E65D8EFB456DBBA43C2551794B3A446182DB374921B74B9FCE8A362E0026DE2AE9383C044B915629CA798EB3D1019261CFB43BBF4AC244C639296E91ECD36E2B6E098F58D6131E323652E37911F01B87D4249CCF48465451469F908E8E483412D04046DA69CD20DC9CF33D20F8757AC32A8FB2F90A756AAA22F5D63AF2BB88BDDDB479A432321A26CB8AB08C3820B3738373A5BDFB529B560AE86B19C352568DF0D921D92F0D00A360203BA3CDC987AE8AF32BC07FAF328A2F58D4B11401C878A9A10D1B6B6D6597573CCF483E1D5392001B25715446D73274F8B5A540575CC565BBBA04B6FB79C55080552AF4CADB766A4120B459F361D1865C8E8E4B691815A5DEEBAE4E32EC77A7B2E8DA4368F3980B89910D2220A649A933D28F875422B43692ED6BE26CA2E1F2D0077848BFF0069D8A6CB11DF2DD773B7DDCCDC836D324DDAE9A5D9A370DC5CC8A9054BAAB01053C4D8CB86E2F950B4D89B8EA0ED396DDEEF31299371C1511AE8CF762BA33DD8AE8CF762BA33DD9A1EA4D7304700C1774AB18816614021B5A0FD29A695E5244E1022F86A6051D24CA740B77445F3F25727A0130721F7476AFD18FBBEAC608E813663B254CE1A70B1646CC6E61EB844BC49D54D4041C51213DBB7DBEEF554C8A70E438C9F58FCC69CC39530D6278715D77C7C8B5C978F903F2578B6691113ABEAE4285D635370F47A44798DFA568C7FD86B19C2D27B37B7B2F0EEF7BF2AC258D2617D11F6FB42425EDA851421C608E1EAFF000CFFC4003D11000103030102080C05040300000000000201030400051211223206101320213142A11415303334525362728191922340416171435051D163B1C1FFDA0008010301013F00FEE32A1F211E3996F16F7FE7E6E1436E38F854AD9D3746A74C294E7AA23BBE4ED8D29E3AD93C207D6D4A99B1DA9E65B276DC2045D9FD47E694FF0004AD4F26C09B45EE97FBA6F815093CE4A74BE1D129EE054321FC094E897BDA2D5CED522D6EE0F26425BA43D4BE4A328A3ECA9EEE6357974B946DA4DDC32F24C0346E0A3CF726DFAD8EBDD5618B6271748CC93CE0F6DC15A11104D05399321A4C0E4D643AD8FF00C65A55C7823249328B30DCF75CA9116443749990D9B663EB790065D71356DB32AF0593EC4FE94F84B7D1BC993C8431DDAF0591EC4FE95E0B23D89FD3C8587836770C64CAD98DDE751A2B31C0598ED83603EAD28A8F5D20AAD60B4A2A9482AB535875E649B65E369CEC90FADFEAAED3E73CA50AE0204F347BF8ED7F1D1E42CBE8EE7C7CC5EA5A737CF9CD920382643908F67D6AB2BB7AB9726E918C6863BA2229B5FB26B40A89D14AA9AEABBB5CBB3ED03EEAE5D9F681F7572ED2F47281F750AE2A4946495C328C8D4F65F41F3A1DE9C76F8A129E2032D9C29F046DE71B1DD13E6597D1DCF8F9BADBA611358E2E7D16A644288EE2BB43D92E6DB233726636DBC58B3BCE17EC3D2B569B8B1391E088CE31D9C444BD6FE1388444C49B31C84A9EB532D3C520DDC594DAC34EEA491108884A200897DD50AD4D039CBABBCA07668FAE9D685E689B3EA2ABE4A964E8C099B4B18CB02ED10AF56BC512094B4221731C6A0DBCA2BA46AE65B14F5A0DD75C3478368EA530B15DE4D4B2E3B2FA3B9F1F317A968D545D221F5EA7FE2DBD974B7B67BF9A84A392276AB830C23368617B47917D57891745CAA6CA290E689E6C6BA75AB6C826CB915DD2E3E19C746E6B0FA7F507FEB885C31DC2C6AD0E3852090CB2D8A94EBA921E4470F7CBB5444A4BA9165C765F4773E3E62F52D336D7DD7949C1C5BD6AEB20346E235D9DEE741BA232CD8EDECEF3A2397BA3A712D18A8190AFE95A5440537DBD3B3C57598E408A92C1321031C87FC8AF42D70BA4332E3DB1F64B213CC878D97DD60B268B12A3357088CB78B9965F4773E3E62D48B9C92526D1711F76B555DA5E759A42A5DADE4E16E988FCBAA989ADC89526306F318E5F3E9E27A234FAE45B255E2D0D7A5C2A6996D91C406889071D4B7AB84CE2376793AF6B11EFA27DD369B648BF0DBD70F9F5F90B64C8EC3262EB989655E3385EDBB96BC670BDB772D78CE17B6EE5A5B9C2D3CF772D12EA66A9CF6CC9A3070778572AE0FDD73BDBA6E6C8CA4EFA7DF1611B22ED188FD574E67096594384CBA1BDE1018FCBA6B857741901162B45D0402E1FCD3A13F2CD19B4E038D96243B43522F0172B193A078CA60DB221F8553A69FB929D916E318B69004BE7AF4A55BA7353E23329BEA20FB4BF54A66EC0577936C77787126FE88AA95C359484EC5889D9DA2F9F4252AAAEF7E5C48C72C4B1AB75D8988932DEFF0099740B1F74B4AE0FDE96D6FF0026E6D463DEF77F7ABECAE4AF49362B9BC20E090FF15719C77096ECA73A32ECFF008FCDEABFDC7FFFD9, 1, 0, CAST(N'2021-12-21' AS Date), 2, 129)
INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (4, N'My post 4', N'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', 0xFFD8FFE000104A46494600010100000100010000FFDB0084000404040404040404040406060506060807070707080C09090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D222A25252A34323444445C010404040404040404040406060506060807070707080C09090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D222A25252A34323444445CFFC2001108011801A403012200021101031101FFC4001D000100020203010100000000000000000000010203040506070809FFDA0008010100000000FA835F3C72BB3CC65CBC9DF2DC0000002A88880389C1C766CB8795DFB5A72C80000104154C4441256B9324E0ACD96CA0021201110898042032264AD62325800885802084A2022212B2664000000000155499C529BD80448C39640000008888380E4762F7B22A88AE2C99A6DE4BEA99C000021246380F22ED3D8F76F688A62E2F82B65DAE536F67C27D37B72644C0008894C52B50F1BDBE5B9CE672E4AE2E2B85D665CFB7C8ED78777BEFBB79136C6BC8902128AC5443CEE6776F39ABB55E0F06C6C6C5EDB3E65B7EAB7B44E49C33B735B4A6E022B15078EE6BC26F392D6CBB1B3B792F9BAAF0FEA3B175E558CB552D17CB204562B01E317CD7BDAD6BDEF97365D8CFB5B1E61C87A3EEDAD32135AC5ED3320888AD30E4BCF8C64CD977372F875B266CB6CF9B676B4BCE7B27A4640AC56F911489B5A6452AAE9527366790DF2E4BF216C74BE4CB97633EC6CF9F6B779ED37B115AC1564B4C8115AEB70EDBD8B4F96DF35A7A1E9ECFA3EC5F2E7CFB19F8CF32EC9E8FCA5822B22642C88222B8D2879664CD923C5BE73EE7ED5ECB932E6CF9F3F8A66EDDE9D92C022B05A6562A295AA50F33BE4B4F4CF953A47AB7D9D972576B67A978CF6AF45EFF00390115882579910429409F3B9CABCF1DF03F21FA13C6790746F4BF70F06EB5DABD97B45EF21102C8900231D6621D172E6D8966F8D343D93CF7CBF675BEAFF20E57B9FD0FB56BD80820B0088AC63A5AB6B6B658CB697CA3E2DE5FBDCC709CD7A0BB37B9FB1E5B5C0AD297B2D2029588A566E89BC98E3E64F99BCAF90DFC9DD791DFECFF0064F690015955690562222296299C0E9FF9B7E79B1C9ED76EBF39EBDF64D800084110B548AD16C38A9BD291ABF95BD07673F39C9ECF35F72FABCCA0048888542B158A44251B10899717F941D5767373BB3BFEBBF7EDC484C4CAD15820AC529563885AB3B50427CF3F2EF89D8BF279F92FAA3EC34C82408022226B48AD5325A530AF9C7E59EAE49DEDCCFE85FA59BE2648B445A044A05488420ADD3335D6F38FCC2E13337B63677FECCFAB0B504A02410111054AAD29461F1BFCD4E22D97633E7D9EE1FA6FD920944A095413352110AA094C91C67E79FCE5A7BFB566D6E7D79F67809813350984222221088BC964E3F27FCD4E8BB3B77BECEEFB6FE925A1208413098215885552ACD58C92AB0FE62F83DD92FB1C87D7FF006D4128010910854AAB11118F6A133689AFC7BF06DA716C64E4BF4ABDC0100442610562B5C78A298AB4C78FB24C81A5F8F9D72B6BE7E4BF4B3DAE482222945611149AD62918F0E3C58AB869AF8FD166415AFE4DF9DEB44E6DDFD1CF7DAD130A455110A2B8EB4C11923163C58A9A1AB82B5F5322B54638FCD0F16C6AE5DFFD0CF7F4250AD6B5A2986D18704CE3D7C31A51C7F1DAD4BE5C1FFFC4001A010101010101010100000000000000000000010203040506FFDA0008010210000000E979E1760012320D5CCDD0CB4324405D50674002661D790DB2F07D1A012323D5C729E873C7C1FB8A55A3107BA59338CCF85F5F40D68620F74E537899E1F3FEAA41AD4301E89E3F99F63B667CAEDEF186B52358834E7F0FE974F37AFE47D6F45D491B92DC418AF37E7BD9EEE3CFEDEB56496D339674C9CFE4FB71CBD1F46D4995AC92492DC7CEF5F3E3F4F60250CB2C578E76C72FA556E434892659D3C1D379C75F6329A29132673753C9EAE79E3F459D4434933329356F1EEC72EE912A8999945D6B4E98E1739885A6667333E9BAE977B9E7E5CB0C259B4CE39CE53FFFC4001A010101010101010100000000000000000000010203040506FFDA0008010310000000B9DEF1880002D09490000D66D420160000B6C9A19FABF24002AB9F5ABC6F4BFA3FCEE62420B479B7AC35D37D3F41F9FE446B105B6385EACDBD7D3F47E0C50C8BADC72DFB7EBFC1F3EBA7DBF17CA0D48168DBAFE83E571F4F9FEE7C0F10A8586877CCF4FE9BC9E1EDDBF37CC34C85D6B24BD3EFF877DBC7F2800695AB937F6BC5D7B7C5E604D0ABBACA7B3D5C77D7E2A5042D5D548F6F5E7BE9E5F14A0035AA897E879BB6B7F24148D2EADA99BDB2E9BF159452AEB56DC6646E6BAF2B6EA816DD69C2673319DF7DF5DAD9116EFA5DEBFFC4004210000103020304070406080603000000000100021103120405211331415106102022306171143240810742505272A1152333435391B1E11624C1D1F0F1606282FFDA0008010100013F017D17099285CD0B68EB6132A3A77A6B9D0982FD47054FBBC13A9B9FDEFF0054C616704372010FB29D41AEE08D166E2C5FA3E9BB7121372F68D4BA53B0B68EEA6538DEA9FA200281F1D2A7C6856A0D501422D0782B7ED68EB1F171FF0080C28F857D46538351C1A376A78FD874F14C77141F3B90ECCAB95CAE1CD5C39ABE16D420F078A953D5D26ACF63B0418E8D4B8FA68A9B83D8D734C823EC2A75A0EE54316CDC532AB5DC5023B2428559A63428BDE0EF5B572BE535D09B5535D3D5D247B9F8F6338368B7F32B26A85D81A41DF564781A7C5369B936990A9DE153754FBC85DCD5C5495722E770550D5E128E21FBA5174EFEB098F842B2157CD66AEDB6635DD3B886AC8EAC503489E32107140A957057053C9170081953F13A286ABE132B4238B2BDB638218F6F25EDA253712C29D5C6F9555E1E66DD5420D5B3285171E0AD2DD0A0100B32C3ECB12E78DD53BCB026CB638194076210D1133C3A876655CA7E0B68E41EAF957153D993D410250794DA8E0AE94100B360D3B004EBAFF258716905533731BD50A1050AD08828047C95CA54F55A837E1A1476610EA08201041626A3ABE264EE6B8854A042C388A4CF4EA8ECCA91D508851D73E35DAA9EC84026B5E3EAAB2A1D765F92B0F1A413A9A850100DF350387500804020162EB6C2839DF58E8DF54C127CD61A95EF6B5011E0421E31EB2613AB06982B6ED42B34EE083C1DCAE570ECCB8714DC4556EE72DBBCABFB210410416635B695F660E94F4F9AA4D581A7DE2EE43C4D7C7702AB3082250A51055AE8D15AEE6A3AA14282A0A859DE6B5B2C608A0E0CA8D20571DEB1FE6392C9BA434F1AF182C5C53C6731EE54F36F9ACD736AB9563B08EAB4CBB0551A43ADDE1C985AF6B5EC32D70907CBAA1050804020163B13ECD41CE1EF9D18A99BA5C4C995446E5856594C79F870A3B611F008F2EC42D147503D50B3BA2FC11C5557076272FC41FF003146EEF5271FAEDE49D14DE6C73A01EE1320E87F255B3FC6E33007038CB6B6A0B6A3E6F042E88662EC4619F82AA7BF460D3FC3FD900A100804100B76AB30C6FB5E2491EE3346FF00BAA3B9615B739AD434087852A54A953DAD7B27C0850A1428599E51ED67DA7095B618C0203FEAB87DD78E4B34C062F055CB71386D9127481DC3F8557C436844EA4EE0BA11985D9C8A551B1B4A6E6B60F1DEA101D5B4A63EB84D2D77BAE9416778CF65C1DA3DFABDC1E438954CAC39596B66ACFDD1E0CA9EB8ED0EB3DB851D9850A142850B1782C3E3A83A862E90A94F7C79F979A7E4E3175EABD95C365EEEE120DA2749D565784C76598EA78BA1FAB349F3246F1E883440322D8DFE4B158DC3E0DBDF792E8D18C1738FA00B11D23AB59AE37328538D013DF4DE916951D61D0693A127CD655D20A45836C60C8993C0A639AF01CD7483B8AE91E28BF311403BBB4DA34F5D5522A89595B2DA1B476F7FF4F0E3E08F6A0F2563B834A149E7EAAF67A9C97B3D4E4B62F08512BA67817E539F3B1B4C358CC5016473021D3E6B2DC5BEABECAAE9F5DCB34CF293360CA9887536B1A090DD24F23E4B179CD4C45CDA15E8B07125CEBCFA689E2BD7AC19DE7BDDC3DE1FD956FF0022D0C7BDAFAE4FB9A10DF5F3586ACF169278AE8DE6AC385AE2BD416B017FA0588C61C5E32B620FEF1E4EBC95172C231D56AD2A437B8C263431AD60DC078B2A7C94F978C7AF7A03AAD9E0A3C906056A81D7F492C6D4AB95B5FF0076A198F4597E3B0FB271AB86352DDE5BBC40DE53B12EAB55F50D62C793BF78F9AF69AA2DBA9533CA1A50CD6A51B762DD9D41C42DA3AA3DCF7BA5CE324F9AA474D551ACEA1837B78D6E1FFA8FF7549FA82A8BD746A86D1F5312468C168F52834A851E015AF54FC3476654AFA4BC2D4A982C06329FEEAA3984FE2FFA4EC48FD145FDDDA9045CD6DA75E7CD35E5BEE94DAF5741B431CB827BAF378E2134AC261CD46EDDFDDC3B77B8F1F21E6554AE1D52EF947F454DD3EB2A93FDDD388DCB27C2FB260285370879173FF11F163E04F66429EDE7F82A598E4F8FC2551A3A8B88FC4D120AC7F730D4A9EEEEF053AA05527DBFEAA9CBDD09D5E69D2A2D24300DC9A75DC98E3BE382E8AE08E3B3160709A747F58FF96E087C1CF873D656BE0D78D8D59DD639666E173C7294DDE8269DEA99B1AD83DEE6AE04A69200D551777871D1744B2B765F9736A561FAEC477CF93780F8B952A54A255CA4F878AAA29D3F5E1CD66556EC456FC6EFEA99EF1F440A075808388120724C7C9B884D24FC974472AFD2B9A516BBF6147F5953D06E1F3434DDF604A93D71E7E0748317EC780AD8AE2C63AC1CDEEEE858A25B51E1C7507F34D887153013135D00EBAA6B840D35E250D485F46F89A2CC56330CEF7EA305BFFCEBF1D0A1428EBD540EA851D8768D256698718968BCF7298A913F7AC3AAC538ED1F3BEE33EA9BB91298493A22E3A8281E03FE7AA63CEAB24CC8E5F8AA3886EFA7558FFECB0D88A78AA14ABD23731ED0E07C8FD9757BCC239AC6E5997E223DA9A5CD6125D7D475A1AD1A921667B118DC57B391B1DB3EC23EECA061129A507681074020EE4D749D070549F060BA39AFA3DCF768CA994D77EE3751278F31F62E8B45A762A68D747258FC9B1999E1EB9C5E25CDA4E618C3B4DA1DF8E166587386C657A1BC36A380206F82BD15C80278A6920ABC5DAEA9AE8248DC9AF33EAB2CCC6AE5F8AA589A2E8731C08594E634734C0D0C6D03A3DBAF93B88FB2F1149B55B16DCEFABA98FC974CF217E5D8BAE4FEC8F7A93A3BB0ED63E4653E654A6B8405F25A1D55DA44F14D708DEAEB57D19E72457AD94D526DA8D3529FAB7FB7D852A7B708E8BA55961C66585D4E90A95E9D463C0E7AC42CF306DC06615E852D6968FA73F71C240F96E4359437B517386FE6B8EA8384EF5A8D7FED5376A645CBA066A1E9365A18621CF91E561F167AA54F5CFC14A9EA9EC540DB7BFB86BFC974DF0CE3570F995430FC6ED1E297F0E9FEEC1F96AB8200C92A2776F5223CD020408D51A8E22DE4987DDE1A6E9DE57D16E597E2B199B3C7EC59B164FDF76FFE43B52A7E1654F5CA9572BC76654A9528EA083BA174FF0023D9E4F8CC69A57ECEA506537FD66B352E27D4A9D2210B7592A7BD30B7192982E2649DCA4C86CE93C5340DE5DBFF00E42FA3DA629F4670C6D873AA5427F9C7813DA9EB952A54A952A7CD5C39AB9BCD5E16D16D56D7CD1ABE6B6BE6B6A3EF2DA8E6B6ADE6B6DE1622851C5D0AB86C4530FA551A5AF69DC47259BE1060B32C76119AB69577B07A34ADEE1A00A25022DF9EF5307D0734D8B77EAA9E96B79F15F47F55B53A35840D9EEBEAB4CF93BC1957057ABD5FE4B6855E55E55E55C4ABA15CAE572B94AB9172B95C8B95EAF45EAF45EAEF23E0C8570E6BA54DAD4B3FCDE95669153DA6A183C413223D51D7D46F956C3A15C37420E70FF65719D0A6BE1CD83DD07D57D1B86D3E8E87B5D76D2BBCFF00280B68B68AF2AF2B6856D0ABCF352A54A952A54AB95C39ABC735785B42B68B69E68D5E4B6CB6AB6855CE289237B95DE6AE45C782DB0E24047154D9C67D17B534F35B76F9FA2F6A3FC272DA95B65B62B6A56D1CB6855E55C55CAE5D3EEF749B34EF93FAC6C7C9A042237DD722DDCA6346A8E2530EBEF2060B5A23CD7D1BBCFF0087A1C75189A9FE8AE1CD5CAE0AE0A54AB94AB95CAE57ADA2B8A95720FF00245C8BE11A81075DC55A54B46F72755A63EBADB379A388E4D256D6A6F809D5AA05ED8FDDC53B1354EE945E3EB22F6F04E23F89A7942D99034A851A8F1A6D7F35FFC4002A1001000201040202020202020300000000010011211031415161712081309140A150D1B1C1E1F0F1FFDA0008010100013F1042200716EF4D412D77F3708859588828EF02E80E08C7CDF8A311CA0A39CECFA94954EE8856CE80E7FC03A33333333333ADD3594E9D46D29AD954916128F04674D86D89BF1977C540607D6529CD2BA8621B7F22E5CB252522EAFE2A6D511D303A84A932CE52A642026ECDB8837C4330C15F92E5FE4B97A57CEA57C82543E091511309037FCA74AFC552A512928951254A654A952BE54CB8687CABC7F87AF3A95A5BA5C1FC567C404620482DB05F337CFF0031D1AEE5D4BD30B4879AB22585F3AAF4C61A730F29DC271522791107291FC09ED01CB2C8FBE99F4B083695E8647C261FE36263E1716679F8663134EA00129DA1A20882D97D32D8DCCCEC88ED9E296CCE65695676C1F2AC1A2D84EC58B40BC40C20C20DFF0068CB1986D0F90977B333F2F6FCB7A56AC6DD31F0B8AC86220255CB252C6252F4ED18A510E86725CB5D2CDB237EF30F68A1E6E5D6FC4576A0F5058D399C82E7154E81B6626CA3BAA09B810DFBB72422E73C91DDD95399E621D8328EE26E8C1163284B25CB967E0A95F05F954A879928CC06D609C554D9620F7450A54BF635399CDC008B04A78659768072B52FD921BE542848594547E596956772B63B1F7B24C886CC7936488026C9642F9653DCA5DE0F82293DA2E524BBBAC2F1988DE199EE0CA9995E605C0FE163A3F1CC3B23F2C56C966EBA2D83C33AA829CB0EC859138D014A19796DCCD6C16ACD88156359DB42E38C6C92FF00D812880E0D02A21DF4C58E2509703BA9861197E082CDCC38651D894E61F818E8F1332FD4CCCCCC2108173CAA16D8954E46525302EA51081020209B5043E23E4C68E8C6222C1B3114694D1AF79810529E6189F52E5229C401DA53A966D311861CCBDAB409DCC7C9C6FAE631533532A06609C54CE81C40E2B432D1BC69A3FAB807057882AAFEEC21C0792EE507682659CA6929DCFDC0DA783E050DDD057DAFF5BC545DCDABBBE63506569F5BDC200180A254F47C6A5B8963797A2C6DE25772A1F3B4CCFB942D840372E35EF2F14B3797147CD92DCB3CB0398102170DA384541B22CBA5546D810217041E20836C42EC1E231D827C2FBB2D4A221E003E6E01B56D2BE15289529E25A4B65F685EEC095D903F033312E32C18D166CA2B63DCD902BD5C0400DEE610785B445F72984196D06D8816E4F48434D4C38C732A1F660A41B8B1785D328C1761B3B8F883909B9628B13C530184061A81B10DE00A1CAF2FD44B82595DDDAD9718678882AA5DB0E7E492999E222EEC229D4A3F2143BC43A98EA028A2054A25110F12BA680A76886D1577D050202DB6B7B7D5605F132879AAB95E6870CC6AC7436D6CAB7CB2FC6561B56ECFB40E21A804D885053405BE081BC2AFC0B7F6655402662DF6E842000518FC45220DB4DA0A1038BD73D7E02A37BDCBE35BE25CBF50820D057762C5EDBB0A234495EE54341CD6E45DDC7638B3B5E0865ED2B22C00DEE621D06BFB964002DC1DD621849BE4CCD80A6F5C7B82592A3AA7267E8230AADAED04AB7359970EEACFDC318873F3554A724B2373C203D4A6079818AD57F232A3718B732A512A67BD2769486910DA30DA64ECF8F2256398223C14B18F1772FB8F254341C8A44954E0538142BD638DE0E58A719CB723F6E21272136C64AA722EF49515609F51452F32ABF37DB1360EA15E1D86C8F31BC837B1BB1AB2C1C3731A65BFA6D08732FE552B425C04D28EE057E4C68B74C772FA972AACA0F941EAE55828738342F13DE2632AF7B247DD7E50CEC710D1E8C0015F58A5F1BCC621AEEB3237426D792A81C14A810C37F82AEDF0A455CD0214428C4CE5B5E250A34555A54FFA79818548B28CB43C308EA45E42707D0544E336D39E6184D61CD76C274041F5065C3D7E0F5143794D42DEBF0ACB22C558A0B2DDE23B25016E8500983AA004B0A101CC3AA511DAAA5B358302F0A86515ED20E20BC649754936B0BB026F32D419681F48C39546DB411C51C8411662E2AA72B17258768C4BA4038CB953CB10140A18739943952E5BC5274DF3A9E8D01DDFC2B6230DBCCE1897312CFC2EB71E0945CB74B970AC0AD73D4B4538A7330963D701B1FDC01610378DB48D9516542CCA3BFEA667FA4FB4AA4BA8F026E4AA9D8363898EB96EDDC19BC2D5112A8C55601E0264374F28F83819367FF6201FA532A7D7E4AF1292A21A10FC0E89AAB39952EA5F89E4D17A5E972E5A23B54413EC8925016ACAD30B0B2039AFD623711108E113F48125C1B7AE6A3504E1AD1DA9CABCC6520ABC8378FF00539C850227ADC191BE4FB82BF81B465E8B7A96FCD964764197513C458CF7A7AB9EE1EE5BAE03887BA448003B007265A8B8C7BC1A57B4B9309B690484692CECEE6745BC7350D12ED445B3DFA943963BEACD065EB72E5CB98972E1F174653196CCC3CCB9718750BD92CE034058DCC75A5B2D9692FCCB259D42160AE8ECA5A8C62B9936DC5476CB5498C97D972E1F64104BA00B75E66F0AACFB5EA3B4D0616B529DF2FB8BD7DA8000280C06DA67B972E5CB972E5E97A5CB98EF465CB97AD46F44637D46E665B1E313D278182F6C6EF765E1597DB2E6FAEC5C30B269168D1F56DB2C04817C16E21996E187E8D42DA99D9A7DC123458FFCFB8E0157C18E123008AEE5B83EE0A94FBBDD6A35B989898D713131312C972E5EB8F9DCCC6EB291AEE51E742FC414A66652CDE867696E746D2A54695B8623E8893C0377BC51117C5221BB4E5B99038BB66C0F894746FCED3015978437F11EAB2D07D78801772B9C5846BAECC145022BC2410E3B36237FB1999F53EA674CCCC3E799999D2E665CB999997ABA54A3AF9592FCCB837A9CBD6C7C1125523868DC0566129A02E536D25BB54AD6767FCCDC9BD96BDD32F3A45686A93314A3670F2C564338D3BD731D115B4061CC3CC6DBA84BD5AB944CCCCCCCEB999999999F8666667A99EA66674BD15D2DF8BA54047B4C687B8AD054545D4F2E2EAA16793A0662F527207142D8A006EDE6EDE3227285C14DEDB020BC24B2B153954DFC7820C34066769D467756DBC8E6EB881E5334CFFA0D2D9F73EFE5F7187C2E5CB97330BD1D6E3A5CB3B988EB52E5E9672CB259D46929987A220403542D8C170F7B74D664B67144009C64CCBDBEA720FADEE5ADAD0725F8E2088106B2F4F5533A963F63B840886CA5DF3D7894540588DDE5A6F316EEC9362C87B8C71F0C7531D4C4C4C7C313131F1B262634B98D2E37C4FBD6C964A6AA3B944A2512A7B4607DE008F3837546A9F8463FCAADB59785F23296683152A656C76B8A50B3222B4463768A08948A8C19236050CE07222D2E5C38B625C41E40BB07157B3FDCB25CB2626262284B2592C964A4BF33DA522C1769498988A772CEE5CB25F52D972D967717CCB9ED8CB9647A41770745B3333631AEDCDE8335A8375E7613685DB9BCCAA09DF1997808558A20416496D7E6046D69845BBF115414CBDC52005610ABECB85825D0297A0EAEE3ADD5B72CABD84B392592E1E659C6A5B2C972E592C964B2092C964B25CB8DCB972E592CCEA592CE23E52BD911D93C92F5B745A5BB9E508485211C88EE3E2A312ADF1B7E0D48C1098CED6466A182C12F3EE56842A4C2AE6E0562B8357798811B91DC5F54432146EB9AAF5E61C8507E595D6B73EE5CBD17332DE65CBD0B2F43E529DCF69ED3C989D0528EB893648D7152AEC081CCA76BC7B11E5964AF52BCC0AD2F4B952B439935DACA51044B6C6EB416020384DA67172F46F2AE0EA12899B0D2D7C78267A0551CB7813B5958D87ADE5558AACF67C544B6C7FB3B05972E59165DCF72C9EC44B2B126D73D65F537AA3271160B6316F315DB3DE2A7BC72C448A6E3E503B221D989E6039163432CB76749643B5964B2592E665CEE66530FFD62F9CC0A137470197A828355197A26F1C966763BC451B369C52D456CA335B97F578885569C36A17D6E4A62184094D968C731758BFE9317A115E23B53C8CF192C8AC5F9653457B95EF569DC79B434B666F21889D96272B84129177BC0B8494EA3980B628C3FD936425E9692F6DD54C8C305C6F43CC2AD461A6FB1642D596BB8E4453D0B6747E874AD5B13A25BB33C93CB2FE65DCB3CD65018979745538674452B5629C798082CA73BF1E7CC4D9C0E42A98A2803D62E2AC5D566FF00EA0B022BB816FB6A3AB1171EB40A7712E48335A6BDCA772BDC49CC4C4F7284ADD1192A9B59E22C0CDC72989B259D88C2C198299BAEEE36831986E30350686CC0415AAE2AA88E0812001E264A5230C65475DE8984A6DDE54C9CBCE650295B7B0FF9216FDD2DBAFD11552B27FFC400281100020202010303050101010000000000000102110312100413202122312330324142525162FFDA0008010201013F0059BFEC4EE45AA1C972BEF597F612E1FA7097DFA6579EC277E76AEBEED0D5784B1B8F8A566B23E0B30E6BEAB340B5F6ACF5E2EFC1E46C9272F5D4D25FE4D266AEC8A44A874C715FA36787ACB7CD96CB65B3613F17E3AA2B87CB2B8EA2F26694A263BEDC6FCD3F17E4D92D9FC0AFF7C5F3D464D216628ED328D4AF1AE2CB1FC78D9B1B1D66494717B65A91EBE52C7284A5EE8FE323A7CCB3E28CD737FB33E4739FFE4E9637B484CB1143F9E2D70FC1F87B4B2CC908655ACCCFD263E967194E7F4CE872E1719471FE266EB2187D23EE918FACCCE5EF8EB133E44B149A1B3A78EB8A37FD117CB2994570F8AE1F3ED2E25B3DDC75494B0CB6FE4E9F164DF32C7EC898F06583FF004286B0A66D2D347FC98E3DCCB18A17A2A12170CB2F85E0F87CFA78648ED8E499D1455646BFA98E297C13BB26A91D163F5964E2F97E166C6DE0F8B3613362CC9351C7391D3474C5C4894767AA31C5638462597C5965F2BED5F3D5C9A86ABFA31AAC62F818E4E128C8DB68DF37F66CBE2CBE6DF3D5C53947E9EC638FD38D0BE3D786AFE4E967F9637E3622CB2CB362CB2F9B36E1089C549518BD99658D9289A9245D4E2D71B73ED3D0F42E26C59B1B1B168B2CB3636132CB277DDC7247CF0FE44AE7146C59B1B1B17137373636363636363636363689658A429710BE2513F19C4D8DC7337373B86E770DD0A68DD1B1DC3B88EE2FD9DC47711DEE2C42E23F1C3F8327E51243931B66CCD99B33666CC5265B3666CC9498E4C7266CC7391B33FFC4002F11000202020004040406030100000000000001021103120410202113223252303141420540516271A1232582C2FFDA0008010301013F00F0D7D0D1A7EA122C9325F915D3B16CB66DC9FE4973B28AF815DBF21DCA2338C86BF41A28D47148EC389A99F07FAFE167EDFF00D14FE2D15CD634BE445A5D98E50368FB8F2D1293BA1262B177EC3C6B3703AAF647FA25146A8D4D47128A2BA574A93B2F933CC4622BFA1DFEA24CE1AB1F0F18C8C95E264A2CB2F95F27D2B9573AE4A8742E4BE62470D8BC5CB14FD267C9A63916597CEBAD0921245228513547E1F8E12CDE78EDFB497E1B08E5F1611F2CBCB28FF2715C3CB86CD2C7228A12EC709856285FDD238F97A61D7E6EA5D3A9462C93C32DB1CAA461E3B27178E51C70FF0037F47E218B3EF8E597D52307073CAEDF96264E0F157925E6387C6E59A31947D244E325BE6957DBD3D8BE8BF80DA1C91BA382C8D7118D44E2278AB0BC9E79193361947DA39F7B5E91461BEEBEE336458B0CA7ED2524DDFC5A2343A2CA1F246193C79612471CDA9638FEC36BF518E96D645F738FCDDA384F97C643146D1A2E8C51DB2452F51C5CF6C8B9445250529FB4C991E494A6FEE28A451451457551422B9D44EC59C1C539ECFED334B69C8647E638AC90943DC38B4E995CA8A28A28AE8AE68BBE748A451C24A953C9AA324BCF2E51FD5899C663EF1CABEEE55F1521228AE6C8B69D9292C987C5FF0092321493132494B1644CA6548EFCAA4514514548A91A9A8A224CA914CD4D468AE58A49472459AF73F8159396B865FBB951A9A9A9A9A9A9A9A946A68C50668FEA7866869C9A352A8A63A2D116892DB14923C33C31626784C588588F0D7B4D17B4D17B4D17B4D3F43535140D242C6D9E148F099AA290C7CA5DBE432243D3908948D51AA3546A8A46A8D5148D50A28514462AC51428AB3546A8FFD9, 1, 0, CAST(N'2021-12-21' AS Date), 1, 77)
INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (5, N'My post 5', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0xFFD8FFE000104A46494600010100000100010000FFDB0084000404040404040404040406060506060807070707080C09090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D222A25252A34323444445C010404040404040404040406060506060807070707080C09090909090C130C0E0C0C0E0C131114100F1014111E171515171E221D1B1D222A25252A34323444445CFFC200110800FA01BC03012200021101031101FFC4001D000100020203010100000000000000000000070805060304090102FFDA0008010100000000DF00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001C55F78E7CEF80000000003AD1AE033190E6FC757A9D488E2C6C36C643FA00000000044358B087DF800DFEDF66400000000212AAFF0000493734000000006028975400017637E000000006329C6860000581B2A00000000A9710F1800067B0F215CE00000000E1AC399AE8000FDFDDB64FB6FE76DF100000000D4E34DA69B8002DF6E5DDA933D58AE2D47F20000000463C1DFA5E000B6B30BF356347F45BA1AC800000010A6D985A84000B4F37902D63F4172200000002BCCC31E55107DD8E519429DFC2D0CEA411583D08EF000000008B652812B209E667D9721F75CA1BCFDFC45A79BC826AFFA1FCE00000000ADB5EF6AD63F17B36A182A0DB2E7E3BB413B107D5DF443F400000000A950F5D0AEB1CFA13DD1AF50ADD37086EC5D8B222AABE8380000000142315E8554888AFDE6C6A14637EDEE069C2D3182A2BE838000000030D40F2BE8054688AC35901A25249124DADD295C4149EE0E5C00029C0000E9C79FA9374FC072C9431BA165337A864B7D1A76C5DF00008C00000000000000000000000000000000000000000000000000000000000000000000007FFFC4001A010100020301000000000000000000000000030501020406FFDA0008010210000000BE0000000000000000000000000000000214C000023AC8B2C7262CAD7200018F3B000B6B40000A6AE00E8F4400034AFA802C7582FF007000208E800F45D1417330001CFAF9F76F4F4D067D074D0DE6C00038EAA2F47BE9E736BAEAA3BBC8000AACF05ECD179F96CBBAB6C3601E6C0479D76DF11B7DB5CE404200000000000003FFC4001B01010002030101000000000000000000000004060203050107FFDA0008010310000000A0800000000000000000000000000000012BD88000037D9A4EBF73EA675AACE200019FD02680AB5600002E3DF0081F3E0001B7BF6C02BF9F4285A40009B26F407CFA05EE9F100009FB6F8E373F9D79F283CFBC52B00001D8B34BF9DEADDF42D74EE65CE9BE0000B3F9DCA542917F8B5CE2D92BD800FA280DCCF5EAF6479AF5E78F802580000000000000FFC4004E100001030203020906090807090000000001020304050600071112211017315155619194D21320415071D114223032528192B3C115354042537274B20863738293B1C21633343662808390A1FFDA0008010100013F00FF00D0B3EFB1158764C9750D32D20ADC5AC8094A40D4924F20C5D39DDE45E5C5B5A221D4A49065C90743FD9A0107B716EE7912E218B9A9C0249D3E1313F16D44E29954A75662373E992DA93196372DA3A8F611CA0F51F55CB9912032B913A534C328DE56EAD2848FAC9C54F386CBA7A9486253F3960E84456751F515948230D67BDBC5643D47A8A13CE9F26A3D85430C674594EFCF726B3D4B63C24E139BB61AB79ABB89FDE8CF7E0938E35EC0E9F1DDA47830BCD9B093C95B2AFDD8CFFE28185E70D8A9E49F215EC8CBFC40C2F3AACB4F219EBF6303F150C2F3CED14FCD835557B196BF1731985992FDDCA6A15392FC6A5200529A59016EB9CEBD9246C8E1B76E8ACDAD344DA44B2D9246DB477B4EA799693B8E2D2CC9A05CB0DA2FCB620CFD765C8CF3894EAAE76CAB4DA49C02080A0771DE3D517D66B53EDB53B4CA425B9B540085EFD59615FF0059077A87362B77156AE29265562A0EC856A4A52A3A211AFA1091B923CCD4F06A79CFC8DA598D5FB55D69A4C854AA703A2E23CA2404FF005677949C502BD4DB9298C55296F85B2E0D0A7914858D3542C7A08F5366B6612A86D2ADDA33BA545F46B21E4EF2C2163F9D5824A89249249D493BC93EDFD072CAF072D7AF34CBEE694C9CB4B3252791049D12E8EB4FA7ABD4B73D758B6E8550ACBFA1F20DFC447D3717F1528FACE274D935299267CC70B922438A71C59E52A59D4FE879695F3705A34E7DD5ED498C0C47FD24A9A00027ACA48F51D66B14FA05364D56A6F86A3309D49E5249DC1091E9513B80C5ED7F556F194A4BA4B14C42B5622255B869B829C3FACBFD1321EA85332BB4659DCEB2DCA6FDAD9D8576850F51E6DDCD2ABF719B7E16DAE253DC2D06D0092EC9D3451D06F247CD18759758714D3ED2DB712745256929503CC41DE3F42A05AD71DD2FC88B6E50E6D49E61BF28F222B2A74A11AE9AAB64624C6910DF762CB61C61F69650E34EA4A56850E54A927782398E329A69857CD246D6899097985FF7D0481DA3D4525F4458EFC970E8869B538A3CC100938C9A87F962EEAC57A5202D6C34B7413E87A4AF97B02B19F34E6928A0551A6101C529F65D712900AB725490AF97536E2128529B504AC6A9241008D74D41F4EF1865971F79A619415BAE29284240DE544E8062F2B2EA7674E6D8960BB19E4ED31252344AF9C1E65271FD1F335DACB5BA1D8F5609142AC169998EE9AA985A09D87BC58CF3C90A6664D28DD56B21845C8DB01C42DA23C9545AF425447EBFD05E283F0AA15DB491359723C88754643CD3A9285A14870052160EF04721071BC69A9F50DF733E01675C7201D0FC05D6C7529D1E4C1ED38C878A94516B93B4DEF4D4B5AF53481E3C66ED2854ACA9CE81AAE13ADCB4FB01283FFC57CBE57448156CBFA647A8C26253687242361E6C383FDE93B8281C43B32D4A7CA6E742A0426A4215AA169693AA4F38E638AF50A9F71D32452AA6D6DB0E8DC46814858E4520FA140E2465AD6A35DF16D65825325654D4B09250638DE5CEA2903423192F9E1332D6A8F65EDF8F2D74561F5476251D5460ABF16558CCDC8BB4B360B17451AA6DD3EB0A405A2A31921F625363E679409D353CCA18A8D89715393B623094D01A95C72547B0E870B438DACB6EA0A140E852A052A079883C9EA0CDF9223D8B524FA5F763B63FC40A23B138C9A8C18B223B806F912E43BD8437FE8C66C48F83D895A1E974B0D76BA9F97C9174B9673A9FD9545F476A10AE128415256500A80202B4DE01E5D0E33C68E98970C0ABB690133E390BEB7182124FD92316AE62DED64AB5B62E59B09BD768B095ED307ACB4BD524E28F9A1722E9D01E92988FADD8ED2D6A536412A2804FCD200C57AE99D7006532E3C66C36AD4169042B908D0A89274F5067A3DB16C5318FDAD4927EC36BC6573459B12800FEB36EAFEDBAA38CE85ECD92EA7E9CD8E3B0957C9004F20F46BD9E6E452F5B6EACDF35489ED6903CCCF96C1A4D01DF4A66389FA968D4E0FA7D98A47E69A5FF0006C7F20F50E7DC9D966DA880F2AE53AA1EC080316743540B52DD8AE2745A29F1F6C7328A4288C6793BB169C06BD2E551AEC0DACF9E0156800275C536D0BA2ADB2605066BA95722CB4A4A3ED2B418B7F23EAF256876E29ADC3675D4B2C10EBA47B7E68C56ECDB76DBB26E66E934F436E7E4C7F69F50DB797B09277A8E0EBAF99911F98AB5FC7A7EEC7999F2A1F916849E79AB3D88231D58A5A762994E473456476207A86EDB2A55D97850644B48145811B6DD3A8D5D70AC9F260731006A71BB900C67D3DA52A80C7D396EAFEC23CDCACCBBA3DC34A9758AFC45BCDA9FF251901C5B6346C7C624A48C46CB9B1E2685AB7231FED4ADDFBC2710E8F49A78D2052E2461FD4B286FF940C6839782EF4ED5A9720E7A6CAFBB383888C2A54A8D15B1F19E750D8039D6A0062E0A78A5572AF4C1AECC698F329E729428807EB1C191407FB375523A48FDDA3CCCF8FCC744FE395FC8782220371633635D12D200E7DC91EA3CFB920C9B6E1FD06A4BA7D8B284F05A369542EFA83F0A16894B4C2DD71D23509D127647B54770C38DB8D38B69D494B88514A92794281D083D7AF05910114DB4ADE8880011059715FBEEA76D47B4F9B7400AB6AE0046E34E95F76782CC683F765B4D1E928A7B1C0719AD0FE077DD6B41A25F2CBE3FF236924F6F0643BBAD12B8D7D09A857DB401E667B201B7292E7D1A901DAD2F0D23CA38DB7F4940769C0E407ABD479DB31322F06A324EBF0580CA0F52964AF1F5E32BED96EDCB62229C40F86CF099520FEF8D528F6246335694D52AF5AA2584E8DC9089607329D1AABB55C14D406E9D01B48D1298ED003A82469E6DDAEF91B5EE274E9F169B2BEECF065DB7E52F6B6C734C4ABEC02AC678341177C45FA5CA6B2AEC7169E0C837FF00E678DFC23807DB1E6675C553F6687D23FE1E732B3D495828FF00356296DF95A9D3DAD3E7C9653DAB03D47D78BA2AABADDC559AA2CEA1F96E1475201D940FA801884C993322C6037BAF36D8FEFA80C2101B421B48F8A9480001A6E034C675A81BD073A60300F6A8F05B73DAA9D028F3D9585A1E86CABD8AD9008FA88F36FF0073C959772AB53BE0B89FB6367832C10177DDBC0FED9D3D8CACE33E23ECD62832BF690DC6BFC35EBFEBE0C897CA2E2ABC7D773B4EDBD3FB3713E2F32E7A426BD6FD5E9040D64C65A11D4E01B483F528038A7ACC3AA4175C0525894DA940EE236160918D75DFEA2B8A598340ADCD49D14C4190E27A9484123071415A1BAE519C734084CE8E4F3681C1AF0675A0A2F404EBA2E9EC2876A93C192D780694BB4673A025654EC152BD0B3BD4DFE23CDCCC5EC58B711D74D5840ED7123832A120DFF40079E49EC8EE1C67DB04C7B6A4F33925B27AC841E0C9D9463DF109BF4488F2193F64AFFCD38F6F9999946FC8779551A4A4A5A92B12DAFDD7F5274EA0A071409A2A342A34FD75322130E93D6B4027F42E382F9E908FDD9AF0E38E0BEFA423F766BDD8E382F9E908FDD9AF0E38E0BE7A423F766BC38E382F9E908FDD9AF0E38E0BE7A423F766BC38E382F9E908FDD9AF0E38E0BEFA423F766BDD8E382FBE908FDD9AF7638E0BE7A423F766BC38E382F9E908FDD9AF0E38E0BE7A423F766BC38E382F9E908FDD9AF0E38E0BE7A423F766BC38E382F9E908FDD9AF0E38E0BEFA423F766BDD8A86695E554832E9D32734A8F25A534E252C2124A16342011C08514292B49214920823D047A703382FA00015063BB367F0C5C372D5AE998CCEAC3A875F6D90CA5486D2D8D80A2A00848D3949E061F7A2BED498EE29B79A5256DAD27429503A820F383819C17D81F9C18EECDFBB1C705F3D211FBB35E1C71C17CF4847EECD7871C705F3D211FBB35E1C56332AEDAED3A4D2AA33595C57C243894B0849210A0A1A10351BC7051AB13E81528F56A6B8944A636F614A40501B69283B8EE3B8E2E2BE6E2BA62B112B325A75A65DF2AD843296C856853CA91C148AB4EA1D4635529CE06E530545B51485004A4A4EA0EE38E386FAE9063BB37EEC71C17CF4847EECD7871C705F3D211FBB35E1C71C17CF4847EECD787170DC956BA26B750AC3C872436C2584A90DA50036145406891CEA38A5666DDF46A7C5A6409AD262C746C3695B085909D49D35231C705F3D211FBB35E1C71C17DF4847EECD7BB1C705F7D211FBB35EEC71C17CF4847EECD7871C705F3D211FBB35E1C71C17CF4847EECD7871C705F3D211FBB35E1C71C17CF4847EECD7871C705F3D211FBB35E1C71C17CF4847EECD7871C705F3D211FBB35E1C71C17CF4847EECD7871C705F7D211FBB35EEC71C17DF4847EECD7BB1C705F3D211FBB35E1C71C17DF4847EECD7BB1C705F3D211FBB35E1FF00B19FFFC4003011000103010505070403000000000000000200010304111214325305102240521521303362728213313442245060FFDA0008010201013F00FF007F34F1C2D69928AA2295B80B959248E21BC64A4DA24EF6443C29ABE76E95DA33748AED09FA417684FE852485295E22424E0F6B1286BF28CA3F2424C4D6B65E48898448DFF5551314D25E7CBE0ECE9B342FF1E4AB2A4CCAE07963E1529DC9E37E44CAE811268EF51175171780140E6226D270929E94A12178F8849337189366140626D68972152564127B565A2F87814BDF4F1FB77558DCA97B147146CC24C3C5C854891C2E239895435CA471E90DF150CB2889DEBA248766B7ED22C2C30C657478AE2FBA76767B1D51FE3C7BAB3F24BE283287235C565397A952C1F5CEC7CA2A40B923874A8DAC0066DD2E42F6A89AD9636F5AA86BB3C8DEA546F6D3C7BAB47F92DF14395B91DA45E58AD99F691D54F9F27BD53CAD2C424DBA5F28FD84A0F3A3F78AAC6B2A0D6CF7B60B3A4B757877C7237EA81ED107F07113EB1AC44FAC6B113EB1AC44FAC6B113EB1AC44FAC6B113EB1AC44FAC488C8FBC8AF209248F215D444E4F6BA09248F215D5889F5893CF33B58F21A67717B591111BDE22BC48659636B064BAB113EB1A29A436B0A4224D3CCCD63486B113EB1AC44FAC6B113EB1AC44FAC6B113EB1AC44FAC6B113EB1AC44FAC7FDCFF00FFC40041110001020304040A07040B0000000000000203040001120514549240425262061011132223303132B1213334717282C1154191A116354350515360617384D1FFDA0008010301013F00FEBF6ACDC3B2A504EAF2872C5D359F5A9D23B5F768ADDB2CE8F9B446A286FC1F4A52E5707516EC1584C4BB84C7E68FD1F67FCC389580CFEF22CD12B098CB6F34376E9364853446911834C14120506A128776078946AA7CA5FF006080D332031A487424C0D4314C3C450C19A6CD0001F16B16F7636FB494B9B743F097D342B1ECF4D0015D6E92C5D21DD1EC7BBBE2D34B9E62E0776AFC3D3A0A01CE2C906D18C1B89A76DA52ABA234A7F972760B5BA089AC9124550110C30B55372910AE54A83E2FEE3FC6265D598788483CE1645544A7234E9D02CD1ADEB796F40F596C7FB1F5EC2D4952FDCCB7F8ACB39AB672532D5910FE10BB95CE66992A54E8166A808BA92AA17442A2FCA2CE29AD69A473D63ABEBC6E6DB6CD95246922218538453FD937CC513B49DB9708D6A746B1E88F777C72F24AA9C0948A4252D68B53DBDC7C5C5637EAE0F7179C29E33D06C40A9FA73D9028B4DEDC50A87D617446115A4B209ADB41542E53359429EB197137F5E97C630E0A96CACF727E50C0EB66D8A7B328B60697EE3E5F2E2B18A5F664F748A0BD2539E83C1D4E5D7AD3DD18E114E753797BE2CEF4B06D2DC87ED8DB3A5132F0EAFBB89ACB95D3796F8F9C3CF645FF00C53F28B20AA6086ED5E716F0D2FAADA11E2B056F696D3D60A860C6606633D5EC6E0CB0C965945C196152CB17065854B2C5C196152CB17065854B2C5C196152CB17065854B2C5C196152CB092292322922980D5B30AB7457A79E4C0A9DA80014C44531A446156E82F4CD6440A9DA18B832C2A5960593419890370121DD821914880C6A184D34D21A521A46146C82D3A954408B7A2E0CB0A96584DAB748AA4D1012DD18262CCA75CDB855F0C5C196152CB17065854B2C5C196152CB17065854B2C5C196152CB17065854B2C5C196152CB17065854B2FEF9FFFD9, 1, 0, CAST(N'2021-12-31' AS Date), 1, 91)
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
/****** Object:  StoredProcedure [dbo].[GetEmployeeRecommendationForUser]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPopularEmployees]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPopularPosts]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPopularTags]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPositivePosts]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPosts]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTagRecommendationForUser]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTotalReads]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUnpopularEmployees]    Script Date: 2021-12-11 23:40:10 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUnpopularPosts]    Script Date: 2021-12-11 23:40:10 ******/
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
