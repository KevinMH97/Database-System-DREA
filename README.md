# Database-System-DREA
REDISEÑO DE LA BASE DE DATOS PARA EL SISTEMA DE CONSTANCIA DE PAGOS DE LA DIRECCIÓN REGIONAL DE EDUCACIÓN DE AYACUCHO- PERÚ


CONSIDERACIONES PREVIAS AL DISEÑO DE LA BASE DE DATOS RELACIONAL

Análisis de Esquemas de la Base de Datos

Actualmente la base de datos del sistema de constancia de pagos de la dirección regional de Ayacucho, presenta gran presencia de datos redundantes y repetitivos, especialmente en las tablas “personas” y “pagos” generando problemas de rendimiento y almacenamiento; Además, se evidenció un desorden entre las relaciones de tablas, donde incluso, se encontró la presencia de bucles generado por la mala utilización de las relaciones y la lógica de modelado. 

Una de las buenas prácticas de diseño de base de datos que utilicé en este informe, es la aplicación de las formas normales, la cual por su naturaleza va a generar más cantidad de tablas, añadiendo complejidad al modelo. 

Una forma de organizar un modelo complejo, es utilizar esquemas de bases de datos, las cuales serán:

a.	Persona: Este esquema contendrá a las tablas que guarden información de cada persona en la DREA a la cual se le realizará el pago, como su nivel magisterial, cargo, régimen laboral, etc.

b.	Boleta: Este esquema contendrá a las tablas que tengan relación a la información que figurará en la boleta de pago, tales como: tipo de pago o detalle de pago.

c.	Admin: Este esquema contendrá a todas las tablas que tengan relación a los usuarios encargados de emitir y registrar un pago a las personas asociadas a la Dirección Regional de Ayacucho.

De este modo, al usar esquemas en la base de datos, se pueden obtener beneficios significativos como:

	Permitir un mayor acceso a las bases de datos por parte de múltiples usuarios.
	Prevenir la ubicación desordenada de las entidades en el sistema.
	Simplificar la identificación de los propietarios de los esquemas.
	Tener tablas con nombres idénticos en diferentes esquemas, eliminando la necesidad de utilizar prefijos o sufijos para distinguirlas.

Nomenclatura en el Diseño de la Base de Datos

Emplear una manera consistente de nombrar elementos al escribir código tiene varias ventajas. Hace que el código sea más fácil de entender, ya que los nombres de variables y funciones siguen un patrón predecible, permitiendo a los programadores comprender rápidamente su propósito y cómo se relacionan con otras partes del código. Además, facilita la tarea de mantener y corregir el código, ya que una nomenclatura coherente ayuda a localizar rápidamente los elementos relevantes durante estas tareas. Esto reduce la posibilidad de errores y conflictos, además de fomentar una colaboración más efectiva entre los miembros del equipo. También, seguir una nomenclatura común ayuda a cumplir con los estándares de codificación establecidos y promueve prácticas recomendadas, lo que contribuye a un código más sólido y de mejor calidad en general.

Por consiguiente, se presenta las reglas en la nomenclatura que se usó para elaborar el código de este informe:

	Para las cláusulas, en el código de implementación de la base de datos, se usó una convención en la cual la primera letra de cada comando SQL, inicia en mayúsculas (Select, Insert, From, Create, etc.).
	Los nombres de las tablas, empiezan en mayúsculas y en singular (Persona, Pago).
	Cada uno de los atributos, empiezan con el nombre de la tabla más el nombre del atributo en minúscula y en singular (Pesona_apellido, Persona_nombre).
	Si un atributo lo componen más de dos palabras, estas empezarán en mayúsculas (Persona_apellidoPaterno, Persona_apellidoMaterno).
	Se sustituirá la letra ñ por n.

Patrones de Diseño para la Base de Datos

La elaboración de modelos conceptuales de datos dimensionales constituye una etapa crucial y desafiante en el desarrollo de sistemas de almacenamiento de datos. Estos modelos representan los requisitos comerciales fundamentales y estratégicos, y se utilizan para implementar bases de datos que generan información vital para la toma de decisiones. A pesar de la reconocida importancia de estos modelos, el uso de patrones de análisis aprobados no es común, lo que puede resultar en modelos de datos mal planificados y bases de datos no validadas. La falta de consideración de estos patrones puede conducir a la generación de información no probada y relevante para la toma de decisiones. Hasta el momento, tanto en la literatura como en la práctica, se ha prestado escasa atención al uso de estos patrones en el modelado de datos dimensionales (Schneider, 2018).

Según Schneider (2018), para formular patrones de diseño de base de datos, se utilizar un formulario “minimalista”. Este formulario consta de tres partes principales: problema, contexto y solución.

