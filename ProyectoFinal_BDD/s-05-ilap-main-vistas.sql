--@Autor: Alejandro Herrera
--@Fecha creación: 10/01/2022
--@Descripción: Creación de vistas para todos los sitios
clear screen
whenever sqlerror exit rollback;

prompt ===========================================
prompt Creando vistas para ahgbdd_s1
prompt ===========================================
connect ilap_bdd/ilap_bdd@ahgbdd_s1
prompt creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql
prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs
@s-05-ilap-ahg-s1-vistas-blob.sql
prompt ===========================================
prompt Creando vistas para ahgbdd_s2
prompt ===========================================
connect ilap_bdd/ilap_bdd@ahgbdd_s2
prompt creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql
prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs
@s-05-ilap-ahg-s2-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para kfgbdd_s1
prompt ===========================================
connect ilap_bdd/ilap_bdd@kfgbdd_s1
prompt creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql
prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs
@s-05-ilap-kfg-s1-vistas-blob.sql
prompt ===========================================
prompt Creando vistas para kfgbdd_s2
prompt ===========================================
connect ilap_bdd/ilap_bdd@kfgbdd_s2
prompt creando vistas que no requieren manejo de BLOBs
@s-05-ilap-vistas.sql
prompt creando tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs
@s-05-ilap-kfg-s2-vistas-blob.sql


prompt Listo!
disconnect