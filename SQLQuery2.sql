create table login(
id_usuario varchar (20),
contrase�a varchar (8),
tipo varchar (20))

insert into login (id_usuario, contrase�a, tipo)
values ('Hugo', '123', 'Usuario'),
		('Admin', 'Admin', 'Administrador'),
		('Secretaria', '12345', 'Secretaria')

select * from login

select * from estudiantes

select * from login where id_usuario = 'Hugo' and contrase�a = '123' and tipo = 'usuario'

insert into login (id_usuario, contrase�a, tipo)
values