a.	¿Cómo puedo identificar y definir correctamente las relaciones entre las entidades para evitar un modelado inadecuado?
Problema: Identificar y definir incorrectamente las relaciones entre entidades puede conducir a un diseño de base de datos que no refleje con precisión las interacciones entre los datos, lo que puede resultar en inconsistencias y dificultades.
Contexto: En el diseño de bases de datos, es fundamental establecer relaciones precisas entre las entidades para capturar adecuadamente las dependencias y conexiones entre los datos.
Solución: Utilizar técnicas de modelado como el diagrama entidad-relación (ER) y realizar un análisis exhaustivo de los requisitos del sistema para identificar y definir con precisión las relaciones entre las entidades. Además, validar el diseño con los usuarios finales y realizar pruebas exhaustivas puede ayudar a garantizar que las relaciones estén correctamente modeladas.

b.	¿Qué estrategias puedo implementar para evitar la duplicación de datos y mantener la consistencia en la base de datos?
Problema: La duplicación de datos puede conducir a inconsistencias y redundancias en la base de datos, lo que dificulta la gestión y mantenimiento de la información.
Contexto: En el diseño de bases de datos, es esencial evitar la duplicación de datos para mantener la integridad y coherencia de la información.
Solución: Aplicar técnicas de normalización para dividir la información en tablas relacionadas, utilizando claves primarias y foráneas para establecer relaciones entre ellas.

c.	¿Cómo puedo garantizar un buen rendimiento de las consultas y evitar tiempos de respuesta lentos en el diseño de la base de datos?
Problema: Un diseño de base de datos ineficiente puede resultar en tiempos de respuesta lentos y afectar la experiencia del usuario.
Contexto: En el diseño de bases de datos, es fundamental optimizar el rendimiento de las consultas para garantizar una respuesta rápida y eficiente del sistema.
Solución: Diseñar índices eficientes en las columnas utilizadas con frecuencia en las consultas, optimizar las consultas mediante técnicas como la selección adecuada de cláusulas WHERE y la de normalización selectiva de datos, y utilizar técnicas de caché para almacenar en caché resultados de consultas frecuentes puede mejorar significativamente el rendimiento de las consultas y evitar tiempos de respuesta lentos.

d.	¿Qué enfoques puedo utilizar para simplificar un diseño de base de datos complejo sin comprometer su funcionalidad?
Problema: Un diseño de base de datos complejo puede ser difícil de entender y mantener, lo que puede dificultar la evolución y adaptación del sistema.
Contexto: Simplificar un diseño de base de datos complejo es esencial para mejorar la comprensión y el mantenimiento del sistema a lo largo del tiempo.
Solución: Utilizar técnicas de abstracción y modularización para dividir la base de datos en componentes más pequeños y manejables. Además, utilizar vistas y procedimientos almacenados para ocultar la complejidad subyacente y proporcionar interfaces más simples para acceder a los datos puede simplificar el diseño sin comprometer su funcionalidad.

e.	¿Cómo puedo asegurarme de que el diseño de la base de datos sea escalable y pueda adaptarse a futuros crecimientos en el volumen de datos?
Problema: Un diseño de base de datos que no sea escalable puede dificultar la adaptación del sistema a medida que crecen los volúmenes de datos.
Contexto: En el diseño de bases de datos, es esencial planificar para el crecimiento futuro y garantizar que el sistema pueda escalar de manera efectiva a medida que aumenta la carga de datos.
Solución: Utilizar técnicas como la partición de tablas y la distribución de datos en múltiples servidores para garantizar que el sistema pueda escalar horizontalmente a medida que aumenta el volumen de datos. Además, diseñar la base de datos con una estructura flexible que permita la adición de nuevos campos o tablas sin afectar el rendimiento del sistema puede garantizar que el diseño sea escalable a largo plazo.

f.	¿Cómo puedo diseñar la base de datos de manera que sea flexible y pueda adaptarse a cambios en los requisitos del sistema sin afectar la integridad de los datos existentes?
Problema: Los cambios en los requisitos del sistema pueden requerir modificaciones en el diseño de la base de datos, lo que puede afectar la integridad de los datos existentes si no se manejan correctamente.
Contexto: En el diseño de bases de datos, es esencial diseñar la base de datos de manera que sea flexible y pueda adaptarse a cambios en los requisitos del sistema sin comprometer la integridad de los datos existentes.
Solución: Utilizar técnicas como la normalización para dividir la base de datos en componentes independientes que puedan modificarse sin afectar otras partes del sistema. Además, utilizar patrones de diseño como el patrón Repositorio para encapsular la lógica de acceso a los datos y facilitar futuras modificaciones en el diseño de la base de datos puede garantizar que el sistema sea flexible y pueda adaptarse a cambios en los requisitos del sistema sin afectar la integridad de los datos existentes.
