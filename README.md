# Database-System-DREA
REDISEÑO DE LA BASE DE DATOS PARA EL SISTEMA DE CONSTANCIA DE PAGOS DE LA DIRECCIÓN REGIONAL DE EDUCACIÓN DE AYACUCHO- PERÚ

# Sistema de Gestión de Planillas y Pagos (Payroll Management System)

## 📌 Descripción del Proyecto
Diseño y desarrollo de una base de datos relacional para la gestión, cálculo y emisión de planillas de pago de personal en el sector educativo/público. El sistema permite administrar los regímenes laborales, conceptos remunerativos, descuentos de ley (AFP/ONP/Aportes) y consolidar el pago neto por periodo.

## 🛠️ Tecnologías Utilizadas
- **Motor de BD:** SQL Server / PostgreSQL (Pon el que corresponda)
- **Conceptos aplicados:** Modelado relacional (ERD), llaves foráneas y restricciones, Vistas, Consultas complejas (JOINs, Aggregations), Stored Procedures y Triggers.

## 📊 Estructura del Esquema
- **Personal:** Datos de trabajadores, cargos, regímenes y centros de costo.
- **Conceptos:** Catálogo parametrizable de ingresos (haberes) y descuentos (legales y personales).
- **Procesamiento de Pagos:** Tablas históricas de detalle y cabecera por periodo fiscal.

## 🔍 Consultas de Negocio Destacadas
- Cálculo automático de sueldo neto y retenciones previsionales.
- Consolidado de gasto presupuestal por condición laboral.
- Generación de resúmenes de aportes a entidades recaudadoras (AFP / ONP).

> *Nota: Todos los datos contenidos en los scripts de prueba son totalmente ficticios para fines demostrativos.*
