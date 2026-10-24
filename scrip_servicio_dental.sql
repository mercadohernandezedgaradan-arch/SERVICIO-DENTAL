BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "PEDIDO" (
	"FOLIO_PEDIDO"	INTEGER,
	"TIPO_SERVICIO"	TEXT,
	"FECHA"	DATE,
	"COSTO"	REAL,
	"ID_CLIENTE"	INTEGER,
	"ID_REPARTIDOR"	INTEGER,
	PRIMARY KEY("FOLIO_PEDIDO"),
	FOREIGN KEY("ID_CLIENTE") REFERENCES "cliente"("id_cliente"),
	FOREIGN KEY("ID_REPARTIDOR") REFERENCES "repartidor"("id_repartidor")
);
CREATE TABLE IF NOT EXISTS "cliente" (
	"id_cliente"	INTEGER,
	"nombre"	TEXT,
	"apellido"	TEXT,
	"direccion"	TEXT,
	PRIMARY KEY("id_cliente")
);
CREATE TABLE IF NOT EXISTS "repartidor" (
	"id_repartidor"	INTEGER,
	"nombre"	TEXT,
	"telefono"	TEXT,
	PRIMARY KEY("id_repartidor")
);


INSERT INTO "PEDIDO" VALUES (1,'PLACA SUPERIOR','14/10/2026',1200.0,2,1);
INSERT INTO "PEDIDO" VALUES (2,'PLACA INFERIOR ','14/10/2026',1500.0,4,2);
INSERT INTO "PEDIDO" VALUES (3,'PLACAS TOTALES ','14/06/2026',2800.0,3,3);
-- (Asegúrate de tener de 10 a 15 registros por tabla)

COMMIT;

-- -------------------------------------------------------------
-- CONSULTAS DE VERIFICACIÓN (Punto 4 de las instrucciones)
-- -------------------------------------------------------------
SELECT * FROM PEDIDO WHERE COSTO > 1000;
SELECT * FROM cliente WHERE id_cliente = 2;
SELECT * FROM repartidor WHERE nombre = 'Juan';