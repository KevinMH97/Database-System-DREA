# Database-System-DREA

# REDISEÑO DE LA BASE DE DATOS PARA EL SISTEMA DE CONSTANCIA DE PAGOS DE LA DIRECCIÓN REGIONAL DE EDUCACIÓN DE AYACUCHO - PERU

## 📌 Descripción del Proyecto
<div align="justify">
Se presenta una solución a la problemática de rendimiento y eficiencia del sistema de constancia de pagos que actualmente viene funcionando en la Dirección Regional de Educación de Ayacucho, como un generador de recibos y boletas de pago para cada trabajador vinculado a dicha organización gubernamental. Esta problemática radica principalmente de la forma en como se almacenan los datos, ya que utiliza un modelo de base de datos con diversas fallas de diseño.

Debido a estas razones, se optó por rediseñar la base de datos, siguiendo un conjunto de estrategias y buenas prácticas establecidas por notables autores en este tema y propia experiencia en modelado de datos. 

El principal indicio de que el sistema de constancia de pagos, presenta evidentes problemas son, los tiempos de respuesta bastante largos. Por lo cual, se optó por realizar un análisis exhaustivo de los datos e información que el sistema realmente necesita almacenar, que las relaciones entre tablas sigan un camino acorde a cómo funciona el proceso de pago en la vida real, tomar en cuenta las formas normales de diseño de base de datos y establecer de manera idónea el tipo de dato a cada atributo de una tabla.
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
