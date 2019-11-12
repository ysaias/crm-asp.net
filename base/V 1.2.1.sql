USE [CRM]
GO
/****** Object:  StoredProcedure [dbo].[GetAllLineaNegocio]    Script Date: 11/11/2019 22:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Angel Chavez>
-- Create date: <11/11/2019>
-- Description:	<Trae Datos de empresa,,>
-- =============================================
Create PROCEDURE [dbo].[GetAllEmpresa]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblEmpresa;
END



USE [CRM]
GO
/****** Object:  StoredProcedure [dbo].[pr_insertarProducto]    Script Date: 11/11/2019 22:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[pr_insertarLineaNegocio] 
	@Nombre varchar(50),
	@descripcion text,
	@Empresa_LineaNegocio int
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblLineaNegocio]
           ([nombre]
           ,[descripcion]
           ,[Empresa_LineaNegocio]
		   )
     VALUES
           (@Nombre
           ,@descripcion
           ,@Empresa_LineaNegocio
           
		   );
	
END






USE [CRM]
GO
/****** Object:  StoredProcedure [dbo].[GetAllEmpresa]    Script Date: 12/11/2019 0:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Angel Chavez>
-- Create date: <11/11/2019>
-- Description:	<Trae Datos de usuarios,,>
-- =============================================
Create PROCEDURE [dbo].[GetAllUsuario]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblUsuario;
END






USE [CRM]
GO
/****** Object:  StoredProcedure [dbo].[pr_insertarLineaNegocio]    Script Date: 12/11/2019 0:47:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_insertarEmpresa] 
	@Nombre varchar(50),
	@descripcion text,
	@Usuario_Empresa int
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblEmpresa]
           ([nombre]
           ,[descripcion]
           ,[Usuario_Empresa]
		   )
     VALUES
           (@Nombre
           ,@descripcion
           ,@Usuario_Empresa 

           
		   );
	
END

