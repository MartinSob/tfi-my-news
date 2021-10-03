USE [master]
GO
/****** Object:  Database [myNews]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[backups]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[bitacore]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[controls]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[dvv]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[employees]    Script Date: 2021-09-22 20:35:56 ******/
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
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[languages]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[policies]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[post_tags]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[posts]    Script Date: 2021-09-22 20:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[body] [varchar](max) NULL,
	[image] [varchar](max) NULL,
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
/****** Object:  Table [dbo].[roles]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[tags]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[user_roles]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[user_tags]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[user_views]    Script Date: 2021-09-22 20:35:56 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 2021-09-22 20:35:56 ******/
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
SET IDENTITY_INSERT [dbo].[controls] ON 

INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (1, 1, N'action', N'Action')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (2, 2, N'action', N'Acción')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (3, 1, N'add', N'Add')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (4, 2, N'add', N'Agregar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (5, 1, N'admin', N'Admin')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (6, 2, N'admin', N'Admin')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (7, 1, N'already_registered', N'The username or mail is already registered.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (8, 2, N'already_registered', N'El nombre o mail del usuario ya esta registrado.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (9, 1, N'backup', N'Backup')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (10, 2, N'backup', N'Copia de seguridad')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (11, 1, N'backup_description', N'Use this to create a new backup file with all the data gathered to the date.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (12, 2, N'backup_description', N'Usa esto para crear un archivo de seguridad con todos los datos hasta la fecha.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (13, 1, N'backup_error', N'There was an error creating the backup.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (14, 2, N'backup_error', N'Hubo un error creando la copia.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (15, 1, N'backup_success', N'The backup was created successfuly.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (16, 2, N'backup_success', N'La copia fue creada correctamente.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (17, 1, N'basic_role_delete', N'The basic role cannot be deleted.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (18, 2, N'basic_role_delete', N'El rol básico no se puede eliminar.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (19, 1, N'bitacore', N'Bitacore')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (20, 2, N'bitacore', N'Bitácora')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (21, 1, N'cancel', N'Cancel')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (22, 2, N'cancel', N'Cancelar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (23, 1, N'circular_role', N'One of the roles selected contains this role as policy, making a circular policy. ')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (24, 2, N'circular_role', N'Uno de los roles seleccionados tiene este rol como política, haciendo una referencia circular.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (25, 1, N'complete_data', N'Complete the necessary fields.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (26, 2, N'complete_data', N'Complete los campos necesarios.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (27, 1, N'confirm_password', N'Confirm password')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (28, 2, N'confirm_password', N'Confirmar contraseña')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (29, 1, N'create', N'Create')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (30, 2, N'create', N'Crear')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (31, 1, N'date', N'Date')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (32, 2, N'date', N'Fecha')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (33, 1, N'delete_confirmation', N'Are you sure you want to delete it?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (34, 2, N'delete_confirmation', N'¿Estás seguro/a que quiere eliminar?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (35, 1, N'delete_myself', N'You cannot delete the user you are using.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (36, 2, N'delete_myself', N'No se puede eliminar el usuario que está usando.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (37, 1, N'description', N'Description')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (38, 2, N'description', N'Descripción')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (39, 1, N'email', N'Email')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (40, 2, N'email', N'Email')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (41, 1, N'employees', N'Employees')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (42, 2, N'employees', N'Empleados')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (43, 1, N'error', N'There was an error.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (44, 2, N'error', N'Hubo un error.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (45, 1, N'errors', N'Errors')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (46, 2, N'errors', N'Errores')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (47, 1, N'error_try_again', N'There was an error. Try again later.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (48, 2, N'error_try_again', N'Hubo un error. Intente nuevamente más tarde.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (49, 1, N'forgot_pass', N'Forgot password?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (50, 2, N'forgot_pass', N'¿Has olvidado la contraseña?')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (51, 1, N'from', N'From')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (52, 2, N'from', N'Desde')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (53, 1, N'home', N'Home')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (54, 2, N'home', N'Principal')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (55, 1, N'language', N'Language')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (56, 2, N'language', N'Idioma')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (57, 1, N'lastname', N'Lastname')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (58, 2, N'lastname', N'Apellido')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (59, 1, N'login', N'Login')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (60, 2, N'login', N'Iniciar sesión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (61, 1, N'login_caption', N'Best place to read your news.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (62, 2, N'login_caption', N'El mejor lugar para enterarte de las noticias.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (63, 1, N'login_failed', N'The username or password are not correct.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (64, 2, N'login_failed', N'El nombre de usuario o contraseña no son correctos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (65, 1, N'logout', N'Logout')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (66, 2, N'logout', N'Cerrar sesión')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (67, 1, N'mail', N'Mail')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (68, 2, N'mail', N'Correo')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (69, 1, N'name', N'Name')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (70, 2, N'name', N'Nombre')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (71, 1, N'password', N'Password')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (72, 2, N'password', N'Contraseña')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (73, 1, N'password_different', N'The passwords do not match.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (74, 2, N'password_different', N'Las contraseñas no coinciden.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (75, 1, N'password_reset', N'Password reset')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (76, 2, N'password_reset', N'Cambio de contraseña')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (77, 1, N'password_reset_error', N'There was a problem creating the new password.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (78, 2, N'password_reset_error', N'Hubo un problema generando la nueva contraseña.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (79, 1, N'password_reset_success', N'An email was sent with the new password.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (80, 2, N'password_reset_success', N'Se ha enviado un correo con la nueva contraseña.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (81, 1, N'permits', N'Permits')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (82, 2, N'permits', N'Permisos')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (83, 1, N'profile', N'Profile')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (84, 2, N'profile', N'Perfil')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (85, 1, N'reports', N'Reports')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (86, 2, N'reports', N'Reportes')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (87, 1, N'restore', N'Restore')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (88, 2, N'restore', N'Restauración')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (89, 1, N'restore_error', N'There was an error with the restore.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (90, 2, N'restore_error', N'Hubo un error con la restauración.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (91, 1, N'restore_description', N'Use this to restore the data from a backup file created before.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (92, 2, N'restore_description', N'Usa esto para restaurar una copia de seguridad.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (93, 1, N'restore_success', N'The restore was successful.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (94, 2, N'restore_success', N'La restauración fue exitosa.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (95, 1, N'signup', N'Sign up')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (96, 2, N'signup', N'Crear cuenta')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (97, 1, N'success', N'Success!')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (98, 2, N'success', N'¡Exitoso!')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (99, 1, N'text', N'Text')
GO
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (100, 2, N'text', N'Texto')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (101, 1, N'title', N'Title')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (102, 2, N'title', N'Título')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (103, 1, N'to', N'To')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (104, 2, N'to', N'Hasta')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (105, 1, N'type', N'Type')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (106, 2, N'type', N'Tipo')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (107, 1, N'update', N'Update')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (108, 2, N'update', N'Actualizar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (109, 1, N'user', N'User')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (110, 2, N'user', N'Usuario')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (111, 1, N'username', N'Username')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (112, 2, N'username', N'Nombre de usuario')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (113, 1, N'users', N'Users')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (114, 2, N'users', N'Usuarios')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (115, 1, N'user_create_error', N'There was a problem creating the user.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (116, 2, N'user_create_error', N'Hubo un problema creando el usuario.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (117, 1, N'user_create_success', N'User created successfuly.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (118, 2, N'user_create_success', N'Usuario creado correctamente.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (119, 1, N'validate', N'Validate')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (120, 2, N'validate', N'Validar')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (121, 1, N'vd', N'Verifying digit')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (122, 2, N'vd', N'Dígito verificador')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (123, 1, N'vd_description', N'Use this to validate the integrity of the database.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (124, 2, N'vd_description', N'Usa esto para validar la integridad de la base de datos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (125, 1, N'vd_problems', N'There are problems with the VD.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (126, 2, N'vd_problems', N'Hay problemas con los DV.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (127, 1, N'vd_valid_update_success', N'The VD were updated successfuly.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (128, 2, N'vd_valid_update_success', N'Los DV fueron actualizados.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (129, 1, N'vd_valid_update_error', N'There was an error updating the VD.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (130, 2, N'vd_valid_update_error', N'Hubo un problema actualizando los DV.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (131, 1, N'vd_valid', N'The VD are valid.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (132, 2, N'vd_valid', N'Los DV son válidos.')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (133, 1, N'writer', N'Writer')
INSERT [dbo].[controls] ([id], [language_id], [tag], [text]) VALUES (134, 2, N'writer', N'Escritor')
SET IDENTITY_INSERT [dbo].[controls] OFF
GO
SET IDENTITY_INSERT [dbo].[dvv] ON 

INSERT [dbo].[dvv] ([id], [table_name], [dvv]) VALUES (1, N'users', N'-1803270082')
SET IDENTITY_INSERT [dbo].[dvv] OFF
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
INSERT [dbo].[policies] ([id], [name], [deleted]) VALUES (4, N'post_search', 0)
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
SET IDENTITY_INSERT [dbo].[roles] OFF
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
ALTER TABLE [dbo].[policies] ADD  CONSTRAINT [DF_policies_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[languages] ADD  CONSTRAINT [DF_languages_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_failed_attempts]  DEFAULT ((0)) FOR [failed_attempts]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_language_id]  DEFAULT ((1)) FOR [language_id]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_deleted]  DEFAULT ((0)) FOR [deleted]
GO
USE [master]
GO
ALTER DATABASE [myNews] SET  READ_WRITE 
GO
