create database Softsit2;
use Softsit2;

create table Usuarios(
Id_Usuario int primary key identity,
Usuario_Name varchar(50) unique,
Usuario_Password Varchar(8),
Fecha_Nacimiento date,
Correo varchar(50)
);

INSERT INTO Usuarios (Usuario_Name, Usuario_Password, Fecha_Nacimiento, Correo)
VALUES
    ('johndoe', '12345678', '1990-05-15', 'johndoe@hotmail.com'),
    ('marysmith', 'abcdefgh', '1988-09-27', 'marysmith@gmail.com'),
    ('alexjones', 'qwertyui', '1995-07-10', 'alexjones@yahoo.com'),
    ('laurasmith', 'password', '1992-12-03', 'laurasmith@hotmail.com'),
    ('mikesmith', '98765432', '1991-08-21', 'mikesmith@gmail.com'),
    ('sarahdoe', '1a2b3c4d', '1994-03-17', 'sarahdoe@yahoo.com'),
    ('davidbrown', 'qwerty12', '1987-06-28', 'davidbrown@hotmail.com'),
    ('emilyjones', 'p@ssw0rd', '1993-02-14', 'emilyjones@gmail.com'),
    ('michaelwilson', 'abcdefg1', '1996-11-09', 'michaelwilson@yahoo.com'),
    ('samanthasmith', 'pass1234', '1990-04-30', 'samanthasmith@hotmail.com'),
    ('robertjohnson', 'passlord', '1989-01-12', 'robertjohnson@gmail.com'),
    ('jenniferdavis', 'abcd1234', '1992-10-25', 'jenniferdavis@yahoo.com'),
    ('chrismartin', 'qwerty12', '1997-07-05', 'chrismartin@hotmail.com'),
    ('lindasmith', '1a2b3c4d', '1988-03-19', 'lindasmith@gmail.com'),
    ('matthewjones', 'passw0rd', '1993-12-07', 'matthewjones@yahoo.com'),
    ('amandaclark', '98765432', '1991-09-20', 'amandaclark@hotmail.com'),
    ('jasonbrown', '1qaz2wsx', '1994-04-14', 'jasonbrown@gmail.com'),
    ('juliasmith', 'p@ssw0rd', '1987-07-27', 'juliasmith@yahoo.com'),
    ('andrewilson', 'qwe12345', '1995-02-10', 'andrewilson@hotmail.com'),
    ('michelledavis', 'asdfghjk', '1990-05-23', 'michelledavis@gmail.com'),
    ('williamjones', '1a2b3c4d', '1989-10-06', 'williamjones@yahoo.com'),
    ('emilywilliams', 'password', '1992-07-19', 'emilywilliams@hotmail.com'),
    ('josephsmith', 'qwertyui', '1997-04-02', 'josephsmith@gmail.com'),
    ('lisajohnson', 'abcd1234', '1988-09-15', 'lisajohnson@yahoo.com'),
    ('christopherlee', 'asdfghj1', '1993-06-29', 'christopherlee@hotmail.com'),
    ('jessicawilson', 'pass1234', '1996-03-12', 'jessicawilson@gmail.com'),
    ('danielthomas', '1qaz2wsx', '1990-08-26', 'danielthomas@yahoo.com'),
    ('sophiawalker', 'p@ssw0rd', '1989-05-09', 'sophiawalker@hotmail.com'),
    ('kevinharris', 'zxcvbnm1', '1994-02-22', 'kevinharris@gmail.com'),
    ('sandrasmith', '1234abcd', '1987-12-05', 'sandrasmith@yahoo.com');

Create table Menu_Terapias(
Id_Terapia int primary key identity,
Contractura_rodilla bit,
Contractura_muneca bit,
Contractura_codo bit,
Contractura_talon bit,
Contractura_isquiotibiale bit,
Tiempo time
);

