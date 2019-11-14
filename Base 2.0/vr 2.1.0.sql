USE [CRM]
GO

/****** Object:  Table [dbo].[tblUsuario]    Script Date: 13/11/2019 21:36:13 ******/
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


/****** Object:  Table [dbo].[tblEmpresa]    Script Date: 13/11/2019 21:35:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblEmpresa](
	[empresaId] [int] IDENTITY(10,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[UsuarioId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[empresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblEmpresa]  WITH CHECK ADD  CONSTRAINT [Fk_tblEmpresa_tblUsuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[tblUsuario] ([idUsuario])
GO

ALTER TABLE [dbo].[tblEmpresa] CHECK CONSTRAINT [Fk_tblEmpresa_tblUsuario]
GO




/****** Object:  Table [dbo].[tblUsuarioEmpresa]    Script Date: 13/11/2019 21:36:19 ******/
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



/****** Object:  Table [dbo].[tblLineaNegocio]    Script Date: 13/11/2019 21:35:26 ******/
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

ALTER TABLE [dbo].[tblLineaNegocio]  WITH CHECK ADD  CONSTRAINT [Fk_tblLineaNegocio_tblEmpresa] FOREIGN KEY([empresaId])
REFERENCES [dbo].[tblEmpresa] ([empresaId])
GO

ALTER TABLE [dbo].[tblLineaNegocio] CHECK CONSTRAINT [Fk_tblLineaNegocio_tblEmpresa]
GO






/****** Object:  Table [dbo].[tblProducto]    Script Date: 13/11/2019 21:35:40 ******/
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

ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD FOREIGN KEY([lineaNegocioId])
REFERENCES [dbo].[tblLineaNegocio] ([idLineaNegocio])
GO


/****** Object:  Table [dbo].[tblRol]    Script Date: 13/11/2019 21:35:46 ******/
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




/****** Object:  Table [dbo].[tblPermisos]    Script Date: 13/11/2019 21:35:33 ******/
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

ALTER TABLE [dbo].[tblPermisos]  WITH CHECK ADD  CONSTRAINT [FK_tblPermisos_tblRol] FOREIGN KEY([Rol_Permiso])
REFERENCES [dbo].[tblRol] ([idRol])
GO

ALTER TABLE [dbo].[tblPermisos] CHECK CONSTRAINT [FK_tblPermisos_tblRol]
GO



/****** Object:  Table [dbo].[tblRolUsuarioEmpresa]    Script Date: 13/11/2019 21:36:05 ******/
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
