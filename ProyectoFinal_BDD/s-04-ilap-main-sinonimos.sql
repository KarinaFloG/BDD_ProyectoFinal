--@Autor: Karina Flores García
--@Fecha creación: 23/12/2021
--@Descripción: Creación de sinónimos - main
clear screen
whenever sqlerror exit rollback;
prompt =====================================
prompt Creando sinonimos para ahgbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@ahgbdd_s1
@s-04-ilap-jrc-s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql
prompt =====================================
prompt creando sinonimos para ahgbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@jahgbdd_s2
@s-04-ilap-jrc-s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql
prompt =====================================
prompt creando sinonimos para kfgbdd_s1
prompt =====================================
connect ilap_bdd/ilap_bdd@kfgbdd_s1
@s-04-ilap-arc-s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql
prompt =====================================
prompt creando sinonimos para kfgbdd_s2
prompt =====================================
connect ilap_bdd/ilap_bdd@kfgbdd_s2
@s-04-ilap-arc-s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql
prompt Listo!
