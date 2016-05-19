--Borrar tablespace
DROP TABLESPACE ts_compratodo INCLUDING CONTENTS AND DATAFILES;

-- Crear tablespace con ubicación alternativa y tamaño de 10MB
CREATE TABLESPACE ts_compratodo LOGGING
DATAFILE 'C:\Users\coste\Documents\GitHub\PRIMER_DATAFILE.dbf' size 10M
-- DATAFILE 'D:\PRIMER_DATAFILE.dbf' size 10M
extent management local segment space management auto;

--Borrar usuario
DROP USER us_compratodo CASCADE;

-- Crear usuariom
CREATE USER us_compratodo profile default
IDENTIFIED BY 123456
DEFAULT TABLESPACE ts_compratodo
TEMPORARY TABLESPACE temp
ACCOUNT UNLOCK;

-- Permisos
GRANT connect, resource, dba TO us_compratodo;

-- Conectarse directamente
connect us_compratodo/123456;