INSERT INTO Menu_Terapias (Contractura_rodilla, Contractura_muneca, Contractura_codo, Contractura_talon, Contractura_isquiotibiale, Tiempo)
VALUES
    (1, 0, 0, 0, 0, '00:15:00'),
    (0, 0, 1, 0, 0, '00:10:00'),
    (0, 0, 0, 1, 0, '00:08:00'),
    (0, 0, 0, 0, 1, '00:12:00'),
    (0, 1, 0, 0, 0, '00:05:00'),
    (0, 0, 1, 0, 0, '00:07:00'),
    (1, 0, 0, 0, 0, '00:10:00'),
    (0, 0, 0, 1, 0, '00:12:00'),
    (0, 0, 0, 1, 0, '00:06:00'),
    (0, 0, 0, 1, 0, '00:08:00'),
    (1, 0, 0, 0, 0, '00:05:00'),
    (0, 1, 0, 0, 0, '00:09:00'),
    (0, 0, 0, 0, 1, '00:07:00'),
    (0, 0, 0, 1, 0, '00:10:00'),
    (0, 0, 1, 0, 0, '00:08:00'),
    (0, 1, 0, 0, 0, '00:06:00'),
    (1, 0, 0, 0, 0, '00:05:00'),
    (0, 1, 0, 0, 0, '00:10:00'),
    (0, 0, 1, 0, 0, '00:07:00'),
    (0, 0, 0, 1, 0, '00:09:00');

Create table Usuario_Menu_Terapias (
Id_Usuario_Menu_Terapia int primary key identity,
Fk_Usuario int,
Fk_Menu int,
foreign key (Fk_Usuario) References Usuarios(Id_Usuario),
foreign key (Fk_Menu) References Menu_Terapias(Id_Terapia),
);

-- Insertar 50 registros aleatorios
INSERT INTO Usuario_Menu_Terapias (Fk_Usuario, Fk_Menu)
VALUES
    (1, 5),
    (3, 8),
    (7, 15),
    (12, 2),
    (19, 9),
    (24, 14),
    (29, 20),
    (5, 1),
    (10, 4),
    (15, 10),
    (20, 16),
    (25, 19),
    (30, 7),
    (2, 3),
    (4, 6),
    (8, 11),
    (13, 18),
    (18, 13),
    (23, 17),
    (28, 12),
    (6, 4),
    (11, 6),
    (16, 11),
    (21, 16),
    (26, 19),
    (1, 7),
    (3, 8),
    (7, 15),
    (12, 2),
    (19, 9),
    (24, 14),
    (29, 20),
    (5, 1),
    (10, 4),
    (15, 10),
    (20, 16),
    (25, 19),
    (30, 7),
    (2, 3),
    (4, 6),
    (8, 11),
    (13, 18),
    (18, 13),
    (23, 17),
    (28, 12),
    (6, 4),
    (11, 6),
    (16, 11),
	(27, 13),
    (9, 5),
    (14, 10),
    (22, 18),
    (17, 15),
    (3, 6),
    (4, 2),
    (26, 11),
    (16, 20),
    (5, 9),
    (28, 3),
    (19, 17),
    (11, 16),
    (6, 12),
    (13, 8),
    (25, 4),
    (7, 7),
    (23, 14),
    (30, 19),
    (8, 1),
    (2, 10),
    (21, 5),
    (12, 13),
    (29, 8),
    (1, 11),
    (18, 3),
    (24, 20),
    (10, 18),
    (15, 16),
    (20, 12),
    (9, 14),
    (13, 19),
    (5, 15),
    (17, 11),
    (7, 4),
    (26, 1),
    (16, 8),
    (27, 3),
    (21, 16),
    (26, 19);


Create table Menu_Masajes(
Id_Masajes int primary key identity,
Velocidad0 bit,
Velocidad1 bit,
Velocidad2 bit,
Velocidad3 bit,
Temperatura0 bit,
Temperatura1 bit,
Temperatura2 bit,
Temperatura3 bit,
Tiempo time
);

