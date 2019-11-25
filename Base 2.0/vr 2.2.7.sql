USE [CRM]
GO

/****** Object:  StoredProcedure [dbo].[pr_deletedEmpresa]    Script Date: 21/11/2019 12:36:37 ******/
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



/****** Object:  StoredProcedure [dbo].[pr_GetEmpresaById]    Script Date: 21/11/2019 12:41:18 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_SelectEmpresa]    Script Date: 21/11/2019 12:45:06 ******/
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



/****** Object:  StoredProcedure [dbo].[pr_updateEmpresa]    Script Date: 21/11/2019 12:45:44 ******/
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