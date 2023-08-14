-- Crear la base de datos
CREATE DATABASE Imagenes;
USE Imagenes;

-- Crear las tablas

CREATE TABLE articulo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    _articulodetalle_id INT,
    cia_id INT,
    _depatamento_id INT,
    _suplidor_id INT,
    activo CHAR(10),
    beneficio DECIMAL(18, 0),
    beneficiomanual DECIMAL(18, 0),
    beneficioporciento DECIMAL(18, 0),
    cantidadajusteneg DECIMAL(18, 0),
    cantidadjustepos DECIMAL(18, 0),
    cantitdaddetall DECIMAL(18, 0),
    cantidadpedir DECIMAL(18, 0),
    cantidadvendida DECIMAL(18, 0),
    codigo DECIMAL(18, 0),
    costomanual DECIMAL(18, 0),
    costopromedio DECIMAL(18, 0),
    costoultimo DECIMAL(18, 0),
    cptcode CHAR(10),
    descripcion NVARCHAR(50),
    esgravable CHAR(10),
    esinventaribale CHAR(10),
    esliquidable CHAR(10),
    fabricante CHAR(10),
    inventario CHAR(10),
    liquidacion CHAR(10),
    liquidacionmanual NVARCHAR(50),
    liquidoporciente TEXT,
    nivelreorden DECIMAL(18, 0),
    opcionbeneficio DECIMAL(18, 0),
    opcioncosto DECIMAL(18, 0),
    opcionprecio DECIMAL(18, 0),
    precio DECIMAL(18, 0),
    preciomanual DECIMAL(18, 0),
    preciodeordenprecision DECIMAL(18, 0),
    referencia CHAR(10),
    secompra CHAR(10),
    sefactura CHAR(10),
    seordena CHAR(10),
    sevende CHAR(10),
    tipo CHAR(10),
    ubicacionalmacen NVARCHAR(50),
    nombreparareporte NVARCHAR(50),
    canitdadexistencia DECIMAL(18, 0),
    medida CHAR(10),
    cantidaddespachada DECIMAL(18, 0),
    tiposervicio CHAR(10),
    nombre_seguro NVARCHAR(50) NOT NULL,
    bata CHAR(10)
);

CREATE TABLE Compania (
    _id_cia INT PRIMARY KEY,
    nombre NVARCHAR(50),
    direccion NVARCHAR(50),
    telefono CHAR(10),
    autorizaciondgii VARCHAR(50),
    rnc NVARCHAR(50)
);

CREATE TABLE departamentos (
    id INT PRIMARY KEY,
    _cia_id INT,
    fechacreacion DATE,
    nombre NVARCHAR(50),
    notas NVARCHAR(50)
);

CREATE TABLE Factura (
    id INT PRIMARY KEY,
    _paciente_id INT,
    _cia_id INT,
    _cuadre_id INT NOT NULL,
    _articulo_id INT,
    _seguro_id INT,
    _usuario_id CHAR(10),
    autorizacion_sesguro NVARCHAR(50),
    carnet_seguro NVARCHAR(50),
    montoseguro DECIMAL(18, 0),
    precioseguro DECIMAL(18, 0),
    polizaseguro NVARCHAR(50),
    RNC NVARCHAR(50),
    tipocomprobante NVARCHAR(50),
    comprobante NVARCHAR(50),
    formadepago NVARCHAR(50),
    tipopago TEXT,
    estado DECIMAL(18, 0),
    numerofactrua CHAR(10),
    nombrecliente VARCHAR(50),
    nombreseguro VARCHAR(50),
    _referidor_id INT,
    nombrereferidor VARCHAR(50),
    montobruto DECIMAL(18, 0),
    coberturaseguro DECIMAL(18, 0),
    cantidadarticulo DECIMAL(18, 0),
    fecha DATE,
    fecha_actualizada DATETIME,
    idturno INT,
    fechainicio DATETIME,
    fechacierre DATETIME
);

-- Continuar creando las demás tablas, usuarios y asignando roles aquí...

-- Crear las tablas restantes

CREATE TABLE FacturaProveedor (
    _id_proveedor INT NOT NULL,
    fecha_factura DATE,
    id_proveedor INT,
    nombre_proveedor NVARCHAR(50),
    nfc NVARCHAR(50),
    id_articulo INT,
    nombre_articulo NVARCHAR(50),
    cantidad_articulo DECIMAL(18, 0),
    precio_unitario CHAR(10),
    idfactura INT
);

CREATE TABLE listaanulados (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo DECIMAL(18, 0),
    fechahora DATETIME,
    id_lista INT,
    procesado INT NOT NULL DEFAULT 0,
    id_factura INT,
    id_facturarec INT
);

CREATE TABLE listadetrabajo (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo DECIMAL(18, 0),
    fechahora DATETIME(7),
    idadmision INT,
    cedula NVARCHAR(50),
    apellidos VARCHAR(50),
    nombres VARCHAR(50),
    fechanacimiento DATE,
    sexo VARCHAR(50),
    nombreestudio TEXT,
    apedoctor VARCHAR(50),
    nomdoctor VARCHAR(50),
    origen VARCHAR(50),
    procesado INT NOT NULL DEFAULT 0,
    id_Seguro INT,
    nombreseguro VARCHAR(50),
    iddepto INT,
    modal CHAR(10),
    usuarioweb VARCHAR(50),
    password VARCHAR(50),
    Record DECIMAL(18, 0),
    MontoAdeudado DECIMAL(18, 0),
    id_facturarec INT,
    indicacion TEXT,
    id_articulo INT,
    idmedicoreferidor INT,
    imagen CHAR(10)
);

