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
    IdMapa int AUTO_INCREMENT not null primary key,
	Nombre varchar(30) not null,
	Imagen varbinary(300),
    Eliminado boolean
);

create table Punto 
(
    IdPunto int AUTO_INCREMENT not null primary key,
	cordX real,
	cordY real,
    Eliminado boolean
);

create table Area 
(
    IdArea INT AUTO_INCREMENT not null ,
    IdMapa int not null,
	Nombre varchar(30) not null,
    Eliminado boolean,
    IdPunto int not null,
    foreign key (IdPunto) references Punto (IdPunto),
    foreign key (IdMapa) references Mapa (IdMapa),
    primary key(IdArea,IdMapa,IdPunto)
);

create table Lugar 
(
	NombreLugar varchar(30) not null,
    Direccion varchar(30) not null,
    Capacidad int,
    Descripcion varchar(30) not null,
	UbicacionCiudad varchar(30) not null,
    CordX real not null,
    CordY real not null,
    Eliminado boolean,
    IdMapa int not null,
	CiDueño varchar(30) not null,
    foreign key (CiDueño) references Dueño (CiDueño),
    foreign key (IdMapa) references Mapa (IdMapa),
	foreign key (UbicacionCiudad) references Ubicacion (Nombre),
    primary key(NombreLugar,IdMapa,UbicacionCiudad,CiDueño)
);

create table FotosLugar
(
NombreFoto varchar(30) not null,
NombreLugar varchar(30) ,
Foto varbinary(100) not null,
foreign key (NombreLugar) references Lugar (NombreLugar),
primary key(NombreFoto,NombreLugar)
);

