USE [CRM]
GO

CREATE PROCEDURE [dbo].[pr_insertarCliente] 
	@NombreCompleto varchar(50),
	@correo varchar,
	@telefono int,
	@celluar int,
	@direccion varchar(300),
	@idCiudad int
	
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblCliente]
           ([NombreCompleto]
           ,[correo]
           ,[Telefono]
		   ,[celular]
		   ,[Direccion]
		   ,[idCiudad])
     VALUES
	       (@NombreCompleto
           ,@correo
           ,@telefono
		   ,@celluar
		   ,@direccion
		   ,@idCiudad);
	
END

GO

