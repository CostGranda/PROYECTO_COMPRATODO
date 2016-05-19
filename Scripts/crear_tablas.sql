DROP TABLE PRODUCTO_PEDIDO;
DROP TABLE PRODUCTO_VENTA;
DROP TABLE PEDIDO;
DROP TABLE VENTA;
DROP TABLE CLIENTE;
DROP TABLE ESTADO;
DROP TABLE PRODUCTO;
DROP TABLE PROVEEDOR;
DROP TABLE VENDEDOR;

CREATE TABLE CLIENTE
  (
    documento_cliente VARCHAR2 (15) NOT NULL ,
    nombre            VARCHAR2 (40) NOT NULL ,
    primer_apellido   VARCHAR2 (40) NOT NULL ,
    segundo_apellido  VARCHAR2 (40) ,
    telefono_cli      VARCHAR2 (15) NOT NULL ,
    correo            VARCHAR2 (40)
  )
  tablespace ts_compratodo;

CREATE TABLE ESTADO
  (
    codigo_estado NUMBER (5) NOT NULL ,
    nombre_estado VARCHAR2 (20) NOT NULL
  )
  tablespace ts_compratodo;

CREATE TABLE PEDIDO
  (
    codigo_pedido        NUMBER (5) NOT NULL ,
    PROVEEDOR_nit        NUMBER (5) NOT NULL ,
    ESTADO_codigo_estado NUMBER (5) NOT NULL
  )
  tablespace ts_compratodo;

CREATE TABLE PRODUCTO
  (
    codigo_producto  NUMBER (5) NOT NULL ,
    nombre_producto  VARCHAR2 (40) NOT NULL ,
    descripcion      VARCHAR2 (40) ,
    precio           NUMBER (10) NOT NULL ,
    existencia_real  NUMBER (5) NOT NULL ,
    disponible_venta NUMBER (5) NOT NULL
  )
  tablespace ts_compratodo;

CREATE TABLE PRODUCTO_PEDIDO
  (
    PRODUCTO_codigo_producto NUMBER (5) NOT NULL ,
    PEDIDO_codigo_pedido     NUMBER (5) NOT NULL ,
    cantidad                 NUMBER (5) NOT NULL ,
    valor_unitario           NUMBER (10) NOT NULL
  )
  tablespace ts_compratodo;

CREATE TABLE PRODUCTO_VENTA
  (
    PRODUCTO_codigo_producto NUMBER (5) NOT NULL ,
    VENTA_codigo_venta       NUMBER (5) NOT NULL ,
    cantidad                 NUMBER (2) NOT NULL
  )
  tablespace ts_compratodo;

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
  )
  tablespace ts_compratodo;

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
  )
  tablespace ts_compratodo;

CREATE TABLE VENTA
  (
    codigo_venta              NUMBER (5) NOT NULL ,
    fecha_venta               DATE NOT NULL ,
    valor_total               NUMBER (10) NOT NULL ,
    VENDEDOR_documento        VARCHAR2 (15) NOT NULL ,
    CLIENTE_documento_cliente VARCHAR2 (15) NOT NULL
  )
  tablespace ts_compratodo;
