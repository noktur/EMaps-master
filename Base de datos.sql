DROP DATABASE IF EXISTS SistemaEventos ;

CREATE database IF NOT EXISTS SistemaEventos ;

use SistemaEventos;


create table Usuarios
(
    Nombre varchar(30) not null ,
    Contraseña varchar(50) not null,
    NombreUsuario varchar(30) not null,
    Ci varchar(30) not null primary key, 
    Email varchar(50) not null,
    Eliminado boolean
);

create table Clientes
(
    CiCliente varchar(30) not null primary key, 
    foreign key (CiCliente) references Usuarios (Ci)
);

create table Admin 
(
    CiAdmin varchar(30) not null primary key,
    foreign key (CiAdmin) references Usuarios (Ci)
);

create table Dueño 
(
    CiDueño varchar(30) not null primary key,
    foreign key (CiDueño) references Usuarios (Ci)
);

create table Organizador
(
    CiOrganizador varchar(30) not null primary key,
    foreign key (CiOrganizador) references Usuarios (Ci)
);

Create table Ubicacion
(
	Nombre varchar(30) not null primary key,
	cordX real,
	cordY real,
    Eliminado boolean
);
create table Pais 
(
    NombrePais varchar(30) not null primary key,
    CodPais varchar(4) not null,
    foreign key (NombrePais) references Ubicacion(Nombre)
);

create table Ciudad 
(
	NombreCiudad varchar(30) ,
	NombrePais varchar(30) not null,
	foreign key (NombrePais) references Pais (NombrePais),
    foreign key(NombreCiudad) references Ubicacion(Nombre),
    primary key(NombreCiudad,NombrePais)
);

create table Mapa 
(
    IdMapa int AUTO_INCREMENT not null ,
    Nombre varchar(30) not null,
    Imagen longblob,
    extension varchar(5),
    Eliminado boolean,
    primary key(IdMapa)
);

create table Lugar 
(
    NombreLugar varchar(30) not null,
    Direccion varchar(30) not null,
    Descripcion varchar(30) not null,
    UbicacionCiudad varchar(30) not null,
    CordX real not null,
    CordY real not null,
    Eliminado boolean,
    CiDueño varchar(30) not null,
	IdMapa int not null,
    foreign key (CiDueño) references Dueño (CiDueño),
    foreign key (UbicacionCiudad) references Ubicacion (Nombre),
    primary key(NombreLugar,UbicacionCiudad,CiDueño)
);


create table Area 
(
    IdArea INT AUTO_INCREMENT not null ,
    IdMapa int ,
    Nombre varchar(30) not null,
	Capacidad int,
    Descripcion varchar(30),
    Eliminado boolean,
    foreign key (IdMapa) references Mapa (IdMapa),
    primary key(IdArea)
);

create table Punto 
(
    IdPunto int AUTO_INCREMENT not null,
	cordX real,
	cordY real,
    Eliminado boolean,
    IdArea int not null,
    foreign key (IdArea) references Area (IdArea),
    primary key(IdPunto,IdArea)
);

create table FotosLugar
(
NombreFoto varchar(30) not null,
NombreLugar varchar(30) ,
extension varchar(5),
Foto longblob not null,
foreign key (NombreLugar) references Lugar (NombreLugar),
primary key(NombreFoto,NombreLugar)
);

create table Alquiler
(
IdAlquiler int AUTO_INCREMENT not null,
IdArea int not null,
CiOrganizador varchar(30) not null,
FechaInicioAlquiler timestamp,
FechaFinAlquiler timestamp,
FechaRealizado timestamp,
foreign key (IdArea) references Area (IdArea),
foreign key (CiOrganizador) references organizador (CiOrganizador),
primary key(IdAlquiler,IdArea,CiOrganizador)
);

create table Categoria
(
NombreCategoria varchar(30) not null,
Descripcion varchar(30) not null,
primary key(NombreCategoria)
);

create table Evento
(
  IdEvento int AUTO_INCREMENT not null ,
  Nombre varchar(30) not null,
  Descripcion varchar(100),
  FechaInicio timestamp not null,
  FechaFin timestamp not null,
  IdArea  int not null,
  CiOrganizador varchar(30) not null,
  NombreCategoria varchar(30) not null,
  CapacidadDisponible int not null,
  EstadoReserva boolean default false,
  foreign key (NombreCategoria) references categoria (NombreCategoria),
  foreign key (IdArea) references Alquiler(IdArea),
  foreign key (CiOrganizador) references Alquiler(CiOrganizador),
  primary key(IdEvento,IdArea,CiOrganizador),
  Eliminado boolean default 0
);

create table Reserva
(
IdReserva int not null AUTO_INCREMENT,
ClienteReserva varchar(30) not null,
EventoReservado int not null,
CantidadReserva int not null,
FechaReserva timestamp not null,
FechaEmision timestamp not null,
primary key(IdReserva,ClienteReserva,EventoReservado),
foreign key (ClienteReserva) references Clientes(CiCliente),
foreign key (EventoReservado) references Evento(IdEvento)
);


create table Entrada
( 
IdEntrada int AUTO_INCREMENT not null,
Precio double not null,
IdReserva int not null,
Cantidad int not null,
FechaEmision timestamp not null,
foreign key (IdReserva) references Reserva (IdReserva),
primary key(IdEntrada,IdReserva)
);


create table MedioPago
( 
IdMedioPago int unique,
IdEntrada int ,
Disponibilidad boolean not null default 0,
primary key(IdEntrada,IdMedioPago)
);

create table MensajeFeedbackLugar
( 
IdFeedback int  AUTO_INCREMENT,
NombreFeedback varchar(30),
MensajeFeedback varchar(100),
CiUsuario varchar(30),
FechaRealizado timestamp,
NombreLugar varchar(30),
foreign key (CiUsuario) references Usuarios(Ci),
foreign key (NombreLugar) references Lugar(NombreLugar),
primary key(IdFeedback,CiUsuario,NombreLugar)
);

create table MensajeFeedbackEvento
( 
IdFeedback int  AUTO_INCREMENT,
NombreFeedback varchar(30),
CiUsuario varchar(30),
MensajeFeedback varchar(100),
FechaRealizado timestamp,
IdEvento int,
foreign key (CiUsuario) references Usuarios(Ci),
foreign key (IdEvento) references Evento(IdEvento),
primary key(IdFeedback,CiUsuario,IdEvento)
);

