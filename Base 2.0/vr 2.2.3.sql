USE [CRM]
GO

ALTER TABLE [dbo].[tblEmpresa] DROP CONSTRAINT [Fk_tblEmpresa_tblUsuario]
GO

/****** Object:  Table [dbo].[tblEmpresa]    Script Date: 15/11/2019 12:38:14 ******/
DROP TABLE [dbo].[tblEmpresa]
GO

/****** Object:  Table [dbo].[tblEmpresa]    Script Date: 15/11/2019 12:38:14 ******/
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


ALTER TABLE [dbo].[tblEmpresa]  ADD telefono INT NULL, email varchar(250) NULL ;