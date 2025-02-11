--Creacion de Base de Datos 
CREATE DATABASE Muertes_Violentas_Ecuador;

--Creacion de Tablas
--Creacion de tabla Provincias en la cual sucedio el delito 

USE Muertes_Violentas_Ecuador;
CREATE TABLE PROVINCIA (
	Id_Provincia INT IDENTITY(1,1) PRIMARY KEY,
	Nombre_Provincia VARCHAR (100) NOT NULL
);
	
--Creacion de tabla Ciudad en la cual sucedio el delito 
USE Muertes_Violentas_Ecuador;
CREATE TABLE CIUDAD (
	Id_Ciudad INT IDENTITY(1,1) PRIMARY KEY,
	Nombre_Ciudad VARCHAR(100) NOT NULL,
	Id_Provincia INT ,
	FOREIGN KEY (Id_Provincia) REFERENCES PROVINCIA(Id_Provincia)
)

--Creacion de tabla Distrito en el cual sucedio el delito
USE Muertes_Violentas_Ecuador;
CREATE TABLE Ubicacion (
	Id_Ubicacion INT IDENTITY(1,1) PRIMARY KEY ,
	Nombre_Distrito VARCHAR(100) NOT NULL,
	Id_Ciudad INT ,
	FOREIGN KEY (Id_Ciudad) REFERENCES CIUDAD(Id_Ciudad)
);

--Creacion de la Tabla Tipo de Arma Usada para el delito 
USE Muertes_Violentas_Ecuador;
CREATE TABLE TIPO_ARMA (
	Id_Tipo INT IDENTITY(1,1) PRIMARY KEY,
	Nombre_Tipo VARCHAR(100)
);

----Creacion de la Tabla Arma Usda para el delito 
USE Muertes_Violentas_Ecuador;
CREATE TABLE ARMA_USADA(
	Id_Arma INT IDENTITY (1,1) PRIMARY KEY ,
	Nombre_Arma VARCHAR(100) NOT NULL,
	Id_Tipo INT ,
	FOREIGN KEY (Id_Tipo) REFERENCES TIPO_ARMA(Id_Tipo)
);




--Creacion de Tabla tipo delito 
USE Muertes_Violentas_Ecuador;
CREATE TABLE TIPO_DELITO(
	Id_Delito INT IDENTITY(1,1) PRIMARY KEY ,
	Nombre_Delito VARCHAR(100),
);

--Creacion de Tabla Motivacion del Delito 
USE Muertes_Violentas_Ecuador;
CREATE TABLE MOTIVACION_DELITO (
	Id_Motivacion INT IDENTITY(1,1) PRIMARY KEY,
	Presunta_Motivacion VARCHAR(100) ,
);

--Creacmos la tabla que registra las Muertes Violentas
USE Muertes_Violentas_Ecuador;
CREATE TABLE Registro_Muertes (
	Id_Registro INT PRIMARY KEY,
	Id_Delito INT NOT NULL,
	Id_Ubicacion INT NOT NULL,
	Fecha_Delito DATE NOT NULL,
	Id_Arma INT NOT NULL,
	Id_Motivacion INT NOT NULL,
	FOREIGN KEY (Id_Delito) REFERENCES TIPO_DELITO(Id_Delito),
	FOREIGN KEY (Id_Ubicacion) REFERENCES Ubicacion (Id_Ubicacion),
	FOREIGN KEY (Id_Arma) REFERENCES ARMA_USADA(Id_Arma),
	FOREIGN KEY (Id_Motivacion) REFERENCES  MOTIVACION_DELITO (Id_Motivacion)
	);

---INSERTAMOS LOS DATOS EN LAS TABLAS 
INSERT INTO TIPO_DELITO (Nombre_Delito)
VALUES 
	('ASESINATO'),
	('HOMICIDIO'),
	('SICARIATO'),
	('FEMICIDIO')

