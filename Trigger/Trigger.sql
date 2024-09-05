-- Creamos una tabla para registrar las actualizaciones de salarios
CREATE TABLE registro_salarios (
    id INT AUTO_INCREMENT PRIMARY KEY,     -- Clave primaria con incremento automático
    empleado_id INT,                       -- ID del empleado cuyo salario ha cambiado
    salario_antiguo DECIMAL(8,2),          -- Valor del salario antes de la actualización
    salario_nuevo DECIMAL(8,2),            -- Valor del nuevo salario después de la actualización
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Fecha y hora de la actualización, por defecto la actual
);

-- Cambiamos el delimitador para definir el cuerpo del trigger
DELIMITER //

-- Creamos un trigger que se ejecuta antes de cualquier actualización en la tabla 'empleados'
CREATE TRIGGER trg_actualizacion_salario
BEFORE UPDATE ON empleados                -- El trigger se activa antes de una actualización en la tabla empleados
FOR EACH ROW                              -- Se aplica para cada fila que se actualiza
BEGIN
    -- Comprobamos si el salario ha cambiado
    IF NEW.salario <> OLD.salario THEN
        -- Si el salario es diferente, insertamos un registro en la tabla registro_salarios con el ID del empleado,
        -- el salario antiguo y el nuevo salario
        INSERT INTO registro_salarios (empleado_id, salario_antiguo, salario_nuevo)
        VALUES (OLD.empleado_id, OLD.salario, NEW.salario);
    END IF;
END;
//

-- Restauramos el delimitador original
DELIMITER ;

-- Actualizamos el salario del empleado con ID 103 para que se registre en el trigger
UPDATE empleados
SET salario = 9500.00
WHERE empleado_id = 103;

-- Consultamos la tabla registro_salarios para verificar los cambios registrados por el trigger
SELECT * FROM registro_salarios WHERE empleado_id = 103;
