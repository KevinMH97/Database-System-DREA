# 🗄️ Consideraciones Previas al Diseño de la Base de Datos Relacional

Este documento detalla el análisis previo, estándares de nomenclatura, esquemas modulares y patrones de diseño aplicados para la reestructuración y optimización de la base de datos del **Sistema de Constancia de Pagos de la Dirección Regional de Educación de Ayacucho (DREA)**.

---

## 📌 1. Análisis y Diagnóstico del Modelo Actual

En la versión inicial del sistema se identificaron diversas oportunidades de mejora críticas:
* **Redundancia y duplicidad de datos:** Presencia excesiva de datos redundantes (principalmente en las entidades `Persona` y `Pago`), provocando sobrecostos de almacenamiento y degradación del rendimiento.
* **Inconsistencia relacional y bucles:** Relaciones mal estructuradas que generaban ciclos/bucles en la lógica del modelado relacional.
* **Complejidad estructural:** La aplicación estricta de las **Formas Normales (FN)** incrementa el número total de tablas, haciendo indispensable una estrategia de organización modular para evitar el desorden.

---

## 🏗️ 2. Arquitectura de Esquemas (Schemas)

Para estructurar eficientemente el modelo y simplificar su administración, la base de datos se organizó en tres esquemas principales:

| Esquema | Descripción / Alcance | Entidades Clave |
| :--- | :--- | :--- |
| `Persona` | Centraliza la información del personal adscrito a la DREA que percibe pagos. | Datos personales, nivel magisterial, cargo, régimen laboral, etc. |
| `Boleta` | Contiene los datos estructurados que integran la constancia/boleta de pago. | Tipos de pago, conceptos, detalle de boleta, importes. |
| `Admin` | Gestiona los usuarios con privilegios para registrar, validar y emitir pagos. | Usuarios, roles, permisos y bitácoras de emisión. |

### 🚀 Ventajas del uso de Esquemas:
* 👥 **Acceso y seguridad granular:** Permite gestionar permisos multiusuario por módulos.
* 🗂️ **Organización limpia:** Previene la dispersión caótica de entidades en el catálogo principal.
* 👤 **Control de propietarios:** Facilita la asignación clara de ownership y mantenimiento.
* 🏷️ **Espacios de nombres aislados:** Permite nombres de tablas idénticos en diferentes esquemas sin recurrir a prefijos forzados.

---

## ✍️ 3. Convenciones y Estándares de Nomenclatura

Se definió un estándar consistente para mejorar la legibilidad, mantenimiento y reducir la tasa de error durante el desarrollo:

```sql
-- Ejemplo ilustrativo de la convención aplicada
Select Persona_apellidoPaterno, Persona_nombre 
From Persona.Docente;
