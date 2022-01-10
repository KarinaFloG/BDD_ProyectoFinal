--@Autor: Alejandro Herrera
--@Fecha creación: 08/01/2022
--@Descripción: Creación de fragmentos en los 4 nodos
clear screen
whenever sqlerror exit rollback;
prompt =====================================
prompt Creando fragmentos para ahgbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@ahgbdd_s1
@s-03-ilap-ahg-s1-ddl.sql
prompt =====================================
prompt Creando fragmentos para ahgbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@ahgbdd_s2
@s-03-ilap-ahg-s2-ddl.sql
prompt =====================================
prompt Creando fragmentos para kfgbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@kfgbdd_s1
@s-03-ilap-kfg-s1-ddl.sql
prompt =====================================
prompt Creando fragmentos para kfgbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@kfgbdd_s2
@s-03-ilap-kfg-s2-ddl.sql
Prompt Listo!