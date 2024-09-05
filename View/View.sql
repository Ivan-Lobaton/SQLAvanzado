-- Creamos una vista llamada 'vista_empleados' que combina datos de varias tablas
CREATE VIEW vista_empleados AS
-- Seleccionamos los campos de interés de las tablas empleados, departamentos y ubicaciones
SELECT e.empleado_id, e.nombres, e.apellidos, e.email, e.numero_telefono, 
       d.departamento_nombre,  -- Nombre del departamento del empleado
       u.ciudad, u.estado_provincia, u.pais_id  -- Ubicación geográfica del departamento
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.departamento_id  -- Unimos con la tabla departamentos por departamento_id
JOIN ubicaciones u ON d.ubicacion_id = u.ubicacion_id;         -- Unimos con la tabla ubicaciones por ubicacion_id

-- Consultamos todos los datos desde la vista que acabamos de crear
SELECT * FROM vista_empleados;
