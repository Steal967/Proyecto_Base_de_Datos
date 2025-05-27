-- INSERTS para promociones
INSERT INTO promociones (nombre, descripcion, tipo) VALUES
('Bono Bienvenida', 'Recarga inicial con bono del 20%', 'bonus'),
('Recarga Doble', 'Duplica tu saldo en fines de semana', 'descuento'),
('Promo Estudiante', 'Descuento para estudiantes universitarios', 'descuento'),
('Super Bonus', 'Bonificación extra al recargar más de $20', 'bonus'),
('Bonus Nocturno', '10% extra en recargas después de las 8pm', 'bonus'),
('Navidad Plus', 'Promoción navideña especial', 'descuento'),
('Finde Recargado', 'Recarga con beneficios sábado y domingo', 'bonus'),
('Viaje Escolar', 'Beneficio en recargas escolares', 'descuento'),
('Semana Viajera', 'Bono semanal para viajeros frecuentes', 'bonus'),
('Recarga Express', 'Descuento por recarga rápida', 'descuento');

-- INSERTS para dispositivos
INSERT INTO dispositivos (tipo, ubicacion) VALUES
('Validador', 'Estación Central'),
('Validador', 'Portal Norte'),
('Validador', 'Estación Sur'),
('Tótem Recarga', 'Centro Comercial Andino'),
('Tótem Recarga', 'Universidad Nacional'),
('Validador', 'Portal Suba'),
('Tótem Recarga', 'Plaza Bolívar'),
('Validador', 'Estación Carrera 30'),
('Validador', 'Estación 7 de Agosto'),
('Tótem Recarga', 'Estación Parque');

-- INSERTS para auditoria_tarjetas
INSERT INTO auditoria_tarjetas (tarjeta_id, estado_anterior, estado_nuevo, fecha_cambio) VALUES
(1, 'activa', 'suspendida', '2025-01-10 10:00:00'),
(2, 'suspendida', 'activa', '2025-02-14 14:20:00'),
(3, 'activa', 'bloqueada', '2025-03-01 09:00:00'),
(4, 'bloqueada', 'caducada', '2025-04-10 12:45:00'),
(5, 'suspendida', 'caducada', '2025-04-15 08:30:00'),
(6, 'activa', 'suspendida', '2025-03-25 17:00:00'),
(7, 'suspendida', 'activa', '2025-05-02 11:15:00'),
(8, 'caducada', 'bloqueada', '2025-02-22 16:00:00'),
(9, 'bloqueada', 'activa', '2025-01-30 18:30:00'),
(10, 'activa', 'caducada', '2025-03-12 07:50:00');

-- INSERTS para tipos_alertas
INSERT INTO tipos_alertas (viaje_id, descripcion, tipo, fecha) VALUES
(1, 'Validación rechazada por tarjeta vencida', 'Error', '2025-01-10 08:00:00'),
(2, 'Intento con tarjeta no registrada', 'Advertencia', '2025-01-11 09:15:00'),
(3, 'Saldo insuficiente en el momento del viaje', 'Error', '2025-01-12 10:30:00'),
(4, 'Dispositivo no respondió', 'Error de dispositivo', '2025-01-13 07:50:00'),
(5, 'Viaje sin tarjeta registrada', 'Advertencia', '2025-01-14 11:10:00'),
(6, 'Tarjeta bloqueada por seguridad', 'Bloqueo', '2025-01-15 13:45:00'),
(7, 'Intento con tarjeta caducada', 'Error', '2025-01-16 06:20:00'),
(8, 'Tarjeta leída pero no validada', 'Advertencia', '2025-01-17 14:05:00'),
(9, 'Dispositivo con error de red', 'Error de dispositivo', '2025-01-18 15:35:00'),
(10, 'Intento duplicado de viaje', 'Duplicado', '2025-01-19 17:00:00');
