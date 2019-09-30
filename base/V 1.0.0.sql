alter table tblUsuario drop column Nombre;
alter table tblUsuario drop column Apellido;
alter table tblUsuario drop column Direccion;
alter table tblUsuario drop column Correo;
alter table tblUsuario drop column Telefono;
alter table tblUsuario drop column Celular;
alter table tblUsuario drop column Usuario;
alter table tblUsuario drop column Contraseña;


alter table tblUsuario add Nombre varchar(100);
alter table tblUsuario add Direccion varchar(100);
alter table tblUsuario add Telefono int;
alter table tblUsuario add Usuario text;
alter table tblUsuario add Contrasena varchar(30);
alter table tblUsuario add CodigoConfirmacion varchar(10);
alter table tblUsuario add activa bit;
alter table tblUsuario add correo text;
alter table tblUsuario add celular text;