USE [master]
GO
/****** Object:  Database [CRM]    Script Date: 25/11/2019 8:11:37 ******/
CREATE DATABASE [CRM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CRM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CRM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CRM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRM] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRM] SET RECOVERY FULL 
GO
ALTER DATABASE [CRM] SET  MULTI_USER 
GO
ALTER DATABASE [CRM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CRM', N'ON'
GO
ALTER DATABASE [CRM] SET QUERY_STORE = OFF
GO
USE [CRM]
GO
/****** Object:  UserDefinedFunction [dbo].[p_verificacionLogin]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[p_verificacionLogin]
(@p_contra varchar(30)
) returns varchar(30)
as
begin
 return CONVERT(VARCHAR(30), HashBytes('MD5', @p_contra), 2);
end;
GO
/****** Object:  Table [dbo].[tblActividad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActividad](
	[idActividad] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Hora] [datetime] NULL,
	[Descripcion] [varchar](200) NULL,
	[idMedio] [int] NULL,
	[idOportunidad] [int] NULL,
 CONSTRAINT [PK_tblActividad] PRIMARY KEY CLUSTERED 
(
	[idActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCiudad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCiudad](
	[idCiudad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[idPais] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCliente]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](100) NULL,
	[correo] [text] NULL,
	[Telefono] [int] NULL,
	[celular] [int] NULL,
	[Direccion] [varchar](300) NULL,
	[idCiudad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpresa]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpresa](
	[empresaId] [int] IDENTITY(10,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[UsuarioId] [int] NOT NULL,
	[telefono] [int] NULL,
	[email] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[empresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLineaNegocio]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLineaNegocio](
	[idLineaNegocio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [text] NULL,
	[empresaId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLineaNegocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMedio]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedio](
	[idMedio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
 CONSTRAINT [PK_tblMedio] PRIMARY KEY CLUSTERED 
(
	[idMedio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOportunidad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOportunidad](
	[idOportunidad] [int] IDENTITY(1,1) NOT NULL,
	[idLineadeNegocio] [int] NULL,
	[idProducto] [int] NULL,
	[Descripcion] [varchar](200) NULL,
	[fechaHora] [datetime] NULL,
	[idOrigen] [int] NULL,
	[idCliente] [int] NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_tblOportunidad] PRIMARY KEY CLUSTERED 
(
	[idOportunidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrigen]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrigen](
	[idOrigen] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
 CONSTRAINT [PK_tblOrigen] PRIMARY KEY CLUSTERED 
(
	[idOrigen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPais]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPais](
	[idPais] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermisos]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPermisos](
	[idPermisos] [int] IDENTITY(1,1) NOT NULL,
	[Permiso] [varchar](50) NULL,
	[Rol_Permiso] [int] NULL,
 CONSTRAINT [PK_tblPermisos2] PRIMARY KEY CLUSTERED 
(
	[idPermisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducto]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [text] NULL,
	[lineaNegocioId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRol]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [varchar](50) NULL,
 CONSTRAINT [PK_tblRol2] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRolUsuarioEmpresa]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRolUsuarioEmpresa](
	[idRolUsuarioEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[RolUsuarioEmpresa] [varchar](50) NULL,
	[Rol_RolUsuarioEmpresa] [int] NULL,
 CONSTRAINT [PK_tblRolUsuarioEmpresa2] PRIMARY KEY CLUSTERED 
(
	[idRolUsuarioEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [int] NULL,
	[Usuario] [text] NULL,
	[Contrasena] [varchar](30) NULL,
	[CodigoConfirmacion] [varchar](10) NULL,
	[activa] [bit] NULL,
	[correo] [text] NULL,
	[celular] [text] NULL,
 CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuarioEmpresa]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarioEmpresa](
	[idUsuarioEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [int] NOT NULL,
	[Empresa] [int] NOT NULL,
 CONSTRAINT [PK_tblUsuarioEmpresa2] PRIMARY KEY CLUSTERED 
(
	[idUsuarioEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCiudad]  WITH CHECK ADD FOREIGN KEY([idPais])
REFERENCES [dbo].[tblPais] ([idPais])
GO
ALTER TABLE [dbo].[tblCiudad]  WITH CHECK ADD FOREIGN KEY([idPais])
REFERENCES [dbo].[tblPais] ([idPais])
GO
ALTER TABLE [dbo].[tblCiudad]  WITH CHECK ADD FOREIGN KEY([idPais])
REFERENCES [dbo].[tblPais] ([idPais])
GO
ALTER TABLE [dbo].[tblCliente]  WITH CHECK ADD FOREIGN KEY([idCiudad])
REFERENCES [dbo].[tblCiudad] ([idCiudad])
GO
ALTER TABLE [dbo].[tblCliente]  WITH CHECK ADD FOREIGN KEY([idCiudad])
REFERENCES [dbo].[tblCiudad] ([idCiudad])
GO
ALTER TABLE [dbo].[tblCliente]  WITH CHECK ADD FOREIGN KEY([idCiudad])
REFERENCES [dbo].[tblCiudad] ([idCiudad])
GO
ALTER TABLE [dbo].[tblEmpresa]  WITH CHECK ADD  CONSTRAINT [Fk_tblEmpresa_tblUsuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[tblUsuario] ([idUsuario])
GO
ALTER TABLE [dbo].[tblEmpresa] CHECK CONSTRAINT [Fk_tblEmpresa_tblUsuario]
GO
ALTER TABLE [dbo].[tblLineaNegocio]  WITH CHECK ADD  CONSTRAINT [Fk_tblLineaNegocio_tblEmpresa] FOREIGN KEY([empresaId])
REFERENCES [dbo].[tblEmpresa] ([empresaId])
GO
ALTER TABLE [dbo].[tblLineaNegocio] CHECK CONSTRAINT [Fk_tblLineaNegocio_tblEmpresa]
GO
ALTER TABLE [dbo].[tblOportunidad]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[tblCliente] ([idCliente])
GO
ALTER TABLE [dbo].[tblOportunidad]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[tblCliente] ([idCliente])
GO
ALTER TABLE [dbo].[tblOportunidad]  WITH CHECK ADD FOREIGN KEY([idLineadeNegocio])
REFERENCES [dbo].[tblLineaNegocio] ([idLineaNegocio])
GO
ALTER TABLE [dbo].[tblOportunidad]  WITH CHECK ADD FOREIGN KEY([idLineadeNegocio])
REFERENCES [dbo].[tblLineaNegocio] ([idLineaNegocio])
GO
ALTER TABLE [dbo].[tblOportunidad]  WITH CHECK ADD FOREIGN KEY([idOrigen])
REFERENCES [dbo].[tblOrigen] ([idOrigen])
GO
ALTER TABLE [dbo].[tblOportunidad]  WITH CHECK ADD FOREIGN KEY([idOrigen])
REFERENCES [dbo].[tblOrigen] ([idOrigen])
GO
ALTER TABLE [dbo].[tblOportunidad]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[tblProducto] ([idProducto])
GO
ALTER TABLE [dbo].[tblOportunidad]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[tblProducto] ([idProducto])
GO
ALTER TABLE [dbo].[tblOportunidad]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[tblUsuario] ([idUsuario])
GO
ALTER TABLE [dbo].[tblOportunidad]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[tblUsuario] ([idUsuario])
GO
ALTER TABLE [dbo].[tblPermisos]  WITH CHECK ADD  CONSTRAINT [FK_tblPermisos_tblRol] FOREIGN KEY([Rol_Permiso])
REFERENCES [dbo].[tblRol] ([idRol])
GO
ALTER TABLE [dbo].[tblPermisos] CHECK CONSTRAINT [FK_tblPermisos_tblRol]
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD FOREIGN KEY([lineaNegocioId])
REFERENCES [dbo].[tblLineaNegocio] ([idLineaNegocio])
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD FOREIGN KEY([lineaNegocioId])
REFERENCES [dbo].[tblLineaNegocio] ([idLineaNegocio])
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD FOREIGN KEY([lineaNegocioId])
REFERENCES [dbo].[tblLineaNegocio] ([idLineaNegocio])
GO
ALTER TABLE [dbo].[tblRolUsuarioEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_tblRolUsuarioEmpresa_tblRol] FOREIGN KEY([Rol_RolUsuarioEmpresa])
REFERENCES [dbo].[tblRol] ([idRol])
GO
ALTER TABLE [dbo].[tblRolUsuarioEmpresa] CHECK CONSTRAINT [FK_tblRolUsuarioEmpresa_tblRol]
GO
ALTER TABLE [dbo].[tblRolUsuarioEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_tblRolUsuarioEmpresa_tblUsuarioEmpresa] FOREIGN KEY([Rol_RolUsuarioEmpresa])
REFERENCES [dbo].[tblUsuarioEmpresa] ([idUsuarioEmpresa])
GO
ALTER TABLE [dbo].[tblRolUsuarioEmpresa] CHECK CONSTRAINT [FK_tblRolUsuarioEmpresa_tblUsuarioEmpresa]
GO
ALTER TABLE [dbo].[tblUsuarioEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioEmpresa_tblEmpresa] FOREIGN KEY([Empresa])
REFERENCES [dbo].[tblEmpresa] ([empresaId])
GO
ALTER TABLE [dbo].[tblUsuarioEmpresa] CHECK CONSTRAINT [FK_tblUsuarioEmpresa_tblEmpresa]
GO
ALTER TABLE [dbo].[tblUsuarioEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioEmpresa_tblUsuario] FOREIGN KEY([Usuario])
REFERENCES [dbo].[tblUsuario] ([idUsuario])
GO
ALTER TABLE [dbo].[tblUsuarioEmpresa] CHECK CONSTRAINT [FK_tblUsuarioEmpresa_tblUsuario]
GO
/****** Object:  StoredProcedure [dbo].[pr_deletedActividad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_deletedActividad]  
(  
  @id INT
	
) as BEGIN  
DELETE FROM  
tblActividad
WHERE  
idActividad = @id 
END 
GO
/****** Object:  StoredProcedure [dbo].[pr_deletedCiudad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pr_deletedCiudad]  
(  
  @idCiudad INT
	
) as BEGIN 
DELETE 
FROM tblCiudad 
WHERE idCiudad = @idCiudad END
GO
/****** Object:  StoredProcedure [dbo].[pr_deletedCliente]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pr_deletedCliente]  
(  
  @id INT
	
) as BEGIN 
DELETE 
FROM tblCliente 
WHERE idCliente = @id END

GO
/****** Object:  StoredProcedure [dbo].[pr_deletedEmpresa]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[pr_deletedEmpresa]  
(  
  @id INT
	
) as BEGIN 
DELETE 
FROM tblLineaNegocio 
WHERE idLineaNegocio = @id 


DELETE FROM  
tblEmpresa 
WHERE  
empresaId = @id END
GO
/****** Object:  StoredProcedure [dbo].[pr_deletedLineaNegocio]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[pr_deletedLineaNegocio]  
(  
  @id INT
	
) as BEGIN 
DELETE FROM  
tblProducto 
WHERE  
lineaNegocioId = @id;

DELETE 
FROM tblLineaNegocio 
WHERE idLineaNegocio = @id END
GO
/****** Object:  StoredProcedure [dbo].[pr_deletedLineaNegocioPrueba]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pr_deletedLineaNegocioPrueba]  
(  
  @id INT
	
) as BEGIN 
DELETE FROM  
tblProducto 
WHERE  
lineaNegocioId = @id;

DELETE 
FROM tblLineaNegocio 
WHERE idLineaNegocio = @id END
GO
/****** Object:  StoredProcedure [dbo].[pr_deletedMedio]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_deletedMedio]  
(  
  @id INT
	
) as BEGIN  
DELETE FROM  
tblMedio 
WHERE  
idMedio = @id
END 
GO
/****** Object:  StoredProcedure [dbo].[pr_deletedOportunidad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_deletedOportunidad]  
(  
  @id INT
	
) as BEGIN  
DELETE FROM  
tblOportunidad
WHERE 
idOportunidad = @id 
END 
GO
/****** Object:  StoredProcedure [dbo].[pr_deletedOrigen]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_deletedOrigen]  
(  
  @id INT
	
) as BEGIN  
DELETE FROM  
tblOrigen
WHERE  
idOrigen = @id 
END 
GO
/****** Object:  StoredProcedure [dbo].[pr_deletedPais]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[pr_deletedPais]  
(  
  @id INT
	
) as BEGIN 
DELETE 
FROM tblPais 
WHERE idPais = @id END

GO
/****** Object:  StoredProcedure [dbo].[pr_deletedProducto]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[pr_deletedProducto]  
(  
  @id INT
	
) as BEGIN  
DELETE FROM  
tblProducto 
WHERE  
idProducto = @id END 
GO
/****** Object:  StoredProcedure [dbo].[pr_GetCiudadById]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pr_GetCiudadById]
	@idCiudad INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
	  [nombre]
	FROM [dbo].[tblCiudad]
	WHERE [idCiudad] = @idCiudad

END
GO
/****** Object:  StoredProcedure [dbo].[pr_GetClienteById]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_GetClienteById]
	@intClienteId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
	  [NombreCompleto]
	  ,[correo]
	  ,[Telefono]
	  ,[celular]
	  ,[Direccion]
	  ,[idCiudad]
	FROM [dbo].[tblCliente]
	WHERE [idCliente] = @intClienteId

END
GO
/****** Object:  StoredProcedure [dbo].[pr_GetEmpresaById]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_GetEmpresaById]
	@intEmpresaId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
	  [nombre]
	  ,[Descripcion]
	  ,[UsuarioId]
	  ,[telefono]
	  ,[email]
	FROM [dbo].[tblEmpresa]
	WHERE [empresaId] = @intEmpresaId

END


GO
/****** Object:  StoredProcedure [dbo].[pr_GetLineaNegocioById]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[pr_GetLineaNegocioById]
	@intNegocioId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
	  [nombre]
	  ,[descripcion]
	  ,[empresaId]
	FROM [dbo].[tblLineaNegocio]
	WHERE [idLineaNegocio] = @intNegocioId

END


GO
/****** Object:  StoredProcedure [dbo].[pr_GetOportunidadById]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_GetOportunidadById]
	@intOportunidad	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
	  [idOportunidad]
	  ,[idLineadeNegocio]
	  ,[idProducto]
	  ,[Descripcion]
	  ,[fechaHora]
	  ,[idOrigen]
	  ,[idCliente]
	  ,[idUsuario]
	FROM [dbo].[tblOportunidad]
	WHERE [idOportunidad] = @intOportunidad

END
GO
/****** Object:  StoredProcedure [dbo].[pr_GetOrigenById]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_GetOrigenById]
	@intId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
	  [Nombre]
	FROM [dbo].[tblOrigen]
	WHERE [idOrigen] = @intId

END
GO
/****** Object:  StoredProcedure [dbo].[pr_GetPaisById]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pr_GetPaisById]
	@intId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
	  [nombre]
	FROM [dbo].[tblPais]
	WHERE [idPais] = @intId

END
GO
/****** Object:  StoredProcedure [dbo].[pr_GetProductoById]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ysaias Ceron
-- Create date: 08/11/2019
-- Description:	Obtiene un registro de producto por id
-- =============================================
CREATE PROCEDURE [dbo].[pr_GetProductoById]
	@intProductoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
	  [nombre]
	  ,[descripcion]
	  ,[lineaNegocioId]
	FROM [dbo].[tblProducto]
	WHERE [idProducto] = @intProductoId

END


GO
/****** Object:  StoredProcedure [dbo].[pr_getUsuarioID]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[pr_getUsuarioID] 
	@idUsuario int
AS
BEGIN
	SET NOCOUNT ON;
	select * from tblUsuario where idUsuario = @idUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[pr_InsertarActividad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_InsertarActividad]

@fecha datetime,
@Hora  datetime,
@Decripcion varchar(200),
@idMedio int,
@idOportunidad int


AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblActividad]
           ([Fecha],
		   [Hora],
		   [Descripcion],
		   [idMedio],
		    [idOportunidad]
		   )
     VALUES
	       (@fecha ,
		   @Hora  ,
			@Decripcion ,
			@idMedio ,
			@idOportunidad 
		    );
	
END
GO
/****** Object:  StoredProcedure [dbo].[pr_insertarCiudad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_insertarCiudad] 
	@Nombre varchar(150),
	@idPais Int
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblCiudad]
           ([nombre],
		    [idPais]
		   )
     VALUES
	       (@nombre,
            @idPais
		    );
	
END

GO
/****** Object:  StoredProcedure [dbo].[pr_insertarCliente]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_insertarCliente] 
	@NombreCompleto varchar(50),
	@correo varchar,
	@telefono int,
	@celluar int,
	@direccion varchar(300),
	@idCiudad int
	
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblCliente]
           ([NombreCompleto]
           ,[correo]
           ,[Telefono]
		   ,[celular]
		   ,[Direccion]
		   ,[idCiudad])
     VALUES
	       (@NombreCompleto
           ,@correo
           ,@telefono
		   ,@celluar
		   ,@direccion
		   ,@idCiudad);
	
END

GO
/****** Object:  StoredProcedure [dbo].[pr_insertarCuenta]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[pr_insertarCuenta] 
	@Nombre varchar(100),
	@Direccion text,
	@Telefono int,
	@Usuario text,
	@Contrasena varchar(30),
	@codigoConfirmacion varchar(10),
	@activa bit,
	@Correo text,
	@Celular text
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblUsuario]
           ([Nombre]
           ,[Direccion]
           ,[Telefono]
		   ,[Usuario]
		   ,[Contrasena]
		   ,[codigoConfirmacion]
		   ,[activa]
		   ,[Correo]
		   ,[Celular])
     VALUES
           (@Nombre
           ,@Direccion
           ,@Telefono
           ,@Usuario
		   ,(select [dbo].[p_verificacionLogin](@Contrasena))
		   ,@codigoConfirmacion
		   ,0
		   ,@Correo
		   ,@Celular
		   );
	select Max(idUsuario) as idUsuario from tblUsuario;
END

GO
/****** Object:  StoredProcedure [dbo].[pr_insertarEmpresa]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_insertarEmpresa] 
	@Nombre varchar(50),
	@descripcion varchar(100),
	@telefono int,
	@email varchar(250),
	@UsuarioId int
	
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblEmpresa]
           ([nombre]
           ,[Descripcion]
           ,[UsuarioId]
		   ,[telefono]
		   ,[email])
     VALUES
	       (@Nombre
           ,@descripcion
           ,@UsuarioId
		   ,@telefono
		   ,@email
		    );
	
END

GO
/****** Object:  StoredProcedure [dbo].[pr_insertarLineaNegocio]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_insertarLineaNegocio]                    
       @nombre varchar(50), 
       @descripcion text , 
       @empresaId int 
                     
AS 
BEGIN 
     SET NOCOUNT ON 

    INSERT INTO [dbo].[tblLineaNegocio]
           ([nombre]
           ,[descripcion]
           ,[empresaId])
     VALUES
           (
		   @nombre,
           @descripcion,
           @empresaId
		   
		   );


END 

GO
/****** Object:  StoredProcedure [dbo].[pr_insertarMedio]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_insertarMedio]

	@Nombre varchar(150)


AS
BEGIN

	SET NOCOUNT ON;


	insert into [dbo].[tblMedio]
           ([Nombre]
		   )
     VALUES
	       (@Nombre
        
		    );
	


END
GO
/****** Object:  StoredProcedure [dbo].[pr_InsertarOportunidad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_InsertarOportunidad]

@idLineadeNegocio int,
@idProducto  int,
@Decripcion varchar(200),
@fechaHora datetime,
@idOrigen int,
@idCliente int,
@idUsuario int


AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblOportunidad]
           ([idLineadeNegocio],
		   [idProducto],
		   [Descripcion],
		   [fechaHora],
		   [idOrigen],
		    [idCliente],
			[idUsuario]
		   )
     VALUES
	       (@idLineadeNegocio,
@idProducto  ,
@Decripcion ,
@fechaHora ,
@idOrigen ,
@idCliente ,
@idUsuario 
		    );
	
END
GO
/****** Object:  StoredProcedure [dbo].[pr_InsertarOrigen]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_InsertarOrigen]
			@Nombre varchar


AS
BEGIN


	SET NOCOUNT ON;
	insert into [dbo].[tblOrigen]
           ([nombre]
		   )
     VALUES
	       (@Nombre
		    );


END
GO
/****** Object:  StoredProcedure [dbo].[pr_insertarPais]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_insertarPais] 
	@Nombre varchar(50)
	
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblPais]
           ([nombre]
		   
		   )
     VALUES
	       (@nombre
           
		    );
	
END

GO
/****** Object:  StoredProcedure [dbo].[pr_insertarProducto]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_insertarProducto] 
	@Nombre varchar(50),
	@descripcion text,
	@LineaNegocio_Producto int
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblProducto]([nombre]
           ,[descripcion]
           ,[lineaNegocioId]
		   )
     VALUES
           (@Nombre
           ,@descripcion
           ,@LineaNegocio_Producto
           
		   );
	
END

GO
/****** Object:  StoredProcedure [dbo].[pr_SelectActividad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_SelectActividad]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblActividad;
END
GO
/****** Object:  StoredProcedure [dbo].[pr_SelectCiudad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pr_SelectCiudad]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblCiudad;
END
GO
/****** Object:  StoredProcedure [dbo].[pr_SelectCliente]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pr_SelectCliente]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblCliente;
END
GO
/****** Object:  StoredProcedure [dbo].[pr_SelectEmpresa]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_SelectEmpresa]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblEmpresa;
END
GO
/****** Object:  StoredProcedure [dbo].[Pr_SelectEmpresaByIdUsuario]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Pr_SelectEmpresaByIdUsuario]

	@usuarioId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select * from tblEmpresa where UsuarioId = @usuarioId;   



END
GO
/****** Object:  StoredProcedure [dbo].[pr_SelectLineaNegocio]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_SelectLineaNegocio]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblLineaNegocio;
END
GO
/****** Object:  StoredProcedure [dbo].[Pr_SelectLineaNegocioByIdEmpresa]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_SelectLineaNegocioByIdEmpresa]

	@empresaId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select * from tblLineaNegocio where empresaId = @empresaId;   



END
GO
/****** Object:  StoredProcedure [dbo].[pr_SelectMedio]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_SelectMedio]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblMedio;
END
GO
/****** Object:  StoredProcedure [dbo].[pr_SelectOportunidad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_SelectOportunidad]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblOportunidad;
END
GO
/****** Object:  StoredProcedure [dbo].[pr_SelectOrigen]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Angel Chavez>
-- Create date: <21/10/2019>
-- Description:	<Trae Datos de linea de negocio,,>
-- =============================================
create PROCEDURE [dbo].[pr_SelectOrigen]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblOrigen;
END
GO
/****** Object:  StoredProcedure [dbo].[pr_SelectPais]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pr_SelectPais]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblPais;
END
GO
/****** Object:  StoredProcedure [dbo].[pr_SelectProducto]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Angel Chavez>
-- Create date: <21/10/2019>
-- Description:	<Trae Datos de linea de negocio,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_SelectProducto]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblProducto;
END
GO
/****** Object:  StoredProcedure [dbo].[Pr_SelectProductoByIdLineaNegocio]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_SelectProductoByIdLineaNegocio]

	@lineanegocioId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select * from tblProducto where lineaNegocioId = @lineanegocioId;   



END
GO
/****** Object:  StoredProcedure [dbo].[pr_SelectUsuario]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_SelectUsuario]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[pr_updateActividad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_updateActividad] 
	@id INT,
	@Fecha datetime,
	@Hora datetime,
	@Descripcion varchar(200),
	@idMedio int,
	@idOportunidad int
AS
BEGIN  
UPDATE tblActividad SET  
Fecha = @Fecha,
Hora = @Hora,
Descripcion= @Descripcion,
idMedio = @idMedio,
idOportunidad = @idOportunidad
WHERE idActividad = @id  
END  
GO
/****** Object:  StoredProcedure [dbo].[pr_updateCiudad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pr_updateCiudad]
	@idCiudad Int,
	@nombre varchar(50),
	@idPais Int
	
AS
BEGIN  
UPDATE tblCiudad SET  
nombre = @nombre, idPais = @idPais   
 
WHERE idCiudad = @idCiudad  
END  
GO
/****** Object:  StoredProcedure [dbo].[pr_updateCliente]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_updateCliente]
	@id Int,
	@NombreCompleto varchar(50),
	@correo varchar,
	@telefono int,
	@celluar int,
	@direccion varchar(300),
	@idCiudad int
AS
BEGIN  
UPDATE tblCliente SET  
NombreCompleto = @NombreCompleto, correo = @correo, telefono = @telefono, 
celular= @celluar, Direccion = @direccion, idCiudad = @idCiudad
 
WHERE idCliente = @id  
END  
GO
/****** Object:  StoredProcedure [dbo].[pr_updateEmpresa]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_updateEmpresa] 
	@id INT,
	@Nombre varchar(50),
	@descripcion text,
	@telefono int,
	@email varchar(250),
	@usuarioId int
AS
BEGIN  
UPDATE tblEmpresa SET  
nombre = @Nombre, Descripcion = @descripcion, telefono = @telefono, email= @email, UsuarioId = @usuarioId  
 
WHERE empresaId = @id  
END  
GO
/****** Object:  StoredProcedure [dbo].[pr_updateLineaNegocio]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_updateLineaNegocio] 
	@id INT,
	@Nombre varchar(50),
	@descripcion text,
	@empresa_LineaNegocio int
AS
BEGIN  
UPDATE tblLineaNegocio SET  
nombre = @Nombre, descripcion = @descripcion, empresaId = @empresa_LineaNegocio  
 
WHERE idLineaNegocio = @id  
END  
GO
/****** Object:  StoredProcedure [dbo].[pr_updateMedio]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_updateMedio] 
	@id INT,
	@Nombre varchar(50)
	
AS
BEGIN  
UPDATE tblMedio SET  
Nombre = @Nombre
 
WHERE idMedio = @id  
END  
GO
/****** Object:  StoredProcedure [dbo].[pr_updateOportunidad]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_updateOportunidad] 
	@id INT,
	@idLineadeNegocio int,
	@idProducto int,
	@Descripcion varchar(200),
	@fechaHora datetime,
	@idOrigen int,
	@idCliente int,
	@idUsuario int
AS
BEGIN  
UPDATE tblOportunidad SET  
idLineadeNegocio= @idLineadeNegocio,
idProducto = @idProducto,
Descripcion= @Descripcion,
fechaHora = @fechaHora,
idOrigen = @idOrigen,
idCliente = @idCliente,
idUsuario = @idUsuario
WHERE idOportunidad = @id  
END  
GO
/****** Object:  StoredProcedure [dbo].[pr_updateOrigen]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_updateOrigen] 
	@id INT,
	@Nombre varchar(50)
	
AS
BEGIN  
UPDATE tblOrigen SET  
Nombre = @Nombre
 
WHERE idOrigen = @id  
END  

GO
/****** Object:  StoredProcedure [dbo].[pr_updatePais]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pr_updatePais]
	@id Int,
	@nombre varchar(50)
	
AS
BEGIN  
UPDATE tblPais SET  
nombre = @nombre   
 
WHERE idPais = @id  
END  
GO
/****** Object:  StoredProcedure [dbo].[pr_updateProducto]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pr_updateProducto] 
	@id INT,
	@Nombre varchar(50),
	@descripcion text,
	@LineaNegocio_Producto int
AS
BEGIN  
UPDATE tblProducto SET  
nombre = @Nombre, descripcion = @descripcion, lineaNegocioId = @LineaNegocio_Producto  
 
WHERE idProducto = @id  
END  
GO
/****** Object:  StoredProcedure [dbo].[pr_verficacionCodigo]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[pr_verficacionCodigo] 
	@codigo varchar(10)
AS
BEGIN
	SET NOCOUNT ON;
	Update tblUsuario
	set activa=1
	where idUsuario= (select idUsuario from tblUsuario where codigoConfirmacion = @codigo and activa=0);
END


select * from tblUsuario;
	insert into tblUsuario(Usuario,Contrasena,activa,Correo) 
	values ('admin',(select [dbo].[p_verificacionLogin]('admin')),1,'admin@gmail.com');

	exec pr_verificacionUsuarios 'admin','admin';

GO
/****** Object:  StoredProcedure [dbo].[pr_verificacionCorreo]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[pr_verificacionCorreo] 
	@Correo text
AS
BEGIN
	SET NOCOUNT ON;
	select * from tblUsuario where Correo like @Correo;
END
GO
/****** Object:  StoredProcedure [dbo].[pr_verificacionUsuarios]    Script Date: 25/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[pr_verificacionUsuarios]
	-- Add the parameters for the stored procedure here
	@p_usuario text,
	@p_contra varchar (30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tblUsuario tblC
    where (tblC.correo like @p_usuario or tblC.Usuario like @p_usuario)
	and tblC.Contrasena =(select [dbo].[p_verificacionLogin](@p_contra)) AND tblC.activa=1;
END

GO
USE [master]
GO
ALTER DATABASE [CRM] SET  READ_WRITE 
GO
