use CRM;

create table tblLineaNegocio(
idLineaNegocio int primary key not null,
nombre varchar(50),
descripcion text,
Empresa_LineaNegocio int);

create table tblProducto(
idProducto int primary key not null,
nombre varchar(50),
descripcion text,
LineaNegocio_Producto int);

alter table tblLineaNegocio
add foreign key (Empresa_LineaNegocio) references tblEmpresa (idEmpresa) ;


alter table tblProducto
add foreign key (LineaNegocio_Producto) references tblLineaNegocio (idLineaNegocio) ;