create table ComentarioFeedbackLugar
( 
IdComentario int AUTO_INCREMENT,
IdFeedback int ,
AsuntoComentario varchar(30),
MensajeComentario varchar(100),
CiUsuario varchar(30),
FechaRealizado timestamp,
foreign key (CiUsuario) references Usuarios(Ci),
foreign key (IdFeedback) references MensajeFeedbackLugar(IdFeedback),
primary key(IdComentario,CiUsuario,IdFeedback)
);

create table ComentarioFeedbackEvento
( 
IdComentario int  AUTO_INCREMENT,
IdFeedback int ,
CiUsuario varchar(30),
AsuntoComentario varchar(30),
MensajeComentario varchar(100),
FechaRealizado timestamp,
foreign key (CiUsuario) references Usuarios(Ci),
foreign key (IdFeedback) references MensajeFeedbackEvento(IdFeedback),
primary key(IdComentario,CiUsuario,IdFeedback)
);

-- PROCEDIMIENTOS ALMACENADOS ADMIN

DELIMITER //
CREATE PROCEDURE AltaAdmin (pNombre VARCHAR(30), pContraseÃ±a Varchar(30),pNombreUsuario varchar(30),pCiAdmin varchar(30),pEmail varchar(50))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
INSERT INTO Usuarios(Nombre,ContraseÃ±a,NombreUsuario,Ci,Email) VALUES(pNombre,pContraseÃ±a,pNombreUsuario,pCiAdmin,pEmail);
INSERT INTO Admin(CiAdmin) values(pCiAdmin);
		COMMIT;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE ModificarAdmin (pNombre VARCHAR(30), pContraseÃ±a Varchar(30),pNombreUsuario varchar(30),pCiAdmin varchar(30),pEmail varchar(50))
BEGIN
UPDATE Usuarios SET Nombre=pNombre,ContraseÃ±a=pContraseÃ±a,NombreUsuario=pNombreUsuario,Email=pEmail  WHERE CiAdmin=pCiAdmin;
END
// DELIMITER;


