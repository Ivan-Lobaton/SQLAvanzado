-- Creamos un índice en la columna 'apellidos' de la tabla 'empleados'
CREATE INDEX idx_apellidos_empleados ON empleados(apellidos);

-- Usamos el índice para acelerar la búsqueda de empleados por apellido
SELECT empleado_id, nombres, apellidos, email
FROM empleados
WHERE apellidos = 'King';  -- La búsqueda por 'apellidos' será más rápida gracias al índice
