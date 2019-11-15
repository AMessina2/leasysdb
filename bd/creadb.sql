-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;

-- Drop table

-- DROP TABLE TestDB.dbo.Colores GO

CREATE TABLE TestDB.dbo.Colores
(
    id bigint IDENTITY(1,1) NOT NULL,
    color varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    codigo varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_Colores PRIMARY KEY (id)
) GO

-- Drop table

-- DROP TABLE TestDB.dbo.DescripcionEstados GO

CREATE TABLE TestDB.dbo.DescripcionEstados
(
    id bigint IDENTITY(1,1) NOT NULL,
    descripcion varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_DescripcionEstados PRIMARY KEY (id)
) GO

-- Drop table

-- DROP TABLE TestDB.dbo.MarcaCoche GO

CREATE TABLE TestDB.dbo.MarcaCoche
(
    id bigint IDENTITY(1,1) NOT NULL,
    nombre varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    imgUrlLogo varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    descripcion varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    slug varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    CONSTRAINT PK_MarcaCoche PRIMARY KEY (id)
) GO

-- Drop table

-- DROP TABLE TestDB.dbo.TipoCambio GO

CREATE TABLE TestDB.dbo.TipoCambio
(
    id smallint IDENTITY(1,1) NOT NULL,
    descripcion varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    CONSTRAINT PK_TipoCambio PRIMARY KEY (id)
) GO

-- Drop table

-- DROP TABLE TestDB.dbo.TipoCoche GO

CREATE TABLE TestDB.dbo.TipoCoche
(
    id bigint IDENTITY(1,1) NOT NULL,
    nombre varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_TipoCoche PRIMARY KEY (id)
) GO

-- Drop table

-- DROP TABLE TestDB.dbo.TipoCombustible GO

CREATE TABLE TestDB.dbo.TipoCombustible
(
    id smallint IDENTITY(1,1) NOT NULL,
    descripcion varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    CONSTRAINT PK_TipoCombustible PRIMARY KEY (id)
) GO

-- Drop table

-- DROP TABLE TestDB.dbo.Coche GO

