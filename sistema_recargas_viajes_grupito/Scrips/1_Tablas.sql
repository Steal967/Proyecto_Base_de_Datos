CREATE TABLE HistorialEstadosTarjeta (
    id SERIAL PRIMARY KEY,
    tarjeta_id INT REFERENCES TARJETAS(tarjeta_id),
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50),
    fecha_cambio DATE
);

CREATE TABLE Promociones (
    promocion_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    tipo VARCHAR(50),
    fecha_inicio DATE,
    fecha_fin DATE
);

ALTER TABLE RECARGAS ADD COLUMN promocion_id INT REFERENCES Promociones(promocion_id);

CREATE TABLE Dispositivos (
    dispositivo_id SERIAL PRIMARY KEY,
    tipo VARCHAR(50), -- 'torniquete', 'movil', etc.
    ubicacion TEXT
);

ALTER TABLE VIAJES ADD COLUMN dispositivo_id INT REFERENCES Dispositivos(dispositivo_id);
