--Consultar historial de cambios de estado de una tarjeta específica
SELECT 
    at.tarjeta_id,
    at.estado_anterior,
    at.estado_nuevo,
    at.fecha_cambio
FROM auditoria_tarjetas at
WHERE at.tarjeta_id = 3
ORDER BY at.fecha_cambio DESC;

--Listar recargas que usaron promociones activas
SELECT 
    r.recarga_id,
    r.fecha,
    r.monto,
    p.nombre AS promocion,
    p.tipo
FROM recargas r
JOIN promociones p ON r.promocion_id = p.promocion_id
ORDER BY r.fecha DESC;

--Dispositivos instalados por tipo y ubicación
SELECT 
    tipo,
    COUNT(*) AS cantidad,
    STRING_AGG(ubicacion, ', ') AS ubicaciones
FROM dispositivos
GROUP BY tipo;

--Alertas registradas en viajes con detalle del tipo y frecuencia
SELECT 
    tipo,
    COUNT(*) AS total_alertas
FROM tipos_alertas
GROUP BY tipo
ORDER BY total_alertas DESC;

