CREATE TABLE dim_cliente (
    cliente_sk SERIAL PRIMARY KEY,
    customer_id_origen VARCHAR(20)
);

CREATE TABLE dim_producto (
    producto_sk SERIAL PRIMARY KEY,
    stock_code VARCHAR(20),
    descripcion VARCHAR(255)
);

CREATE TABLE dim_fecha (
    fecha_sk SERIAL PRIMARY KEY,
    fecha_completa TIMESTAMP,
    anio INT,
    mes INT,
    dia INT,
    hora INT,
    minuto INT
);

CREATE TABLE dim_pais (
    pais_sk SERIAL PRIMARY KEY,
    nombre_pais VARCHAR(100)
);

CREATE TABLE fact_ventas (
    venta_sk SERIAL PRIMARY KEY,
    cliente_sk INT,
    producto_sk INT,
    fecha_sk INT,
    pais_sk INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    total_venta DECIMAL(10,2),

    CONSTRAINT fk_cliente
        FOREIGN KEY (cliente_sk)
        REFERENCES dim_cliente(cliente_sk),

    CONSTRAINT fk_producto
        FOREIGN KEY (producto_sk)
        REFERENCES dim_producto(producto_sk),

    CONSTRAINT fk_fecha
        FOREIGN KEY (fecha_sk)
        REFERENCES dim_fecha(fecha_sk),

    CONSTRAINT fk_pais
        FOREIGN KEY (pais_sk)
        REFERENCES dim_pais(pais_sk)
);