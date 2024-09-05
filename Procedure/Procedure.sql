-- Cambiamos el delimitador para poder definir el cuerpo del procedimiento
DELIMITER //

-- Creamos un procedimiento para aumentar el salario de los empleados en un departamento específico
CREATE PROCEDURE aumentar_salario_departamento(
    IN p_departamento_id INT,      -- Parámetro de entrada: ID del departamento
    IN p_porcentaje DECIMAL(5,2)   -- Parámetro de entrada: porcentaje de aumento
)
BEGIN
    -- Actualizamos los salarios de los empleados del departamento dado, aplicando el porcentaje de aumento
    UPDATE empleados
    SET salario = salario * (1 + p_porcentaje / 100)  -- Calculamos el nuevo salario
    WHERE departamento_id = p_departamento_id;        -- Solo afectamos a los empleados del departamento especificado
END;
//
-- Restauramos el delimitador original
DELIMITER ;

-- Llamamos al procedimiento para aumentar en un 5% los salarios del departamento con ID 9
CALL aumentar_salario_departamento(9, 5);
