-- Modelo relacional para el sistema de gestión de asuntos jurídicos

CREATE TABLE CLIENTE (
    DNI VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    fecha_nacimiento DATE
);          

CREATE TABLE PROCURADOR (
    DNI VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    num_colegiado VARCHAR(50) NOT NULL,
    casos_ganados INT DEFAULT 0
);

CREATE TABLE ASUNTO (
    num_expediente VARCHAR(50) PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    estado VARCHAR(20) NOT NULL,
    DNI_cliente VARCHAR(20) NOT NULL,
    CONSTRAINT fk_asunto_cliente FOREIGN KEY (DNI_cliente) REFERENCES CLIENTE(DNI)
);

CREATE TABLE ASUNTO_PROCURADOR (
    num_expediente VARCHAR(50) NOT NULL,
    DNI_procurador VARCHAR(20) NOT NULL,
    PRIMARY KEY (num_expediente, DNI_procurador),
    CONSTRAINT fk_ap_asunto FOREIGN KEY (num_expediente) REFERENCES ASUNTO(num_expediente),
    CONSTRAINT fk_ap_procurador FOREIGN KEY (DNI_procurador) REFERENCES PROCURADOR(DNI)
);

-- Opcional: tabla de estados si se desea normalizar valores de estado
-- CREATE TABLE ESTADO_ASUNTO (
--     estado VARCHAR(20) PRIMARY KEY
-- );

-- En este diseño, la tabla intermedia ASUNTO_PROCURADOR resuelve la relación N:M
-- entre asuntos y procuradores.
