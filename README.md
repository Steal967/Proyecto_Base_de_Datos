# Sistema de Gestión para Transporte Público: Base de Datos de Recargas y Viajes

**Base de datos:** `sistema_recargas_viajes_grupito`

---

## Introducción

Este proyecto aborda el diseño y ampliación de una base de datos para un sistema de transporte público que gestiona tarjetas de usuario, recargas monetarias, viajes, dispositivos de validación, auditoría de tarjetas, promociones y el registro de incidencias operativas.  
El propósito es proveer un sistema robusto que permita el análisis profundo del comportamiento de los usuarios, la eficacia de promociones y el monitoreo del funcionamiento operativo, contribuyendo a la optimización continua del servicio.

---

## Objetivos

- Diseñar un modelo de datos integral que cubra las necesidades funcionales y de análisis del sistema de transporte.
- Incorporar funcionalidades de auditoría para seguimiento del estado y uso de tarjetas.
- Integrar promociones para incentivar recargas y fomentar el uso del sistema.
- Implementar el registro y seguimiento de incidencias para detectar y corregir fallas.
- Facilitar la obtención de reportes detallados para análisis de comportamiento y rendimiento.

---

## Arquitectura del Modelo de Datos

El sistema está construido a partir de las siguientes entidades principales, cada una con funciones específicas y relaciones definidas para mantener integridad y coherencia:

### Entidades y Relaciones Clave

| Entidad              | Clave Primaria          | Relaciones                                | Función Principal                                        |
|----------------------|-------------------------|------------------------------------------|----------------------------------------------------------|
| **Usuarios**         | `usuario_id`            | Uno a muchos con tarjetas                 | Representa a los usuarios del sistema                     |
| **Tarjetas**         | `tarjeta_id`            | Relacionada a un usuario; uno a muchos con recargas y viajes | Identificación para el uso del sistema                   |
| **Recargas**         | `recarga_id`            | Vinculada a tarjetas y promociones        | Registro de depósitos de saldo en tarjetas                |
| **Promociones**      | `promocion_id`          | Uno a muchos con recargas                  | Incentivos y bonos aplicados a recargas                   |
| **Viajes**           | `viaje_id`              | Asociado a tarjeta, estación y dispositivo| Registro de viajes validados                              |
| **Estaciones**       | `estacion_id`           | Uno a muchos con viajes                    | Puntos de abordaje y destino                               |
| **Dispositivos**     | `dispositivo_id`        | Uno a muchos con viajes                    | Terminales de validación (puntos físicos o móviles)       |
| **Auditoría de tarjetas** | `auditoria_id`       | Vinculada a tarjetas                       | Historial de cambios de estado para monitoreo             |
| **Incidencias**      | `incidencia_id`         | Asociada a viajes                          | Registro de eventos anómalos o fallos en el servicio      |

---

## Descripción Detallada de las Tablas

### Usuarios  
Contiene los datos de los usuarios que poseen una o más tarjetas para acceder al sistema de transporte.

### Tarjetas  
Identifica las tarjetas asignadas a usuarios, permitiendo gestionar su estado y relacionarlas con recargas y viajes.

### Recargas  
Guarda el historial de recargas realizadas, incluyendo datos de monto, fecha y la promoción que se haya aplicado.

### Promociones  
Lista las promociones disponibles para aplicar incentivos a las recargas, facilitando campañas de marketing y fidelización.

### Viajes  
Registra cada viaje efectuado por los usuarios, indicando la tarjeta utilizada, estación de abordaje y el dispositivo de validación empleado.

### Estaciones  
Describe los puntos físicos o virtuales donde los usuarios abordan el sistema, siendo clave para análisis geográficos y operativos.

### Dispositivos  
Detalle de los dispositivos (lectores físicos o apps móviles) usados para validar viajes, con su tipo y ubicación para trazabilidad.

### Auditoría de tarjetas  
Mantiene un registro cronológico de los cambios en el estado de cada tarjeta (activo, bloqueado, etc.), fundamental para seguridad y control.

### Incidencias  
Permite registrar y clasificar eventos negativos, como errores de validación, retrasos o problemas técnicos durante el viaje.

---

## Innovaciones y Mejoras Implementadas

Este proyecto incorpora varias mejoras que fortalecen la base de datos inicial:

- **Historial de auditoría:**  
  Se implementó una tabla dedicada para registrar cualquier cambio en el estado de las tarjetas, lo que facilita la detección temprana de anomalías y mejora la transparencia en la gestión.

- **Sistema de promociones:**  
  Se creó un módulo para incluir promociones en las recargas, permitiendo realizar análisis del impacto y efectividad de incentivos sobre el comportamiento del usuario.

- **Gestión avanzada de dispositivos:**  
  Se añadió la gestión de dispositivos de validación, detallando el tipo (físico o móvil) y su ubicación, lo que permite análisis operativos y detección de posibles fallas en terminales específicas.

- **Registro de incidencias:**  
  La inclusión de una tabla para incidencias permite documentar eventos problemáticos durante los viajes, facilitando acciones correctivas y mejoras continuas.

---

## Casos de Uso Clave

1. **Monitoreo de cambios en tarjetas:**  
   Permite supervisar cuándo y cómo cambian los estados de las tarjetas, ayudando a identificar posibles fraudes o errores operativos.

2. **Evaluación de promociones:**  
   Analiza cómo las promociones afectan la frecuencia y monto de recargas, optimizando campañas de fidelización.

3. **Control de validaciones:**  
   Verifica la correcta validación de viajes, identificando viajes no validados o problemas con dispositivos específicos.

4. **Análisis de incidencias:**  
   Clasifica y reporta las incidencias por tipo y ubicación para implementar mejoras focalizadas.

---

## Scripts SQL Incluidos

### 1. Creación y Modificación de Estructuras  
Define tablas nuevas (auditoría, promociones, dispositivos, incidencias) y modifica tablas existentes para integrar las nuevas funcionalidades.

### 2. Población de Datos de Prueba  
Inserta registros de prueba en las nuevas tablas y actualiza fechas en tablas existentes para facilitar análisis de datos recientes (principalmente en abril 2025).

### 3. Consultas Analíticas  
Incluye consultas complejas para extraer información útil como:

- Cambios mensuales en el estado de tarjetas.
- Ranking de tarjetas con más modificaciones.
- Volumen de recargas por tipo de promoción.
- Viajes sin validación o validados con dispositivos móviles.
- Identificación del dispositivo más utilizado.
- Estadísticas y detalles de incidencias.

### 4. Actualización y Auditoría Continua  
Actualiza datos históricos para mantener la base actualizada y ejecuta consultas para validar el correcto funcionamiento del sistema.

---

## Cómo Empezar

Para desplegar y probar el sistema, sigue estos pasos:

1. Ejecuta el script de estructura para crear y modificar tablas.  
2. Inserta datos con el script de datos de prueba.  
3. Usa las consultas para verificar y analizar el comportamiento del sistema.  
4. Repite la auditoría periódicamente con el script de actualización para mantener datos actualizados.

---

## Conclusión

Este sistema de base de datos es una solución completa y escalable para la gestión de un sistema de transporte público moderno. Permite no solo la operación diaria, sino también la generación de información clave para la toma de decisiones estratégicas, mejorando la calidad del servicio y la satisfacción del usuario.

---

¿Quieres que te ayude a preparar también diagramas ER o archivos SQL para que puedas subirlos directo a GitHub?  
