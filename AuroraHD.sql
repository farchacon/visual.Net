USE [master]
GO
/****** Object:  Database [AuroraHD]    Script Date: 27/07/2018 01:54:59 p.m. ******/
CREATE DATABASE [AuroraHD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AuroraHD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AuroraHD.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AuroraHD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AuroraHD_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AuroraHD] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AuroraHD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AuroraHD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AuroraHD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AuroraHD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AuroraHD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AuroraHD] SET ARITHABORT OFF 
GO
ALTER DATABASE [AuroraHD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AuroraHD] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AuroraHD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AuroraHD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AuroraHD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AuroraHD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AuroraHD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AuroraHD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AuroraHD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AuroraHD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AuroraHD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AuroraHD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AuroraHD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AuroraHD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AuroraHD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AuroraHD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AuroraHD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AuroraHD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AuroraHD] SET RECOVERY FULL 
GO
ALTER DATABASE [AuroraHD] SET  MULTI_USER 
GO
ALTER DATABASE [AuroraHD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AuroraHD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AuroraHD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AuroraHD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [AuroraHD]
GO
/****** Object:  Table [dbo].[AHD_Casos]    Script Date: 27/07/2018 01:54:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AHD_Casos](
	[Codigo_Caso] [int] IDENTITY(1,1) NOT NULL,
	[Serial_Caso] [char](10) NOT NULL,
	[Diagnostico_Caso] [nvarchar](100) NOT NULL,
	[Prioridad_Caso] [char](10) NULL,
	[Status_Caso] [bit] NOT NULL,
	[Solucion_Caso] [nvarchar](1000) NULL,
	[Fecha_Creacion_INS] [datetime] NOT NULL,
	[Fecha_Atencion] [datetime] NOT NULL,
	[Fecha_UPD] [datetime] NOT NULL,
	[Fecha_Solucion] [datetime] NOT NULL,
	[Codigo_Empleado] [int] NULL,
 CONSTRAINT [PK_AHD_Casos] PRIMARY KEY CLUSTERED 
(
	[Codigo_Caso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AHD_Componentes]    Script Date: 27/07/2018 01:54:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AHD_Componentes](
	[Codigo_Componente] [int] IDENTITY(1,1) NOT NULL,
	[Serial_Componente] [char](10) NULL,
	[Grupo_Componente] [varchar](50) NOT NULL,
	[Descripcion_Componente] [nvarchar](100) NOT NULL,
	[Condicion_Componente] [varchar](50) NULL,
	[Numero_Insumo_Componente] [smallint] NULL,
	[Serial_Fabrica_Componente] [nvarchar](50) NULL,
	[Marca_Fabrica_Componente] [nvarchar](50) NULL,
	[Codigo_Configuracion] [int] NULL,
 CONSTRAINT [PK_AHD_Componentes] PRIMARY KEY CLUSTERED 
(
	[Codigo_Componente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AHD_Configuraciones]    Script Date: 27/07/2018 01:54:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AHD_Configuraciones](
	[Codigo_Configuracion] [int] NOT NULL,
	[Serial_Configuracion] [char](10) NOT NULL,
	[Descripcion_Configuracion] [nvarchar](500) NOT NULL,
	[Fecha_INS] [datetime] NULL,
	[Usuario_INS] [nchar](10) NULL,
	[Fecha_UPD] [datetime] NULL,
	[Usuario_UPD] [nchar](10) NULL,
	[Grupo_Configuracion] [varchar](15) NOT NULL,
	[Codigo_Caso] [int] NULL,
 CONSTRAINT [PK_AHD_Mantenimientos] PRIMARY KEY CLUSTERED 
(
	[Codigo_Configuracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AHD_Departamentos]    Script Date: 27/07/2018 01:54:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AHD_Departamentos](
	[Codigo_Departamento] [int] IDENTITY(1,1) NOT NULL,
	[Serial_Departamento] [char](10) NOT NULL,
	[Nombre_Departamento] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AHD_Departamentos] PRIMARY KEY CLUSTERED 
(
	[Codigo_Departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AHD_Empleados]    Script Date: 27/07/2018 01:54:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AHD_Empleados](
	[Codigo_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[Serial_Empleado] [char](10) NOT NULL,
	[Nombre_Empleado] [nvarchar](50) NOT NULL,
	[Apellido_Empleado] [nvarchar](50) NOT NULL,
	[Cargo_Empleado] [varchar](50) NOT NULL,
	[Area_Empleado] [varchar](25) NULL,
	[Telefono_Empleado] [nchar](10) NULL,
	[Direccion_Empleado] [nvarchar](100) NULL,
	[Status_Empleado] [bit] NOT NULL,
	[Codigo_Departamento] [int] NULL,
 CONSTRAINT [PK_AHD_Contratados] PRIMARY KEY CLUSTERED 
(
	[Codigo_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AHD_Nivel_Usuarios]    Script Date: 27/07/2018 01:54:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AHD_Nivel_Usuarios](
	[Codigo_Nivel_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Serial_Nivel_Usuario] [char](10) NOT NULL,
	[Descripcion_Nivel_Usuario] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AHD_Nivel_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Codigo_Nivel_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AHD_Solicitudes]    Script Date: 27/07/2018 01:54:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AHD_Solicitudes](
	[Codigo_Solicitud] [int] IDENTITY(1,1) NOT NULL,
	[Serial_Solicitud] [char](10) NOT NULL,
	[Descripcion_Solicitud] [nvarchar](1000) NOT NULL,
	[Fecha_INS] [datetime] NOT NULL,
	[Fecha_UPD] [datetime] NOT NULL,
	[Usuario_INS] [nvarchar](50) NOT NULL,
	[Usuario_UPD] [nvarchar](50) NOT NULL,
	[Codigo_Usuario] [int] NULL,
	[Codigo_Departamento] [int] NULL,
 CONSTRAINT [PK_AHD_Solicitudes] PRIMARY KEY CLUSTERED 
(
	[Codigo_Solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AHD_Usuarios]    Script Date: 27/07/2018 01:54:59 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AHD_Usuarios](
	[Codigo_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[User_Usuario] [nvarchar](10) NOT NULL,
	[Pass_Usuario] [nvarchar](10) NOT NULL,
	[Nombre_Usuario] [nvarchar](50) NOT NULL,
	[Apellido_Usuario] [nvarchar](50) NOT NULL,
	[Correo_Usuario] [nvarchar](100) NULL,
	[Status_Usuario] [bit] NOT NULL,
	[Codigo_Departamento] [int] NULL,
	[Codigo_Nivel_Usuario] [int] NULL,
 CONSTRAINT [PK_AHD_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Codigo_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AHD_Casos]  WITH CHECK ADD  CONSTRAINT [FK_AHD_Casos_AHD_Empleados] FOREIGN KEY([Codigo_Empleado])
REFERENCES [dbo].[AHD_Empleados] ([Codigo_Empleado])
GO
ALTER TABLE [dbo].[AHD_Casos] CHECK CONSTRAINT [FK_AHD_Casos_AHD_Empleados]
GO
ALTER TABLE [dbo].[AHD_Casos]  WITH CHECK ADD  CONSTRAINT [FK_AHD_Casos_AHD_Solicitudes] FOREIGN KEY([Codigo_Caso])
REFERENCES [dbo].[AHD_Solicitudes] ([Codigo_Solicitud])
GO
ALTER TABLE [dbo].[AHD_Casos] CHECK CONSTRAINT [FK_AHD_Casos_AHD_Solicitudes]
GO
ALTER TABLE [dbo].[AHD_Componentes]  WITH CHECK ADD  CONSTRAINT [FK_AHD_Componentes_AHD_Configuraciones] FOREIGN KEY([Codigo_Configuracion])
REFERENCES [dbo].[AHD_Configuraciones] ([Codigo_Configuracion])
GO
ALTER TABLE [dbo].[AHD_Componentes] CHECK CONSTRAINT [FK_AHD_Componentes_AHD_Configuraciones]
GO
ALTER TABLE [dbo].[AHD_Configuraciones]  WITH CHECK ADD  CONSTRAINT [FK_AHD_Configuraciones_AHD_Casos] FOREIGN KEY([Codigo_Caso])
REFERENCES [dbo].[AHD_Casos] ([Codigo_Caso])
GO
ALTER TABLE [dbo].[AHD_Configuraciones] CHECK CONSTRAINT [FK_AHD_Configuraciones_AHD_Casos]
GO
ALTER TABLE [dbo].[AHD_Empleados]  WITH CHECK ADD  CONSTRAINT [FK_AHD_Contratados_AHD_Departamentos] FOREIGN KEY([Codigo_Departamento])
REFERENCES [dbo].[AHD_Departamentos] ([Codigo_Departamento])
GO
ALTER TABLE [dbo].[AHD_Empleados] CHECK CONSTRAINT [FK_AHD_Contratados_AHD_Departamentos]
GO
ALTER TABLE [dbo].[AHD_Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_AHD_Solicitudes_AHD_Departamentos] FOREIGN KEY([Codigo_Departamento])
REFERENCES [dbo].[AHD_Departamentos] ([Codigo_Departamento])
GO
ALTER TABLE [dbo].[AHD_Solicitudes] CHECK CONSTRAINT [FK_AHD_Solicitudes_AHD_Departamentos]
GO
ALTER TABLE [dbo].[AHD_Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_AHD_Solicitudes_AHD_Usuarios] FOREIGN KEY([Codigo_Usuario])
REFERENCES [dbo].[AHD_Usuarios] ([Codigo_Usuario])
GO
ALTER TABLE [dbo].[AHD_Solicitudes] CHECK CONSTRAINT [FK_AHD_Solicitudes_AHD_Usuarios]
GO
ALTER TABLE [dbo].[AHD_Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_AHD_Usuarios_AHD_Departamentos] FOREIGN KEY([Codigo_Departamento])
REFERENCES [dbo].[AHD_Departamentos] ([Codigo_Departamento])
GO
ALTER TABLE [dbo].[AHD_Usuarios] CHECK CONSTRAINT [FK_AHD_Usuarios_AHD_Departamentos]
GO
ALTER TABLE [dbo].[AHD_Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_AHD_Usuarios_AHD_Nivel_Usuarios] FOREIGN KEY([Codigo_Nivel_Usuario])
REFERENCES [dbo].[AHD_Nivel_Usuarios] ([Codigo_Nivel_Usuario])
GO
ALTER TABLE [dbo].[AHD_Usuarios] CHECK CONSTRAINT [FK_AHD_Usuarios_AHD_Nivel_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [AuroraHD] SET  READ_WRITE 
GO
