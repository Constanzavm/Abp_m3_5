CREATE SCHEMA abdasdas2;
CREATE USER 'wasd2'@'localhost' IDENTIFIED BY 'Contrasegna.1';
GRANT ALL PRIVILEGES ON abdasdas2 . * TO 'wasd2'@'localhost';
USE abdasdas2;

create table usuario (
	id_usuario INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	contraseña VARCHAR(50),
    zona_horaria VARCHAR(20) NOT NULL DEFAULT 'UTC-3',
	genero VARCHAR(50) NOT NULL DEFAULT 'No binario',
	telefono INT NOT NULL DEFAULT '123456789',
    PRIMARY KEY (id_usuario)
);

CREATE TABLE fechahora
(
	id_ingreso INT NOT NULL AUTO_INCREMENT,
	id_usuario INT NOT NULL,
	fecha_hora_ingreso TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id_ingreso)
);

ALTER TABLE usuario
	CHANGE COLUMN zona_horaria zona_horaria VARCHAR(20) NOT NULL DEFAULT 'UTC-2';
    
insert into usuario (nombre, apellido, contraseña) values ('Cordero', 'Perdido', 'awdniowd24hj');
insert into usuario (nombre, apellido, contraseña) values ('Corderito', 'Desorientado', 'asniefsn89j');
insert into usuario (nombre, apellido, contraseña) values ('Conejillo', 'De Indias', 'hn4w89oisfnw3');
insert into usuario (nombre, apellido, contraseña) values ('Sacrificial', 'Lamb', 'acvwnd892');
insert into usuario (nombre, apellido, contraseña) values ('Lost', 'Lamb', 'afawmfw.28');
insert into usuario (nombre, apellido, contraseña) values ('Uno', 'De Muchos', 'afjiopefsvnivbn2');
insert into usuario (nombre, apellido, contraseña) values ('juan', 'pamelo', 'avanwfuio29');
insert into usuario (nombre, apellido, contraseña) values ('Emily Anabell', 'Rose Higgins', 'afjiopefsvnivn2');

insert into fechahora (id_usuario) values (8);
insert into fechahora (id_usuario) values (2);
insert into fechahora (id_usuario) values (3);
insert into fechahora (id_usuario) values (4);
insert into fechahora (id_usuario) values (5);
insert into fechahora (id_usuario) values (7);
insert into fechahora (id_usuario) values (2);
insert into fechahora (id_usuario) values (3);

/*tercera tabla*/

CREATE TABLE visitas
(
	id_usuario INT NOT NULL,
	numerovisitas INT NOT NULL DEFAULT 0
);

INSERT INTO visitas (id_usuario, numerovisitas) 
	VALUES (1, (select count(fecha_hora_ingreso) from fechahora where id_usuario = 1));
    
/*Para actualizar*/
/*
UPDATE visitas
	SET numerovisitas = (select count(fecha_hora_ingreso) from fechahora where id_usuario = 2) 
    WHERE (id_usuario = 2);
*/
    
INSERT INTO visitas (id_usuario, numerovisitas) 
	VALUES (2, (select count(fecha_hora_ingreso) from fechahora where id_usuario = 2));
