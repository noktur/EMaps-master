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
    CodPais varchar(2) not null,
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
  foreign key (NombreCategoria) references categoria (NombreCategoria),
  foreign key (NombreLugar) references Lugar (NombreLugar),
  foreign key (CiOrganizador) references Organizador(CiOrganizador),
  primary key(IdEvento,NombreLugar,CiOrganizador),
  Eliminado boolean default 0
);



create table Entrada
( 
IdEntrada int AUTO_INCREMENT not null,
Precio double not null,
IdEvento int not null,
CiCliente varchar(30) not null,
Cantidad int not null,
FechaEmision timestamp not null,
foreign key (IdEvento) references Evento (IdEvento),
foreign key (CiCliente) references Clientes(CiCliente),
primary key(IdEntrada,IdEvento,CiCliente)
);

create table MedioPago
( 
IdMedioPago int unique,
IdEntrada int ,
Disponibilidad boolean not null default 0,
primary key(IdEntrada,IdMedioPago)
);

create table FeedbackLugar
( 
IdFeedback int  AUTO_INCREMENT,
NombreFeedback varchar(30),
CiUsuario varchar(30),
FechaRealizado timestamp,
NombreLugar varchar(30),
foreign key (CiUsuario) references Usuarios(Ci),
foreign key (NombreLugar) references Lugar(NombreLugar),
primary key(IdFeedback,CiUsuario,NombreLugar)
);

