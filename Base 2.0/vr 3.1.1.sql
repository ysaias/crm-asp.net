USE [CRM2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pr_SelectEmpresaByIdUsuario]

	@usuarioId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select * from tblEmpresa where UsuarioId = @usuarioId;   



END
GO