CREATE TABLE TestDB.dbo.Coche
(
    id bigint IDENTITY(1,1) NOT NULL,
    modelo varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    fecha date NOT NULL,
    activo int NOT NULL,
    idMarca bigint NOT NULL,
    idTipo bigint NOT NULL,
    imgUrl varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    slug varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    idCombustible smallint NULL,
    idCambio smallint NULL,
    descripcion varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    CONSTRAINT PK_Modelo PRIMARY KEY (id),
    CONSTRAINT FK_266 FOREIGN KEY (idMarca) REFERENCES TestDB.dbo.MarcaCoche(id),
    CONSTRAINT FK_269 FOREIGN KEY (idTipo) REFERENCES TestDB.dbo.TipoCoche(id),
    CONSTRAINT FK_300 FOREIGN KEY (idCombustible) REFERENCES TestDB.dbo.TipoCombustible(id),
    CONSTRAINT FK_304 FOREIGN KEY (idCambio) REFERENCES TestDB.dbo.TipoCambio(id)
) GO
CREATE NONCLUSTERED INDEX fkIdx_266 ON dbo.Coche (  idMarca ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO
CREATE NONCLUSTERED INDEX fkIdx_269 ON dbo.Coche (  idTipo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO
CREATE NONCLUSTERED INDEX fkIdx_300 ON dbo.Coche (  idCombustible ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO
CREATE NONCLUSTERED INDEX fkIdx_301 ON dbo.Coche (  idCambio ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO
CREATE NONCLUSTERED INDEX fkIdx_304 ON dbo.Coche (  idCambio ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO

-- Drop table

-- DROP TABLE TestDB.dbo.CocheColor GO

CREATE TABLE TestDB.dbo.CocheColor
(
    id bigint IDENTITY(1,1) NOT NULL,
    idColor bigint NOT NULL,
    idCoche bigint NOT NULL,
    CONSTRAINT [PK_Coche-Color] PRIMARY KEY (id),
    CONSTRAINT FK_249 FOREIGN KEY (idColor) REFERENCES TestDB.dbo.Colores(id),
    CONSTRAINT FK_251 FOREIGN KEY (idCoche) REFERENCES TestDB.dbo.Coche(id)
) GO
CREATE NONCLUSTERED INDEX fkIdx_249 ON dbo.CocheColor (  idColor ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO
CREATE NONCLUSTERED INDEX fkIdx_251 ON dbo.CocheColor (  idCoche ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO

-- Drop table

-- DROP TABLE TestDB.dbo.Oferta GO

CREATE TABLE TestDB.dbo.Oferta
(
    id bigint IDENTITY(1,1) NOT NULL,
    km int NOT NULL,
    tiempo varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    precio float NOT NULL,
    activo int NOT NULL,
    idCoche bigint NOT NULL,
    slug varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    descripcion varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    CONSTRAINT PK_Oferta PRIMARY KEY (id),
    CONSTRAINT FK_229 FOREIGN KEY (idCoche) REFERENCES TestDB.dbo.Coche(id)
) GO
CREATE NONCLUSTERED INDEX fkIdx_229 ON dbo.Oferta (  idCoche ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO

-- Drop table

-- DROP TABLE TestDB.dbo.PreCliente GO

CREATE TABLE TestDB.dbo.PreCliente
(
    id bigint IDENTITY(1,1) NOT NULL,
    comprado int NOT NULL,
    idModelo bigint NOT NULL,
    CONSTRAINT PK_PreCliente PRIMARY KEY (id),
    CONSTRAINT FK_207 FOREIGN KEY (idModelo) REFERENCES TestDB.dbo.Coche(id)
) GO
CREATE NONCLUSTERED INDEX fkIdx_207 ON dbo.PreCliente (  idModelo ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO

-- Drop table

-- DROP TABLE TestDB.dbo.RelacionesTablas GO

CREATE TABLE TestDB.dbo.RelacionesTablas
(
    id bigint IDENTITY(1,1) NOT NULL,
    idOfertaPrincipal bigint NOT NULL,
    idOfertaRelacionada bigint NOT NULL,
    CONSTRAINT PK_RelacionesTablas PRIMARY KEY (id),
    CONSTRAINT FK_302 FOREIGN KEY (idOfertaPrincipal) REFERENCES TestDB.dbo.Oferta(id),
    CONSTRAINT FK_303 FOREIGN KEY (idOfertaRelacionada) REFERENCES TestDB.dbo.Oferta(id)
) GO
CREATE NONCLUSTERED INDEX fkIdx_302 ON dbo.RelacionesTablas (  idOfertaPrincipal ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO
CREATE NONCLUSTERED INDEX fkIdx_303 ON dbo.RelacionesTablas (  idOfertaRelacionada ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO

-- Drop table

-- DROP TABLE TestDB.dbo.Cliente GO

CREATE TABLE TestDB.dbo.Cliente
(
    id bigint IDENTITY(1,1) NOT NULL,
    telefonoMovil varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    email varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    nombre varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    codigoAcceso varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    dniFotoA varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    dniFotoB varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    apellido1 varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    apellido2 varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    dniNumero varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    fechaNacimiento varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    lugarNacimiento varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    provinciaDomicilio varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    codigoPostal int NULL,
    estadoCivil varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    tipoEmpleo varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    antiguedadLaboral varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    telefonoFijo varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    confirmacionPD int NULL,
    idPreCliente bigint NULL,
    estadoRegistro bigint NULL,
    activo int NULL,
    fechaPromesaBorrado date NULL,
    movilVerificado smallint NULL,
    CONSTRAINT PK_Cliente PRIMARY KEY (id),
    CONSTRAINT FK_214 FOREIGN KEY (idPreCliente) REFERENCES TestDB.dbo.PreCliente(id),
    CONSTRAINT FK_294 FOREIGN KEY (estadoRegistro) REFERENCES TestDB.dbo.DescripcionEstados(id)
) GO
CREATE NONCLUSTERED INDEX fkIdx_214 ON dbo.Cliente (  idPreCliente ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO
CREATE NONCLUSTERED INDEX fkIdx_294 ON dbo.Cliente (  estadoRegistro ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO

-- Drop table

-- DROP TABLE TestDB.dbo.CocheImagen GO

CREATE TABLE TestDB.dbo.CocheImagen
(
    id bigint IDENTITY(1,1) NOT NULL,
    imgUrl varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    portada int NOT NULL,
    idCoche bigint NOT NULL,
    CONSTRAINT PK_CocheImagen PRIMARY KEY (id),
    CONSTRAINT FK_275 FOREIGN KEY (idCoche) REFERENCES TestDB.dbo.Cliente(id)
) GO
CREATE NONCLUSTERED INDEX fkIdx_275 ON dbo.CocheImagen (  idCoche ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO

-- Drop table

-- DROP TABLE TestDB.dbo.Pedido GO

CREATE TABLE TestDB.dbo.Pedido
(
    id bigint IDENTITY(1,1) NOT NULL,
    precio float NOT NULL,
    kms int NOT NULL,
    fecha date NOT NULL,
    tiempo varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    estudioCredito int NULL,
    domicilioEntrega varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    cuentaBancaria varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    documento varbinary NULL,
    finalizado int NULL,
    idUsuario bigint NULL,
    idOferta bigint NULL,
    estadoPedido bigint NULL,
    idColor bigint NULL,
    CONSTRAINT PK_PrePedido PRIMARY KEY (id),
    CONSTRAINT FK_201 FOREIGN KEY (idUsuario) REFERENCES TestDB.dbo.Cliente(id),
    CONSTRAINT FK_213 FOREIGN KEY (idColor) REFERENCES TestDB.dbo.CocheColor(id),
    CONSTRAINT FK_258 FOREIGN KEY (idOferta) REFERENCES TestDB.dbo.Oferta(id),
    CONSTRAINT FK_291 FOREIGN KEY (estadoPedido) REFERENCES TestDB.dbo.DescripcionEstados(id)
) GO
CREATE NONCLUSTERED INDEX fkIdx_201 ON dbo.Pedido (  idUsuario ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO
CREATE NONCLUSTERED INDEX fkIdx_213 ON dbo.Pedido (  idColor ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO
CREATE NONCLUSTERED INDEX fkIdx_258 ON dbo.Pedido (  idOferta ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO
CREATE NONCLUSTERED INDEX fkIdx_291 ON dbo.Pedido (  estadoPedido ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]  GO;