create table FeedbackEvento
( 
IdFeedback int  AUTO_INCREMENT,
NombreFeedback varchar(30),
CiUsuario varchar(30),
FechaRealizado timestamp,
IdEvento int,
foreign key (CiUsuario) references Usuarios(Ci),
foreign key (IdEvento) references Evento(IdEvento),
primary key(IdFeedback,CiUsuario,IdEvento)
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
CREATE PROCEDURE AltaPais (pNombre VARCHAR(30),pCodPais varchar(2),pCordX real,pCordY real)
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
CREATE PROCEDURE ListarEventoPorFecha()
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
join Entrada 
on evento.IdEvento=entrada.IdEvento
join clientes
on entrada.CiCliente=clientes.CiCliente
where  evento.Eliminado=0;
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



-- PROCEDIMIENTOS ALMACENADOS ENTRADA

DELIMITER //
CREATE PROCEDURE AltaEntrada (pPrecio double,pIdEvento int,pCiCliente varchar(30),pCantidad int,pFechaEmision timestamp)
BEGIN
INSERT INTO Entrada(IdEntrada,Precio,IdEvento,CiCliente,Cantidad,FechaEmision) VALUES(0,pPrecio,pIdEvento,pCiCliente,pCantidad,pFechaEmision);
END//


DELIMITER //
CREATE PROCEDURE ModificarEntrada (pIdEntrada int,pPrecio double,pIdEvento int,pCiCliente varchar(30),pCantidad int,pFechaEmision timestamp)
BEGIN
UPDATE Entrada SET Precio=pPrecio,IdEvento=pIdEvento,CiCliente=pCiCliente,Cantidad=pCantidad,FechaEmision=pFechaEmision WHERE IdEntrada=pIdEntrada;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE ComprobarEstadoEvento(pIdEvento int,pFechaInicio timestamp,pFechaFin timestamp)
BEGIN
SELECT *
FROM Evento 
where Evento.IdEvento=pIdEvento and evento.FechaInicio >= pFechaFin 
  AND evento.FechaFin <= pFechaInicio;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE EliminarEntrada (pIdEntrada int,pIdEvento int)
BEGIN
delete from Entrada where IdEntrada=pIdEntrada and entrada.IdEvento=pIdEvento;
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

DELIMITER //
CREATE PROCEDURE ListarEntradasPorCliente(pCiCliente varchar(30))
BEGIN
SELECT *
FROM clientes
join entrada
on clientes.CiCliente=entrada.CiCliente
where entrada.CiCliente=pCiCliente
order by  UNIX_TIMESTAMP(entrada.FechaEmision) desc;
END//

DELIMITER //
CREATE PROCEDURE ListarEntradasPorEvento(pIdEvento int)
BEGIN
SELECT *
FROM Evento
join entrada
on evento.IdEvento=entrada.IdEvento
where entrada.IdEvento=pIdEvento
order by  UNIX_TIMESTAMP(entrada.FechaEmision) desc;
END//


-- PROCEDIMIENTOS ALMACENADOS FeedbackLugar

DELIMITER //
CREATE PROCEDURE AltaFeedbackLugar (pNombreFeedback varchar(30),pCiUsuario varchar(30),pFechaRealizado timestamp,pNombreLugar varchar(30))
BEGIN
INSERT INTO feedbacklugar(IdFeedback,NombreFeedback,CiUsuario,FechaRealizado,NombreLugar) VALUES(0,pNombreFeedback,pCiUsuario,pFechaRealizado,pNombreLugar);
END//


DELIMITER //
CREATE PROCEDURE ModificarFeedbackLugar (IdFeedback int,pNombreFeedback varchar(30),pCiUsuario varchar(30),pFechaRealizado timestamp,pNombreLugar varchar(30))
begin
UPDATE feedbacklugar SET NombreFeedback=pNombreFeedback,CiUsuario=pCiUsuario,FechaRealizado=pFechaRealizado,NombreLugar=pNombreLugar WHERE IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarFeedbackLugar(pIdFeedback int)
BEGIN
delete from feedbacklugar where IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarFeebackLugar(pIdFeedback int)
BEGIN
SELECT *
FROM feedbacklugar
WHERE feedbacklugar.IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarFeedbackLugaresxUsuario(pCiUsuario varchar(30))
BEGIN
SELECT *
FROM feedbacklugar
where feedbacklugar.CiUsuario=pCiUsuario;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarFeedbackLugar()
BEGIN
SELECT *
FROM feedbacklugar;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE ListarFeedbackdeUnLugar(pNombreLugar varchar(30))
BEGIN
SELECT *
FROM Lugar
join feedbacklugar
on lugar.NombreLugar= feedbacklugar.NombreLugar
where feedbacklugar.NombreLugar=pNombreLugar
order by  UNIX_TIMESTAMP(feedbacklugar.FechaRealizado) desc;
END//

DELIMITER //
CREATE PROCEDURE ListarFeedbackPorLugarYUsuario(pNombreLugar varchar(30),pCiUsuario varchar(30))
BEGIN
SELECT *
FROM Lugar
join feedbacklugar
on lugar.NombreLugar= feedbacklugar.NombreLugar
join usuarios 
on feedbacklugar.CiUsuario=usuarios.Ci
where feedbacklugar.NombreLugar=pNombreLugar and feedbacklugar.CiUsuario=pCiUsuario
order by  UNIX_TIMESTAMP(feedbacklugar.FechaRealizado) desc;
END//

-- PROCEDIMIENTOS ALMACENADOS FeedbackEvento

DELIMITER //
CREATE PROCEDURE AltaFeedbackEvento (pNombreFeedback varchar(30),pCiUsuario varchar(30),pFechaRealizado timestamp,pIdEvento int)
BEGIN
INSERT INTO feedbackEvento(IdFeedback,NombreFeedback,CiUsuario,FechaRealizado,IdEvento) VALUES(0,pNombreFeedback,pCiUsuario,pFechaRealizado,pIdEvento);
END//


DELIMITER //
CREATE PROCEDURE ModificarFeedbackEvento (pIdFeedback int,pNombreFeedback varchar(30),pCiUsuario varchar(30),pFechaRealizado timestamp,pIdEvento int)
begin
UPDATE feedbackEvento SET NombreFeedback=pNombreFeedback,CiUsuario=pCiUsuario,FechaRealizado=pFechaRealizado,IdEvento=pIdEvento WHERE IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE EliminarFeedbackEvento (pIdFeedback int)
BEGIN
delete from feedbackEvento where IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE BuscarFeebackEvento(pIdFeedback int)
BEGIN
SELECT *
FROM feedbackevento
WHERE feedbackEvento.IdFeedback=pIdFeedback;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarFeedbackEventoxUsuario(pCiUsuario varchar(30))
BEGIN
SELECT *
FROM feedbackevento
where feedbackevento.CiUsuario=pCiUsuario
order by  UNIX_TIMESTAMP(feedbackevento.FechaRealizado) desc;
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE ListarFeedbackEvento()
BEGIN
SELECT *
FROM feedbackevento
order by  UNIX_TIMESTAMP(feedbackevento.FechaRealizado) desc;
END//
DELIMITER;


DELIMITER //
CREATE PROCEDURE ListarFeedbackPorEvento(pIdEvento int)
BEGIN
SELECT *
FROM Evento
join feedbackevento
on evento.IdEvento= feedbackevento.IdEvento
where feedbackevento.IdEvento=pIdEvento
order by  UNIX_TIMESTAMP(feedbackevento.FechaRealizado) desc;
END//

DELIMITER //
CREATE PROCEDURE ListarFeedbackPorEventoYUsuario(pIdEvento int,pCiUsuario varchar(30))
BEGIN
SELECT *
FROM evento
join feedbackevento
on evento.IdEvento= feedbackevento.IdEvento
join usuarios 
on feedbackevento.CiUsuario=usuarios.Ci
where feedbackevento.IdEvento=pIdEvento and feedbackevento.CiUsuario=pCiUsuario
order by  UNIX_TIMESTAMP(feedbackevento.FechaRealizado) desc;
END//

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

