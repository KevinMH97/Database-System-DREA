# Database-System-DREA

# REDISEÑO DE LA BASE DE DATOS PARA EL SISTEMA DE CONSTANCIA DE PAGOS DE LA DIRECCIÓN REGIONAL DE EDUCACIÓN DE AYACUCHO - PERU

## 📌 Descripción del Proyecto
<div align="justify">
Se presenta una solución a las deficiencias de rendimiento y eficiencia del sistema de constancias de pago de la Dirección Regional de Educación de Ayacucho (DREA), plataforma encargada de generar los recibos y boletas del personal. El principal síntoma de esta problemática radica en los prolongados tiempos de respuesta, causados por fallas estructurales en el diseño y almacenamiento de la base de datos actual.

Para solucionar este problema, se rediseña la base de datos aplicando principios de normalización, estándares de la industria y la lógica operativa del proceso de pagos. Este proceso comprende:

- **Depuración de requerimientos:** Identificación precisa de los datos estrictamente necesarios para el sistema.

- **Alineación del modelo relacional:** Estructuración de las relaciones entre tablas acorde al flujo real del negocio.

- **Normalización y tipificación:** Aplicación de formas normales y asignación rigurosa de tipos de datos a cada atributo.
</div>

## 🛠️ Tecnologías Utilizadas
- **Motor de BD:** SQL Server
- **Conceptos aplicados:** Modelado relacional (ERD), normalización, llaves foráneas y restricciones.

> *Se prsenta en documentos de texto, todos los procedimietnos a detalle del proyecto.*


> *Nota: Todos los datos contenidos en los scripts de prueba son totalmente ficticios para fines demostrativos.*



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