DELIMITER //
CREATE PROCEDURE EliminarAdmin (pCiAdmin varchar(30))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
DELETE FROM Admin WHERE CiAdmin=pCiAdmin;
DELETE FROM Usuarios WHERE Ci=pCiAdmin;
		COMMIT;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE BuscarAdmin(pCiAdmin varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN Admin a
ON u.Ci =a.CiAdmin
WHERE a.Ci=pCiAdmin;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE AdminLogueo(pNombreUsuario varchar(30),pContraseÃ±a varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN Admin a
ON u.Ci =a.CiAdmin
WHERE u.NombreUsuario=pNombreUsuario and u.ContraseÃ±a=pContraseÃ±a;
END //
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarAdmin()
BEGIN
SELECT *
FROM Usuarios u JOIN Admin a
ON u.Ci=a.CiAdmin;
END//
DELIMITER;


-- PROCEDIMIENTOS ALMACENADOS CLIENTE

DELIMITER //
CREATE PROCEDURE AltaCliente (pNombre VARCHAR(30), pContraseÃ±a Varchar(30),pNombreUsuario varchar(30),pCiCliente varchar(30),pEmail varchar(50))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
INSERT INTO Usuarios(Nombre,ContraseÃ±a,NombreUsuario,Ci,Email) VALUES(pNombre,pContraseÃ±a,pNombreUsuario,pCiCliente,pEmail);
INSERT INTO Clientes(CiCliente) values(pCiCliente);
		COMMIT;
END //
DELIMITER;




DELIMITER //
CREATE PROCEDURE ModificarCliente (pNombre VARCHAR(30), pContraseÃ±a Varchar(30),pNombreUsuario varchar(30),pCiCliente varchar(30),pEmail varchar(50))
BEGIN
UPDATE Usuarios SET Nombre=pNombre,ContraseÃ±a=pContraseÃ±a,NombreUsuario=pNombreUsuario,Email=pEmail  WHERE CiCliente=pCiCliente;
END
// DELIMITER;



DELIMITER //
CREATE PROCEDURE EliminarCliente (pCiCliente varchar(30))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
DELETE FROM Clientes WHERE CiCliente=pCiCliente;
DELETE FROM Usuarios WHERE Ci=pCiCliente;
		COMMIT;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarCliente(pCiCliente varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN Clientes c
ON u.Ci =c.CiCliente
WHERE c.CiCliente=pCiCliente;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE ClienteLogueo(pNombreUsuario varchar(30),pContraseÃ±a varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN Clientes c
ON u.Ci =c.CiCliente
WHERE u.NombreUsuario=pNombreUsuario and u.ContraseÃ±a=pContraseÃ±a;
END //
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarClientes()
BEGIN
SELECT *
FROM Usuarios u JOIN Clientes c
ON u.Ci=c.CiCliente;
END//
DELIMITER;


-- PROCEDIMIENTOS ALMACENADOS DUEÃ‘O

DELIMITER //
CREATE PROCEDURE AltaDueÃ±o (pNombre VARCHAR(30), pContraseÃ±a Varchar(30),pNombreUsuario varchar(30),pCiDueÃ±o varchar(30),pEmail varchar(50))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
INSERT INTO Usuarios(Nombre,ContraseÃ±a,NombreUsuario,Ci,Email) VALUES(pNombre,pContraseÃ±a,pNombreUsuario,pCiDueÃ±o,pEmail);
INSERT INTO DueÃ±o(CiDueÃ±o) values(pCiDueÃ±o);
		COMMIT;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE ModificarDueÃ±o (pNombre VARCHAR(30), pContraseÃ±a Varchar(30),pNombreUsuario varchar(30),pCiDueÃ±o varchar(30),pEmail varchar(50))
BEGIN
UPDATE Usuarios SET Nombre=pNombre,ContraseÃ±a=pContraseÃ±a,NombreUsuario=pNombreUsuario,Email=pEmail  WHERE CiDueÃ±o=pCiDueÃ±o;
END
// DELIMITER;



DELIMITER //
CREATE PROCEDURE EliminarDueÃ±o (pCiDueÃ±o varchar(30))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
DELETE FROM DueÃ±o WHERE CiDueÃ±o=pCiDueÃ±o;
DELETE FROM Usuarios WHERE Ci=pCiDueÃ±o;
		COMMIT;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarDueÃ±o(pCiDueÃ±o varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN DueÃ±o d
ON u.Ci =d.CiDueÃ±o
WHERE d.CiDueÃ±o=pCiDueÃ±o;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE DueÃ±oLogueo(pNombreUsuario varchar(30),pContraseÃ±a varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN DueÃ±o c
ON u.Ci =c.CiDueÃ±o
WHERE u.NombreUsuario=pNombreUsuario and u.ContraseÃ±a=pContraseÃ±a;
END //
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarDueÃ±os()
BEGIN
SELECT *
FROM Usuarios u JOIN DueÃ±o d
ON u.Ci=d.CiDueÃ±o and u.Eliminado=0;
END//
DELIMITER;


-- PROCEDIMIENTOS ALMACENADOS ORGANIZADOR

DELIMITER //
CREATE PROCEDURE AltaOrganizador (pNombre VARCHAR(30), pContraseÃ±a Varchar(30),pNombreUsuario varchar(30),pCiOrganizador varchar(30),pEmail varchar(50))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
INSERT INTO Usuarios(Nombre,ContraseÃ±a,NombreUsuario,Ci,Email) VALUES(pNombre,pContraseÃ±a,pNombreUsuario,pCiOrganizador,pEmail);
INSERT INTO Organizador(CiOrganizador) values(pCiOrganizador);
		COMMIT;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE ModificarOrganizador (pNombre VARCHAR(30), pContraseÃ±a Varchar(30),pNombreUsuario varchar(30),pCiOganizador varchar(30),pEmail varchar(50))
BEGIN
UPDATE Usuarios SET Nombre=pNombre,ContraseÃ±a=pContraseÃ±a,NombreUsuario=pNombreUsuario,Email=pEmail  WHERE CiOrganizador=pCiOrganizador;
END
// DELIMITER;



DELIMITER //
CREATE PROCEDURE EliminarOrganizador (pCiOrganizador varchar(30))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
DELETE FROM Organizador WHERE CiOrganizador=pCiOrganizador;
DELETE FROM Usuarios WHERE Ci=pCiOrganizador;
		COMMIT;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarOrganizador(pCiOrganizador varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN Organizador o
ON u.Ci =o.CiOrganizador
WHERE o.CiOrganizador=pCiOrganizador and u.Eliminado=0;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE OrganizadorLogueo(pNombreUsuario varchar(30),pContraseÃ±a varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN Organizador o
ON u.Ci =o.CiOrganizador
WHERE u.NombreUsuario=pNombreUsuario and u.ContraseÃ±a=pContraseÃ±a;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE ListarOrganizadores()
BEGIN
SELECT *
FROM Usuarios u JOIN Organizador o
ON u.Ci=o.CiOrganizador and u.Eliminado=0;
END//
DELIMITER;



-- PROCEDIMIENTOS ALMACENADOS PAIS


DELIMITER //
CREATE PROCEDURE AltaPais (pNombre VARCHAR(30),pCodPais varchar(4),pCordX real,pCordY real)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
INSERT INTO Ubicacion(Ubicacion.Nombre,Ubicacion.cordX,Ubicacion.cordY) VALUES(pNombre,pCordx,pCordy);
INSERT INTO Pais(Pais.NombrePais,Pais.CodPais) VALUES(pNombre,pCodPais);
UPDATE Ubicacion SET Eliminado=0;
COMMIT;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ModificarPais(pNombre VARCHAR(30),pCordX real,pCordY real) 
BEGIN
UPDATE Ubicacion SET cordX=pCordX,cordY=pCordY WHERE Nombre=pNombre;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarPais (pNombre varchar(30))
BEGIN
UPDATE Ubicacion SET Ubicacion.Eliminado=1  WHERE ubicacion.Nombre=pNombre;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarPais(pNombre varchar(30))
BEGIN
SELECT *
FROM Ubicacion join Pais 
On Ubicacion.Nombre=Pais.NombrePais
WHERE Pais.NombrePais=pNombre and Ubicacion.Eliminado=0;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarPaises()
BEGIN
SELECT *
FROM Ubicacion join Pais 
On Ubicacion.Nombre=Pais.NombrePais
WHERE Ubicacion.Eliminado=0;
END//
DELIMITER;

-- PROCEDIMIENTOS ALMACENADOS CIUDAD


DELIMITER //
CREATE PROCEDURE AltaCiudad (pNombre VARCHAR(30),pCordX real,pCordY real,pNombrePais varchar(30))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
INSERT INTO Ubicacion(Ubicacion.Nombre,Ubicacion.cordX,Ubicacion.cordY) VALUES(pNombre,pCordx,pCordy);
INSERT INTO Ciudad(Ciudad.NombrePais,Ciudad.NombreCiudad) VALUES(pNombrePais,pNombre);
UPDATE Ubicacion SET Eliminado=0;
COMMIT;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ModificarCiudad(pNombre VARCHAR(30),pCordX real,pCordY real) 
BEGIN
UPDATE Ubicacion SET cordX=pCordX,cordY=pCordY  WHERE Ciudad.NombreCiudad=pNombre;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarCiudad (pNombreCiudad varchar(30),pNombrePais varchar(30))
BEGIN
UPDATE Ubicacion SET Eliminado=1 WHERE Ubicacion.Nombre=pNombreCiudad;
UPDATE Ubicacion SET Eliminado=1 WHERE Ubicacion.Nombre=pNombrePais;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarCiudad(pNombre varchar(30))
BEGIN
SELECT *
FROM Ubicacion join Ciudad
ON Ubicacion.Nombre=Ciudad.NombreCiudad
join Pais
ON Ciudad.NombrePais=Pais.NombrePais
WHERE Ciudad.NombreCiudad=pNombre and  Ubicacion.Eliminado=0;
END //
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarCiudades()
BEGIN
SELECT *
FROM Ubicacion join ciudad
ON Ubicacion.Nombre=ciudad.NombreCiudad
join pais
ON ciudad.NombrePais=pais.NombrePais
WHERE Ubicacion.Eliminado=0;
END//
DELIMITER;



DELIMITER //
CREATE PROCEDURE ListarCiudadesdePais(pNombrePais varchar(30))
BEGIN
SELECT *
FROM Ubicacion join Pais 
ON Ubicacion.Nombre=Pais.NombrePais
join Ciudad 
ON Pais.NombrePais=Ciudad.NombreCiudad
WHERE Ubicacion.Eliminado=0 and Ciudad.NombrePais=pNombrePais;
END//
DELIMITER;


-- PROCEDIMIENTOS ALMACENADOS LUGAR


DELIMITER //
CREATE PROCEDURE AltaLugar (pNombre varchar(30),pDireccion varchar(30),pDescripcion varchar(30),pNombreUbicacion varchar(30),pCordX real,pCordY real,pCiDueño varchar(30),pIdMapa int)
BEGIN
INSERT INTO Lugar(NombreLugar,Direccion,Descripcion,UbicacionCiudad,CordX,CordY,CiDueño,IdMapa,IdMapa) VALUES(pNombre,pDireccion,pDescripcion,pNombreUbicacion,pCordX,pCordY,pCiDueño,pIdMapa);
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ModificarLugar(pNombre varchar(30),pDireccion varchar(30),pDescripcion varchar(30),pNombreUbicacion varchar(30),pCiDueño varchar(30),pIdMapa int) 
BEGIN
UPDATE Lugar SET NombreLugar=pNombre,Direccion=pDireccion,Descripcion=pDescripcion,UbicacionCiudad=pNombreUbicacion,CiDueño=pCiDueño,IdMapa = pIdMapa WHERE NombreLugar=pNombreLugar;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarLugar (pNombreLugar varchar(30))
BEGIN
UPDATE Lugar SET Eliminado=1  WHERE NombreLugar=pNombreLugar;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarLugar(pNombreLugar varchar(30))
BEGIN
SELECT *
FROM Ciudad join Ubicacion
ON Ciudad.NombreCiudad=Ubicacion.Nombre
Join Lugar
ON Ubicacion.Nombre=Lugar.UbicacionCiudad
WHERE Lugar.NombreLugar=pNombreLugar;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarLugares()
BEGIN
SELECT *
FROM Ciudad join Ubicacion
ON Ciudad.NombreCiudad=Ubicacion.Nombre
Join Lugar
ON Ubicacion.Nombre=Lugar.UbicacionCiudad
join FotosLugar
On Lugar.NombreLugar=FotosLugar.NombreLugar;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarLugaresDisponibles()
BEGIN
SELECT *
FROM Ciudad join Ubicacion
ON Ciudad.NombreCiudad=Ubicacion.Nombre
Join Lugar
ON Ubicacion.Nombre=Lugar.NombreUbicacion
join FotosLugar
On Lugar.NombreLugar=FotosLugar.NombreLugar
where EstadoAlquiler=0;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE ListarLugaresCiudad(pNombreCiudad varchar(30))
BEGIN
SELECT *
FROM Ciudad join Ubicacion
ON Ciudad.NombreCiudad=Ubicacion.Nombre
Join Lugar
ON Ubicacion.Nombre=Lugar.CiudadUbicacion
join FotosLugar
On Lugar.NombreLugar=FotosLugar.NombreLugar
where lugar.UbicacionCiudad=pNombreCiudad;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE ListarLugaresDueño(pCiDueño varchar(30))
BEGIN
SELECT *
FROM ciudad join Ubicacion
ON Ciudad.NombreCiudad=Ubicacion.Nombre
Join Lugar
ON Ubicacion.Nombre=Lugar.CiudadUbicacion
join Dueño
on Dueño.CiDueño=Lugar.CiDueño
join FotosLugar
On Lugar.NombreLugar=FotosLugar.NombreLugar
where Lugar.CiDueño=pCiDueño;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarMapaLugar(pNombreLugar varchar(30))
BEGIN
SELECT *
FROM Mapa
join Lugar
On Mapa.IdMapa=Lugar.IdMapa
WHERE Mapa.NombreLugar=pNombreLugar;
END//
DELIMITER;


-- PROCEDIMIENTOS ALMACENADOS ALQUILER


DELIMITER //
CREATE PROCEDURE AlquilarArea (pIdArea int,pFechaInicio timestamp,pFechaFin timestamp,pCiOrganizador varchar(30),pFechaReservacion timestamp)
BEGIN
INSERT INTO ALQUILER(IdAlquiler,IdArea,CiOrganizador,FechaInicioAlquiler,FechaFinAlquiler,FechaRealizado) values (0,pIdArea,pCiOrganizador,pFechaInicio,pFechaFin,pFechaReservacion);
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE ComprobarAlquilerArea(pIdArea int,pFechaInicio timestamp,pFechaFin timestamp)
BEGIN
SELECT *
FROM Alquiler 
where alquiler.IdArea=pIdArea and alquiler.FechaInicioAlquiler <= pFechaFin 
  AND alquiler.FechaFinAlquiler >= pFechaInicio;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE EliminarAlquilerArea (pIdAlquiler int,pIdArea int)
BEGIN
DELETE from alquiler WHERE alquiler.IdAlquiler=pIdAlquiler and alquiler.IdArea=pIdArea;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE BuscarAlquiler(pIdAlquiler int)
BEGIN
SELECT *
FROM Alquiler 
WHERE alquiler.IdAlquiler=pIdAlquiler
order by  UNIX_TIMESTAMP(alquiler.FechaInicioAlquiler) desc;
END//
DELIMITER;





DELIMITER //
CREATE PROCEDURE ListarAlquiler()
BEGIN
SELECT *
FROM Alquiler 
order by  UNIX_TIMESTAMP(alquiler.FechaInicioAlquiler) desc;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE ListarAlquilerdeOrganizador(pCiOrganizador varchar(30))
BEGIN
SELECT *
FROM organizador
join alquiler
on organizador.CiOrganizador=alquiler.CiOrganizador
where alquiler.CiOrganizador=pCiOrganizador
order by  UNIX_TIMESTAMP(alquiler.FechaInicioAlquiler) desc;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarAlquilerdeArea(pIdArea int)
BEGIN
SELECT *
FROM lugar
join alquiler
on lugar.NombreLugar=alquiler.NombreLugar
where alquiler.IdArea=pIdArea
order by  UNIX_TIMESTAMP(alquiler.FechaInicioAlquiler) desc;
END//
DELIMITER;

-- PROCEDIMIENTOS ALMACENADOS MAPA

DELIMITER //
CREATE PROCEDURE AltaMapa (pNombre varchar(30),pImagen longblob,pExtension varchar(5))
BEGIN
INSERT INTO Mapa(IdMapa,Nombre,Imagen,extension,NombreLugar) VALUES(0,pNombre,pImagen,pExtension);
UPDATE Mapa SET Eliminado=0;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ModificarMapa(pIdMapa int,pNombre varchar(30),pImagen longblob,pExtension varchar(5)) 
BEGIN
UPDATE Mapa SET Nombre=pNombre,Imagen=pImagen,extension=pExtension,NombreLugar=pNombreLugar WHERE IdMapa=pIdMapa;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarMapa (pIdMapa int)
BEGIN
UPDATE Mapa SET Eliminado=1 WHERE IdMapa=pIdMapa;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarMapa(pIdMapa int)
BEGIN
SELECT *
FROM Mapa 
WHERE Mapa.IdMapa=pIdMapa;
END//
DELIMITER;



-- PROCEDIMIENTOS ALMACENADOS FOTOS DE LUGAR

DELIMITER //
CREATE PROCEDURE AltaFotosLugar (pNombreFoto varchar(30),pExtension varchar(5),pFoto longblob,pNombreLugar varchar(30))
BEGIN
INSERT INTO FotosLugar(NombreFoto,Extension,Foto,NombreLugar) VALUES(pNombreFoto,pExtension,pFoto,pNombreLugar);
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarFotosLugar (pNombreLugar varchar(30))
BEGIN
SELECT * FROM fotoslugar
where fotoslugar.NombreLugar=pNombreLugar;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BajaFotosLugar (pNombreFoto varchar(30),pNombreLugar varchar(30))
BEGIN
delete from FotosLugar where NombreFoto=pNombreFoto and NombreLugar=pNombreLugar;
END//
DELIMITER;

-- PROCEDIMIENTOS ALMACENADOS AREAS

DELIMITER //
CREATE PROCEDURE AltaArea (pNombre varchar(30),pDescripcion varchar(30),pCapacidad int,pIdMapa int)
BEGIN
INSERT INTO Area (IdArea,Nombre,Descripcion,Capacidad,IdMapa) VALUES(0,pNombre,pDescripcion,pCapacidad,pIdMapa);
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ModificarArea(pIdArea int,pNombre varchar(30),pDescripcion varchar(30),pCantidad int,pIdMapa int)
BEGIN
UPDATE Area SET Nombre=pNombre,Descripcion=pDescripcion,Cantidad=pCantidad,IdMapa=pIdMapa WHERE IdArea=pIdArea;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarArea (pIdArea int)
BEGIN
UPDATE PUNTO SET ELIMINADO=1 WHERE IdArea=pIdArea;
UPDATE Area SET Eliminado=1 WHERE IdArea=pIdArea;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE AltaPuntodeArea (pIdArea int,pIdPunto int,pCordX real,pCordY real)
BEGIN
INSERT INTO Punto (IdPunto,IdArea,CordX,CordY) VALUES(0,pIdArea,pCordX,pCordY);
END
//
DELIMITER;


DELIMITER //
CREATE PROCEDURE BuscarArea(pIdArea int)
BEGIN
SELECT *
FROM Area
WHERE Area.IdArea=pIdArea;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarAreaPorNombre(pNombre varchar(30))
BEGIN
SELECT *
FROM Area
WHERE Area.Nombre=pNombre;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarAreasDeMapa(pIdMapa int)
BEGIN
SELECT *
FROM Mapa
join area
on mapa.IdMapa=Area.IdMapa
WHERE Area.Eliminado=0 and Area.IdMapa=pIdMapa;
END



DELIMITER //
CREATE PROCEDURE ListarPuntosdeUnArea(pIdArea int)
BEGIN
SELECT *
FROM Area
join punto 
ON Area.IdPunto=Punto.IdPunto
where Area.IdArea=pIdArea;
END//
DELIMITER;


-- PROCEDIMIENTOS ALMACENADOS EVENTOS


DELIMITER //
CREATE PROCEDURE AltaEvento (pNombre varchar(30),pDescripcion varchar(60),pFechaInicio timestamp,pFechaFin timestamp,pIdArea int,pCiOrganizador varchar(30),pNombreCategoria varchar(30))
BEGIN
INSERT INTO Evento(IdEvento,Nombre,Descripcion,FechaInicio,FechaFin,IdArea,CiOrganizador,NombreCategoria,Eliminado) VALUES(0,pNombre,pDescripcion,pFechaInicio,pFechaFin,pIdArea,pCiOrganizador,pNombreCategoria,0);
END//


DELIMITER //
CREATE PROCEDURE ModificarEvento(pIdEvento int,pNombre varchar(30),pDescripcion varchar(60),pFechaInicio timestamp,pFechaFin timestamp,pIdArea int,pCiOrganizador varchar(30),pNombreCategoria varchar(30))
BEGIN
UPDATE Evento SET Nombre=pNombre,Descripcion=pDescripcion,FechaInicio=pFechaInicio,FechaFin=pFechaFin,NombreLugar=pNombreLugar,CiOrganizador=pCiOrganizador,NombreCategoria=pNombreCategoria  WHERE IdEvento=pIdEvento;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarEvento (pIdEvento int)
BEGIN
UPDATE Evento SET Eliminado=1 WHERE IdEvento=pIdEvento;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE BuscarEvento(pIdEvento int)
BEGIN
SELECT *
FROM Evento
WHERE Evento.IdEvento=pIdEvento and Eliminado=0;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarEventosPorFecha()
BEGIN
SELECT *
FROM Evento
where evento.Eliminado=0 
order by  UNIX_TIMESTAMP(evento.FechaInicio) desc;
END//
DELIMITER;



DELIMITER //
CREATE PROCEDURE ListarEventosOrganizador(pCiOrganizador varchar(30))
BEGIN
SELECT *
FROM organizador 
join evento 
on Organizador.CiOrganizador=evento.CiOrganizador
where evento.CiOrganizador=pCiOrganizador and evento.Eliminado=0;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarEventosReservados()
BEGIN
SELECT *
FROM organizador 
join evento 
on Organizador.CiOrganizador=evento.CiOrganizador
join Reserva
on evento.IdEvento=Reserva.EventoReservado
join clientes
on Reserva.ClienteReserva=clientes.CiCliente
where  evento.Eliminado=0 and evento.EstadoReserva=1;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarEventosDisponibles()
BEGIN
SELECT *
FROM evento
join reserva
on evento.IdEvento=Reserva.EventoReservado
where evento.Eliminado=0 and evento.EstadoReserva=0;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarEventosxArea(pIdArea int)
BEGIN
SELECT *
FROM area
join alquiler
on area.IdArea=alquiler.IdArea
join evento 
where evento.NombreLugar=pNombreLugar and evento.Eliminado=0;
END//
DELIMITER;

-- PROCEDIMIENTOS ALMACENADOS RESERVA

DELIMITER //
CREATE PROCEDURE AltaReserva (pClienteReserva varchar(30),pIdEvento int,pCantidad int,pFechaReserva timestamp,pFechaEmision timestamp)
BEGIN
INSERT INTO Reserva(IdReserva,ClienteReserva,EventoReservado,CantidadReserva,FechaReserva,FechaEmision) VALUES(0,pClienteReserva,pIdEvento,pCantidad,pFechaReserva,pFechaEmision);
UPDATE Evento set EstadoReserva=1 where evento.IdEvento=reserva.EventoReservado;
END//

DELIMITER //
CREATE PROCEDURE ModificarReserva (pIdReserva int,pClienteReserva varchar(30),pIdEvento int,pCantidad int,pFechaReserva timestamp,pFechaEmision timestamp)
BEGIN
UPDATE reserva SET ClienteReserva=pClienteReserva,EventoReservado=pIdEvento,CantidadReserva=pCantidad,FechaReserva=pFechaReserva,FechaEmision=pFechaEmision WHERE IdReserva=pIdReserva;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarReserva (pIdReserva int,pIdEvento int)
BEGIN
delete from reserva where IdReserva=pIdReserva;
UPDATE EVENTO SET evento.EstadoReserva=1 where evento.IdEvento=reserva.EventoReservado;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE BuscarReserva(pIdReserva int)
BEGIN
SELECT *
FROM reserva
WHERE reserva.IdReserva=pIdReserva and evento.EstadoReserva=1;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarReservasPorFecha()
BEGIN
SELECT *
FROM reserva
where evento.EstadoReserva=1
order by  UNIX_TIMESTAMP(reserva.FechaEmision) desc;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarReservasPorCliente(pCiCliente varchar(30))
BEGIN
SELECT *
FROM clientes
join Reserva
on clientes.CiCliente=Reserva.ClienteReserva
join entrada
on reserva.IdReserva=entrada.IdReserva
where Reserva.ClienteReserva=pCiCliente and evento.EstadoReserva=1
order by  UNIX_TIMESTAMP(reserva.FechaEmision) desc;
END//

DELIMITER //
CREATE PROCEDURE ListarReservasPorEvento(pIdEvento int)
BEGIN
SELECT *
FROM Evento
join reserva
on evento.IdEvento=reserva.EventoReservado
join entrada 
on reserva.IdReserva=entrada.IdReserva
where reserva.EventoReservado=pIdEvento and evento.EstadoReserva=1
order by  UNIX_TIMESTAMP(entrada.FechaEmision) desc;
END//


DELIMITER //
CREATE PROCEDURE ComprobarEstadoEvento(pIdEvento int,pFechaInicio timestamp,pFechaFin timestamp)
BEGIN
SELECT *
FROM Evento 
where Evento.IdEvento=pIdEvento and evento.FechaInicio >= pFechaFin 
  AND evento.FechaFin <= pFechaInicio;
END//
DELIMITER;


-- PROCEDIMIENTOS ALMACENADOS ENTRADA

DELIMITER //
CREATE PROCEDURE AltaEntrada (pPrecio double,pIdReserva int,pCantidad int,pFechaEmision timestamp)
BEGIN
INSERT INTO Entrada(IdEntrada,Precio,IdReserva,Cantidad,FechaEmision) VALUES(0,pPrecio,pIdReserva,pCantidad,pFechaEmision);
END//


DELIMITER //
CREATE PROCEDURE ModificarEntrada (pIdEntrada int,pPrecio double,pIdReserva int,pCantidad int,pFechaEmision timestamp)
BEGIN
UPDATE Entrada SET Precio=pPrecio,IdReserva=pIdReserva,Cantidad=pCantidad,FechaEmision=pFechaEmision WHERE IdEntrada=pIdEntrada;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarEntrada (pIdEntrada int,pIdReserva int)
BEGIN
delete from Entrada where IdEntrada=pIdEntrada and entrada.IdReserva=pIdReserva;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarEntrada(pIdEntrada int)
BEGIN
SELECT *
FROM Entrada
WHERE Entrada.IdEntrada=pIdEntrada ;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarEntradasPorFecha()
BEGIN
SELECT *
FROM Entrada
order by  UNIX_TIMESTAMP(entrada.FechaEmision) desc;
END//
DELIMITER;

-- DELIMITER //
-- CREATE PROCEDURE ListarEntradasPorCliente(pCiCliente varchar(30))
-- BEGIN
-- SELECT *
-- FROM clientes
-- join reserva
-- on clientes.CiCliente=reserva.ClienteReserva
-- join Entrada
-- on reserva.IdReserva=entrada.IdReserva
-- where reserva.ClienteReserva=pCiCliente
-- order by  UNIX_TIMESTAMP(entrada.FechaEmision) desc;
-- END//
-- 
-- DELIMITER //
-- CREATE PROCEDURE ListarEntradasPorEvento(pIdEvento int)
-- BEGIN
-- SELECT *
-- FROM Evento
-- join reserva
-- on evento.IdEvento=reserva.EventoReservado
-- join entrada
-- on reserva.IdReserva=entrada.IdReserva
-- where reserva.EventoReservado=pIdEvento
-- order by  UNIX_TIMESTAMP(entrada.FechaEmision) desc;
-- END//
-- 

-- PROCEDIMIENTOS ALMACENADOS MensajesFeedbackLugar

DELIMITER //
CREATE PROCEDURE AltaMensajeFeedbackLugar (pNombreFeedback varchar(30),pCiUsuario varchar(30),pMensaje varchar(100),pFechaRealizado timestamp,pNombreLugar varchar(30))
BEGIN
INSERT INTO Mensajefeedbacklugar(IdFeedback,NombreFeedback,CiUsuario,MensajeFeedback,FechaRealizado,NombreLugar) VALUES(0,pNombreFeedback,pCiUsuario,pMensaje,pFechaRealizado,pNombreLugar);
END//


DELIMITER //
CREATE PROCEDURE ModificarMensajeFeedbackLugar (IdFeedback int,pNombreFeedback varchar(30),pMensaje varchar(100),pCiUsuario varchar(30),pFechaRealizado timestamp,pNombreLugar varchar(30))
begin
UPDATE Mensajefeedbacklugar SET NombreFeedback=pNombreFeedback,MensajeFeedback=pMensaje,CiUsuario=pCiUsuario,FechaRealizado=pFechaRealizado,NombreLugar=pNombreLugar WHERE IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarMensajeFeedbackLugar(pIdFeedback int)
BEGIN
delete from ComentarioFeedbackLugar where IdFeedback=pIdFeedback;
delete from Mensajefeedbacklugar where IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarMensajeFeebackLugar(pIdFeedback int)
BEGIN
SELECT *
FROM Mensajefeedbacklugar
WHERE Mensajefeedbacklugar.IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarMensajesFeedbackLugaresxUsuario(pCiUsuario varchar(30))
BEGIN
SELECT *
FROM comentariofeedbacklugar join mensajefeedbacklugar
on comentariofeedbacklugar.IdFeedback=mensajefeedbacklugar.IdFeedback
where Mensajefeedbacklugar.CiUsuario=pCiUsuario;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarMensajesFeedbackLugar()
BEGIN
SELECT *
FROM comentariofeedbacklugar join mensajefeedbacklugar
on comentariofeedbacklugar.IdFeedback= mensajefeedbacklugar.IdFeedback;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE ListarMensajesFeedbackdeUnLugar(pNombreLugar varchar(30))
BEGIN
SELECT *
FROM Lugar
join Mensajefeedbacklugar
on lugar.NombreLugar= mensajefeedbacklugar.NombreLugar
join comentariofeedbacklugar
on mensajefeedbacklugar.IdFeedback= comentariofeedbacklugar.IdFeedback
where Mensajefeedbacklugar.NombreLugar=pNombreLugar
order by  UNIX_TIMESTAMP(Mensajefeedbacklugar.FechaRealizado) desc;
END//

DELIMITER //
CREATE PROCEDURE ListarMensajesFeedbackPorLugarYUsuario(pNombreLugar varchar(30),pCiUsuario varchar(30))
BEGIN
SELECT *
FROM Lugar
join mensajefeedbacklugar
on lugar.NombreLugar= mensajefeedbacklugar.NombreLugar
join comentariofeedbacklugar
on mensajefeedbacklugar.IdFeedback= comentariofeedbacklugar.IdFeedback
where Mensajefeedbacklugar.NombreLugar=pNombreLugar and Mensajefeedbacklugar.CiUsuario=pCiUsuario
order by  UNIX_TIMESTAMP(Mensajefeedbacklugar.FechaRealizado) desc;
END//

-- PROCEDIMIENTOS ALMACENADOS MensajesFeedbackEvento

DELIMITER //
CREATE PROCEDURE AltaMensajeFeedbackEvento (pNombreFeedback varchar(30),pCiUsuario varchar(30),pMensaje varchar(100),pFechaRealizado timestamp,pIdEvento int)
BEGIN
INSERT INTO MensajefeedbackEvento(IdFeedback,NombreFeedback,CiUsuario,MensajeFeedback,FechaRealizado,IdEvento) VALUES(0,pNombreFeedback,pCiUsuario,pMensaje,pFechaRealizado,pIdEvento);
END//


DELIMITER //
CREATE PROCEDURE ModificarMensajeFeedbackEvento (pIdFeedback int,pNombreFeedback varchar(30),pCiUsuario varchar(30),pMensaje varchar(100),pFechaRealizado timestamp,pIdEvento int)
begin
UPDATE mensajefeedbackevento SET NombreFeedback=pNombreFeedback,CiUsuario=pCiUsuario,MensajeFeedback=pMensaje,FechaRealizado=pFechaRealizado,IdEvento=pIdEvento WHERE IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarMensajeFeedbackEvento (pIdFeedback int)
BEGIN
delete from comentariofeedbackevento where IdFeedback=pIdFeedback;
delete from mensajefeedbackEvento where IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarMensajeFeebackEvento(pIdFeedback int)
BEGIN
SELECT *
FROM Mensajefeedbackevento
WHERE mensajefeedbackEvento.IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarMensajesFeedbackEventoxUsuario(pCiUsuario varchar(30))
BEGIN
SELECT *
FROM comentariofeedbackevento join mensajefeedbackevento
on comentariofeedbackevento.IdFeedback= mensajefeedbackevento.IdFeedback
where mensajefeedbackevento.CiUsuario=pCiUsuario
order by  UNIX_TIMESTAMP(mensajefeedbackevento.FechaRealizado) desc;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarMensajesFeedbackEvento()
BEGIN
SELECT *
FROM comentariofeedbackevento join mensajefeedbackevento
on comentariofeedbackevento.IdFeedback= comentariofeedbackevento.IdFeedback
order by  UNIX_TIMESTAMP(mensajefeedbackevento.FechaRealizado) desc;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE ListarMensajesFeedbackPorEvento(pIdEvento int)
BEGIN
SELECT *
FROM Evento
join mensajefeedbackevento
on evento.IdEvento= mensajefeedbackevento.IdEvento
join comentariofeedbackevento
on mensajefeedbackevento.IdFeedback= comentariofeedbackevento.IdFeedback
where mensajefeedbackevento.IdEvento=pIdEvento
order by  UNIX_TIMESTAMP(mensajefeedbackevento.FechaRealizado) desc;
END//

DELIMITER //
CREATE PROCEDURE ListarMensajesFeedbackPorEventoYUsuario(pIdEvento int,pCiUsuario varchar(30))
BEGIN
SELECT *
FROM evento
join mensajefeedbackevento
on evento.IdEvento= mensajefeedbackevento.IdEvento
join comentariofeedbackevento
on mensajefeedbackevento.IdFeedback= comentariofeedbackevento.IdFeedback
where mensajefeedbackevento.IdEvento=pIdEvento and mensajefeedbackevento.CiUsuario=pCiUsuario
order by  UNIX_TIMESTAMP(mensajefeedbackevento.FechaRealizado) desc;
END//


-- PROCEDIMIENTOS ALMACENADOS ComentariosFeedbackLugar

DELIMITER //
CREATE PROCEDURE AltaComentarioFeedbackLugar(pIdFeedback int ,pAsunto varchar(30),pMensajeComentario varchar(30),pCiUsuario varchar(100),pFechaRealizado timestamp)
BEGIN
INSERT INTO comentariofeedbacklugar(IdComentario,IdFeedback,AsuntoComentario,MensajeComentario,CiUsuario,FechaRealizado) VALUES(0,pNombreFeedback,pCiUsuario,pMensaje,pFechaRealizado);
END//


DELIMITER //
CREATE PROCEDURE ModificarComentarioFeedbackLugar(pIdComentario int,pIdFeedback int ,pAsunto varchar(30),pMensajeComentario varchar(30),pCiUsuario varchar(100),pFechaRealizado timestamp)
begin
UPDATE comentariofeedbacklugar SET AsuntoComentario=pAsunto,MensajeComentario=pMensajeComentario,CiUsuario=pCiUsuario,FechaRealizado=pFechaRealizado WHERE IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarComentarioFeedbackLugar(pIdComentario int)
BEGIN
delete from ComentarioFeedbackLugar where IdComentario=pIdComentario;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarComentariodeUnMensajeFeebackLugar(pIdComentario int,pIdFeedback int)
BEGIN
SELECT *
FROM comentariofeedbacklugar
WHERE comentariofeedbacklugar.IdComentario=pIdComentario and comentariofeedbacklugar.IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarComentariosFeedbackLugaresxUsuario(pCiUsuario varchar(30))
BEGIN
SELECT *
FROM comentariofeedbacklugar join mensajefeedbacklugar
on comentariofeedbacklugar.IdFeedback=mensajefeedbacklugar.IdFeedback
where Comentariofeedbacklugar.CiUsuario=pCiUsuario;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarComentariosFeedbackLugar()
BEGIN
SELECT *
FROM comentariofeedbacklugar join mensajefeedbacklugar
on comentariofeedbacklugar.IdFeedback= mensajefeedbacklugar.IdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarComentariosdeUnMensajeFeedbackLugar(pIdFeedback int)
BEGIN
SELECT *
FROM comentariofeedbacklugar join mensajefeedbacklugar
on comentariofeedbacklugar.IdFeedback= mensajefeedbacklugar.IdFeedback
where comentariofeedbacklugar.IdFeedback=pIdFeedback;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE ListarComentariosFeedbackPorLugarYUsuario(pNombreLugar varchar(30),pCiUsuario varchar(30))
BEGIN
SELECT *
FROM Lugar
join mensajefeedbacklugar
on lugar.NombreLugar= mensajefeedbacklugar.NombreLugar
join comentariofeedbacklugar
on mensajefeedbacklugar.IdFeedback= comentariofeedbacklugar.IdFeedback
where Mensajefeedbacklugar.NombreLugar=pNombreLugar and comentariofeedbacklugar.CiUsuario=pCiUsuario
order by  UNIX_TIMESTAMP(comentariofeedbacklugar.FechaRealizado) desc;
END//

-- PROCEDIMIENTOS ALMACENADOS ComentariosFeedbackEvento

DELIMITER //
CREATE PROCEDURE AltaComentarioFeedbackEvento(pIdFeedback int ,pAsunto varchar(30),pMensajeComentario varchar(30),pCiUsuario varchar(100),pFechaRealizado timestamp)
BEGIN
INSERT INTO comentariofeedbackEvento(IdComentario,IdFeedback,AsuntoComentario,MensajeComentario,CiUsuario,FechaRealizado) VALUES(0,pNombreFeedback,pCiUsuario,pMensaje,pFechaRealizado);
END//


DELIMITER //
CREATE PROCEDURE ModificarComentarioFeedbackEvento(pIdComentario int,pIdFeedback int ,pAsunto varchar(30),pMensajeComentario varchar(30),pCiUsuario varchar(100),pFechaRealizado timestamp)
begin
UPDATE comentariofeedbackevento SET AsuntoComentario=pAsunto,MensajeComentario=pMensajeComentario,CiUsuario=pCiUsuario,FechaRealizado=pFechaRealizado WHERE IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarComentarioFeedbackEvento(pIdComentario int)
BEGIN
delete from ComentarioFeedbackEvento where IdComentario=pIdComentario;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarComentariodeUnMensajeFeebackEvento(pIdComentario int,pIdFeedback int)
BEGIN
SELECT *
FROM comentariofeedbackevento
WHERE comentariofeedbackevento.IdComentario=pIdComentario and comentariofeedbackevento.IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarComentariosFeedbackEventoxUsuario(pCiUsuario varchar(30))
BEGIN
SELECT *
FROM comentariofeedbackevento join mensajefeedbackevento
on comentariofeedbackevento.IdFeedback=mensajefeedbackevento.IdFeedback
where Comentariofeedbackevento.CiUsuario=pCiUsuario;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarComentariosFeedbackEvento()
BEGIN
SELECT *
FROM comentariofeedbackevento join mensajefeedbackevento
on comentariofeedbackevento.IdFeedback= mensajefeedbackevento.IdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarComentariosdeUnMensajeFeedbackEvento(pIdFeedback int)
BEGIN
SELECT *
FROM comentariofeedbackevento join mensajefeedbackevento
on comentariofeedbackevento.IdFeedback= mensajefeedbackevento.IdFeedback
where comentariofeedbackevento.IdFeedback=pIdFeedback;
END//
DELIMITER;



-- PROCEDIMIENTOS ALMACENADOS CATEGORIA

DELIMITER //
CREATE PROCEDURE BuscarCategoria(pNombreCategoria varchar(30))
BEGIN
SELECT *
FROM categoria
WHERE categoria.NombreCategoria=pNombreCategoria;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarCategorias()
BEGIN
SELECT *
FROM categoria;
END // 

call AltaDueño('Matias','matiasmelfi1990','Matii','4772000','matias@gmail');

call AltaPais ('Uruguay','UY','-32.522779','-55.765835')

call AltaPais ('Argentina','AR',-38.416097,-63.616672);
call AltaPais ('Brasil','BR',-14.235004,-51.92528);
call AltaCiudad ('Montevideo'),-34.9011127,-56.1645314,'Uruguay');
call AltaCiudad ('Santa Lucia'),-34.46467409,-56.40518188,'Uruguay');
call AltaCiudad ('Minas'),-34.38084597,-55.26260376,'Uruguay');
call AltaCiudad ('BahÃ¬a Blanca'),-38.76693348,-62.26501465,'Argentina');
call AltaCiudad ('Buenos Aires'),-34.6377276,-58.39782715,'Argentina');
call AltaCiudad ('Mar del Plata'),-38.07836563,-57.58483887,'Argentina');
call AltaCiudad ('Brasilia'),-15.80282494,-47.80151367,'Brasil');
call AltaCiudad ('Salvador'),-13.02596593,-38.45214844,'Brasil');