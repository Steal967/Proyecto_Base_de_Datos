-- Tabla de auditoría de cambios de estado de las tarjetas
CREATE TABLE auditoria_tarjetas (
    auditoria_id SERIAL PRIMARY KEY,
    tarjeta_id INT REFERENCES tarjetas(tarjeta_id),
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50),
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de promociones (para asociar a recargas)
CREATE TABLE promociones (
    promocion_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    tipo VARCHAR(50)
);

-- Agregar columna de promoción a recargas (asegúrate de que la tabla recargas ya existe)
ALTER TABLE recargas ADD COLUMN promocion_id INT REFERENCES promociones(promocion_id);

-- Tabla de dispositivos para registrar intentos fallidos o eventos de validación
CREATE TABLE dispositivos (
    dispositivo_id SERIAL PRIMARY KEY,
    tipo VARCHAR(50),
    ubicacion VARCHAR(100)
);

-- Agregar columna dispositivo_id a la tabla viajes (si no existe aún)
ALTER TABLE viajes ADD COLUMN dispositivo_id INT REFERENCES dispositivos(dispositivo_id);

-- Tabla para registrar alertas o incidencias durante los viajes
CREATE TABLE tipos_alertas (
    incidencia_id SERIAL PRIMARY KEY,
    viaje_id INT REFERENCES viajes(viaje_id),
    descripcion TEXT,
    tipo VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--Número de alertas generadas por día
SELECT 
    DATE(fecha) AS fecha_alerta,
    COUNT(*) AS total_alertas
FROM tipos_alertas
GROUP BY DATE(fecha)
ORDER BY fecha_alerta;

--Detalle de alertas con origen de viaje y dispositivo
SELECT 
    ta.incidencia_id,
    ta.descripcion,
    ta.tipo,
    ta.fecha,
    v.tarjeta_id,
    v.estacion_aborde_id,
    v.dispositivo_id
FROM tipos_alertas ta
JOIN viajes v ON ta.viaje_id = v.viaje_id
ORDER BY ta.fecha DESC;

