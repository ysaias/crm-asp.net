USE [CRM]
GO

/****** Object:  Table [dbo].[tblCiudad]    Script Date: 21/11/2019 13:39:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCiudad](
	[idCiudad] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[nombre] [varchar](50) NULL,
	[idPais] [int]
	FOREIGN KEY (idPais) REFERENCES tblPais(idPais)
)
GO


/****** Object:  StoredProcedure [dbo].[pr_insertarPais]  Script Date: 21/11/2019 12:41:18 ******/
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

/****** Object:  StoredProcedure [dbo].[pr_deletedCiudad]    Script Date: 21/11/2019 12:41:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[pr_deletedCiudad]  
(  
  @idPais INT
	
) as BEGIN 
DELETE 
FROM tblCiudad 
WHERE idPais = @idPais END

GO


/****** Object:  StoredProcedure [dbo].[pr_GetCiudadById]    Script Date: 21/11/2019 12:41:18 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_SelectCiudad]    Script Date: 21/11/2019 12:45:06 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_updateCiudad]    Script Date: 21/11/2019 12:45:44 ******/
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



