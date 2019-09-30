use CRM;
go
create function [dbo].[p_verificacionLogin]
(@p_contra varchar(30)
) returns varchar(30)
as
begin
 return CONVERT(VARCHAR(30), HashBytes('MD5', @p_contra), 2);
end;
go
create PROCEDURE [dbo].[pr_verificacionUsuarios]
	-- Add the parameters for the stored procedure here
	@p_usuario text,
	@p_contra varchar (30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tblUsuario tblC
    where (tblC.correo like @p_usuario or tblC.Usuario like @p_usuario)
	and tblC.Contrasena =(select [dbo].[p_verificacionLogin](@p_contra)) AND tblC.activa=1;
END
go
create PROCEDURE [dbo].[pr_insertarCuenta] 
	@Nombre varchar(100),
	@Direccion text,
	@Telefono int,
	@Usuario text,
	@Contrasena varchar(30),
	@codigoConfirmacion varchar(10),
	@activa bit,
	@Correo text,
	@Celular text
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO [dbo].[tblUsuario]
           ([Nombre]
           ,[Direccion]
           ,[Telefono]
		   ,[Usuario]
		   ,[Contrasena]
		   ,[codigoConfirmacion]
		   ,[activa]
		   ,[Correo]
		   ,[Celular])
     VALUES
           (@Nombre
           ,@Direccion
           ,@Telefono
           ,@Usuario
		   ,(select [dbo].[p_verificacionLogin](@Contrasena))
		   ,@codigoConfirmacion
		   ,0
		   ,@Correo
		   ,@Celular
		   );
	select Max(idUsuario) as idUsuario from tblUsuario;
END
go
create PROCEDURE [dbo].[pr_verificacionCorreo] 
	@Correo text
AS
BEGIN
	SET NOCOUNT ON;
	select * from tblUsuario where Correo like @Correo;
END
go
create PROCEDURE [dbo].[pr_getUsuarioID] 
	@idUsuario int
AS
BEGIN
	SET NOCOUNT ON;
	select * from tblUsuario where idUsuario = @idUsuario;
END
go
create PROCEDURE [dbo].[pr_verficacionCodigo] 
	@codigo varchar(10)
AS
BEGIN
	SET NOCOUNT ON;
	Update tblUsuario
	set activa=1
	where idUsuario= (select idUsuario from tblUsuario where codigoConfirmacion = @codigo and activa=0);
END


select * from tblUsuario;
	insert into tblUsuario(Usuario,Contrasena,activa,Correo) 
	values ('admin',(select [dbo].[p_verificacionLogin]('admin')),1,'admin@gmail.com');

	exec pr_verificacionUsuarios 'admin','admin';
	GO
	select * from tblUsuario;