INSERT INTO Menu_Masajes (Velocidad0, Velocidad1, Velocidad2, Velocidad3, Temperatura0, Temperatura1, Temperatura2, Temperatura3, Tiempo)
VALUES
    (1, 0, 0, 0, 1, 0, 0, 0, '00:15:00'),
    (0, 1, 0, 0, 0, 1, 0, 0, '00:10:00'),
    (0, 0, 1, 0, 0, 0, 1, 0, '00:08:00'),
    (0, 0, 0, 1, 0, 0, 0, 1, '00:12:00'),
    (1, 0, 0, 0, 1, 0, 0, 0, '00:05:00'),
    (0, 1, 0, 0, 0, 1, 0, 0, '00:07:00'),
    (1, 0, 0, 0, 0, 0, 1, 0, '00:10:00'),
    (0, 0, 1, 0, 0, 0, 0, 1, '00:12:00'),
    (0, 0, 0, 1, 1, 0, 0, 0, '00:06:00'),
    (0, 0, 0, 1, 0, 1, 0, 0, '00:08:00'),
    (1, 0, 0, 0, 1, 0, 0, 0, '00:05:00'),
    (0, 1, 0, 0, 0, 1, 0, 0, '00:09:00'),
    (0, 0, 1, 0, 0, 0, 1, 0, '00:07:00'),
    (0, 0, 0, 1, 0, 0, 0, 1, '00:09:00'),
    (1, 0, 0, 0, 0, 1, 0, 0, '00:06:00'),
    (0, 1, 0, 0, 1, 0, 0, 0, '00:10:00'),
    (0, 0, 1, 0, 0, 1, 0, 0, '00:08:00'),
    (0, 0, 0, 1, 0, 0, 1, 0, '00:06:00'),
    (1, 0, 0, 0, 0, 0, 0, 1, '00:05:00'),
    (0, 1, 0, 0, 0, 0, 1, 0, '00:10:00'),
    (0, 0, 1, 0, 1, 0, 0, 0, '00:07:00');

Create table Usuario_Menu_Masajes (
Id_Usuario_Menu_Masajes int primary key identity,
Fk_Usuario int,
Fk_Menu int,
foreign key (Fk_Usuario) References Usuarios(Id_Usuario),
foreign key (Fk_Menu) References Menu_Masajes(Id_Masajes),
);

INSERT INTO Usuario_Menu_Masajes (Fk_Usuario, Fk_Menu)
VALUES
    (1, 2),
    (3, 5),
    (7, 10),
    (12, 8),
    (19, 12),
    (24, 17),
    (29, 20),
    (5, 3),
    (10, 7),
    (15, 11),
    (20, 15),
    (25, 18),
    (30, 14),
    (2, 1),
    (4, 4),
    (8, 6),
    (13, 9),
    (18, 13),
    (23, 16),
    (28, 19),
    (6, 5),
    (11, 7),
    (16, 9),
    (21, 12),
    (26, 15),
    (1, 3),
    (3, 6),
    (7, 8),
    (12, 11),
    (19, 14),
    (24, 17),
    (29, 20),
    (5, 2),
    (10, 5),
    (15, 9),
    (20, 13),
    (25, 16),
    (30, 19),
    (2, 1),
    (4, 3),
    (8, 6),
    (13, 9),
    (18, 12),
    (23, 15),
    (28, 18),
    (6, 4),
    (11, 7),
    (16, 10),
    (21, 13),
    (26, 16),
	(1, 4),
    (3, 9),
    (7, 14),
    (12, 19),
    (19, 3),
    (24, 8),
    (29, 13),
    (5, 18),
    (10, 2),
    (15, 7),
    (20, 12),
    (25, 17),
    (30, 20),
    (2, 5),
    (4, 10),
    (8, 15),
    (13, 1),
    (18, 6),
    (23, 11),
    (28, 16),
    (6, 19),
    (11, 13),
    (16, 17),
    (21, 2),
    (26, 7),
    (9, 3),
    (14, 8),
    (17, 13),
    (22, 18),
    (27, 4);