INSERT INTO MOTIVACION_DELITO (Presunta_Motivacion)
VALUES
	('VIOLENCIA COMUNITARIA'),
	('DELINCUENCIA COMUN'),
	('VIOLENCIA INTRAFAMILIAR'),
	('TRANSNACIONAL'),
	('SICOPATOLOGIAS'),
	('VIOLENCIA SEXUAL'),
	('TERRORISMO'),
	('NO DETERMINADA')

INSERT INTO TIPO_ARMA (Nombre_Tipo)
VALUES 
	('ARMA BLANCA'),
	('ARMA CONTUNDENTE'),
	('ARMA DE FUEGO'),
	('CONSTRICTORA'),
	('OTROS'),
	('SUSTANCIAS')


INSERT INTO ARMA_USADA (Nombre_Arma,Id_Tipo)
VALUES 
	('ACIDOS',5),
	('AGROQUIMICO',6),
	('ALCOHOL',6),
	('AMETRALLADORA',3),
	('BARRA',2),
	('BATE',2),
	('BISTURI',1),
	('CABLE',4),
	('CADENA',4),
	('CARABINA',3),
	('CARTUCHERA',3),
	('CINTA DE EMBALAJE',5),
	('CORREA',4),
	('CORTO PUNZANTE',1),
	('CUCHILLO',1),
	('CUERDA',4),
	('DAGA',1),
	('DESTORNILLADOR',1),
	('DROGAS ADICTIVAS',6),
	('ELECTRICIDAD',5),
	('ESCOPETA',3),
	('ESCOPOLAMINA',6),
	('EXPLOSIVOS',5),
	('FARMACOS',6),
	('FUNDA',5),
	('FUSIL',3),
	('GARROTE',2),
	('HACHA',1),
	('HIDROCARBUROS',5),
	('HOJA DE AFEITAR',1),
	('LANZA',1),
	('MACHETE',1),
	('MARTILLO',2),
	('NATURAL T�XICA',6),
	('NAVAJA',1),
	('NINGUNA',5),
	('OBJETO CONTUSO',2),
	('OTRO',1),
	('OTROS ARMA CORTA',3),
	('OTROS ARMA LARGA',3),
	('PALO',2),
	('PICA HIELO',1),
	('PISTOLA',3),
	('PRENDA TEXTIL',4),
	('PU�AL',1),
	('REPETIDORA',3),
	('REVOLVER',3),
	('ROCA',2),
	('SIN_DATO',3),
	('SOGA',4),
	('SUBAMETRALLADORA',3),
	('TIJERAS',1),
	('VENENO',6)

INSERT INTO PROVINCIA(Nombre_Provincia)
VALUES
	('AZUAY'),
	('BOLIVAR'),
	('CA�AR'),
	('CARCHI'),
	('CHIMBORAZO'),
	('COTOPAXI'),
	('EL ORO'),
	('ESMERALDAS'),
	('GALAPAGOS'),
	('GUAYAS'),
	('IMBABURA'),
	('LOJA'),
	('LOS RIOS'),
	('MANABI'),
	('MORONA SANTIAGO'),
	('NAPO'),
	('ORELLANA'),
	('PASTAZA'),
	('PICHINCHA'),
	('SANTA ELENA'),
	('SANTO DOMINGO DE LOS TSACHILAS'),
	('STO DGO DE LOS TSACHILAS'),
	('SUCUMBIOS'),
	('TUNGURAHUA'),
	('ZAMORA CHINCHIPE'),
	('ZONA NO DELIMITADA')

