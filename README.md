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
