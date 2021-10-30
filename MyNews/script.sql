USE [master]
GO
/****** Object:  Database [myNews]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[backups]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[bitacore]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[controls]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[dvv]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[employees]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[languages]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[policies]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[post_tags]    Script Date: 2021-10-21 15:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post_tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [nchar](10) NOT NULL,
	[tag_id] [nchar](10) NOT NULL,
 CONSTRAINT [PK_post_tags_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[roles]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[tags]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[user_roles]    Script Date: 2021-10-21 15:03:00 ******/
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
/****** Object:  Table [dbo].[user_tags]    Script Date: 2021-10-21 15:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[tag_id] [int] NULL,
	[finished] [bit] NULL,
	[qualification] [int] NULL,
	[views] [int] NULL,
	[updated_date] [date] NULL,
 CONSTRAINT [PK_user_tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_views]    Script Date: 2021-10-21 15:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_views](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[post_id] [int] NULL,
	[date] [date] NULL,
	[finished] [bit] NULL,
	[qualification] [int] NULL,
 CONSTRAINT [PK_user_views] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2021-10-21 15:03:00 ******/
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

INSERT [dbo].[bitacore] ([id], [date], [title], [description], [type], [user_id]) VALUES (1, CAST(N'2021-10-20' AS Date), N'Inicio sesion', N'admin ha iniciado sesión.', N'Info', 1)
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
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (29, 1, N'backup', N'Backup')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (30, 2, N'backup', N'Copia de seguridad')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (31, 1, N'backup_manage', N'[Backup] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (32, 2, N'backup_manage', N'[Copia de seguridad] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (33, 1, N'backup_description', N'Use this to create a new backup file with all the data gathered to the date.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (34, 2, N'backup_description', N'Usa esto para crear un archivo de seguridad con todos los datos hasta la fecha.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (35, 1, N'backup_error', N'There was an error creating the backup.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (36, 2, N'backup_error', N'Hubo un error creando la copia.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (37, 1, N'backup_success', N'The backup was created successfuly.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (38, 2, N'backup_success', N'La copia fue creada correctamente.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (39, 1, N'basic_role_delete', N'The basic role cannot be deleted.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (40, 2, N'basic_role_delete', N'El rol básico no se puede eliminar.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (41, 1, N'birthday', N'Birthday')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (42, 2, N'birthday', N'Cumplaños')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (43, 1, N'bitacore', N'Bitacore')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (44, 2, N'bitacore', N'Bitácora')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (45, 1, N'body', N'Body')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (46, 2, N'body', N'Cuerpo')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (47, 1, N'cancel', N'Cancel')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (48, 2, N'cancel', N'Cancelar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (49, 1, N'circular_role', N'One of the roles selected contains this role as policy, making a circular policy. ')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (50, 2, N'circular_role', N'Uno de los roles seleccionados tiene este rol como política, haciendo una referencia circular.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (51, 1, N'color', N'Color')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (52, 2, N'color', N'Color')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (53, 1, N'complete_data', N'Complete the necessary fields.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (54, 2, N'complete_data', N'Complete los campos necesarios.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (55, 1, N'confirm_password', N'Confirm password')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (56, 2, N'confirm_password', N'Confirmar contraseña')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (57, 1, N'create', N'Create')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (58, 2, N'create', N'Crear')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (59, 1, N'date', N'Date')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (60, 2, N'date', N'Fecha')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (61, 1, N'delete_confirmation', N'Are you sure you want to delete it?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (62, 2, N'delete_confirmation', N'¿Estás seguro/a que quiere eliminar?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (63, 1, N'delete_myself', N'You cannot delete the user you are using.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (64, 2, N'delete_myself', N'No se puede eliminar el usuario que está usando.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (65, 1, N'description', N'Description')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (66, 2, N'description', N'Descripción')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (67, 1, N'document', N'Document')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (68, 2, N'document', N'Documento')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (69, 1, N'dv_update', N'[DV] Update')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (70, 2, N'dv_update', N'[DV] Actualización')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (71, 1, N'end_day', N'End day')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (72, 2, N'end_day', N'Último día')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (73, 1, N'email', N'Email')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (74, 2, N'email', N'Email')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (75, 1, N'employees', N'Employees')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (76, 2, N'employees', N'Empleados')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (77, 1, N'employee_gestion', N'[Employee] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (78, 2, N'employee_gestion', N'[Empleado] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (79, 1, N'error', N'There was an error.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (80, 2, N'error', N'Hubo un error.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (81, 1, N'errors', N'Errors')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (82, 2, N'errors', N'Errores')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (83, 1, N'error_try_again', N'There was an error. Try again later.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (84, 2, N'error_try_again', N'Hubo un error. Intente nuevamente más tarde.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (85, 1, N'forgot_pass', N'Forgot password?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (86, 2, N'forgot_pass', N'¿Has olvidado la contraseña?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (87, 1, N'from', N'From')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (88, 2, N'from', N'Desde')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (89, 1, N'home', N'Home')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (90, 2, N'home', N'Principal')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (91, 1, N'image', N'Image')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (92, 2, N'image', N'Imagen')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (93, 1, N'invalid_file_format', N'Invalid file format.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (94, 2, N'invalid_file_format', N'Formato de la imagen es inválido.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (95, 1, N'language', N'Language')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (96, 2, N'language', N'Idioma')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (97, 1, N'lastname', N'Lastname')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (98, 2, N'lastname', N'Apellido')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (99, 1, N'last_language', N'The last language cannot be deleted.')
GO
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (100, 2, N'last_language', N'El último idioma no se puede eliminar.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (101, 1, N'login', N'Login')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (102, 2, N'login', N'Iniciar sesión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (103, 1, N'login_caption', N'Best place to read your news.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (104, 2, N'login_caption', N'El mejor lugar para enterarte de las noticias.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (105, 1, N'login_failed', N'The username or password are not correct.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (106, 2, N'login_failed', N'El nombre de usuario o contraseña no son correctos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (107, 1, N'logout', N'Logout')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (108, 2, N'logout', N'Cerrar sesión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (109, 1, N'mail', N'Mail')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (110, 2, N'mail', N'Correo')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (111, 1, N'name', N'Name')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (112, 2, N'name', N'Nombre')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (113, 1, N'password', N'Password')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (114, 2, N'password', N'Contraseña')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (115, 1, N'password_different', N'The passwords do not match.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (116, 2, N'password_different', N'Las contraseñas no coinciden.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (117, 1, N'password_reset', N'Password reset')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (118, 2, N'password_reset', N'Cambio de contraseña')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (119, 1, N'password_reset_error', N'There was a problem creating the new password.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (120, 2, N'password_reset_error', N'Hubo un problema generando la nueva contraseña.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (121, 1, N'password_reset_success', N'An email was sent with the new password.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (122, 2, N'password_reset_success', N'Se ha enviado un correo con la nueva contraseña.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (123, 1, N'permits', N'Permits')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (124, 2, N'permits', N'Permisos')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (125, 1, N'policies_manage', N'[Policies] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (126, 2, N'policies_manage', N'[Políticas] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (127, 1, N'post', N'Post')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (128, 2, N'post', N'Nota')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (129, 1, N'post_delete', N'[Post] Delete')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (130, 2, N'post_delete', N'[Nota] Eliminar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (131, 1, N'post_manage', N'[Post] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (132, 2, N'post_manage', N'[Nota] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (133, 1, N'post_qualify', N'[Post] Qualify')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (134, 2, N'post_qualify', N'[Nota] Calificar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (135, 1, N'post_read', N'[Post] Read')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (136, 2, N'post_read', N'[Nota] Leer')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (137, 1, N'posts', N'Posts')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (138, 2, N'posts', N'Notas')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (139, 1, N'profile', N'Profile')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (140, 2, N'profile', N'Perfil')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (141, 1, N'reports', N'Reports')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (142, 2, N'reports', N'Reportes')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (143, 1, N'reports_see', N'[Reports] See')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (144, 2, N'reports_see', N'[Reportes] Ver')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (145, 1, N'restore', N'Restore')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (146, 2, N'restore', N'Restauración')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (147, 1, N'restore_manage', N'[Restore] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (148, 2, N'restore_manage', N'[Restauración] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (149, 1, N'restore_error', N'There was an error with the restore.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (150, 2, N'restore_error', N'Hubo un error con la restauración.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (151, 1, N'restore_description', N'Use this to restore the data from a backup file created before.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (152, 2, N'restore_description', N'Usa esto para restaurar una copia de seguridad.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (153, 1, N'restore_success', N'The restore was successful.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (154, 2, N'restore_success', N'La restauración fue exitosa.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (155, 1, N'show_unemployed', N'Show unemployed?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (156, 2, N'show_unemployed', N'¿Mostrar desempleados?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (157, 1, N'signup', N'Sign up')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (158, 2, N'signup', N'Crear cuenta')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (159, 1, N'start_day', N'Start day')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (160, 2, N'start_day', N'Primer día')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (161, 1, N'success', N'Success!')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (162, 2, N'success', N'¡Exitoso!')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (163, 1, N'tags', N'Tags')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (164, 2, N'tags', N'Etiquetas')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (165, 1, N'text', N'Text')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (166, 2, N'text', N'Texto')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (167, 1, N'title', N'Title')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (168, 2, N'title', N'Título')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (169, 1, N'to', N'To')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (170, 2, N'to', N'Hasta')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (171, 1, N'type', N'Type')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (172, 2, N'type', N'Tipo')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (173, 1, N'type_gestion', N'[Type] Manage')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (174, 2, N'type_gestion', N'[Tipo] Gestión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (175, 1, N'update', N'Update')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (176, 2, N'update', N'Actualizar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (177, 1, N'user', N'User')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (178, 2, N'user', N'Usuario')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (179, 1, N'username', N'Username')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (180, 2, N'username', N'Nombre de usuario')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (181, 1, N'users', N'Users')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (182, 2, N'users', N'Usuarios')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (183, 1, N'user_create_error', N'There was a problem creating the user.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (184, 2, N'user_create_error', N'Hubo un problema creando el usuario.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (185, 1, N'user_create_success', N'User created successfuly.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (186, 2, N'user_create_success', N'Usuario creado correctamente.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (187, 1, N'validate', N'Validate')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (188, 2, N'validate', N'Validar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (189, 1, N'vd', N'Verifying digit')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (190, 2, N'vd', N'Dígito verificador')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (191, 1, N'vd_description', N'Use this to validate the integrity of the database.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (192, 2, N'vd_description', N'Usa esto para validar la integridad de la base de datos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (193, 1, N'vd_problems', N'There are problems with the VD.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (194, 2, N'vd_problems', N'Hay problemas con los DV.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (195, 1, N'vd_valid_update_success', N'The VD were updated successfuly.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (196, 2, N'vd_valid_update_success', N'Los DV fueron actualizados.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (197, 1, N'vd_valid_update_error', N'There was an error updating the VD.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (198, 2, N'vd_valid_update_error', N'Hubo un problema actualizando los DV.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (199, 1, N'vd_valid', N'The VD are valid.')
GO
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (200, 2, N'vd_valid', N'Los DV son válidos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (201, 1, N'writer', N'Writer')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (202, 2, N'writer', N'Escritor')
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

INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (1, N'1         ', N'1         ')
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (2, N'1         ', N'2         ')
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (3, N'2         ', N'1         ')
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (4, N'3         ', N'2         ')
INSERT [dbo].[post_tags] ([id], [post_id], [tag_id]) VALUES (5, N'4         ', N'1         ')
SET IDENTITY_INSERT [dbo].[post_tags] OFF
GO
SET IDENTITY_INSERT [dbo].[posts] ON 

INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (1, N'My post 1', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, 1, 0, CAST(N'2021-10-21' AS Date), 3, 69)
INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (2, N'My post 2', N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. 

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', NULL, 1, 0, CAST(N'2021-10-21' AS Date), 2, 129)
INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (3, N'My post 3', N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. 

Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 0xFFD8FFE000104A46494600010100000100010000FFDB0084000505050505050606060608090809080C0B0A0A0B0C120D0E0D0E0D121B1114111114111B181D1816181D182B221E1E222B322A282A323C36363C4C484C646486010505050505050606060608090809080C0B0A0A0B0C120D0E0D0E0D121B1114111114111B181D1816181D182B221E1E222B322A282A323C36363C4C484C646486FFC200110801BC031303012200021101031101FFC4001D000100020301010101000000000000000000070804050603010209FFDA0008010100000000EC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C48E3A7EAC00000000000000000000000E4EB4E8D23CFDB90000000000000000000D6E8F61B3CB03F38DE18FA1ACD84336C4492000000000000000001E114451CBFC3DB33DFF004C5C6C7003EC9328C85F40000000000000000388AEBA2000000244B2590000000000000000045D5D7F0000000124D950000000000000000707587CC0000000B2F238000000000000000C3A89A800000001D65B200000000000000010AC1600000000B6BD480000000000000022FAF1E0000000009CE6B0000000000000008CEB77C000000003BEB40000000000000003595030C000000006D2E500000000000000087A3393601000000032FF00A4B4E2165D0CE000000000000002B6F732CD33D6800000094A2FFCDCCB49FCF2872D975800000000000000547B13D7D5CE10000002C76A7C2658BEBD7EEF9CE1403AC92800000000000001F2955C6D842D050000005A4EE842F8713DD3B25C772DC66180000000000000D653EBA884E0D000000B2D24079D7F89645B4B2A7D8AB0C0000000000000E52B55C057A898000002C4CAA08EEB2A759A4000000000000011EC276B95BE310000009FE5F072F5253ACD20000000000000089E3AB3AAC91E0000E83F7CE013BCCE0E72A22759A4000000000000010968EC4AAC710001EBD9CB1265738BC09D66907355193CCCA00000000000000AF3DF490A95CB01E9D6EDF79D074DD56515EA263D7C89E66507355193ECC2000000000000008CE4BFAA75A60244B34010044077BC113FCBE0E72A22C24B4000000000000000A51E07EFF058C948020586DE93A40E4F332839FA82B17298000000000000006BE989D5F770C96DBA80082A166CEC3D6526B9CC1A8A70B2925000000000000000729530B51B6A825CCD90040B0DB7F656A592CD85078529F9676410000000000000008B2BA3A8B6CA5988BA19C015DA2A75166A9E923598029DE96D4F6A0000000000000015A63749F63D4BB096FF007E015AE3575F692961D7DAF02BE449687BD000000000000000A73A74C93D294782739AC02B2478ECAD652BC56E2E301C255CB112B000000000000000C5A59F1324F4A5D84CDB75B70157B8276F69EA0681FABB1E80F2A6D2ACF200000004720000001ABAF676D312BDEACEF25C0106F32E9A728279D2C4E78106FB4D800000005670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFC4001A010100030101010000000000000000000000030405020106FFDA0008010210000000D800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002AD3BF38000000002AD6F7AF5E73CD2F3DD0BDD8000000038C8AE001DECCC000000018B5C000B1B40000000286600006ECA0000000A9900000D4BC0000000CCF28800242DE98000000336C63800B97A4CAE65D3EC000000734A6C60016F5CC7F346C0000000860EB20077C16B60CB8B640000002B7B1651EC924D6BCC7F7CB3B265C7B00000001C774333DF2C6D0AB8F62BDAD832F8D70000000332869E65FD315B1AFD0B1B466C7AC000000062F1BBF3D7B4C54C8D3CC9774A75B540000000F9E9F6BE7A5DBF4A793AB98FA038CAD8000192000F2A756AA7967B23827879B82BD800014C00000000000000000000000000000000000000000000000007FFFC4001A010100030101010000000000000000000000040506030201FFDA0008010310000000C680000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001656F4708000000003ED9D8F9E7E5EFD74BA33F49C800000001DB59380039642180000000FBB29A00041C680000000BDD1800062A200000002DB540000CCD2800000034BF6E8001C7EAA7340000000D141D6000A9A58DA9EF0F35C400000075B889AE001579335FEB3D03E00000012E6F9D500E7D0AEC81A693900000000B2F12F4C2370875BEF5657640D348C8800000076E37DA22063859EB614DADC89A59192000000034B779BD251E6C596BA8EF20E34D148CA80000001B1EF87DFD266C5AEAF39A38F872E2C32E0000000FBBE858DDFC7C5792DF5398D27DC09D753910001AB0007DB4F15B69F6071244D852FD55FC27C000016A00000000000000000000000000000000000000000000000003FFFC4005010000103020205050B0709070207000000010203040506001107173153931012132171142022304150517291B1D1406061738192C1233234425274A1A2B2152433353662C216435582839094A0B3FFDA0008010100013F00FF00ECCF32744A7C75C998FA19651B56B500312F4B36EB0FF46C3129F4039171290907B028838A2DE96F574A51166043C7632F7E4D7F027B3E705D57753AD78B9BBF9592B19B51C1C8ABE93E84E2B970D56E194644F7CABF61B1986D03D094F2DB7A49AC518A189A55362FA16AFCA23D55628B5FA55C11BA7A7C80BD9CF41EA5A09F2293F33A6566934F244CA845608F238EA52706FBB452A0835763D8AF8619BA6DB9197475883D85E403EC386A7427F2E86530BCF2CB9AE03B7C42948402A528003CA4E430B9D09B00AE530907D2E0185D668ED9E6AEA51127E97500E5F69C1B96DD4A8A555AA7023D321BF8E2B57ED029B4D7E4459D1E53E064D34DAC12A51F4E5E4C546A12EAB35E9B31D2E3CEAB3528F7B4FA94EA54A44A85216CBC8D8A49CB167690A257CB70A704B13B62776F7ABF4FD1F32A54A8D0985BF25E434D2066A5AD4000315CD2CC08A54CD223992ADEAF34B7F138AADE972D60A848A8B886CFFDA68F448FE5DA3B70492733D64F78DC87D9CBA37968C8E639AA23AF08AC55DBCF9951969EC79633F61C26E3B85B1CD4566A091F448700F7E3FEA6B93FF1BA8FFF0025CF8E15725C4B490AACD4083B4190E11EFC2EB156732E7D4652BB5E59C2A5CA5925521C24ED256493E312A52141492410730475104794629BA53B92106D120312D090012E248591EB27141D25502AE52CC85184F9D89748283D8BC0208CC7583F31AEBBE69B6CA4B23F2F348CD2C24ECFA567C98AE5C756B86474D3E41500734343A908F553F2CB3EFE9D4071B89354A7E01397349CD4D7D28F8622CA8D3A3352633A97597521485A4E6140FCC4BEEFD4D102E9B4C5A55388C9C736863E2AC3AEBAFB8B75D5A96B59254A5124A89DA493F2ED1EDDEAA14E4D3E639FDC642FCA7A9A59D8AECF4FCC3BEEEE4DB54F0D30A06748043436F306C2B3F861D75C79C5BAEAD4B5AD44A944925449CC924ED27CC1A35B88D668BDC6FAF3930B9AD9CCF5ADB3F9A7E60CF9D1E9B0A44D92AE6B4CA14B51F2E406C18AED624D7AA926A120F84E2BC14E798420752523B3CC364D68D0AE289216AC9970F42FFA8BF81EBF983A5BAF14371A86CAB22BC9F91D9B109F31D9955358B6A9D256ACDC0DF46EFAEDF8249EDDBE7FBDB484CD13A4A7D30A5D9DB16BDA863E2AC4A95226BEE4892EADD7567352D6492A3F493E63D0FD479CD54E9AB3F9AA43E8FB47355EE1E7ED215E66831BFB3A0AFF00BF3E9CCAB728F4FAC7C985294B515289249CC93D6493E53E64D1A4EEE3BB22A09C9321A75957B39C07B53E7DACD518A2D2E5D45FEB430D9565B0A8EC091DA71509F26A93A44D94BE7BCF2CAD47CCB4396605669B281C83529A59EC0A048F3EE97AA45AA753E9C8565D3BCA717D8D0F89C5936C8B9EAFD03CA5263348E91E527691B02476E2BBA28A7BAC29CA2BAB65F48CC34E28A90BF879820B0C499D15890F861971F6D0E3A4661B4920159ECC2344BA365D15BA67FD3B016D744101F0DA7A73FEFE980E7138D2BE882A3603FDDF0CAE5515E5E487F6AD951FD477969727BB69B065679F4D19A73EFA41F3E695A67745CE1807AA3C56D1D8559AFF001C688E08668B3669192E449E6F6A5A1F12792B318C3ABD46311974529E47B17F2DA6E8F5CABD9CD5463754F53AE388493D4E343C108EDEACC61685B6B52169295A490A4919104751041E4D006959331962CDAE3F93ED279B4E7D7FF711B9F587EA626C1855386FC29CC21F8EFB65B75A58052A4A86C38D2E68AE5E8FAA7DD3142DDA3CA59EE77772774E1E4B1640956952179EC60B7C351479F2F295DD775561DCF64A5B7C2F03F0C58717B92D2A4A32C8AD92E715457C9A4882615DB3481921F4B6FA7FF30C89F683F2AA05A76EDC36AD25E99051D298C125D6F36D64A494F936E26687A228930AACF207A1D6839FC414E22687529792A97572B6C104A5B6722476951CB1162B10A2B3163A021A690942123C800C80C6906C515543957A637FDF109CDD6923FC61E9F5F04104823223A8E7869D75875B7997148710A0A42D2482920E608236118D0C698D8BBE3B141ADBC1BACB28C90B3B25A53B543D0E62AD49A75729D2A9D518A8911A420A1C696330A4E34A3A1DACD8725C9B0D0E4BA2AC92DBE066A67FD8F7C71A2A7FA5B5799BA96EA3DCBFC7CF64800927203AC93898F9952E43E76BAF2D673FF712714963B9295023EEA2B2DFDD401C9A608082C52EA2080A0B5B0AFA411CE1F2AD1BB9D259D4D0732505E49E2ABBDD21D8BD307AB74A6BC319AE5323F5C6F13F4E347167B13E973EA1506B344B6D71D8FA11B14B1894C4EA1555C6438B6A4C490425C4129295B6730A491ED071A29D3B53AE0618A2DD2FB516A6004352D6421A93F05E1686DD69495A42D2B0410A008208C88C2EC1B55297930E9CD422EACB8A31B26C151F2F340E6E27D813D9CD709F43E9F2255E02BE18994E9D4F57365C671A27A81524807B0F9E6B4FF72D1EA4FE7974511E5FDD413884C774CC8CC659F48F21190FF7103974C4FE4D51A38F2A9E70FD81207CAB458E73ED548EBF0253C3F1EF9A69A65096DA425084F504A40000FA00C696A92235562D4909C9329BE62C8DE35F11C96BE95AFBB450DB34DAC3A63236467C079A03D002FF00371A3CD37CFBA624A354A4B0975852015C75A929215F42F3C377FD2143C362520FAA93EE56245F341536A4169F7411D69E8C7E2713E4B52E63EFB2C2196D4ACD2DA3600065E4F3C5F2F773DA5575E7B63F338842316B33D3DCB464659833D927B02C1E5D2F3C4D76033FB3042BEF2D5F0F95688960DBB311992535059EC0508EFF004A1044BB55E7B2CD519F69D1F69E61FEAE5D0E7E8D59FAD67DCAF3DE93DEE8AD1928DEBED23D8A0BFC3160B5D35DF49465B1C5ABEEA14AE5D2CA8AAE7641D8980D01F7D5F2AD0FA89A554D1E412927DA8EFEF54172D5AC00364551F675F2E873F46ACFD6B3EE579EF4BCF736830590722B9A0F684A158D18B41CBBA29FD865D57B50472E94161576BE91B52C343F867F21A2DAF5BB81604088A5379E45E5782DA7B547173DBAEDB3506E0BAFA5D598E8714A482002A24643C468749EE5AC7D6B3EE577F77FFA5EB5FB8BDEEE5D0E7E8D59FAD67DCAF3DE98DEF068AC03E57D67F940C688E329CAFCB7F2F01A86A1F6AD69CB9748CE7497954F23984F4491C24F8E6597A42C36CB6B5ACEC4A52493D806297A3BBA6A652A30FB99B3FAF20F33F97F3B141D175169A52F541466BDE850C9A07D5C2108690943680942464948000006C000C6969013734750DAAA7B67F9D63C46873F46ACFD6B3EE577F792C22D5AC93B0C4707DA465CBA1D46506ACBCF6BED0F603E7BD2F3E175E82C03FE1C307ED52D58D18D0954AA0996F2327A6A839D8D8192396F677A5BAEB073D92549FBA00F10D34E3CEA1A6D254B5A825291D65449C80186747F77BFF9B4958F5DC423FA95863457753B973D315AF5DDCFFA01C47D0F4F565DD356611F56DA9CF794622E8868ADE464CF96EFA9CC6C7B95887A3EB46164534D4BAAF4BCA5399FD84E588B0A1C2474716332CA3F65B4040F60EF34BC902BD057E53000F62D5DE2D971A4B6A5A480B4F3939F9466467FC3BCD0EA3283575E7B5F687B01EFEF1485DAD590AF24470FDA39743FFE5B54FDE51FD3E7BAA586AADDDCAAACF75060A50D735A04952CA065CD3E84E000901291901D400D8072DC6EF4F7055DCCF30A9EF9DB9ED59F11A32A40A95C8DBEB4E6DC34178FAFB13E2B4C0902AB4C5794C557F5F797C528535AB70A53905D21A4ABE95A492AFEAEF343E47F64D4C737AC4A49CFB51DFDDFFE97AD7EE2F7BB97443FE4950FDF7FE09F3FCA7BA792FBDFB6E295E8DA49EF1685B679AA490480402323910083D7E43DE689E9C235BEF4D23C395215D7E9435E08F15A624113A92BCF6B0E8F611CADA0BAE2109DAA5003B49CB1A5E86053690F81D4D3CE35F7D39FFC7BCD0EAF3855747A1E68FB41EFEEB415DB35A48F24078FB104F2E88C116D4ACC6DA8B8470D1E7EAB3E2352A7BE4E41A8AF2FEEA09EF2CDB71572569A8C4111DBFCA4850EAC900EC1F4AB1A58A0A23AA0D5A3B412D9488CE0480024A4668EF2CB8E22DAB476C0DB150E717C3FC7C5698BF49A37D5BDEF4F2D151D2D629ADF5F852D91ED5818D28C60FDA6F39B890CB9ED3CCFF9779A1C7007AB4DF566A430AF61577F70203B41AB3673C9501F1ED411CBA29414DAC49D8A96E91E7EBE24F725A757733DB1CB7C5211F8F79615BA2DFA1341D4652A4E4EBE48EB04EC41F5462EAA50AD502A1082735A992A6FEB11E127F88EF28CD8668F4D6C6C444680CBA875200F15A617019F496BAB34B0EABEF2B96D5415DCD4548F254183EC5838BD990FDA95849F2462BFB842BBCD10BDCDAE4F67F6E1157DD5A7E3DFCA67BA233ECFEDB4A4FB4118208391EA2393462808B462919F86F3C7F9C8F3F696A788F408F0C1F0E4C94F57A50D8CCF2D994F153B9E971D69E723A7E91436821A057F872CF425A9D2DB4EC4BEE01D8091CB4CFF002D83FBB35FD3E2B4BAB26E2868EAC853D07DAB5F2D9690BBAA8E0F92520FDA3172B7D35BB5946599301F001F50F79A2D7BA3BB1A46F23BC9F600AFC3C45C704D36BD5388A1906E53813EA924A4F268ED21366D2805663274FB5D579FB4A552332E75460ACD11194363D650E7ABDFCBA268E1DB99D77750DC57DA5494F2D4883529A41CC190E9047ADCB6B4A44DB7290FA0E60C4681F59002543DA3C56959415748036A62340FF372D8690BBBA900EF947D88389CCF744194C659F48C388D99ED04779613DD05DD485E7B5E523EFA0A7C4696E95DCF56895242724C96798BF5DAF883C9A34743967C046ED6F24F10ABCFD704B33AB953939E61C96F14F6738E439743CDE73EACE7A23B63DAAE595FA4BFF58AF7F2E896BC14D48A23EBF0924BD1FE907F393E2B4A0A0ABB5F036A58647F2F2E8F925778524246C5B87D8DAB92733DCD364B1965D1BCB47A3612396DE7FB9ABD497F3C8227324F6058F11A46A59A9DAD2CA139B9188909EC46615FCA4F2688E4872833182732D4C51EC0B40F3ECE7FB9614A91BA656E7DD04E0924E67AC9E5D0EB804EAB37E5530D2BD8796A48E8EA5351CDCB9B21D191F264A232E5A6CF934A9D1E7455F35E656169C50EB116BD4C8F508C7C1713E1273CCA143A9493F48F13A4B5055E13C03994A190786397471FEB3A57FEBFFF008AB92EA67B9EE5ACB796404E788EC2B27950B2DAD2B4F51490476839E1A712F34DB89FCD5A428761198EFDE69B7DA7197139A16929503B082322315680BA5D4A6415E79B0FADBED00E40E343D2F9B3AAB0F78C36EF0CE5FF002F306B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E162B9A49B726D16A516338F979F8AEB68CDA2066B491DE58570C5B72B4B9330A830E475B6A291990490A1EEC6B4AD3DEC9E1635A569EF64F0B15B7E34BAC54644524B2ECA75C6C9191C96A24020F7962DDE6D99AB6E495AA0BFF00E2246D42C6C58C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C5E355895AB8E7542195165DE8B9A54323E0B694F2D9D558945B8E0D42615065AE979C52333E136A4E35A569EF64F0B1765421556E19F36115161E52549CD3CD39F3003DE5274996DC7A5C062439203CDC6690E64D1239E1391C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858BC2A912B571CEA8432A2CBBD173494E47C16D293FC462C9AE47B7EBEC4D9254182871B70A4667223E39635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2C6B4AD3DEC9E1635A569EF64F0B1AD2B4F7B27858D695A7BD93C2FF00DDF3FFC40037110001020402070702050501000000000001020300041151149110122021334171132231405061723032425282A1C163708081B1F0FFDA0008010201013F00FF002ADF994B5B80AAA133AE83520110D4C36EF81A1B7A3B936D2370EF1F6833CBE481027D5CDB19C63C736FF78C7A3F218C7A7F21CE31FF00D3FDE31E793633833CE104048104926A740241044333A00A3B98842D0B154A81F4371C4B69D657843D30B74D85BEB216A6D5AC93430C3C1E4579F31E82770261F78BCBAF21E1E4259CECDD163B8FA0CD4C2754B493BF9F92617AED255CE9BFCFCDBDD9A7553F71E761E4E45556D49B1AE7E7C8EDA7083E03F889C6908D552452B5FAEA6D48092AE62A2104577C2D14DE2244F7D63D81C8F9F93EF3AEAFFF006F31389D6649B107EAC984A9C5050046AC6158AFD90B6D2E23548DD18673B5ECFF00784AB92BC61821A735B95212E217E0A1D3CEACD10A3606240775C3EE226CD185751F564B8DFE8EC4DA355E34F03BE2586BBA12ADE28630CDFBC0140079C7CD1973E312228D2BE513A68CFEA1F47517ABAFAA697D894E3A7A1D89EE227A44A71D3D0F9E9B34615EE444AA0A19483CF7E713DC34FCB6432F1F06D5940947CFE1CCC26455F896043728CA379153EF139C03D46C4A71D3D0EC4F7DE8E9129C74F43E79684B80050A806BA27CF75B1EE762551AEF26C379D99CE02BA8D0DA2AD3C6DABA2538E9E87627BEF474893E38F89F409E3DF40B0D0996A4B90477942BA24077D67D86CCDF015D468964D65DFE9FC6895347D1D7627C6F6FA1892E31F89F409A5EBBCAF6DD94329D67503DC683E27AC487DCB1EC3667781FA868931565C1EE7FE6864D1E6FE4362751ACD0558C497155F1F4026A49B9895E3A341F13D61973B2712ACFA40208041A83B13DC11F21A24784AF942851447B9849A106C76169D742937112A4A1F00FB8F238D7AC9CA31AF59394635EB2728C6BD64E518D7AC9CA31AF59394635EB2728C6BD64E518D7AC9CA31AF59394635EB2728C6BD64E518D7AC9CA31AF5939419C78823BB968428A14143C44635EB272826A49D0DCD3AD2754508F78C6BD64E518D7AC9CA31AF593943B30E3C90955295E4343530E329294D295E62144A9449E67409D780A77728C6BD64E518D7AC9CA31AF59394768AED3B4E75AC635EB2728C6BD64E518D7AC9CA31AF59394635EB2728C6BD64E518D7AC9CA31AF59394635EB2728C6BD64E518D7AC9CA31AF59394635EB2728C6BD64E518D7AC9CA31AF59397F727FFFC40042110001020304050806080505000000000001020300040511155192101221317113202240416191B11430344250A123243233537281C143627382A252637080C2FFDA0008010301013F00FF00B57254D766EC5ABA2DE38F085D1654A6C429695636DB1352131287A42D476286EF830049006F8629334F00540363F9B7F842686C81D27964F700215436CFD97D4388060D095D93032C5C6EFE323C0C0A1B9DAFA7C22E2C663FC205091F8E72C2288C0502A714403BA00090001601B8682028104020EF0626E8E4AB5E5ACB0FB84F943ACBAC2B55C4149F81B0C3930E06DB169F2894A7B328010029CED59FDBD73CCB6FA0A1C4820C4E4A2E4DD283B5276A4E23E020151000B4C484A2651903DF3B567A85465BD2659400E9A7A49F80D2E9EB2B44C3A2C48DA907B7BFA94F35C8CDBC8ECD6B4703D7E9524261C2EB82D423B313D4EB6DEACC36B1EF23CBAFA5664E90952362D4361EF5451E69D7F9543AB2AD5008277FAF6A61A794B4A15B50AD5221D048041DD0DB9ADB0EF8AE22D6995E0B23C475FABFD14ACB3587FE5314877939C4A7B160A7D6D616B6D86D6851490E6F071062F39ED5B396F9086261D97743A8574BB7BF8C5E4C7A2FA4778053DA0E10B40D8B46E222790B99962D8B35B58104F743B2EF33F6DB23BF78EBACA75DE6938AC08AE1FA46138249F18A4A75A79BEE0A3F2F5B5816C9F05A7994A78BB268077A094C54545A955B88D8A046DFD62F299B08E87841254493BC9EB92235A7181FCE0F84568DB34818363CE28C2D9CFEC3EA7966B94E482C6BD84EAF6F32AC2D91738A7CF9943FB877F3FED155F62738A7CC75EA4A75A79BEE0A3F28A9BC1E9C70A76816241E11441F5970E0D9F991CD54E4AA77BEDE685D56491FC4D6E00C395C647DDB4A5712043F559B78101410304C5209F4E4F7A15CCAAFB0B9C53E7CCA1FDC3BFD4FDA2ADEC2BE29F3EBCCBEE30545B3612922DD1424F4DF560903C7995378B326E11BD5D11FAF36926C9E470579689877526E4D1FEA2BF2D156F61738A7CF9943FB877F38F28AB9FA92BF327E01434D8CBCAC560780D0ED449A8B6A07E8D07538DBB09D15C57D0B29C57CDA4FB737C15E5A2A2BD49E923811F33668A90D6917F803E0799423D07D381498AC9B24C0C5C1F00A635C8C9B78AAD578C4E2F9395795820E84FD94F0115C0792655D8144788E6D1C5B39FD8AD15756ACE3070483FE5A26D3AD2AF8C5B3CCA33BA9325B3EFA7E622B63EAA8383A3C8F5F0092008424212948DC001152F617F80F31A13B5293DC22725C4D4BADB3BF7838110A4A90A2950B083611CCA28B66CFF4CF98D15BF6A6C7FB43CCC36AD66D0AC520C2D3AC8527104731970B2EB6E0F7540C550076416A1B86AA8751B9A4F173345CD278B99A2E693C5CCD17349E2E668B9A4F173345CD278B99A2E693C5CCD17349E2E668B9A4F173345CD278B99A2E693C5CCD17349E2E668B9A4F173345CD278B99A1347944A92A1AF6820EFD0EB4979B5B6BDCA1618B9A4F173342521294A47600344C5365A65C2E2C2828EFB0D917349E2E668B9A4F173345CD278B99A25A9EC4AACADBD6B4A48DA744CD3D89A585B9AD68481B0C2101B4250372400341A3CA2893D3DA718B9A4F173345CD278B99A2E693C5CCD1C820B1C81B7535357F48B9A4F173345CD278B99A2E693C5CCD17349E2E668B9A4F173345CD278B99A2E693C5CCD17349E2E668B9A4F173345CD278B99A2E693C5CCD17349E2E668B9A4F173345CD278B99A2E693C5CCD17349E2E66FF927FFD9, 1, 0, CAST(N'2021-10-21' AS Date), 2, 129)
INSERT [dbo].[posts] ([id], [title], [body], [image], [employee_id], [deleted], [date], [paragraphs], [words]) VALUES (4, N'My post 4', N'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.', 0xFFD8FFE000104A46494600010100000100010000FFDB0084000505050505050606060608090809080C0B0A0A0B0C120D0E0D0E0D121B1114111114111B181D1816181D182B221E1E222B322A282A323C36363C4C484C646486010505050505050606060608090809080C0B0A0A0B0C120D0E0D0E0D121B1114111114111B181D1816181D182B221E1E222B322A282A323C36363C4C484C646486FFC200110801BC031303012200021101031101FFC4001C0001000301010101010000000000000000000506070403010208FFDA0008010100000000B8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000166AD7C000000000000000000000000D96915100000000000000000000000166DCF2BCE80000000000000000000000097DD3BB0382000000000000000000000004B6E723925000000000000000000000000131B9F7E539D800000000000000000000002437B90CAB39000000000396338FC3CDE9D1D921D87CF9FA0000000000D434BA56320000000001E31F1905CE1D1DDC3CDF5D72B63EB000000000D72FF0086D580000000003CE3E3E078C003EDC670000000005EF60C0608000000001F884838CF8000F59A90FDCDFD000000003DBFA071FAC000000000E7AE407980004BF7494A7EC000000002CF29440000000023E03C79A3C00007EA6ECBD8000000003AF90000000003CEB55CFC800002C76AFA00000069D2C0005668200000045D379C00003E4FFB45CA5A8000000DDEC800050F2000000056EAA00FBDFEBF38F9C03D2F9DDCFD00000006EF640002879000000054EBA48E95214FA23B341B3FA88DA5535EDA54E57737FCF6683F40000006EF6400028790000000AB5686B93AF2C524F55E8015CCB2CBA899ED21719D0000001BBD90000AA66903E000001190523D9578CDAFB940A56D1D800A367FAF4DA9B9C25AF00042F2CFFA800377B20000785132EE700000F1A5C5AF77EF987DB744003CB11B2E9DF9C8619FAD2FE8033581D6FB4001BBD900008687B474C1E19C600007850F90583AAABB2D023C01A752EAB6B808DFDFE1A1F58033581D6FB4001BBD90000A1E41DBB25AA978C00003E51234090DA725B1E07FD034526ABBD7297EE3CA47EAD957B94B0033581D6FB4001BBD90000A1E40E8FE8191FE7F85000082A7767182C5ABA72E956859FE189BEFE683E51D8B84F5A7C3B81C3F82830DA6759D9EA00DDEC800050F2034ED3727CF00002893DD54407B6DBEC49DE3D51749F12999C8347F70324E200D2A7801BBD90000A1E405EB61CD72E0001F88C96A8D7C0BD5FDD97DF711944FCF9E2BC80B55900A1F390BCB3FEA5C64C01BBD90000A1E40699A7E539D000019DF281FAD965AFB5DFE64AE7A68BFD4D5AAA67949024AF80066B03ADF6800377B2000143C81EBBFCBE03040000F1CDC02D3BE593F14AC4B51BFCAFE332C1FE01F74CFA00CD6075BED0006EF6400028790746C372A9622000046D0C02C1FD4FF00A304DA648CC70400D0BB0019AC0EB7DA000DDEC800040C05BBBE2709E0000021A95F7E017CFE8D23FF0097B50D84A9FF003107CFD7C5E654019FC4699D6000DDEC80001F9A5651C4000020E9B6CA9816EFE9B30FD568562BB2B1FCBA0B4567F37698000000377B2000157CF2BDC00000086AE5D73803D7FADBB806398C82C7254ABC4B0000001BBD90000A1E4000000233CBBB3B01ACEE0050BF9DFCC13176A559FB8000000DDEC800050F20000001E3E9E59C0069FAD4F7E9199264BF0096BC47F67A0000001BBD90000A1E40000000F999747B7080EA92FC4300276E20000000DDEC800050F2000000033C9AE7820000F5F3F8B5D8C000000125EC00072F080000015097E5A9800074CA41342EC00000000000000000047F9F467A7EBF2001DB6DA2F7DFC000000000000000000797AE7FC290E4F20012F76CDEDB38000000000000000000081A7A5912002C96AAD593E80000000000000000003E67FC52F295449C6FC3D7F1F92ED30000000000000000000008FA1485DB39F960F5AD12139537DD27D00000000000000000000086A869150809FB5E7FCA93BD50A3E5AF000000000000000000000119DBF33C96BA45D13EC9DEE3A85709E00000000000000000000010B5CBEAAF5990BF2976FF0050000000000000000000000AED87EA9D15A33CFD000000000000000000000001F2AF67FD00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFC4001B01010002030101000000000000000000000004050103060207FFDA0008010210000000B80000000000000000000000000000000000D3B3D0000000000018AD9FB0000000000018AEDF2C00008D0BC6C97298C80000AFF734000079A4E574A46AF32FA5BC000056CFF6000087CED36902E6FED40001A3DEC0000D755CD4000CDBF552C003C6A033BC00237195C31E3DE4CF4361760011A001B6CC0045E1635047E8E920336969CDD8DDFD0F7800468006CB2F40057C3E4F93959AD0BCACDBD075BD00419B9046800673BE7802BB86F1E3CD3F5F0A05B6394BBF76165D6855D9E411A001B6CA06D9601C844AC6BE5ADE459D5D7C6EA123BEDE42C4691999E8468006DB3D30EC80635F0510A3C771BA2F09656476D6E68C419B9DF911A001B6CE368B000D3F381E2CA56ED15BA4749D4855D9E411A001EE642B1DA010B8B867BB5F5B74F8A9265876211F7E411A0019912B6802242E285AFB22C13B087D4800468006DB30018F3F38CEB7B91EF4E8C1D9DB6C0008D000DB66000E5205600990FE852C0018C00F40008B49CBEFD00EAE9FBA000000000347CF6E28F769CB1DEEE9400000000028F4F3BD1F2DBAEA8BE8D9000000000069ABC69E73E81CDF50000000000011A4F31D3E320000000000000000000000000000000000000000000001FFC4001B01010002030101000000000000000000000004050203060107FFDA0008010310000000E3400000000000000000000000000000000025E8D60000000000065D373F1C0000000000197470A9C00009961B754085EBC00001D06AA4000019F47DC6F45DF9C0E3B9A000074B41A4000161D6743200E7F95A400004FD11C00036DE7636601E50711040037C93DF0C210004CFA15B801C9D5736001697C046E58004DFA6CBD996ACF330C36E1A3E5114002D2F808FCCEB002D67F77331661AF2F35F0BCA05ED2620B4BE031C20D0F8016DF4BD9EB0A491221AF31F2B69F840EAF97C01697C046E5FA1895001DF4FB87BBA0EA892E4C9D28BF2D8C5DE5655DE536B1697C046E5A5DD734032DBF509C6C8F458E7D0E581F39A02C3DBCA5C60E02D2F808DCB594FE78037FD787947ABCCA65A8E43890EAF97C01697C068A8B9E7620058FD1679AE8BCF32CEF88155F3E0B2AFC41697C0615D5714013ACBE8A28B593ACCE067F12001697C046E580065EFD7F1DAC2161BE60F9E51E9000B4BE02372C000EE2D6E0057D87CA6000032C806B0004DE93B48F201C3DFFCCC00000000095F57E7BA5D1BF1F7DF97C6860000000003A591D6F21DBC6E7BA5F926200000000009175948EB7E59D7716000000000012E2767C6BC0000000000000000000000000000000000000000000000FFC400511000020102020404100A0805040301000001020304050011061221311040415107131620223035526171729192B1B2D1141532364255607481931723505473A1C1D208243334625382D3E125638090FFDA0008010100013F00FF00F6BE8FD905EE9AE51AEC9A258DE26E4CF6E6BF8E19591991810C09041D8411B083F68B41EDCD456A35120C9EA5838F200C971A6D42292F4F2A8C96A104BB376B66437DA1D19B0BDE6B433A914D190656E7E64C2A84500000019003600063A22329A9B7A7D211C9E627ED0596CD5379AB58620420C8C926598518B7DBE9AD94B1D2D326AA28FC49E7382CA8A5988000CC93B00031A4774176BACD3A9FD52E51C5E48F7FD9FB359AAAF354218464A32324846C518B65B296D54AB4D4CB928DA49DEC79CF0696694FC2CC96FA17FD48394B203F2CF30FF8FD9FB2D96AAF55421886AC6B9192423628C5BADB496BA64A6A540A8379E563CE7C3C1A57A57D3FA65BEDF27EAF6896507E573AAF83ECFDAEDD35D6BA1A4876173D936F0146F2716EB752DB29569A9935517CEC79CF0696E95194BDBA81F24DA269472F3A8F07EC89EAE9A9BFD5900F393892FF0044BF255DCF38000C36919FA14DE77C369155FD18A11E304E3E3FAEE68BD1C7C7F5FDEC5E8E06915572C517E198C2691F7F4DE67C477FA17D8C1D39C9198C435F473FC89D093C84E47AC2CA37903C78E989DF0F38FD95D0F68D443595846D2E225F000031F58E0D33BD35B6885340D94F5198CC6F541BC8FD94F4F4F2FCB851BC6A0E25B2DBE5DD1143CEA48C4DA3AC33304E0F81C658AAA4A8A360B32644EEE5072E623AE86B6AA9F2E9533281C99E630D7CB832E41D41E70A33C495B572FCB9DCFF00DC40C1249CCEDE0562A73524788E588AE15D0FC8A87196E04E63CC714FA433290278C38E75D8714B5B4D58BAD0B8246F53B08FD8DD0F9C1B554A728AA24F88AAF0699D4B545FEA173D912A463F019FACFECA792389759DD54739200C4B79B7C5B3A6EB91C8A09C49A4518FF4E9D8F85980F5678AEAF9AB995A4C805CF5546E19F6E491E260E8C5586D046C38B5DD855E50CD90940F107CBF62E8157AD3DC66A463B2A1015F2D38349BBBD71FE31FD8F24B142BAF23AA81CA4E431517FA58F35855A43E6189EF75D36615C460F228C8E19DE46D6762C4F3924F6F869E6A86D5863673E01BB10E8F54380669550730DA70BA3D483E549293E0200C0B0D2290C924CAC0E6086198230010002733EBFD894F3C94D3C53C4DAAF1B0653CC41CF169B9C376A186AE2D9AC3265E5561BC1C6994663D21AB3C8E1187E2807EC5A8AA829575E69028E40779F10C55E903B66B4C9AA3BE6DA712CD34EDAD2BB39E7273E2505EAA69D022450841C8148C47A4677494FE8B621BDD04BB19D90F330C2491CABAE8EAC0F28208FD8DA317F366ACCA524D34A409077A7BE18D3C8D5ABE8EAA320A4D4C006077EA93EFFD8954D706CD296355E791C8FE4061EC771998BC9346CC79D893EAC3586B977188F898E24B4DC22F954EC7C9C8FAB0CAC8DAAEA411BC1191E291CB2C4DAD1BB29E704838A5BF54C592CEA245E7DC714D5F4B583F5520CF954EC23F62C95B512D24348EDAD1C4CC63CF7AEB6F00FEC69658E142F238551BC9390C565FD8E6948B90EFC8DBF80C492492B9791CB31DE49CCF16562AC1949046D046C231417D65223ABDABB848378F1E159594329041198236820F1CB1E885AAE36AA5AB99A7E992292DAAE00D87C58EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8EA0EC7DF54FA63DD8D2AD19B6D9ADD15452994BB54043AED98C8AB1E395F758288151D9C9DE8E4F1E2AEB27AC7D799F3CB728D807161967B71476BA1AE4D68EA1C30F94A40CC624D1C703F575009E62A4627B4D753825A22CA395768C586B1B59A91CE6322533E4238E6897CDFB7F90DED1E21D103B8D07DF53D86E3772BD08F5A0A539B6E693907806199989662493B493B493DA9519DB555493CC06670969BA49B5286A0F8E32063E20BCFEE5260D8AEEA3334337E033C4D435B00266A59900DE59081DAA19A5A795648DB2618A0AE4AE8438D8E3632F31E034B4E6759FA58120CFB21B09CC65B72E39A25F37EDFE437B47887440EE341F7D4F61B8D5DAEE64D6829CE49B99C7D2F00EB2D76BA9BAD488611901B5DCEE41CE7145A3769A3500C0257E56906B67F81D83125AADB2AEABD14047F0C038BD689AC71BD45BB3C9412D09249C877BC3436EABB94DD2A9A32C47CA63B0283CA716FD11A1A70AD544CF2736E40710D3C14EBA904488BCCAA00EB6AED16DAE07A7D32163F480C9BCE3175D119A9C34B42C6551B4C67E581FD7041525586446C20EF078296966AC9D2081359DCE407AC9C5B7456829515AA544F2F293F201E60306DB6D2BAA68A9F2DD974B5CB174D12A4A8467A21D2A5DE1733A8DEEC4D14904AF14AA55D090C0EF0470505635154AC836A9D8C39C1C2B2B2865398233047283C7744BE6FDBFC86F68F10E881DC683EFA9EC3719BCDD092D4B036C1B2461EA1D6E8DD12D1DAA020767281231E539ED1E61C33CD1534324D2B6AA2292C4F2018AE9A3A9AB9E78E3D4577242F3027163B24B7798924A4087B37E527986292929E8615829E30883906F279C9E53DA6F5A3B4F730D3459475006C61B9FC0D89A192095E2954ABA12181DE08C689D7535257B24CA019804493BD39E797E3D6699D12A4B4F5AA322F9A3F848DA0F0D86A8CD4A61639B44721E23C7744BE6FDBFC86F68F10D2CB555DE2DD1414A14BAD42B90C72190561FD712E87E90C433F816B8E74653FD71514B5548DA95104913720752A78B5CA6AA11F49A58D9A471B586C0A3C6710E8FD53ED964441CC332711E8F52AFFA923B9F0640605A6DB102C61190DA4B3123172A9A695FA552C4891A9DAC1402E782D722CB6DA2753983047E700023874C6E44B476F8DB60C9E5F093B8629E092A668E08866EEC154784E2828A2B7D2454D16E41B4F2B13CA7B5E985AC145B8C4BB464B2E5CA3703C1A3F72372B723B9CE58FB0939C90361FC7874D6451434B19CB59A7D6FC0023FAF0D966E935C8A4EC7057B6565FA8686A1A0944BAE002725046D19E3AA9B6734DE88C432ACF0C732E7AAEAAC33DF930CC67DBF44BE6FDBFC86F68F129A186A22314D1248877AB0041C5E341692A034B6D6E9327FD324943EEC55D1D4D04EF054C4D1C8BBD4FAC1E51C5A69E2A78CC92B0551CA7D43171BB4B5A4A2669103B1795BC7C3A27798D17E2E9DF2DA4C4C7CE5781995159D8E400249E60369C56D4B56554F50FBE47276F202760C686D074C9E6AD71B221A89E511B4F9BB654431D4C32C120CD5D4AB0F011962AA99E92A66824F951B953E1C8E3442B0C1726A727B09D081E52EDE09658E18DA49182AA8CD98EC000C5FAEBF1AD7174CC428356307D7C314862963906F56047E073C0218023683B476BD24EEBCDE4A7AB82DBDCEA2FBBC5ECF6FD12F9BF6FF0021BDA3C42F77982C94A953346EEAD204C932CF3209FE98A5D38B14E72779A1FE227F6938A7A9A7AB8C4B04C9221E54398E0BE59296F74C639405914671C806D53EEC57D0D45BAAA5A5A84C9D0FE047211C52A6A22A585A590E4079C9E618ADAE9ABA5D673928F92A3728EB68B49EEB46A135D6541B00901240F01073C55E97575553490086141221562332722382C947F01B65342464C5759F9F36C5D7A30689D9EE5596DA98EBCCD4F3189F52252335E6CDB1FA72D0BEF2E3F92BFDD8FD39685F7971FC95FEEC7E9CB42FBCB8FE4AFF00763F4E5A17DE5C7F257FBB1FA72D0BEF2E3F92BFDD8FD39685F7971FC95FEEC7E9CB42FBCB8FE4AFF763F4E5A17DE5C7F257FBB1FA72D0BEF2E3F92BFDD8FD39685F7971FC95FEEC58EF349A4169A5BA5187105429282400364095DA013CD8D32A2E9559155A8D92AE4DE52E296A24A4A88A78F2D78D830CF712390E0E9AD7EA6429A0D6FF00BB15F78B85C8E551312A0E6106C51C114324C5846332067AA3791E01C340FD328A9DF94C4A0F8C0C8F6BD24EEBCDE4A7AB82DBDCEA2FBBC5ECF6FD12F9BF6FF21BDA3C43A20771A0FBEA7B0DC14172ADB64C26A499A36E503730E620EF18D1DD25A7BDC4636023AA419B47C8C39D7834C2CAB72A135312FF0098A752473B20DA47132400493901B4938BA57B56CE754FEAD3628E7E73DA2D34BF0CB952C04661A505BC4369E0BBF419D17BD5D2B6E5515973596A67795D52588282DCD9A1C5B3FC3268057D143506E77D05B7E53C1FD61C5FBA0369FD0E93D45A6DB669EAA91A7614B599AF4B30F2348FB94E17FC2F681414624ABBB5F3A62440CA526802663981871FA05D0FFDFEEFF9B17FE2C7E81743FF007FBBFE6C5FF8B1FA05D0FF00DFEEFF009B17FE2C58FF00C3BE835CAA5E19EE37A04266BA9343FD62C744CFF0DF5161A2A3ACD0B8EE372DAE2AE099E379877AD18444C7439FF0D62F1679AB74D3E31B7CEF2814F4F03C4AE1072CA1D1F179FF000F3A0F4159D220B8DE5804058BCD0FF48B160B2D2E8EDA292D348F23C34EAC11A420B90496DA4003971A554C2A2D123E5D944CB20F51F5F5B0CAF0C89221C994E60E25A1A5BB53AD4C39248C3691BB31BC1C54534D4B218E6420FF002239C1C595B5ADD10E62C3F993DAF493BAF37929EAE0B6F73A8BEEF17B3DBF44BE6FDBFC86F68F10E881DC683EFA9EC370D2554F4551154C0FAAF1B02A7FA1F01C5AAE115D2821AC8F6075EC97BD61B08E0D21A016DBBD553A8CA3D6D78F9B55B6E5C4AFB5661A71021C9E5D879C28E0A6B6D65500D1C4429FA4760C32EA92B98391CB31B8F8BAED15282F50EB6F2B205F370D9EF52DAD995975E163995CF683CE30BA4D6729999D81EF4A1C5E7480D74669E9D4AC44F644EF6CB9314743515ADAB1AE406F63B00C2E8EC3ABD94EE5B9C00062AAC353102D0B094736E388269E8EA1258C95910F2F21DC4118A4D2AA19507C24344E06DD8594F9B15BA55491C65690348FB8120851896592691E5918B3B1258F393C17865169AF2E401F07900CF9C82075D61ABE9539A773D8C9B57C0C31534B0D5466399731FCC1E718B7D235142F116D61AE4AF3E4475ED73B7C6CC8F5508652410580208D841C7C6D6DFDF21F4C63E36B6FEF90FA631F1B5B7F7C87D318BF4D0D45CA592275742A9930398D838282E76F8E86911EAA10CB046082C0104000838F8DADBFBE43E98C7C6D6DFDF21F4C63E36B6FEF90FA6310CD0CE82489D5D0EE60731B3676BD12F9BF6FF21BDA3C43A20771A0FBEA7B0DD6743CAC256B68D8EE2B2A7A9B83A21D385ACA1A81BDE174F408FEEE2571792BAE4EB182C41D4503C18A0B2434E03CE03C9BF23B42E2ED53F06A190A9C99FB05FC7AFA5A89292A22A88FE5C6C187E0714D511D5D3C53C4735750C3F1E43D65B6DCF5D2EDCC44BF29B10C31C11AC71A80A06400E1B85B22AD52DB16503630E5F01C4D0CB4F2B4722E4C3ACD31B808A963A243D94A759FC0A0FBFAE5664657539104107988DA314B38A9A78E65DCCB99F01E51DA2E5DD1ADFBC4BED1ED5A37DC887CA7F5F6BD12F9BF6FF21BDA3C43A20771A0FBEA7B0DD6743FEEC547DD1BDB5E0E88BFE8DBFCB97D4388CCFD2E291C0CCAA93E619E2D76F14916BB8CE67DAC4F267C83834867D69E2801D88B99F19ED1A1F74D566B74ADB0E6D113FCC70D151C95B308D360DECDC8A310C31D3C4B146B928190F79EB6E56F5AE876642451D8B6195A36656043039107782382A278A96192795B2445258F8062E15B25C2B26A9936173B077A06C03AFD1DA8D68E5A7276A9D65F11ED159A37709EAEA26530EABCCEC33639E44938EA5AE5DF43E91F763A96B977D0FA47DD8EA5AE5DF43E91F762B2926A1A86825D52E00272398DA33E08746EE13C31CC861D5755619B1CF223319E3A96B977D0FA47DD8EA5AE5DF43E91F763A96B977D0FA47DD8B4524D43431C12EA970589C8E636927B5E897CDFB7F90DED1E21D103B8D07DF53D86EB3A1E52106BAB08D9D8C4BEB3C1D10E70D5543072A46EFE99C87B3C52BE6E9F593BE7982E40F12ECED114AF0C89246C559082A46F046D07168B925D28639D720FBA451F4586111A4754519B139003949C5BE8968600836B1DAEDCE71A71A4955A2B617B8D2D1FC224E9AB1807E426B0F96F97262E3D11B4CAE4CC5EEF342BC8B4F94207A1B7125F6F531CE5BA563F95339F59C41A45A414C4182F15F191DECEE3D471A23D12B4C7E34A3A1919AE51CB2AA189901932E70C382FB42197E1718DA36480728E7E0D2EBB74C905BA16EC5083291CA79BB459E6E935F16DD8F9A1FC7B6692775E6F253D5C16DEE7517DDE2F67B7E897CDFB7F90DED1E21D103B8D07DF53D86E182096A668E1850BBBB00AA37927165B6A5A6DB051A904A8CDDBBE73B49E0D25AF171BCD54AA738D5BA5A7893666389D449D260964EF118F9867DAB44ABCD35C3E0EE7F5738CBC4C36838B1D06A2FC2A41D930C901E41CFC0CAB22B2BA865232208CC10790838AEE873A177062F2D9E147E7859A2FE4840C744FD0DB268AC16B7B624CA677983EBC85B628523168E85BA1868A9279A82595DE18E43AF338DA467F448C5B6C968B3214B6D053D38232263400B78CEF3C0C1594AB0CC119107941C5FC8B2A55C8C3358D4B267CB9EC5189247964791D897624B13BC927327B42318DD5D77A90478C1CF0AC18061B88047E3DAF493BAF37929EAE0B6F73A8BEEF17B3DBF44BE6FDBFC86F68F10E881DC683EFA9EC37052D254D6CCB0D342D2487914667C67986346745E3B3AFC22A355EA986F1B901E41C1A597916AB73471B655138291E5BD41DEDC52ECDA96EA83CE00F3903B5689D09B8E915B69F32019C3B78A305CFAB000000032036003ACE8E7FED2C5FC59FD4B8B4F72ADFF758BD81D6745185CD8E19D06EA84593C920F6AB7BF4CA1A66FF00EA51E61976BD24EEBCDE4A7AB82DBDCEA2FBBC5ECF6FD12F9BF6FF0021BDA3C42FF665BE51C74CD318C2CA1F30B9E79023FAE29B402D7110D3CD3CBFF1CC28C515BE8ADF1F4BA5A748D797547ACF05D6ED4967A533D43F38441BD8F30C5CEE55175AC92AAA0ED6D8146E50390714BEB656F61CEEA38111A4655419B139003B474355074A21246E82523CDD65CAE96FB3D1C95B70A9482041D93B1E5E61CE71A67A4F70E8875C905A6D933D3512CB228542F211CAEF963407A25DBAED1535A6E5AB4B5888B1C6C4E51CD96C00733759A6D4E2A7456E8847C98C49E228C1BAE033200DE70C8D1B14652186C20EC2386CADAD6D87C1AC3F99ED77EB7D7545CA5922A691D0AA64C1491B063E29B97EE737A07140AD1D0D2230219608C10778200041EDFA25F37EDFE437B47893B84059C8006F39E400C5E34D6DF421A3A322A26F01EC078CF2E2BEE35973A86A8AA94B379828E61C56FF00FEC07F15782D54029A95EA645FD63212A0FD119768D03A914DA556E2C720ECF1FE2E840EB34A740B4A74AF4AC8ACB80169401E26FF00A60EF454EFF9DB161D1EB4E8DD0AD1DB69C469B0B31DAEE7BE76E538D37E86141A43D36BAD9A94B70DA5B9239BCAE63E1C681506915BAC11417FA83254063A88C43346836052C3E570E994C20D17BB31C8034E53F17217AF82963BBDB918E4278C6A6B73E5B81C4B1490C8D1C8B9329C883C16327E2F4CF919B8E6897CDFB7F90DED1E21A5177AAB25045534CB133B4E2321C12322A4F211CD89B4E6FB28215A08FC88F3F689C565D6E3703FE6AAE6979722C721F80D9C5EFCB9D013CCEA7169A3F85D52EB0CD13B26F0F30C557FB59FF86FEA3DA29AA24A4A986A22393C522C8A798A90716FAE86E5434D5909CD268D5C6DCF2CC6641ED3D13EFF00174A8EC903E6E59649FC000CD57AFD1D9489278B3D854301E23962EF6E1570F4D8C7EB507A439B82CA08B6C279CB91E7238E6897CDFB7F90DED1E21D103B8D07DF53D86E33785D7B74E394053E620E2C94FD2688391D94A758FA862B333475396FE92FEA3DA7A1BE94A52B7C4B592011C8C4D3B13900E77A7E3C9DA34C74CE0B044D4B4ACB257B8D8BBC443BE6FE83134D2D44D24D339791D8B331399624E649EBEC2756BC0E7461C17BA314F53D3546492E67C4716C5D4A0A61CE80F9F6F1CD12F9BF6FF21BDA3C43A20771A0FBEA7B0DC66A22E9F04B16E2E8C078C8CB088B1A2A2EE5000F101962A4674D301CB130ED5A37D126AEDE894B7647A98464165073957C7DF62DDA5160BA2A9A6B8C058FD076D47F45B2C0208CC70DC6EF6CB4C7AF5D591423780CDB4F8946D38D21E89B2CEAF4F644689796A240358F90BC9877795D9E472CEC4966249249DA492779ED16304DC633CCAC4F05CA97E174922019B0DABE3188D0471A20DCAA079865C7344BE6FDBFC86F68F10E881DC683EFA9EC371B650CA54EE2323860558A9DE0E5E6C51D3355D4C708DC4ED23900DA4E2EB0886BA6441928D5C87808ED305757530CA0AA9E21CC9215F561749F48933CAF15DF8CCE7D789749348275D492ED58579BA730070CCD2316662CC76924E649F093DAB47935AAE46E4588F9C9E3FA25F37EDFE437B47887440EE341F7D4F61B8E5C62E935B509B86B923C4768C68EC2339A73C9920C69047AB568FC8F10F3824712A68D66A88A26390760BE2CF66244689D91C64CA483E31B3874761D5866948F94C00F101FFBE3F05E6EB4D12C30574E91AEC5557200CCE78EA82F9F5954FE61C75417CFACAA7F30E3AA0BE7D6553F9871D505F3EB2A9FCC38EA82F9F5954FE61C75417CFACAA7F30E3AA0BE7D6553F9871D505F3EB2A9FCC38EA82F9F5954FE61C75417CFACAA7F30E3AA0BE7D6553F9871D505F3EB2A9FCC38EA82F9F5954FE61C75417CFACAA7F30E3AA0BE7D6553F98715574B8D74623AAAB9A540DAC15D890080471CD2180ACF1CE06C75C8F8C62C49AB6F46EF998FF4C69143AD4F0CA3E83907C447FEB8950FFBDA5FE327AF17EA6E9554B328D920FE6386820F8351C3111910B9B78CED3F62EE54BF0BA474519B0EC97C631653FF00C6C03946B83E962BE0F84D1CD101992B98F18DA3AC891A5911177B3003C64E5DBAD8BAD5F4C3FE60E2F14FF08A09321D927663F0E0B5537C26B63523344EC9BC43EC6C50AC3AE1360662DE22782E74DF06AD9540C949D65F11DBC3695D7B8D38E6627CC09C54A74AA8993BD761E63DB6C69AF7046EF158FF002CBFAE0804107683B0E2A6134F512C47E83100F833D87163A5E914BD35864F2EDF101BBEC7DFA93A75389D476516FF000A9E1B18CEE0879958E2F70F4AAF73C8E030EDBA3B17655129E401782BADC6A6ED1E43B0750CE7C9C0000000C80D83EC7B2AB295619823220F2838B8D1B5154B47F40ED43CE0F0588E57041CEAC31A4306B4314E06D4391F11E1B5522D6493C6DB3F52723CC73191C488D13B238C994907C63ACA785AA268E2539176001E6CF12C4F0C8D1B8C994E447596487A5502B1191762C7EC9DC6856BA029B038DA8798E1D1A37647043039107908C5A1B52E34E790923CE08C5542B530490B6E7523C4790E1D5A3665719104823C2367068E8FF3139E6403CE717EA1DA2AD0730900F303D65A575AE34E3C24F98138BE5074D8FE1518EC907660728E145323AAAED2C4003C2766218D6289235DC8A00FC065F652EB6B5AC5E9B1E42603F060390E212D4D551B3820A4AA483B08C8F05FA93A5CCB50A3B17D8DE061C1A3A7FCCCC39E3CFCC71246B2A3238CD58104780E2B695A8EA1E26DA06D53CE0F0D90677284F3073FC88C1008208CC1C5CE88D1549551FAB6DA8782CB074EAE462331182C7ECB57DB21AE1ADF22403630E5F01C402458635932D70A0311B4120659E2A69D2AA1785F730CBC4790E27864A795E29064CA723EF18B03EAD711CF1B0E0BAD08AD83B11FAC4DABE1E7182082411911B083C165245CA11CE1FD92782E9462B295828ECD76A78C705869FA5D2B4C46D91BF90FB3377B77C2E2E9B18FD6A0F4862D2FD2EE3013CA483F882386F56DCF3AB857C3201EBE0B49D5B8D39FF911E70470DDA84A57AF4B1B273D8F944E44621896189234DC8A00FC07D9AB95B4ACCB5B4EB9B2306751CB91CF318041008DA0ED1C376B51A7267817388ED603E81C5136A5653BF2095785A2491919D41287353CC7223ECF9008C8ED07171B2B231A8A3198073318DE3C230AC1D5586E201F3FFF00C9BFFFC40042110002010202050905070106070000000001020300040511122131415110131420303261719122335272810623404250A1B1C11524626370823443537392A2D1FFDA0008010201013F00FF0042667D04CC6DCC6548C1D430DE3F502428249D552C9CE3780D9512958D41E1FA79214124EAA9A6321C86A515041964EDF41F849AF2D60244B3229E04EBA6C6B0F5D9213E4A6BFB7AC38C9FF8D2E3587B7FCD23CD4D457B69364239E32786972820FE16E1C96D1DC2ADE107DB61E5F8570841D3008F1ABA1811CF9C3103FE0DBFFAD4E2012BF3058C79FB25B6F2A5DDD46BA293C80700C69A47739BB163E249E486FEF2020C733F91398F43587E32972C22980593711B0FE0E7044AD518C914780FC1DD5FDADA0FBD90697C2359AB8C7E77CC40810713ADAA6B89E739CB233799EC2CE3C1C646E26766E04155FDAA0B5C26619C290B791D7F839E2D35CC778544738D3CBF052C66452BA6CBE2BA8D3E0B6191662FC492D57B1D8C4DA36D2BBEBD79E5976409520824115698D5D5BE4B27DEA703B7D6AD2F60BD4D389B58EF29DA3B679163199AE93178D7498BC6BA4C5E342E62F1AE93178D7498BC6BA4C5E34B711B30519E67B6BABB86CE3324ADE4379F2ABEC4A7BD6209D18F720FEBD56655EF301E75CF45FF00513D681076107AB87261B7CBCCCB005946F52406F1151611D12E639ADA52003932B6F53DB5D7707CDD843EF57CFB5BBBB8ACE132C9F41BC9ABABA9AEE5324A75EE1B80E4BBBC91E464462101CB56FA86E6789C156275EC3AF3A791638F9C7F646599CEAE31096524467417F735AC9CCF22B321CD4907C0D5B62246493EB1B9BFFB533B244EE83488198A79E691B49A46CFCEAC2EDCB88A46CC11EC93B454723C522C887265398AB59D6E608E65FCCA091C0F6D75DC1F3761110245278D0756D8C0F693E1B0DD4BCE4ECED96A55CF202AEBFB2F0D4FF878CB91ECAE599A9A669E4691B204EE1A80F01573134333A91BC91F5AC361124A6423520FDCD62539690440EA5DBE7D6C367D38CC676AECF115790886760361D62B0F899E70E06A4D79F8F27D9F98B412C47F2B823EBD67B8915D80CB51A1AC03E1D7BAEE0F9BB000B1006D3455936822A2B82A407D638D02080476588DF2D941A4322EDA9054923CAECEEC4B13992791E38E5193A861E34A915BA31550A0024D59361F24D2B62064D12331A1C73A8BECEE13346922194AB2820E96E357D86E01879413B4F9B8246473D9597D98F8AE6ACF04C16FA11340662A491ACE47555E60D825843CF4E660BA41751CCE66ADE48E3BEFBA24C65D82E7B744ECA92086520C880914AAA8345400380AB6B33788E22239D4D7A07F30F03580E94779344E083CDEB07C08EB4BEF1FCE97BA3C875EEBB83E6EC21F7ABE7440232353C5A0735D86ADA4CF343F4ECAE21B8C5AFE4E6FDDA1D00C760CAB12B482C9E38518B3E5A4E4F2CC86489D06D65228820E4751AB2C72FAC62E650A320D81C1395416D738BCC6EAF1CE86C196ACC0E1E15261162EBA223D13C4139D09710C05CF34C1A273BC66A4F8F0357F89DD622CA6761A2BB100C80AB64324F1A8E20FA72DA5C35ADC4732FE53AC7114B1C323A5CA805B43530DE0F50DD3039688AE94FF0008A63A4C4F1342E580EE8AE94FF08A43A480F11D5BAEE0F9BB087DEAF9F24E3389AADCE52AFD7B1209040391CB6D410C76F12C518C95455F4DD22EE7933D45C81E43575311B7D07E797636DF03586D89BC97DAD51AF78F1F0A8A025405C828D42BA31F8855CDB2BA34528055855E5AB5A4ED1B6B1B54F115875BF371F3AC3DA71ABC0753049B9DB155275C64AFD37750DB46493AEBA345E3EB4E02BB01B8D0B68C8075ECAE8D178FAD0014003AB75DC1F37610FBD5F3E4B970134779AB65CE4CF80ECAE1F9B8257F8518FA0EAC9173E8D1FC5A855A5B25AC0B12EEDA789A048D848A677E6A33A475E75AF79AC4AD16E6343BD187A6FEAFD9E9327B88F71556F4D5D697DE3F9D2F74790EBDD7707CDD846C15D49D80D3DCA0EE8CCD12D237126A18F9B5F13B7B2C44E56373FF006CD595A3DE4DA0352819B9E03A91FBC4F3E4550C759C8569C6DEC10401B0D1191233CE9FB8DE47A97368F02C720D7148B9A37F43E35801FEFAC38C47F91D66B65662748EB340643AF75DC1F3760AA5880369A16AFBC8151C291ECDBC7B3BF5D2B3B81FE53561B6A2DB0E6623DB910B37D46A1D58DC48A1BA93CBA8A2FD7A985C69778573328CC0665F2DE2B07B67B7C46E237DA9191E6091DB5D7707CDD843EF57CFB5650EACA761041A64050A01AB472CA9119DC228CD89C80F1A96330CB246DB518A9FA72A3B21CD4D2DD1DEB5D297E134F70EC32032EAE02B95867C6463FD28448266940F699403F439F6D75DC1F37610FBD5F3EDECED7431B95586A42CE3EBB3F9AC5E2E6AFE6E0D930FAF6296FCE58C938DA92647C88E4B087A3D9C319DA175F99D67B7201DA2B417E11E95A0BF08F4AD05F847A5682FC23D2B417E11E95A0BF08F4AD05F847A568AF01E9DBF4602F16E46D31146F5041AFB4306A86703FC0DFC8E4311E8EB37190AFEC3AF835B8970E9D1B648E47EC2B0DB369EF951C6A8CE6FFEDDDFA45D40B730490B7E61A8F0352C6F0C8D1B8C994E46A3879DC0E4206B49B4BF61C8D0BAC51CA47B0E5803E2BC8AA5982A8CC939014415241191E4C2E2E66C205DE5748FFBB5D41691C124D22F7A47D227F49C5F0C37239F847DEA8D63E202B01C9EDAE2171B1F583C18655776ED6B71242DB8EA3C4558DAA5E60E223B7498A9E06A44689D91C64CA4822AC867796C3FCE4FE6B1DB1D06E9483531C9FCF8D5BC4679E3887E6602800A0003200643F4B5822499E655C9D800DE358C581BA884B18CE441EA2B006CEC997E190D63587F38BD2621ED28F6C711C6AC8E5776E784A9FCD4D124F13C4E3356041AC1EC5E2BE9CB8F75EC83C4B7E9D15B4704B2BC7A8484165DD98DFC988614D1482EAD5730183320DDE2286B00D6401240DBFE9D7FFFC40041110002010202040909080103050000000001020300040511122131410610132022305172911533344252536162711432405081A1B1C163237082167392A2D1FFDA0008010301013F00FF00626CA113CE15866B9126A58CC52BA1DAA7F30556760AA332760AB4B616D1E5EB1D6C6AEA412DC48EBB33FCBD559D82A8CC9D82ACED16D9733ADCED357F7D9E70C4756C66FEBF090585EDC8061B79187681AA9383B8B38D7085FABAD7FD3389FF008BFF002A7E0EE2C9B210DF475A9B0EBE83332DB4AA06FD124716BDC28823683F85C36054844A4749FF008AC46ECAE7021D79748FE150C8187265836ED1DBFB5591E12AE5C8898AFF009367FEF56A6E0C09F695412E5D20BB38E5B0B299C3C96D133769514914518C91154760195100EDAB8C2EC2E8112DBA13DA0007C4562DC1F92C95A7B7264886B23D651F83B070F6B1FCBA8D5C1267949F6CFE0ECB0BBDBF239188E8FB6DA96AD382D6D180D732191BD95E8AD41696D6C3286144EE8EA2FE5E1012C2D608D53B43067FDEAE2F71D809FB4493A6ED6321F83B0B9E424D163D06DBF0ABB1A37328F9BF9FC1432885C3F268F96E7198A8F8478A02A88223B8284FD8655874B894C9A5790C718235004E978754CA181560083B41ABEE0ED8DD02D10E45FB5767EA2AFB0EB9C3A4D09D751FBAC361EBA0824B862A9966067AEBC9973F2F8D7932E7E5F1AF265CFCBE3470EBA3B747C6BC9973F2F8D7932E7E5F1AF265CFCBE352585C448CEDA390199D7D75958DC5FCC2281733BC9D8A3B4D61B835AE1CA0801E5CB5C87FAE76BEC3CEC5E5C630C7E5E1B92F013EB2A9D1F81D55363E2FACE5B6BC80124741D3730D9A8F5D8579F7EE75179E8D2F77ADB0B19B10B858621F166DCA3B6ACACA0B080430AE4379DEC7B4F12AE54403596672A0A0730A7650AC80A65DE2A68A39E278A45CD1810455E5B3D9DD4D03ED46C81ED1B8F5D8579F7EE75174ACF6F22A8CC95D429E2953EFA30FA8EB2D717B8B180C56C91A127367CB3626AC7CB58C49E952AC40F4DF32A3F4032CCD5BC096D0AC4849037B1CC9F89340E6298EAA41BF9CE35D29CC531C87170AE0097504E079C42A7EABCE830FB7922476D2CCA8275D380AEC06E279F8579F7EE750CCA8A598E406D3492C337DC756ABAC392405A11A2FD9B8D105490464475584618D895CE89D5126B76FEAA28A382358E350A8A3200710245664D5C7DA42AFD9F473CF5E953627768CCA74330723AAADEEEFEE4318C47D1CB3CC6559E2BD9154F7F7B6F218E4080E5D9505FDF5C49C9C623CF2CF58A018C634F2D2D119E5DB5991C579880C3E48CCEBFE8B9CB941EA1F9876570A024D616F323061CAEA23582181E75AFA3C5DC15279C7EF1E7E15E7DFB9D45E7A34BDDA04A90549046C22AC2ECDC2947FBE078D6290052B301B7537556B3DA603864226D72C8BA6506D24D60F7F738924B3C88A91E968C6A36EADA49E31A88E2B8C3EDEE1F4D8303BF2DF4F2C3629C8C0A33DFBFC696F6E14E65F3F811452DB1251A608751B8EBAB6B486D41E4C6B3B49DB44E438EF6D52F6D6581BD61A8F61DC69A6B88A392D198840FAD0EE65E6261711556E51B5806BC9517BC6A8D0468A80EA000A6C2E26627946D673AF2545EF1AA5411CAE8362B11CDC2BCFBF73A8BCF4697BBC562C56EE2CB79CAB1000DA49F0C8F52A406048CC67AC55CDC4B7533CD2B66CC7C3E02B0CB7FB2D85B45BC4609FA9D679887755D5C081357DF3B2892492759359D23B230653911504CB3C61C6DDE3B0D39DDCCE11DB08312660354AA1FF005D8798312B95000D1D400D95E53BAF97C2A1732431BB6D2A09A7C4AE55D80D1D448D95E53BAF97C29DCC8ECEDB49CCF370AF3EFDCEA2F3D1A5EEF161B0979F9423527F3589C812DF477B1EAAD63E5AE608FDB9557C4F34B6802C760049A96569A42EDC59664F1594A639747736AE6F0B22CE2B5972D8CCBE3AF9D6BE8F1770549E71FBC79F8579F7EE751728D2412228CC91AAA2C2E562395214789A448ADE2C864AA2AF2E4DCCA48FBA3528EAB0919E2767FF00796B11BF8EC20E51B5BB1D145ED279930CE2907CA78F23C51E7CA265B748732CEFE3B979616E8CD1310E9FD8F8570A4678721EC9D7F83CE8F1292345408B9280298E9331ED39F3F0AF3EFDCEA24758919DB60199A7C56103A08CDFB55C5DCB707A4725DCA3ABC31B4311B46FF327EE6B17BD3798B2A83D08A408BE3ACF3668CC52152356E3F0E659C04B09586A1B3998D4B2586362E2139368237D77106B1FBC8EEF08B4963D924A0E5D9929CFAEC2BCFBF73A8BCF4697BBD6A3147575DAA411FA52B9120727321B3A92448A3695CE48ABA44FC2A0956782299763A2B0FD467C7246928C9C674D603D57F115F607F6C547651A1CD8E91FDB9BC2760D89E5ECC4A3FBA33C8D02404F415D9C7D5BAEC2BCFBF73A8BCF4697BBD7E217BCA707217075CA1233F51B7F8AC026E5B0AB7ED4050FE87A97BBE4B128ED98EA921257BCA73E2C4EE05D5FDCCC0E60B900FC1750EBD5994E6AC47D0D72D37BC6F135CB4DEF1BC4D72D37BC6F135CB4DEF1BC4D72D37BC6F135CB4DEF1BC4D72D37BC6F13465948C8BB11F53D78BB26C1ACDB6098489E04115C14BA00CF6A4EDC9D7F83C4B38376F6FBC42B2789239FC21BA68317B59136C28A7F7272AC62FD6DB0D6951BA52A811FFC8679FE516774F657515C26D46D63B45432C73C492C6D9A38041A9AE390E1242AC754B6E13F7247125CC6F3CB003D38C2961F06E27654567639050493F014AC180652082330471635372F8A5CB03A83688FF8EAAB9BD96EA2B689FEEC31E801FDFE5380E302CDBECD70DFE931CD5BD83FFCAE13868EF2D2E50EB318D161DAA73FEEAC6ED2F6D229D7D61AC7611A88AC4EF64C3F840671B0040C3B548A8A449A349636CD1802A7B41AC44E8E1F787FC127F15C19C4B9443632B7494131F77B2AEE75B5B69A66F5109A662CC598E649CC9FCADEE67920481DF4911B34CFD5CF70F85707F14165398266CA290EDF65BB6B8509A388237B508FD89AE0E62A216165337418E719EC3D9588AE9585D8ED824FE2A09E4B69A39A339323022B1FC4D27C36D8447CFF00488EC0BBBC7F2E9EF25B98608E5D6620555B7E89DC78B0AC712784D9DE3E44A15590EC39EE6A208391A2490012721B3FDBAFFFD9, 1, 0, CAST(N'2021-10-21' AS Date), 1, 77)
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
SET IDENTITY_INSERT [dbo].[user_roles] ON 

INSERT [dbo].[user_roles] ([id], [user_id], [policy_id]) VALUES (1, 1, 15)
INSERT [dbo].[user_roles] ([id], [user_id], [policy_id]) VALUES (2, 2, 14)
INSERT [dbo].[user_roles] ([id], [user_id], [policy_id]) VALUES (3, 3, 13)
INSERT [dbo].[user_roles] ([id], [user_id], [policy_id]) VALUES (4, 4, 16)
SET IDENTITY_INSERT [dbo].[user_roles] OFF
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
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_failed_attempts]  DEFAULT ((0)) FOR [failed_attempts]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_language_id]  DEFAULT ((1)) FOR [language_id]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[user_views] ADD  CONSTRAINT [DF_user_views_finished]  DEFAULT ((0)) FOR [finished]
GO
ALTER TABLE [dbo].[user_views] ADD  CONSTRAINT [DF_user_views_qualification]  DEFAULT ((0)) FOR [qualification]
GO
ALTER TABLE [dbo].[user_tags] ADD  CONSTRAINT [DF_user_tags_finished]  DEFAULT ((0)) FOR [finished]
GO
ALTER TABLE [dbo].[user_tags] ADD  CONSTRAINT [DF_user_tags_qualification]  DEFAULT ((0)) FOR [qualification]
GO
ALTER TABLE [dbo].[user_tags] ADD  CONSTRAINT [DF_user_tags_views]  DEFAULT ((1)) FOR [views]
GO
USE [master]
GO
ALTER DATABASE [myNews] SET  READ_WRITE 
GO
