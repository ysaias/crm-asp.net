USE [CRM]
GO
/****** Object:  StoredProcedure [dbo].[pr_insertarCuenta]    Script Date: 21/10/2019 0:58:45 ******/
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
INSERT INTO [dbo].[tblProducto]
           ([nombre]
           ,[descripcion]
           ,[LineaNegocio_Producto]
		   )
     VALUES
           (@Nombre
           ,@descripcion
           ,@LineaNegocio_Producto
           
		   );
	
END



  insert into tblEmpresa VALUES ('ACUARIO','VENTAS DE ROPA',11);
insert into tblLineaNegocio VALUES ('VENTAS','VENTAS DE ROPA',1);



-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Angel Chavez>
-- Create date: <21/10/2019>
-- Description:	<Ver Producto>
-- =============================================
CREATE PROCEDURE pr_SelectProducto
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT [idProducto]
      ,[nombre]
      ,[descripcion]
      ,[LineaNegocio_Producto]
  FROM [dbo].[tblProducto]




END



-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Angel Chavez>
-- Create date: <21/10/2019>
-- Description:	<Trae Datos de linea de negocio,,>
-- =============================================
CREATE PROCEDURE GetAllLineaNegocio
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

