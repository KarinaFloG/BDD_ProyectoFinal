--@Autor: Alejandro Herrera
--@Fecha creación: 10/01/2022
--@Descripción: Archivo de carga inicial para catalogos replicados.
clear screen
whenever sqlerror exit rollback;
--Para visualizar export NLS_LANG=SPANISH_SPAIN.WE8ISO8859P1
Prompt ======================================
Prompt Cargando catalogos de forma manual en ahgbdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@ahgbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;
Prompt ======================================
Prompt Cargando catalogos de forma manual en ahgbdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@ahgbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;
Prompt ======================================
Prompt Cargando catalogos de forma manual en kfgbdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@kfgbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;
Prompt ======================================
Prompt Cargando catalogos de forma manual en kfgbdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@kfgbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;
Prompt Listo!
exit