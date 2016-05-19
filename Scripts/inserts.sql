DROP SEQUENCE seq_codigos;

CREATE SEQUENCE seq_codigos
START WITH 1
INCREMENT BY 1
MAXVALUE 10;
INSERT INTO PRODUCTO(codigo_hor, descripcion_hor) values(seq_codigos.nextval, '01:00 - 01:20');
