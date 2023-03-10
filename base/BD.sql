USE [CRM10]
GO
/****** Object:  Table [dbo].[tblEmpresa]    Script Date: 26/9/2019 21:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpresa](
	[idEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Usuario_Empresa] [int] NULL,
 CONSTRAINT [PK_tblEmpresa2] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermisos]    Script Date: 26/9/2019 21:27:26 ******/
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
/****** Object:  Table [dbo].[tblRol]    Script Date: 26/9/2019 21:27:26 ******/
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
/****** Object:  Table [dbo].[tblRolUsuarioEmpresa]    Script Date: 26/9/2019 21:27:26 ******/
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
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 26/9/2019 21:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Telefono] [int] NULL,
	[Celular] [int] NULL,
	[Usuario] [varchar](30) NULL,
	[Contraseña] [varchar](30) NULL,
 CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuarioEmpresa]    Script Date: 26/9/2019 21:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarioEmpresa](
	[idUsuarioEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[Usuario_Empresa] [int] NULL,
	[Empresa_UsuarioEmpresa] [int] NULL,
 CONSTRAINT [PK_tblUsuarioEmpresa2] PRIMARY KEY CLUSTERED 
(
	[idUsuarioEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_tblEmpresa_tblUsuario] FOREIGN KEY([Usuario_Empresa])
REFERENCES [dbo].[tblUsuario] ([idUsuario])
GO
ALTER TABLE [dbo].[tblEmpresa] CHECK CONSTRAINT [FK_tblEmpresa_tblUsuario]
GO
ALTER TABLE [dbo].[tblPermisos]  WITH CHECK ADD  CONSTRAINT [FK_tblPermisos_tblRol] FOREIGN KEY([Rol_Permiso])
REFERENCES [dbo].[tblRol] ([idRol])
GO
ALTER TABLE [dbo].[tblPermisos] CHECK CONSTRAINT [FK_tblPermisos_tblRol]
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
ALTER TABLE [dbo].[tblUsuarioEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioEmpresa_tblEmpresa] FOREIGN KEY([Empresa_UsuarioEmpresa])
REFERENCES [dbo].[tblEmpresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[tblUsuarioEmpresa] CHECK CONSTRAINT [FK_tblUsuarioEmpresa_tblEmpresa]
GO
