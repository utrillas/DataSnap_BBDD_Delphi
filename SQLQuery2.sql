create table login(
id_usuario varchar (20),
contraseņa varchar (8),
tipo varchar (20))

insert into login (id_usuario, contraseņa, tipo)
values ('Hugo', '123', 'Usuario'),
		('Admin', 'Admin', 'Administrador'),
		('Secretaria', '12345', 'Secretaria')

select * from login

select * from estudiantes

select * from login where id_usuario = 'Hugo' and contraseņa = '123' and tipo = 'usuario'

insert into login (id_usuario, contraseņa, tipo)
values