CREATE TABLE listarecibe (
    id_lista INT NOT NULL,
    codigo_medico VARCHAR(20) NOT NULL,
    fecha_leyo DATETIME NOT NULL,
    tecnico CHAR(12),
    equipo_uso CHAR(12),
    reporte NVARCHAR(max),
    idadmision INT NOT NULL,
    PRIMARY KEY (id_lista)
);

CREATE TABLE pacientes (
    _paciente_id INT NOT NULL PRIMARY KEY,
    nombre NVARCHAR(50),
    apellido NVARCHAR(50),
    fecha_nacimiento CHAR(10),
    documento NVARCHAR(50),
    _id_seguro INT,
    poliza NVARCHAR(50),
    afiliado NVARCHAR(50),
    _id_plan CHAR(10),
    fecha_actualizada DATETIME
);

CREATE TABLE pagos (
    id INT NOT NULL PRIMARY KEY,
    fecha_recibo DATE,
    _factura_id INT,
    caja_afectada TEXT NOT NULL,
    valor DECIMAL(18, 0),
    formadepago DECIMAL(18, 0),
    iddepto INT,
    idseguro INT,
    Estado DECIMAL(18, 0),
    Actualizado DECIMAL(18, 0),
    fecha_actualizada DATETIME
);

CREATE TABLE Referidor (
    id_referidor INT,
    nombre NVARCHAR(50),
    apellido NVARCHAR(50),
    clinica NVARCHAR(50),
    PRIMARY KEY (id_referidor)
);

CREATE TABLE Segurodbo (
    _seguro_id INT NOT NULL PRIMARY KEY,
    nombre NVARCHAR(50),
    estado NVARCHAR(50),
    rnc NVARCHAR(50),
    CodigoPSS NVARCHAR(50)
);

CREATE TABLE suplidores (
    idSuplidor INT NOT NULL PRIMARY KEY,
    cia_id INT,
    nombre VARCHAR(50),
    abonos DECIMAL(18, 0),
    apellido VARCHAR(50),
    balance DECIMAL(18, 0),
    cargos DECIMAL(18, 0),
    ciudad VARCHAR(50),
    nota NVARCHAR(50),
    telefono NVARCHAR(50),
    tipo NVARCHAR(50)
);

CREATE TABLE VEDOCSATENDIMENTOS (
    REQ_COD VARCHAR(255) NOT NULL,
    REQ_CONVENIO_COD VARCHAR(255),
    REQ_CONVENIO_NOME VARCHAR(255),
    REQ_DATAHORA DATETIME NOT NULL,
    REQ_FLAG_DISPONIVEL BIT,
    REQ_PROTOCOLO VARCHAR(255) NOT NULL,
    REQ_SENHA VARCHAR(255) NOT NULL,
    REQ_UND_ABERTURA_COD VARCHAR(255) NOT NULL,
    REQ_UND_ABERTURA_NOME VARCHAR(255) NOT NULL,
    PAC_COD VARCHAR(255) NOT NULL,
    PAC_DATA_NASCIMENTO DATE,
    PAC_EMAIL VARCHAR(255),
    PAC_NOME VARCHAR(255) NOT NULL,
    PAC_SEXO VARCHAR(255) NOT NULL,
    PM_MED_SOL_COD VARCHAR(255) NOT NULL,
    PM_MED_SOL_DOC_NUM VARCHAR(255),
    PM_MED_SOL_DOC_TIPO VARCHAR(255),
    PM_MED_SOL_DOC_UF VARCHAR(255),
    PM_MED_SOL_EMAIL VARCHAR(255),
    PM_MED_SOL_NOME VARCHAR(255) NOT NULL,
    EXAM_COD VARCHAR(255) NOT NULL,
    EXAM_NOME VARCHAR(255) NOT NULL,
    EXAM_CATEGORIA_COD VARCHAR(255) NOT NULL,
    EXAM_CATEGORIA_NOME VARCHAR(255) NOT NULL,
    EXAM_EXEC_ACC_NUM VARCHAR(255),
    EXAM_EXEC_PACS VARCHAR(255),
    EXAM_EXEC_PATIENT_ID VARCHAR(255),
    EXAM_EXEC_COD VARCHAR(255) NOT NULL,
    EXAM_EXEC_FLAG_DISPONIVEL BIT,
    EXAM_EXEC_IMG_DISPONIVEL BIT,
    EXAM_EXEC_LAUDO_COD VARCHAR(255),
    EXAM_EXEC_LAUDO_DATAHORA DATETIME,
    EXAM_EXEC_LAUDO_DISPONIVEL BIT,
    EXAM_EXEC_LAUDO_URL NCHAR(255),
    REG_DATAHORA_ATUALIZACAO DATETIME NOT NULL,
    REG_DATAHORA_PROCESSADO DATETIME,
    STATUS_REQUISICAO INT NOT NULL,
    ERRO_LEITURA NCHAR(1000),
    IDIMAGENES INT NOT NULL,
    ID INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (ID)
);

-- Crear usuarios y asignar roles

CREATE USER 'root'@'localhost' IDENTIFIED BY 'randy1234';
GRANT ALL PRIVILEGES ON Imagenes.* TO 'tu_usuario'@'localhost';

-- Finalizar con la configuración de la base de datos

ALTER DATABASE Imagenes CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;