INSERT INTO CIUDAD(Nombre_Ciudad,Id_Provincia)
VALUES 
	('24 DE MAYO',14),
	('AGUARICO',17),
	('ALAUSI',5),
	('ALFREDO BAQUERIZO MORENO',10),
	('AMBATO',24),
	('ANTONIO ANTE',11),
	('ARAJUNO',18),
	('ARCHIDONA',16),
	('ARENILLAS',7),
	('ATACAMES',8),
	('ATAHUALPA',7),
	('AZOGUES',3),
	('BABA',13),
	('BABAHOYO',13),
	('BALAO',10),
	('BALSAS',7),
	('BALZAR',10),
	('BA�OS DE AGUA SANTA',24),
	('BIBLIAN',3),
	('BOLIVAR',14),
	('BUENA FE',13),
	('CALUMA',2),
	('CALVAS',12),
	('CAMILO PONCE ENRIQUEZ',1),
	('CA�AR',3),
	('CARLOS JULIO AROSEMENA TOLA',16),
	('CASCALES',23),
	('CATAMAYO',12),
	('CAYAMBE',19),
	('CELICA',12),
	('CENTINELA DEL CONDOR',25),
	('CEVALLOS',24),
	('CHAGUARPAMBA',12),
	('CHAMBO',5),
	('CHILLA',7),
	('CHILLANES',2),
	('CHIMBO',2),
	('CHINCHIPE',25),
	('CHONE',14),
	('CHORDELEG',1),
	('CHUNCHI',5),
	('COLIMES',10),
	('COLTA',5),
	('COTACACHI',11),
	('CRNEL. MARCELINO MARIDUE�A',10),
	('CUENCA',1),
	('CUMANDA',5),
	('CUYABENO',23),
	('DAULE',10),
	('DELEG',3),
	('DURAN',10),
	('ECHEANDIA',2),
	('EL CARMEN',14),
	('EL CHACO',16),
	('EL GUABO',7),
	('EL PAN',1),
	('EL PANGUI',25),
	('EL TAMBO',3),
	('EL TRIUNFO',10),
	('ELOY ALFARO',8),
	('EMPALME',10),
	('ESMERALDAS',8),
	('ESPEJO',4),
	('ESPINDOLA',12),
	('FLAVIO ALFARO',14),
	('GIRON',1),
	('GNRAL. ANTONIO ELIZALDE',10),
	('GONZALO PIZARRO',23),
	('GONZANAMA',12),
	('GUACHAPALA',1),
	('GUALACEO',1),
	('GUALAQUIZA',15),
	('GUAMOTE',5),
	('GUANO',5),
	('GUARANDA',2),
	('GUAYAQUIL',10),
	('HUAMBOYA',15),
	('HUAQUILLAS',7),
	('IBARRA',11),
	('ISIDRO AYORA',10),
	('JAMA',14),
	('JARAMIJO',14),
	('JIPIJAPA',14),
	('JUNIN',14),
	('LA CONCORDIA',22),
	('LA JOYA DE LOS SACHAS',17),
	('LA LIBERTAD',20),
	('LA MANA',6),
	('LA TRONCAL',3),
	('LAGO AGRIO',23),
	('LAS LAJAS',7),
	('LAS NAVES',2),
	('LATACUNGA',6),
	('LIMON INDANZA',15),
	('LOGRO�O',15),
	('LOJA',12),
	('LOMAS DE SARGENTILLO',10),
	('LORETO',17),
	('MACARA',12),
	('MACHALA',7),
	('MANTA',14),
	('MEJIA',19),
	('MERA',18),
	('MILAGRO',10),
	('MIRA',4),
	('MOCACHE',13),
	('MOCHA',24),
	('MONTALVO',13),
	('MONTECRISTI',14),
	('MONTUFAR',4),
	('MORONA',15),
	('MUISNE',8),
	('NABON',1),
	('NANGARITZA',25),
	('NARANJAL',10),
	('NARANJITO',10),
	('NOBOL',10),
	('OLMEDO',14),
	('ORELLANA',17),
	('OTAVALO',11),
	('PABLO SEXTO',15),
	('PAJAN',14),
	('PALANDA',25),
	('PALENQUE',13),
	('PALESTINA',10),
	('PALLATANGA',5),
	('PALORA',15),
	('PALTAS',12),
	('PANGUA',6),
	('PAQUISHA',25),
	('PASAJE',7),
	('PASTAZA',18),
	('PATATE',24),
	('PAUTE',1),
	('PEDERNALES',14),
	('PEDRO CARBO',10),
	('PEDRO MONCAYO',19),
	('PEDRO VICENTE MALDONADO',19),
	('PICHINCHA',14),
	('PIMAMPIRO',11),
	('PINDAL',12),
	('PI�AS',7),
	('PLAYAS',10),
	('PORTOVELO',7),
	('PORTOVIEJO',14),
	('PUCARA',1),
	('PUEBLO VIEJO',13),
	('PUEBLOVIEJO',13),
	('PUERTO FRANCISCO DE ORELLANA',17),
	('PUERTO LOPEZ',14),
	('PUERTO QUITO',19),
	('PUJILI',6),
	('PUTUMAYO',23),
	('PUYANGO',12),
	('QUERO',24),
	('QUEVEDO',13),
	('QUIJOS',16),
	('QUILANGA',12),
	('QUININDE',8),
	('QUINSALOMA',13),
	('QUITO',19),
	('RIOBAMBA',5),
	('RIOVERDE',8),
	('ROCAFUERTE',14),
	('RUMI�AHUI',19),
	('SALCEDO',6),
	('SALINAS',20),
	('SALITRE',10),
	('SAMBORONDON',10),
	('SAN FERNANDO',1),
	('SAN JACINTO DE YAGUACHI',10),
	('SAN JUAN BOSCO',15),
	('SAN LORENZO',8),
	('SAN MIGUEL',2),
	('SAN MIGUEL DE  BOLIVAR',2),
	('SAN MIGUEL DE LOS BANCOS',19),
	('SAN MIGUEL DE SALCEDO',6),
	('SAN MIGUEL DE URCUQUI',11),
	('SAN PEDRO DE HUACA',4),
	('SAN PEDRO DE PELILEO',24),
	('SAN VICENTE',14),
	('SANTA ANA',14),
	('SANTA CLARA',18),
	('SANTA CRUZ',9),
	('SANTA ELENA',20),
	('SANTA ISABEL',1),
	('SANTA LUCIA',10),
	('SANTA ROSA',7),
	('SANTIAGO',15),
	('SANTIAGO DE PILLARO',24),
	('SANTO DOMINGO',22),
	('SAQUISILI',6),
	('SARAGURO',12),
	('SEVILLA DE ORO',1),
	('SHUSHUFINDI',23),
	('SIGCHOS',6),
	('SIGSIG',1),
	('SIMON BOLIVAR',10),
	('SOZORANGA',12),
	('SUCRE',14),
	('SUCUA',15),
	('SUCUMBIOS',23),
	('SUSCAL',3),
	('TAISHA',15),
	('TENA',16),
	('TISALEO',24),
	('TIWINTZA',15),
	('TOSAGUA',14),
	('TULCAN',4),
	('URDANETA',13),
	('VALENCIA',13),
	('VENTANAS',13),
	('VINCES',13),
	('YANTZAZA',25),
	('ZAMORA',25),
	('ZAPOTILLO',12),
	('ZARUMA',7),
	('ZONA NO DELIMITADA',26)

