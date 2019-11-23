USE [CRM2]
GO
/****** Object:  UserDefinedFunction [dbo].[p_verificacionLogin]    Script Date: 23/11/2019 17:44:13 ******/
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
/****** Object:  Table [dbo].[tblEmpresa]    Script Date: 23/11/2019 17:44:13 ******/
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
/****** Object:  Table [dbo].[tblLineaNegocio]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  Table [dbo].[tblPermisos]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  Table [dbo].[tblProducto]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  Table [dbo].[tblRol]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  Table [dbo].[tblRolUsuarioEmpresa]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  Table [dbo].[tblUsuarioEmpresa]    Script Date: 23/11/2019 17:44:14 ******/
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
ALTER TABLE [dbo].[tblPermisos]  WITH CHECK ADD  CONSTRAINT [FK_tblPermisos_tblRol] FOREIGN KEY([Rol_Permiso])
REFERENCES [dbo].[tblRol] ([idRol])
GO
ALTER TABLE [dbo].[tblPermisos] CHECK CONSTRAINT [FK_tblPermisos_tblRol]
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
/****** Object:  StoredProcedure [dbo].[pr_deletedEmpresa]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_deletedLineaNegocio]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_deletedLineaNegocioPrueba]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_deletedProducto]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_GetEmpresaById]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_GetLineaNegocioById]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_GetProductoById]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_getUsuarioID]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_insertarCuenta]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_insertarEmpresa]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_insertarLineaNegocio]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_insertarProducto]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[Pr_SeleccionByusuario]    Script Date: 23/11/2019 17:44:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pr_SeleccionByusuario]

	@usuarioId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select * from tblEmpresa where UsuarioId = @usuarioId;   



END
GO
/****** Object:  StoredProcedure [dbo].[pr_SelectEmpresa]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_SelectLineaNegocio]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_SelectProducto]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_SelectUsuario]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_updateEmpresa]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_updateLineaNegocio]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_updateProducto]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_verficacionCodigo]    Script Date: 23/11/2019 17:44:14 ******/
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
GO
/****** Object:  StoredProcedure [dbo].[pr_verificacionCorreo]    Script Date: 23/11/2019 17:44:14 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_verificacionUsuarios]    Script Date: 23/11/2019 17:44:14 ******/
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