create table Alquiler
(
IdAlquiler int AUTO_INCREMENT not null,
NombreLugar varchar(30) not null,
CiOrganizador varchar(30) not null,
FechaInicioAlquiler timestamp,
FechaFinAlquiler timestamp,
FechaRealizado timestamp,
foreign key (NombreLugar) references Lugar (NombreLugar),
foreign key (CiOrganizador) references organizador (CiOrganizador),
primary key(IdAlquiler,NombreLugar,CiOrganizador)
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
  NombreLugar varchar(30) ,
  CiOrganizador varchar(30) not null,
  NombreCategoria varchar(30) not null,
  CapacidadDisponible int not null,
  EstadoReserva boolean default false,
  foreign key (NombreCategoria) references categoria (NombreCategoria),
  foreign key (NombreLugar) references Lugar (NombreLugar),
  foreign key (CiOrganizador) references Organizador(CiOrganizador),
  primary key(IdEvento,NombreLugar,CiOrganizador),
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
CREATE PROCEDURE AltaAdmin (pNombre VARCHAR(30), pContraseña Varchar(30),pNombreUsuario varchar(30),pCiAdmin varchar(30),pEmail varchar(50))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
INSERT INTO Usuarios VALUES(pNombre,pContraseña,pNombreUsuario,pCiAdmin,pEmail);
INSERT INTO Admin values(pCiAdmin);
		COMMIT;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE ModificarAdmin (pNombre VARCHAR(30), pContraseña Varchar(30),pNombreUsuario varchar(30),pCiAdmin varchar(30),pEmail varchar(50))
BEGIN
UPDATE Usuarios SET Nombre=pNombre,Contraseña=pContraseña,NombreUsuario=pNombreUsuario,Email=pEmail  WHERE CiAdmin=pCiAdmin;
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
CREATE PROCEDURE AdminLogueo(pNombreUsuario varchar(30),pContraseña varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN Admin a
ON u.Ci =a.CiAdmin
WHERE u.NombreUsuario=pNombreUsuario and u.Contraseña=pContraseña;
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
CREATE PROCEDURE AltaCliente (pNombre VARCHAR(30), pContraseña Varchar(30),pNombreUsuario varchar(30),pCiCliente varchar(30),pEmail varchar(50))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
INSERT INTO Usuarios VALUES(pNombre,pContraseña,pNombreUsuario,pCiCliente,pEmail);
INSERT INTO Clientes values(pCiCliente);
		COMMIT;
END //
DELIMITER;




DELIMITER //
CREATE PROCEDURE ModificarCliente (pNombre VARCHAR(30), pContraseña Varchar(30),pNombreUsuario varchar(30),pCiCliente varchar(30),pEmail varchar(50))
BEGIN
UPDATE Usuarios SET Nombre=pNombre,Contraseña=pContraseña,NombreUsuario=pNombreUsuario,Email=pEmail  WHERE CiCliente=pCiCliente;
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
CREATE PROCEDURE ClienteLogueo(pNombreUsuario varchar(30),pContraseña varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN Clientes c
ON u.Ci =c.CiCliente
WHERE u.NombreUsuario=pNombreUsuario and u.Contraseña=pContraseña;
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


-- PROCEDIMIENTOS ALMACENADOS DUEÑO

DELIMITER //
CREATE PROCEDURE AltaDueño (pNombre VARCHAR(30), pContraseña Varchar(30),pNombreUsuario varchar(30),pCiDueño varchar(30),pEmail varchar(50))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
INSERT INTO Usuarios VALUES(pNombre,pContraseña,pNombreUsuario,pCiDueño,pEmail);
INSERT INTO Dueño values(pCiDueño);
		COMMIT;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE ModificarDueño (pNombre VARCHAR(30), pContraseña Varchar(30),pNombreUsuario varchar(30),pCiDueño varchar(30),pEmail varchar(50))
BEGIN
UPDATE Usuarios SET Nombre=pNombre,Contraseña=pContraseña,NombreUsuario=pNombreUsuario,Email=pEmail  WHERE CiDueño=pCiDueño;
END
// DELIMITER;



DELIMITER //
CREATE PROCEDURE EliminarDueño (pCiDueño varchar(30))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
DELETE FROM Dueño WHERE CiDueño=pCiDueño;
DELETE FROM Usuarios WHERE Ci=pCiDueño;
		COMMIT;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarDueño(pCiDueño varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN Dueño d
ON u.Ci =d.CiDueño
WHERE d.CiDueño=pCiDueño;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE DueñoLogueo(pNombreUsuario varchar(30),pContraseña varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN Dueño c
ON u.Ci =c.CiDueño
WHERE u.NombreUsuario=pNombreUsuario and u.Contraseña=pContraseña;
END //
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarDueños()
BEGIN
SELECT *
FROM Usuarios u JOIN Dueño d
ON u.Ci=d.CiDueño and u.Eliminado=0;
END//
DELIMITER;


-- PROCEDIMIENTOS ALMACENADOS ORGANIZADOR

DELIMITER //
CREATE PROCEDURE AltaOrganizador (pNombre VARCHAR(30), pContraseña Varchar(30),pNombreUsuario varchar(30),pCiOrganizador varchar(30),pEmail varchar(50))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
INSERT INTO Usuarios VALUES(pNombre,pContraseña,pNombreUsuario,pCiOrganizador,pEmail);
INSERT INTO Organizador values(pCiOrganizador);
		COMMIT;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE ModificarOrganizador (pNombre VARCHAR(30), pContraseña Varchar(30),pNombreUsuario varchar(30),pCiOganizador varchar(30),pEmail varchar(50))
BEGIN
UPDATE Usuarios SET Nombre=pNombre,Contraseña=pContraseña,NombreUsuario=pNombreUsuario,Email=pEmail  WHERE CiOrganizador=pCiOrganizador;
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
CREATE PROCEDURE OrganizadorLogueo(pNombreUsuario varchar(30),pContraseña varchar(30))
BEGIN
SELECT *
FROM Usuarios u JOIN Organizador o
ON u.Ci =o.CiOrganizador
WHERE u.NombreUsuario=pNombreUsuario and u.Contraseña=pContraseña;
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
UPDATE Ubicacion SET Ubicacion.Eliminado=1  WHERE Pais.NombrePais=pNombre;
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
UPDATE Ubicacion SET Eliminado=1 WHERE Ciudad.NombreCiudad=pNombreCiudad and Ciudad.NombrePais=pNombrePais;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarCiudad(pNombre varchar(30))
BEGIN
SELECT *
FROM Ubicacion join Pais 
ON Ubicacion.Nombre=Pais.NombrePais
join Ciudad 
ON Pais.NombrePais=Ciudad.NombreCiudad
WHERE Ciudad.NombreCiudad=pNombre and  Ubicacion.Eliminado=0;
END //
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarCiudades()
BEGIN
SELECT *
FROM Ubicacion join Pais 
ON Ubicacion.Nombre=Pais.NombrePais
join Ciudad 
ON Pais.NombrePais=Ciudad.NombreCiudad
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
CREATE PROCEDURE AltaLugar (pNombre varchar(30),pDireccion varchar(30),pCapacidad int,pDescripcion varchar(30),pIdMapa int,pNombreUbicacion varchar(30),pCordX real,pCordY real,pCiDueño varchar(30))
BEGIN
INSERT INTO Lugar(NombreLugar,Direccion,Capacidad,Descripcion,IdMapa,UbicacionCiudad,CordX,CordY,CiDueño,EstadoAlquiler) VALUES(pNombre,pDireccion,pCapacidad,pDescripcion,pIdMapa,pNombreUbicacion,pCordX,pCordY,pCiDueño,0);
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ModificarLugar(pNombre varchar(30),pDireccion varchar(30),pCapacidad int,pDescripcion varchar(30),pIdMapa int,pNombreUbicacion varchar(30),pCiDueño varchar(30)) 
BEGIN
UPDATE Lugar SET NombreLugar=pNombre,Direccion=pDireccion,Capacidad=pCapacidad,Descripcion=pDescripcion,IdMapa=pIdMapa,UbicacionCiudad=pNombreUbicacion,CiDueño=pCiDueño WHERE NombreLugar=pNombreLugar;
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
CREATE PROCEDURE BuscarMapaLugar(pNombreLugar varchar(30),pIdMapa int)
BEGIN
SELECT *
FROM Mapa
join Lugar
On Mapa.IdMapa=Lugar.IdMapa
WHERE Lugar.NombreLugar=pNombreLugar and lugar.IdMapa=pIdMapa;
END//
DELIMITER;



-- PROCEDIMIENTOS ALMACENADOS ALQUILER


DELIMITER //
CREATE PROCEDURE AlquilarLugar (pNombreLugar varchar(30),pFechaInicio timestamp,pFechaFin timestamp,pCiOrganizador varchar(30),pFechaReservacion timestamp)
BEGIN
INSERT INTO ALQUILER(IdAlquiler,NombreLugar,CiOrganizador,FechaInicioAlquiler,FechaFinAlquiler,FechaRealizado) values (0,pNombreLugar,pCiOrganizador,pFechaInicio,pFechaFin,pFechaReservacion);
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE ComprobarAlquilerLugar(pNombreLugar varchar(30),pFechaInicio timestamp,pFechaFin timestamp)
BEGIN
SELECT *
FROM Alquiler 
where alquiler.NombreLugar=pNombreLugar and alquiler.FechaInicioAlquiler <= pFechaFin 
  AND alquiler.FechaFinAlquiler >= pFechaInicio;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE EliminarAlquilerLugar (pIdAlquiler int,pNombreLugar varchar(30))
BEGIN
DELETE from alquiler WHERE alquiler.IdAlquiler=pIdAlquiler and alquiler.NombreLugar=pNombreLugar;
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
CREATE PROCEDURE ListarAlquilerdeLugar(pNombreLugar varchar(30))
BEGIN
SELECT *
FROM lugar
join alquiler
on lugar.NombreLugar=alquiler.NombreLugar
where alquiler.NombreLugar=pNombreLugar
order by  UNIX_TIMESTAMP(alquiler.FechaInicioAlquiler) desc;
END//
DELIMITER;

-- PROCEDIMIENTOS ALMACENADOS PUNTO


DELIMITER //
CREATE PROCEDURE ModificarPunto(pCordX double,pCordY double,pIdPunto int) 
BEGIN
UPDATE Punto SET cordX=pCordX,cordY=pCordY  WHERE IdPunto=pIdPunto;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarPunto (pIdPunto int)
BEGIN
UPDATE Punto SET Eliminado=1  WHERE IdPunto=pIdPunto;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarPuntoxId(pIdPunto int)
BEGIN
SELECT *
FROM Punto p
WHERE p.IdPunto=pIdPunto;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarPuntoxCoordenadas(pCordX double,pCordY double)
BEGIN
SELECT *
FROM Punto p
WHERE p.CordX=pCordX and p.CordY=pCordY;
END


-- PROCEDIMIENTOS ALMACENADOS EVENTO

DELIMITER //
CREATE PROCEDURE AltaMapa (pNombre varchar(30),pImagen varbinary(300))
BEGIN
INSERT INTO Mapa(IdMapa,Nombre,Imagen) VALUES(0,pNombre,pImagen);
UPDATE Mapa SET Eliminado=0;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ModificarMapa(pIdMapa int,pNombre varchar(30),pImagen varbinary(300)) 
BEGIN
UPDATE Mapa SET Nombre=pNombre,Imagen=pImagen WHERE IdMapa=pIdMapa;
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
CREATE PROCEDURE AltaFotosLugar (pNombreFoto varchar(30),pFoto varbinary(300),pNombreLugar varchar(30))
BEGIN
INSERT INTO FotosLugar(NombreFoto,Foto,NombreLugar) VALUES(pNombreFoto,pFoto,pNombreLugar);
END//

DELIMITER //
CREATE PROCEDURE EliminarFotosLugar (pNombreFoto varchar(30),pNombreLugar varchar(30))
BEGIN
Delete from FotosLugar
where NombreFoto = pNombreFoto and NombreLugar = pNombreLugar;
END//

CREATE PROCEDURE ListarFotosLugar (pNombreLugar varchar(30))
BEGIN
Select * from FotosLugar
where NombreLugar = pNombreLugar;
END//

-- PROCEDIMIENTOS ALMACENADOS AREAS

DELIMITER //
CREATE PROCEDURE AltaArea (pNombre varchar(30),pIdMapa int)
BEGIN
INSERT INTO Area (IdArea,Nombre,IdMapa) VALUES(0,pNombre,pIdMapa);

END

DELIMITER //
CREATE PROCEDURE ModificarArea(pIdArea int,pNombre varchar(30),pIdMapa int)
BEGIN
UPDATE Area SET Nombre=pNombre,IdMapa=pIdMapa WHERE IdArea=pIdArea;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarArea (pIdArea int)
BEGIN
UPDATE Area SET Eliminado=1 WHERE IdArea=pIdArea;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE AltaPuntodeArea (pIdArea int,pIdPunto int,pCordX real,pCordY real,pIdMapa int)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
START TRANSACTION;
INSERT INTO Punto (IdPunto,CordX,CordY) VALUES(0,pCordX,pCordY);
INSERT INTO Area (IdArea,IdPunto,IdMapa) VALUES(0,pIdPunto,pIdMapa);
commit;
END
//
DELIMITER;


DELIMITER //
CREATE PROCEDURE BuscarArea(pIdArea int)
BEGIN
SELECT *
FROM Mapa 
WHERE Mapa.IdArea=pIdArea;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarAreasDeMapa(pIdMapa int)
BEGIN
SELECT *
FROM Area
Join Mapa
On Area.IdMapa=Mapa.IdMapa
WHERE Area.Eliminado=0 and Area.IdMapa=pIdMapa;
END



DELIMITER //
CREATE PROCEDURE ListarPuntosdeUnArea(pIdArea int)
BEGIN
SELECT *
FROM Area 
join Punto
ON Area.IdPunto=Punto.IdPunto
where Area.IdArea=pIdArea;
END//
DELIMITER;


-- PROCEDIMIENTOS ALMACENADOS EVENTOS


DELIMITER //
CREATE PROCEDURE AltaEvento (pNombre varchar(30),pDescripcion varchar(60),pFechaInicio timestamp,pFechaFin timestamp,pNombreLugar varchar(30),pCiOrganizador varchar(30),pNombreCategoria varchar(30))
BEGIN
INSERT INTO Evento(IdEvento,Nombre,Descripcion,FechaInicio,FechaFin,NombreLugar,CiOrganizador,NombreCategoria,Eliminado) VALUES(0,pNombre,pDescripcion,pFechaInicio,pFechaFin,pNombreLugar,pCiOrganizador,pNombreCategoria,0);
END//


DELIMITER //
CREATE PROCEDURE ModificarEvento(pIdEvento int,pNombre varchar(30),pDescripcion varchar(60),pFechaInicio timestamp,pFechaFin timestamp,pNombreLugar varchar(30),pCiOrganizador varchar(30),pNombreCategoria varchar(30))
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
CREATE PROCEDURE ListarEventosxLugar(pNombreLugar varchar(30))
BEGIN
SELECT *
FROM fotoslugar
join lugar
on fotoslugar.NombreLugar=lugar.NombreLugar
join evento 
on lugar.NombreLugar=evento.NombreLugar
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
END//

call AltaCliente('a','matiasmelfi','la','aasdasd','asdasd@fasdasd')
create table ComentarioFeedbackLugar (  IdComentario int AUTO_INCREMENT, IdFeedback int not null, AsuntoComentario varchar(30), MensajeComentario varchar(100), CiUsuario varchar(30), FechaRealizado timestamp, foreign key (CiUsuario) references Usuarios(Ci), foreign key (IdFeedback) references Feedback(IdFeedback), primary key(IdComentario,CiUsuario,IdFeedback) )
