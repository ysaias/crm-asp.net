USE [CRM]
GO

/****** Object:  StoredProcedure [dbo].[pr_verificacionCorreo]    Script Date: 13/11/2019 21:52:35 ******/
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


/****** Object:  UserDefinedFunction [dbo].[p_verificacionLogin]    Script Date: 13/11/2019 21:53:02 ******/
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



/****** Object:  StoredProcedure [dbo].[pr_updateProducto]    Script Date: 13/11/2019 21:52:29 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_updateLineaNegocio]    Script Date: 13/11/2019 21:52:21 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_updateEmpresa]    Script Date: 13/11/2019 21:52:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_updateEmpresa] 
	@id INT,
	@Nombre varchar(50),
	@descripcion text,
	@usuarioId int
AS
BEGIN  
UPDATE tblEmpresa SET  
nombre = @Nombre, Descripcion = @descripcion, UsuarioId = @usuarioId  
 
WHERE empresaId = @id  
END  
GO


/****** Object:  StoredProcedure [dbo].[pr_SelectUsuario]    Script Date: 13/11/2019 21:52:07 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_SelectProducto]    Script Date: 13/11/2019 21:51:59 ******/
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

/****** Object:  StoredProcedure [dbo].[pr_SelectLineaNegocio]    Script Date: 13/11/2019 21:51:48 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_SelectEmpresa]    Script Date: 13/11/2019 21:51:41 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_insertarLineaNegocio]    Script Date: 13/11/2019 21:51:29 ******/
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



/****** Object:  StoredProcedure [dbo].[pr_insertarEmpresa]    Script Date: 13/11/2019 21:51:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_insertarEmpresa] 
	@Nombre varchar(50),
	@descripcion varchar(100),
	@UsuarioId int
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblEmpresa]
           ([nombre]
           ,[Descripcion]
           ,[UsuarioId])
     VALUES
	       (@Nombre
           ,@descripcion
           ,@UsuarioId           
		   );
	
END

GO

/****** Object:  StoredProcedure [dbo].[pr_insertarProducto]    Script Date: 13/11/2019 21:51:35 ******/
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



/****** Object:  StoredProcedure [dbo].[pr_getUsuarioID]    Script Date: 13/11/2019 21:51:13 ******/
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



/****** Object:  StoredProcedure [dbo].[pr_GetProductoById]    Script Date: 13/11/2019 21:51:04 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_GetEmpresaById]    Script Date: 13/11/2019 21:50:52 ******/
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
	FROM [dbo].[tblEmpresa]
	WHERE [empresaId] = @intEmpresaId

END


GO



/****** Object:  StoredProcedure [dbo].[pr_GetLineaNegocioById]    Script Date: 13/11/2019 21:50:58 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_deletedProducto]    Script Date: 13/11/2019 21:50:46 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_deletedEmpresa]    Script Date: 13/11/2019 21:50:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[pr_deletedEmpresa]  
(  
  @id INT
	
) as BEGIN  
DELETE FROM  
tblEmpresa 
WHERE  
empresaId = @id END 
GO

/****** Object:  StoredProcedure [dbo].[pr_deletedLineaNegocio]    Script Date: 13/11/2019 21:50:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[pr_deletedLineaNegocio]  
(  
  @id INT
	
) as BEGIN  
DELETE FROM  
tblLineaNegocio 
WHERE  
idLineaNegocio = @id END 
GO