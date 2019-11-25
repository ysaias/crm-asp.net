USE [CRM]
GO

/****** Object:  Table [dbo].[tblPais]    Script Date: 21/11/2019 13:39:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblPais](
	[idPais] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[nombre] [varchar](50) NULL,

)
GO


/****** Object:  StoredProcedure [dbo].[pr_insertarPais]  Script Date: 21/11/2019 12:41:18 ******/
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

/****** Object:  StoredProcedure [dbo].[pr_deletedPais]    Script Date: 21/11/2019 12:41:18 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_GetPaisById]    Script Date: 21/11/2019 12:41:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pr_GetPaisById]
	@intPaisId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
	  [nombre]
	FROM [dbo].[tblPais]
	WHERE [idPais] = @intPaisId

END
GO


/****** Object:  StoredProcedure [dbo].[pr_SelectPais]    Script Date: 21/11/2019 12:45:06 ******/
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


/****** Object:  StoredProcedure [dbo].[pr_updatePais]    Script Date: 21/11/2019 12:45:44 ******/
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



