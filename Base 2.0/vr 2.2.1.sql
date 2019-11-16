USE [CRM]
GO



/****** Object:  StoredProcedure [dbo].[pr_deletedLineaNegocio]    Script Date: 14/11/2019 13:48:12 ******/
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


select * from tblLineaNegocio;

exec pr_deletedLineaNegocioPrueba 1;

select * from tblLineaNegocio;
select * from tblProducto;



exec pr_insertarProducto 'Botas','son botas para todo tipo', 1;
exec pr_insertarProducto 'Zapatos','son zapatos para todo tipo', 1;
exec pr_insertarProducto 'Faldas','son faldas para todo tipo', 1;