INSERT INTO Ubicacion(Nombre_Distrito,Id_Ciudad)
VALUES 
	('24 DE MAYO',182),
	('9 DE OCTUBRE',76),
	('AGUARICO',2),
	('ALAUSI',3),
	('AMBATO NORTE',5),
	('AMBATO SUR',5),
	('ARAJUNO',7),
	('ATACAMES',112),
	('AZOGUES',19),
	('BABAHOYO',14),
	('BALZAR',17),
	('BA�OS',18),
	('BOLIVAR JUNIN',20),
	('BUENA FE',211),
	('CALDERON',161),
	('CALVAS',69),
	('CA�AR',203),
	('CATACOCHA',128),
	('CATAMAYO',28),
	('CAYAMBE',137),
	('CEIBOS',76),
	('CENTRO SUR',201),
	('CHILLANES',36),
	('CHINCHIPE',123),
	('CHONE',65),
	('CIUDAD BLANCA',178),
	('COLTA',73),
	('CUENCA NORTE',46),
	('CUENCA SUR',46),
	('DANSANTE',192),
	('DAULE',187),
	('DURAN',51),
	('EL CARMEN',53),
	('EL EMPALME',61),
	('EL PIEDRERO',218),
	('EL TRIUNFO BUCAY',59),
	('EL VALLE DE QUIJOS',157),
	('ELOY ALFARO',161),
	('ESMERALDAS',62),
	('ESPEJO',105),
	('ESPINDOLA',64),
	('ESTEROS',76),
	('EUGENIO ESPEJO',161),
	('FLORIDA',76),
	('GALAPAGOS',184),
	('GIRON',186),
	('GUALACEO',71),
	('GUANO',74),
	('GUARANDA',75),
	('HUAQUILLAS',9),
	('JIPIJAPA',150),
	('JUJAN SIMON BOLIVAR',198),
	('LA CONCORDIA',85),
	('LA DELICIA',161),
	('LA JOYA DE LOS SACHAS',86),
	('LA MANA',88),
	('LA TRONCAL',89),
	('LAGO AGRIO',90),
	('LAS GOLONDRINAS',218),
	('LATACUNGA',93),
	('LIBERTAD SALINAS',167),
	('LOJA',96),
	('LOS CHILLOS',161),
	('MACARA',99),
	('MACHALA',100),
	('MANGA DEL CURA',218),
	('MANTA',101),
	('MANUELA SAENZ',161),
	('MENDEZ',189),
	('MILAGRO',104),
	('MODELO',76),
	('MONTUFAR',20),
	('MORONA',111),
	('NABON',113),
	('NANEGAL',161),
	('NARANJAL BALAO',115),
	('NARANJITO MARCELINO MARIDUE�A',45),
	('NOROCCIDENTE',138),
	('NUEVA PROSPERINA',76),
	('ORELLANA LORETO',119),
	('PAJAN',122),
	('PALLATANGA',126),
	('PANGUA',129),
	('PAQUISHA',130),
	('PASAJE',131),
	('PASCUALES',76),
	('PASTAZA',132),
	('PATATE',180),
	('PAUTE',194),
	('PEDERNALES',135),
	('PEDRO CARBO',136),
	('PICHINCHA',139),
	('PILLARO',190),
	('PI�AS',16),
	('PLAYAS',143),
	('PONCE ENRIQUEZ',24),
	('PORTETE',76),
	('PORTOVIEJO',145),
	('PROGRESO',76),
	('PUEBLOVIEJO',210),
	('PUTUMAYO',153),
	('QUERO',206),
	('QUEVEDO',156),
	('QUININDE',159),
	('QUITUMBE',161),
	('RIO VERDE',163),
	('RIOBAMBA',162),
	('ROCAFUERTE',208),
	('RUMI�AHUI - MEJIA',102),
	('SABANILLA',141),
	('SALCEDO',166),
	('SALITRE',168),
	('SAMBORONDON',169),
	('SAN LORENZO',173),
	('SAN MIGUEL',174),
	('SANGAY',127),
	('SANTA ELENA',185),
	('SANTA ROSA',188),
	('SANTO DOMINGO ESTE',191),
	('SANTO DOMINGO OESTE',191),
	('SARAGURO',193),
	('SHUSHUFINDI',195),
	('SIG SIG',197),
	('SIGCHOS',196),
	('SUBTROPICO',22),
	('SUCRE',181),
	('SUCUMBIOS',68),
	('SUR',76),
	('TAISHA',204),
	('TENA',205),
	('TIERRA DEL SOL',44),
	('TULCAN',209),
	('TUMBACO',161),
	('VALLE DEL AMANECER',120),
	('VENTANAS',160),
	('VINCES',213),
	('YAGUACHI',171),
	('YANTZAZA',57),
	('ZAMORA',215),
	('ZAPOTILLO',216),
	('ZARUMA',144)

--CARGAMOS LOS  DATOS CON RESPECTO AL REGIASTRO DE LAS MUERTES 

BULK INSERT Registro_Muertes
FROM 'C:\Users\HP\Documents\1.Fabricio Coque\16.Proyectos\2.SQL\Registro Homicidios Intencionales _2014_2023.csv'
WITH
(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR ='\n',
	FIRSTROW=2
)