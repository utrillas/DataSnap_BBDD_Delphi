CREATE DATABASE Colegio

CREATE TABLE estudiantes(
	id_estudiante int identity (1,1) ,
	nombre varchar(50),
	direccion varchar(100),
	telefono varchar (15),
	id_ciudad int,
	fecha_de_nacimiento date
)


INSERT INTO estudiantes (nombre, direccion, telefono, id_ciudad, fecha_de_nacimiento)
VALUES ( 'Manuel', 'Madrid', '111 111 111', 35035, '2000-04-06'),
		('Rita', 'Valencia', '222 222 222', 46001, '1981-06-07'),
		( 'Sofia', 'Lugo', '333 333 333', 27001, '1995-03-03'),
		('Alejandro', 'Santiago de Compostela', '444 444 444', 15701, '1975-08-10'),
		('Lucia', 'Barcelona', '555 555 555', 08001, '2000-08-09')

select * from estudiantes

update estudiantes set contraseña = '444' where nombre = 'Lucia'

drop table estudiantes
