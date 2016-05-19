-- Generado por Oracle SQL Developer Data Modeler 4.1.3.901
--   en:        2016-05-18 23:38:08 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




DROP TABLE CLIENTE CASCADE CONSTRAINTS ;

DROP TABLE ESTADO CASCADE CONSTRAINTS ;

DROP TABLE PEDIDO CASCADE CONSTRAINTS ;

DROP TABLE PRODUCTO CASCADE CONSTRAINTS ;

DROP TABLE PRODUCTO_PEDIDO CASCADE CONSTRAINTS ;

DROP TABLE PRODUCTO_VENTA CASCADE CONSTRAINTS ;

DROP TABLE PROVEEDOR CASCADE CONSTRAINTS ;

DROP TABLE VENDEDOR CASCADE CONSTRAINTS ;

DROP TABLE VENTA CASCADE CONSTRAINTS ;

CREATE TABLE CLIENTE
  (
    documento_cliente VARCHAR2 (15) NOT NULL ,
    nombre            VARCHAR2 (40) NOT NULL ,
    primer_apellido   VARCHAR2 (40) NOT NULL ,
    segundo_apellido  VARCHAR2 (40) ,
    telefono_cli      VARCHAR2 (15) NOT NULL ,
    correo            VARCHAR2 (40)
  ) ;
ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE PRIMARY KEY ( documento_cliente ) ;


