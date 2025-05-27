# 🚌 Sistema de Gestión para Transporte Público

**Base de datos:** `sistema_recargas_viajes`

---

## 📘 Introducción

Este proyecto desarrolla y amplía una base de datos para un sistema de transporte público que gestiona:

- Tarjetas de usuario
- Recargas monetarias
- Viajes validados
- Dispositivos de validación
- Auditoría de tarjetas
- Promociones
- Registro de incidencias

El objetivo es facilitar el análisis del comportamiento de los usuarios, evaluar la efectividad de promociones y monitorear el funcionamiento operativo para optimizar continuamente el servicio.

---

## 🎯 Objetivos

- Diseñar un modelo de datos integral y normalizado.
- Implementar auditoría de tarjetas para rastrear cambios de estado.
- Integrar promociones asociadas a recargas.
- Registrar y clasificar incidencias ocurridas en los viajes.
- Ejecutar consultas analíticas útiles para la toma de decisiones.

---

## 🧱 Arquitectura del Modelo de Datos

El sistema está compuesto por las siguientes entidades principales:

| Entidad                   | Clave Primaria      | Relaciones                                      | Función Principal                                                  |
|---------------------------|---------------------|--------------------------------------------------|---------------------------------------------------------------------|
| **Usuarios**              | `usuario_id`        | Uno a muchos con tarjetas                        | Representa a los usuarios registrados del sistema                   |
| **Tarjetas**              | `tarjeta_id`        | FK a usuario; uno a muchos con recargas y viajes | Medio de identificación para utilizar el sistema                   |
| **Recargas**              | `recarga_id`        | FK a tarjeta, punto_recarga y promociones        | Registra saldo agregado a tarjetas                                 |
| **Promociones**           | `promocion_id`      | Uno a muchos con recargas                        | Incentivos aplicables a recargas                                   |
| **Viajes**                | `viaje_id`          | FK a tarjeta, tarifa, estación y dispositivo     | Registro de desplazamientos realizados                             |
| **Estaciones**            | `estacion_id`       | Uno a muchos con viajes                          | Lugares físicos de abordaje y destino                              |
| **Dispositivos**          | `dispositivo_id`    | Uno a muchos con viajes                          | Terminales de validación: físicos o móviles                        |
| **Auditoría de tarjetas** | `auditoria_id`      | FK a tarjeta                                     | Registro cronológico de cambios de estado de tarjetas              |
| **Incidencias**           | `incidencia_id`     | FK a viajes                                      | Documenta eventos anómalos como fallos de lectura o validación     |

---

## 📋 Descripción de Tablas Nuevas

### Auditoría de tarjetas

Registra los cambios de estado de cada tarjeta con fecha y hora. Fundamental para detectar fraudes o usos indebidos.

### Promociones

Contiene los incentivos aplicables a recargas. Permite campañas personalizadas y análisis de fidelización.

### Dispositivos

Lista los validadores o puntos de control utilizados en los viajes, incluyendo tipo y ubicación.

### Incidencias

Documenta errores o fallas durante los viajes, como saldo insuficiente, errores de lectura o tarjetas inválidas.

---

## ✅ Casos de Uso Clave

1. **Supervisión de tarjetas**
   - Ver historial completo de cambios por tarjeta.

2. **Evaluación de promociones**
   - Determinar cuáles promociones generan más recargas.

3. **Monitoreo de validadores**
   - Ver dispositivos que presentan más errores o fallas.

4. **Análisis de incidencias**
   - Clasificación por tipo, frecuencia y ubicación de eventos anómalos.

---

## 🧾 Scripts SQL Incluidos

### 1. Creación y modificación de tablas

- `CREATE TABLE auditoria_tarjetas`
- `CREATE TABLE promociones`
- `CREATE TABLE dispositivos`
- `CREATE TABLE tipos_alertas`
- `ALTER TABLE recargas ADD COLUMN promocion_id`
- `ALTER TABLE viajes ADD COLUMN dispositivo_id`

### 2. Población de datos de prueba

Se incluyen al menos 10 registros por tabla para pruebas iniciales.

### 3. Consultas útiles

- Historial de auditoría por tarjeta
- Promociones utilizadas en recargas
- Alertas clasificadas por tipo y fecha
- Dispositivos con mayor número de incidencias

---

## 🚀 Cómo Empezar

1. Ejecuta el script de estructura (`tablas_complementarias.sql`).
2. Inserta los datos de prueba (`datos_mejoras_corregido.sql`).
3. Ejecuta las consultas de análisis incluidas.
4. Monitorea periódicamente la tabla de auditoría e incidencias.

---

## 🏁 Conclusión

Este sistema provee una base sólida para la operación de transporte público moderno. Las nuevas funcionalidades permiten mejorar la calidad del servicio, aumentar la transparencia operativa y fomentar el uso mediante promociones estratégicas.

---

> ¿Te gustaría que subamos esto como `README.md` o que se empaquete como documentación en PDF o GitHub Pages?
