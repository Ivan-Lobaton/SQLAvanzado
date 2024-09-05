Actividad SQL Avanzado

Descripción de la base de datos:
Esta actividad utiliza una base de datos relacional compuesta por varias tablas que almacenan información sobre empleados, dependientes, departamentos, trabajos, ubicaciones, países y regiones. Entre las tablas más relevantes se encuentran:

- empleados: Almacena los datos de los empleados, incluyendo su nombre, apellidos, email, número de teléfono, fecha de ingreso, salario, y el departamento al que pertenecen.
- departamentos: Guarda la información sobre los diferentes departamentos de la organización, incluyendo su ubicación.
- ubicaciones: Contiene la dirección, ciudad, estado/provincia y país de las ubicaciones donde se encuentran los departamentos.

Descripción de los códigos implementados:
Event: evento_reporte_mensual
Este evento programado se ejecuta automáticamente cada mes para insertar en la tabla reporte_mensual la cantidad de empleados activos en la empresa. Se inicia a partir del 1 de septiembre de 2024 y permite tener un registro mensual de la cantidad de empleados.

Index: idx_apellidos_empleados
Se crea un índice sobre la columna apellidos de la tabla empleados. Este índice optimiza las búsquedas que se realizan sobre los apellidos de los empleados, mejorando el rendimiento de consultas como las que buscan un empleado por su apellido.

Procedure: aumentar_salario_departamento
Este procedimiento almacenado recibe como parámetros un ID de departamento y un porcentaje de aumento salarial. Su función es actualizar los salarios de todos los empleados pertenecientes al departamento especificado, incrementando su salario en base al porcentaje dado.

Trigger: trg_actualizacion_salario
Este disparador (trigger) se ejecuta antes de cada actualización en la tabla empleados. Si el salario de un empleado cambia, el disparador inserta un registro en la tabla registro_salarios con el salario anterior y el nuevo salario, junto con el ID del empleado y la fecha de la actualización.

View: vista_empleados
Esta vista combina la información de varias tablas (empleados, departamentos y ubicaciones) para mostrar una lista detallada de empleados con su nombre, apellidos, email, número de teléfono, el nombre del departamento al que pertenecen y la ciudad, estado/provincia y país de su ubicación. Esto facilita la consulta de datos sin necesidad de realizar múltiples uniones de tablas.