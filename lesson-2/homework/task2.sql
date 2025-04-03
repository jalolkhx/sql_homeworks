CREATE TABLE data_types_demo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    sample_date DATE,
    sample_time TIME,
    sample_datetime DATETIME,
    sample_float FLOAT,
    sample_tinyint TINYINT,
    sample_decimal DECIMAL(10,2)
);
INSERT INTO data_types_demo (sample_date, sample_time, sample_datetime, sample_float, sample_tinyint, sample_decimal)
VALUES 
    ('2025-04-03', '14:30:00', '2025-04-03 14:30:00', 123.456, 10, 99.99),
    ('2024-12-25', '08:15:00', '2024-12-25 08:15:00', 3.14159, 255, 150.75),
    ('2023-07-19', '22:45:00', '2023-07-19 22:45:00', 0.0001, 5, 5000.50);
