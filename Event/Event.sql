-- Creamos una tabla para almacenar los reportes mensuales con las fechas y el número de empleados
CREATE TABLE reporte_mensual (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Campo autoincremental para la clave primaria
    fecha_reporte DATE,                 -- Fecha en la que se generará el reporte
    cantidad_empleados INT              -- Cantidad de empleados en la fecha del reporte
);

-- Creamos un evento que se ejecutará mensualmente para generar reportes automáticos
CREATE EVENT evento_reporte_mensual
ON SCHEDULE EVERY 1 MONTH                -- Configuración del evento para que se ejecute cada mes
STARTS '2024-09-01 00:00:00'             -- Fecha y hora en que comenzará el evento
DO
BEGIN
    -- Inserta la fecha actual y el número de empleados en la tabla reporte_mensual
    INSERT INTO reporte_mensual (fecha_reporte, cantidad_empleados)
    SELECT CURDATE(), COUNT(*) FROM empleados;  -- CURDATE() obtiene la fecha actual, COUNT(*) cuenta los empleados
END;

-- Consultamos los registros que se han insertado en la tabla de reporte_mensual
SELECT * FROM reporte_mensual;
