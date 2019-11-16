USE [CRM]
GO

/****** Object:  StoredProcedure [dbo].[pr_deletedLineaNegocio]    Script Date: 15/11/2019 9:47:22 ******/
DROP PROCEDURE [dbo].[pr_deletedEmpresa]
GO

/****** Object:  StoredProcedure [dbo].[pr_deletedLineaNegocio]    Script Date: 15/11/2019 9:47:22 ******/
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
WHERE empresaId = @id 


DELETE FROM  
tblEmpresa 
WHERE  
empresaId = @id END

