-- Función para obtener información del cliente
CREATE OR REPLACE FUNCTION get_cliente_info(p_cliente_id INT)
RETURNS TABLE (
    nombre VARCHAR,
    provincia VARCHAR,
    pais VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        rp.name::VARCHAR AS nombre,
        s.name::VARCHAR AS provincia,
        c.name::VARCHAR AS pais -- Asegura que sea VARCHAR
    FROM res_partner rp
    LEFT JOIN res_country_state s ON rp.state_id = s.id
    LEFT JOIN res_country c ON rp.country_id = c.id
    WHERE rp.id = p_cliente_id;
END;
$$ LANGUAGE plpgsql;

-- Creación de la tabla milog para registrar logs
CREATE TABLE milog (
    log_id SERIAL PRIMARY KEY,
    user_id INT,
    partner_id INT,
    create_date TIMESTAMP DEFAULT now()
);

-- Función para registrar nuevos clientes en milog
CREATE OR REPLACE FUNCTION log_new_client()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO milog (user_id, partner_id, create_date)
    VALUES (NEW.create_uid, NEW.id, now());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Creación del trigger para ejecutar la función log_new_client
CREATE OR REPLACE TRIGGER trg_log_new_client
AFTER INSERT ON res_partner
FOR EACH ROW
EXECUTE FUNCTION log_new_client();

-- Consulta para ver los registros en milog
SELECT * FROM milog;

-- Consulta para ver los registros en res_partner
SELECT * FROM res_partner;

-- Inserción de un nuevo cliente en res_partner
INSERT INTO res_partner (
    name, email, phone, street, city, zip, country_id, customer_rank, company_id, create_date
) VALUES (
    'Alvaro bajo', 'alvarobajo@gmail.com', '+34911222333', 'Calle Luna 34', 'Sevilla', '41001', 69, 1, 1, NOW()
);

-- Consulta para ver los clientes registrados en milog
SELECT * FROM res_partner WHERE id IN (SELECT partner_id FROM milog);
