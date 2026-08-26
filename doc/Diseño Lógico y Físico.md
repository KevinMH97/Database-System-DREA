### Diseño Lógico

El modelo lógico de una base de datos es una representación abstracta de la estructura de los datos, independiente del hardware y software subyacentes. Se centra en la organización de la información y en las relaciones existentes entre las entidades, sin contemplar la implementación física. En este nivel, se utilizan entidades, atributos y relaciones para describir cómo se almacenan y vinculan los datos.

En esta etapa, se aplicaron las formas normales a las tablas identificadas para optimizar la base de datos previa del **Sistema de Constancia de Pagos de la DREA** (el diagrama completo se encuentra en el **Anexo 01**):

* **Esquema `Persona`:** Se renombró la tabla `Persona` por `Trabajador` y se identificaron atributos con redundancia de registros. Mediante la aplicación de la primera y segunda forma normal, se dividió la entidad original en ocho tablas relacionadas de muchos a muchos. Cada tabla resultante almacena el dominio específico de las características del trabajador (régimen laboral, cargo, cuenta bancaria, entre otros).
* **Esquema `Boleta`:** Se eliminaron atributos en desuso y se adaptó el modelo al flujo operativo real. Por ejemplo, la tabla `Pago_Detalle` registra cada monto parcial correspondiente a un haber específico; dichos montos se consolidan en la columna `montoLiquido` de la tabla `Pago`.
* **Esquema `Admin`:** Según las reglas de negocio del sistema, se estructuró un módulo de control de acceso para gestionar los usuarios autorizados a manipular la información mediante la asignación de roles y permisos específicos.

---

**Diseño Lógico del Esquema Persona de la Base de Datos para el Sistema de Constancia de Pagos de la Dirección Regional de Educación de Ayacucho.** 

<img width="719" height="682" alt="image" src="https://github.com/user-attachments/assets/0ddd588e-2064-49b3-82af-8bd293cd6155" />

> **Fuente:** Elaboración propia.

---

**Diseño Lógico del Esquema Boleta de la Base de Datos para el Sistema de Constancia de Pagos de la Dirección Regional de Educación de Ayacucho.**

<img width="369" height="391" alt="image" src="https://github.com/user-attachments/assets/0fac0ca6-eb58-412b-b03e-194402d28e75" />

> **Fuente:** Elaboración propia.

---

**Diseño Lógico del Esquema Admin de la Base de Datos para el Sistema de Constancia de Pagos de la Dirección Regional de Educación de Ayacucho.**

<img width="443" height="551" alt="image" src="https://github.com/user-attachments/assets/ad9fa7b0-22a9-415c-950b-8438c88da8db" />

> **Fuente:** Elaboración propia.

---

### Diseño Físico

El modelo físico se concentra en la implementación real de la estructura de datos en el sistema de gestión de bases de datos seleccionado. En esta fase se definen:

* El almacenamiento en disco.
* La asignación precisa de tipos de datos para cada columna.
* La aplicación de restricciones de integridad.
* La indexación para optimizar el rendimiento de las consultas.
* La gestión de seguridad, permisos y fragmentación de datos.

#### Almacenamiento de Datos en Disco
El motor de base de datos utilizado es **Microsoft SQL Server**. Para maximizar el rendimiento de lectura/escritura (I/O) y la eficiencia general, se recomienda distribuir los archivos de la base de datos en discos físicos independientes según la disponibilidad del servidor:
* Archivo principal de datos (`.mdf`).
* Archivos secundarios de datos (`.ndf`).
* Archivo de registro de transacciones (`.ldf`).

#### Elección de Índices
Una correcta indexación reduce el tiempo de respuesta en la ejecución de consultas:
* **Identificación y análisis:** Priorizar índices sobre columnas frecuentemente utilizadas en cláusulas `WHERE`, `JOIN` y `ORDER BY`.
* **Control de sobreindexación:** Evitar la creación indiscriminada de índices, ya que penalizan el rendimiento en operaciones de inserción (`INSERT`), actualización (`UPDATE`) y eliminación (`DELETE`).
* **Mantenimiento:** Mantener actualizadas las estadísticas para que el optimizador del motor ejecute planes de consulta eficientes.

#### Elección de Tipos de Dato
La asignación rigurosa de tipos de datos garantiza la integridad, optimiza el espacio de almacenamiento y agiliza las operaciones aritméticas:
* Uso de tipos numéricos (`INT`, `DECIMAL`) en lugar de `VARCHAR` para valores calculables.
* Uso de tipos temporales precisos (`DATE` para fechas y `DATETIME` para registros con marca de tiempo).

---
 
**Diseño Físico del Esquema Persona de la Base de Datos para el Sistema de Constancia de Pagos de la Dirección Regional de Educación de Ayacucho.**
\
<img width="940" height="623" alt="image" src="https://github.com/user-attachments/assets/abc634cc-aace-41f1-98a9-b259be63f7bf" />

> **Fuente:** Elaboración propia.

---

**Diseño Físico del Esquema Boleta de la Base de Datos para el Sistema de Constancia de Pagos de la Dirección Regional de Educación de Ayacucho.**

<img width="706" height="424" alt="image" src="https://github.com/user-attachments/assets/b3f023be-95a8-4d98-be10-5caeadbcaed0" />

> **Fuente:** Elaboración propia.

---

**Diseño Físico del Esquema Admin de la Base de Datos para el Sistema de Constancia de Pagos de la Dirección Regional de Educación de Ayacucho.**

<img width="638" height="479" alt="image" src="https://github.com/user-attachments/assets/2a21a8dd-171a-4efe-a305-6f77824d1767" />

> **Fuente:** Elaboración propia.
