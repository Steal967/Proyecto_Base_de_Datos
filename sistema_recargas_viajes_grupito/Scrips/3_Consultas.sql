--Tabla auditoria_tarjetas
--1. Cambios de estado más recientes por tarjeta

SELECT tarjeta_id, estado_anterior, estado_nuevo, fecha_cambio
FROM auditoria_tarjetas
ORDER BY fecha_cambio DESC
LIMIT 10;

--2. Total de cambios realizados por cada tarjeta

SELECT tarjeta_id, COUNT(*) AS total_cambios
FROM auditoria_tarjetas
GROUP BY tarjeta_id
ORDER BY total_cambios DESC;

--3. Tarjetas que han sido "caducadas"

SELECT tarjeta_id, estado_anterior, estado_nuevo, fecha_cambio
FROM auditoria_tarjetas
WHERE estado_nuevo = 'caducada'
ORDER BY fecha_cambio DESC;

--Tabla promociones
--1. Lista completa de promociones ordenadas por tipo

SELECT nombre, tipo, descripcion
FROM promociones
ORDER BY tipo;

--2. Cantidad de promociones por tipo

SELECT tipo, COUNT(*) AS total
FROM promociones
GROUP BY tipo;

--3. Promociones que incluyen la palabra "bonus"

SELECT *
FROM promociones
WHERE LOWER(nombre) LIKE '%bonus%';

--📡 Tabla dispositivos
--1. Listado de dispositivos por ubicación

SELECT dispositivo_id, tipo, ubicacion
FROM dispositivos
ORDER BY ubicacion;

--2. Cantidad de dispositivos por tipo

SELECT tipo, COUNT(*) AS total
FROM dispositivos
GROUP BY tipo;

--3. Dispositivos instalados en ubicaciones específicas

SELECT *
FROM dispositivos
WHERE ubicacion LIKE '%Universidad%';

--🚨 Tabla tipos_alertas
--1. Alertas registradas ordenadas por fecha más reciente

SELECT * 
FROM tipos_alertas
ORDER BY fecha DESC
LIMIT 10;

--2. Total de alertas por tipo

SELECT tipo, COUNT(*) AS total_alertas
FROM tipos_alertas
GROUP BY tipo
ORDER BY total_alertas DESC;

--3. Alertas asociadas a un viaje específico

SELECT *
FROM tipos_alertas
WHERE viaje_id = 3;
