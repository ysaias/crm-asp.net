USE [CRM]
GO

/****** Object:  Table [dbo].[tblCliente]    Script Date: 19/11/2019 20:34:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCliente](
	[idCliente] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[NombreCompleto] [varchar](100) NULL,
	[correo] [text] NULL,
	[Telefono] [int] NULL,
	[celular] [int] NULL,
	[Direccion] [varchar](300) NULL,
	[idCiudad] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblCliente]  WITH CHECK ADD FOREIGN KEY([idCiudad])
REFERENCES [dbo].[tblCiudad] ([idCiudad])
GO