CREATE TABLE ESTADO
  (
    codigo_estado NUMBER (5) NOT NULL ,
    nombre_estado VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE ESTADO ADD CONSTRAINT PK_ESTADO PRIMARY KEY ( codigo_estado ) ;


CREATE TABLE PEDIDO
  (
    codigo_pedido        NUMBER (5) NOT NULL ,
    PROVEEDOR_nit        NUMBER (5) NOT NULL ,
    ESTADO_codigo_estado NUMBER (5) NOT NULL
  ) ;
ALTER TABLE PEDIDO ADD CONSTRAINT PK_PEDIDO PRIMARY KEY ( codigo_pedido ) ;


CREATE TABLE PRODUCTO
  (
    codigo_producto  NUMBER (5) NOT NULL ,
    nombre_producto  VARCHAR2 (40) NOT NULL ,
    descripcion      VARCHAR2 (40) ,
    precio           NUMBER (10) NOT NULL ,
    existencia_real  NUMBER (5) NOT NULL ,
    disponible_venta NUMBER (5) NOT NULL
  ) ;
ALTER TABLE PRODUCTO ADD CONSTRAINT PK_PRODUCTO PRIMARY KEY ( codigo_producto ) ;


CREATE TABLE PRODUCTO_PEDIDO
  (
    PRODUCTO_codigo_producto NUMBER (5) NOT NULL ,
    PEDIDO_codigo_pedido     NUMBER (5) NOT NULL ,
    cantidad                 NUMBER (5) NOT NULL ,
    valor_unitario           NUMBER (10) NOT NULL
  ) ;
ALTER TABLE PRODUCTO_PEDIDO ADD CONSTRAINT PK_producto_pedido PRIMARY KEY ( PRODUCTO_codigo_producto, PEDIDO_codigo_pedido ) ;


CREATE TABLE PRODUCTO_VENTA
  (
    PRODUCTO_codigo_producto NUMBER (5) NOT NULL ,
    VENTA_codigo_venta       NUMBER (5) NOT NULL ,
    cantidad                 NUMBER (2) NOT NULL
  ) ;
ALTER TABLE PRODUCTO_VENTA ADD CONSTRAINT PK_producto_venta PRIMARY KEY ( PRODUCTO_codigo_producto, VENTA_codigo_venta ) ;


CREATE TABLE PROVEEDOR
  (
    nit                       NUMBER (5) NOT NULL ,
    nombre_proveedor          VARCHAR2 (40) NOT NULL ,
    nombre_contacto           VARCHAR2 (40) NOT NULL ,
    primer_apellido_contacto  VARCHAR2 (40) NOT NULL ,
    segundo_apellido_contacto VARCHAR2 (40) ,
    telefono_contacto         VARCHAR2 (15) NOT NULL ,
    correo_proveedor          VARCHAR2 (40) NOT NULL ,
    telefono_proveedor        VARCHAR2 (15) NOT NULL
  ) ;
ALTER TABLE PROVEEDOR ADD CONSTRAINT PK_PROVEEDOR PRIMARY KEY ( nit ) ;


CREATE TABLE VENDEDOR
  (
    documento               VARCHAR2 (15) NOT NULL ,
    nombre                  VARCHAR2 (40) NOT NULL ,
    primer_apellido         VARCHAR2 (40) NOT NULL ,
    segundo_apellido        VARCHAR2 (40) ,
    telefono                VARCHAR2 (15) NOT NULL ,
    celular                 VARCHAR2 (15) NOT NULL ,
    correo                  VARCHAR2 (40) NOT NULL ,
    direccion               VARCHAR2 (40) NOT NULL ,
    VENDEDOR_documento_jefe VARCHAR2 (15) NOT NULL
  ) ;
ALTER TABLE VENDEDOR ADD CONSTRAINT PK_VENDEDOR PRIMARY KEY ( documento ) ;


CREATE TABLE VENTA
  (
    codigo_venta              NUMBER (5) NOT NULL ,
    fecha_venta               DATE NOT NULL ,
    valor_total               NUMBER (10) NOT NULL ,
    VENDEDOR_documento        VARCHAR2 (15) NOT NULL ,
    CLIENTE_documento_cliente VARCHAR2 (15) NOT NULL
  ) ;
ALTER TABLE VENTA ADD CONSTRAINT PK_VENTA PRIMARY KEY ( codigo_venta ) ;


ALTER TABLE PEDIDO ADD CONSTRAINT FK_PEDIDO_ESTADO FOREIGN KEY ( ESTADO_codigo_estado ) REFERENCES ESTADO ( codigo_estado ) ;

ALTER TABLE PEDIDO ADD CONSTRAINT FK_PEDIDO_PROVEEDOR FOREIGN KEY ( PROVEEDOR_nit ) REFERENCES PROVEEDOR ( nit ) ;

ALTER TABLE PRODUCTO_PEDIDO ADD CONSTRAINT FK_PEDIDO_codigo_pedido FOREIGN KEY ( PEDIDO_codigo_pedido ) REFERENCES PEDIDO ( codigo_pedido ) ;

ALTER TABLE PRODUCTO_PEDIDO ADD CONSTRAINT FK_PRODUCTO_codigo_producto FOREIGN KEY ( PRODUCTO_codigo_producto ) REFERENCES PRODUCTO ( codigo_producto ) ;

ALTER TABLE PRODUCTO_VENTA ADD CONSTRAINT FK_PRODUCTO_codigo_productov2 FOREIGN KEY ( PRODUCTO_codigo_producto ) REFERENCES PRODUCTO ( codigo_producto ) ;

ALTER TABLE VENDEDOR ADD CONSTRAINT FK_VENDEDOR_VENDEDOR FOREIGN KEY ( VENDEDOR_documento_jefe ) REFERENCES VENDEDOR ( documento ) ;

ALTER TABLE VENTA ADD CONSTRAINT FK_VENTA_CLIENTE FOREIGN KEY ( CLIENTE_documento_cliente ) REFERENCES CLIENTE ( documento_cliente ) ;

ALTER TABLE VENTA ADD CONSTRAINT FK_VENTA_VENDEDOR FOREIGN KEY ( VENDEDOR_documento ) REFERENCES VENDEDOR ( documento ) ;

ALTER TABLE PRODUCTO_VENTA ADD CONSTRAINT FK_VENTA_codigo_venta FOREIGN KEY ( VENTA_codigo_venta ) REFERENCES VENTA ( codigo_venta ) ;


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
