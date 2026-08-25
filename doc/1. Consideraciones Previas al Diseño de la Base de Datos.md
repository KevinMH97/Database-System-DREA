# 📊 Consideraciones previas al diseño de la Base de Datos

Documentación técnica sobre las consideraciones previas, estándares y patrones de diseño aplicados en el modelado de la base de datos relacional para la **Dirección Regional de Educación de Ayacucho (DREA)**.

---

## 📑 Tabla de Contenidos
- [1. Análisis de Esquemas](#1-análisis-de-esquemas)
- [2. Convenciones de Nomenclatura](#2-convenciones-de-nomenclatura)
- [3. Patrones de Diseño](#3-patrones-de-diseño)
  - [a. Definición precisa de relaciones entre entidades](#a-definición-precisa-de-relaciones-entre-entidades)
  - [b. Control de redundancia y consistencia de datos](#b-control-de-redundancia-y-consistencia-de-datos)
  - [c. Optimización de rendimiento y tiempos de respuesta](#c-optimización-de-rendimiento-y-tiempos-de-respuesta)
  - [d. Modularidad y reducción de complejidad](#d-modularidad-y-reducción-de-complejidad)
  - [e. Escalabilidad ante el crecimiento de datos](#e-escalabilidad-ante-el-crecimiento-de-datos)
  - [f. Flexibilidad ante cambios normativos](#f-flexibilidad-ante-cambios-normativos)
- [Referencias](#-referencias)

---

## 1. Análisis de Esquemas

La base de datos original presentaba redundancia crítica en tablas principales (`personas` y `pagos`), así como referencias circulares (*loops*). Se aplicó **normalización** estructurada en tres esquemas lógicos:

| Esquema | Propósito / Alcance |
| :--- | :--- |
| `Persona` | Datos personales, nivel magisterial, cargo, régimen laboral y beneficiarios. |
| `Boleta` | Estructura de emisión de pagos, tipos, conceptos, montos y detalles. |
| `Admin` | Gestión de usuarios, roles, accesos y permisos de operadores del sistema. |

> **Beneficios:** Control de accesos granular por rol, prevención de desorganización de entidades, delimitación clara de responsabilidades y reutilización de nombres de tablas sin prefijos redundantes.

---

## 2. Convenciones de Nomenclatura

Estándares definidos para asegurar la mantenibilidad y legibilidad del código SQL:

| Elemento | Convención | Ejemplo |
| :--- | :--- | :--- |
| **Comandos SQL** | Mayúscula inicial (*Capitalized*) | `Select`, `Insert`, `From`, `Create` |
| **Tablas** | PascalCase / Singular | `Persona`, `Pago` |
| **Atributos (1 palabra)** | `[Tabla]_[campo]` (minúsculas) | `Persona_apellido`, `Persona_nombre` |
| **Atributos compuestos** | `[Tabla]_[campoCamelCase]` | `Persona_apellidoPaterno`, `Persona_apellidoMaterno` |
| **Caracteres especiales** | Sin tildes ni caracteres no estándar (`ñ` $\rightarrow$ `n`) | `Persona_anoIngreso` |

---

## 3. Patrones de Diseño

Siguiendo el enfoque minimalista propuesto por **Schneider (2018)** (*Problema - Contexto - Solución*):

### a. Definición precisa de relaciones entre entidades
* **Problema:** Relaciones mal definidas distorsionan las dependencias del negocio y generan inconsistencias.
* **Contexto:** Es indispensable capturar con exactitud las dependencias desde la fase conceptual.
* **Solución:** Uso de diagramas Entidad-Relación (ER), validación continua contra requerimientos y pruebas funcionales directas con usuarios finales.

### b. Control de redundancia y consistencia de datos
* **Problema:** Datos duplicados causan anomalías de inserción, actualización y sobreconsumo de almacenamiento.
* **Contexto:** Mantener la integridad transaccional y la unicidad del dato es prioritario en sistemas de pago.
* **Solución:** Aplicación estricta de formas normales junto a claves primarias (`PK`) y foráneas (`FK`).

### c. Optimización de rendimiento y tiempos de respuesta
* **Problema:** Consultas lentas y cuellos de botella ante grandes volúmenes de datos.
* **Contexto:** Las respuestas deben ser rápidas y escalables para la consulta de boletas.
* **Solución:** Índices en columnas de alta selectividad, cláusulas `WHERE` eficientes, desnormalización selectiva justificada y caché en consultas recurrentes.

### d. Modularidad y reducción de complejidad
* **Problema:** Diseños sobrecargados dificultan la depuración y mantenimiento del sistema.
* **Contexto:** Se requiere simplicidad arquitectónica sin perder funcionalidad.
* **Solución:** Modularización por esquemas, encapsulando la lógica interna mediante **vistas** y **procedimientos almacenados**.

### e. Escalabilidad ante el crecimiento de datos
* **Problema:** Pérdida de rendimiento conforme crece el histórico de emisiones de pago.
* **Contexto:** La base de datos debe soportar el incremento sostenido de registros sin reestructuraciones drásticas.
* **Solución:** Particionamiento de tablas por períodos, balanceo de carga y arquitectura extensible para nuevas entidades.

### f. Flexibilidad ante cambios normativos
* **Problema:** Nuevas reglas de negocio pueden comprometer la integridad de datos preexistentes.
* **Contexto:** Adaptabilidad requerida frente a directivas de la DREA y normativas laborales.
* **Solución:** Aislamiento de impacto mediante normalización y uso del **Patrón Repositorio** en la capa de software para desacoplar el acceso a datos.

---

## 📚 Referencias
* Schneider, M. (2018). *Design Patterns for Dimensional Data Modeling*.
