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
    documento_cliente VARCHAR2 (15),
    nombre            VARCHAR2 (40),
    primer_apellido   VARCHAR2 (40),
    segundo_apellido  VARCHAR2 (40) ,
    telefono_cli      VARCHAR2 (15),
    correo            VARCHAR2 (40)
  )
  tablespace ts_compratodo;

CREATE TABLE ESTADO
  (
    codigo_estado NUMBER (5),
    nombre_estado VARCHAR2 (20)  )
  tablespace ts_compratodo;

CREATE TABLE PEDIDO
  (
    codigo_pedido        NUMBER (5),
    PROVEEDOR_nit        NUMBER (5),
    ESTADO_codigo_estado NUMBER (5)
  )
  tablespace ts_compratodo;

CREATE TABLE PRODUCTO
  (
    codigo_producto  NUMBER (5),
    nombre_producto  VARCHAR2 (40),
    descripcion      VARCHAR2 (40) ,
    precio           NUMBER (10),
    existencia_real  NUMBER (5),
    disponible_venta NUMBER (5)
  )
  tablespace ts_compratodo;

CREATE TABLE PRODUCTO_PEDIDO
  (
    PRODUCTO_codigo_producto NUMBER (5),
    PEDIDO_codigo_pedido     NUMBER (5),
    cantidad                 NUMBER (5),
    valor_unitario           NUMBER (10)
  )
  tablespace ts_compratodo;

CREATE TABLE PRODUCTO_VENTA
  (
    PRODUCTO_codigo_producto NUMBER (5),
    VENTA_codigo_venta       NUMBER (5),
    cantidad                 NUMBER (2)
  )
  tablespace ts_compratodo;

CREATE TABLE PROVEEDOR
  (
    nit                       NUMBER (5),
    nombre_proveedor          VARCHAR2 (40),
    nombre_contacto           VARCHAR2 (40),
    primer_apellido_contacto  VARCHAR2 (40),
    segundo_apellido_contacto VARCHAR2 (40) ,
    telefono_contacto         VARCHAR2 (15),
    correo_proveedor          VARCHAR2 (40),
    telefono_proveedor        VARCHAR2 (15)
  )
  tablespace ts_compratodo;

CREATE TABLE VENDEDOR
  (
    documento               VARCHAR2 (15),
    nombre                  VARCHAR2 (40),
    primer_apellido         VARCHAR2 (40),
    segundo_apellido        VARCHAR2 (40),
    telefono                VARCHAR2 (15),
    celular                 VARCHAR2 (15),
    correo                  VARCHAR2 (40),
    direccion               VARCHAR2 (40),
    VENDEDOR_documento_jefe VARCHAR2 (15)
  )
  tablespace ts_compratodo;

CREATE TABLE VENTA
  (
    codigo_venta              NUMBER (5),
    fecha_venta               DATE,
    valor_total               NUMBER (10),
    VENDEDOR_documento        VARCHAR2 (15),
    CLIENTE_documento_cliente VARCHAR2 (15)
  )
  tablespace ts_compratodo;
