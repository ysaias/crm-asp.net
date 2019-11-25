USE [CRM]
GO

/****** Object:  StoredProcedure [dbo].[pr_GetEmpresaById]    Script Date: 15/11/2019 15:29:21 ******/
DROP PROCEDURE [dbo].[pr_GetEmpresaById]
GO

/****** Object:  StoredProcedure [dbo].[pr_GetEmpresaById]    Script Date: 15/11/2019 15:29:21 ******/
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



/****** Object:  StoredProcedure [dbo].[pr_insertarEmpresa]    Script Date: 15/11/2019 15:34:14 ******/
DROP PROCEDURE [dbo].[pr_insertarEmpresa]
GO

/****** Object:  StoredProcedure [dbo].[pr_insertarEmpresa]    Script Date: 15/11/2019 15:34:14 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_updateEmpresa]    Script Date: 15/11/2019 16:00:42 ******/
DROP PROCEDURE [dbo].[pr_updateEmpresa]
GO

/****** Object:  StoredProcedure [dbo].[pr_updateEmpresa]    Script Date: 15/11/2019 16:00:42 ******/
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


select * from tblUsuario;