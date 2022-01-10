--@Autor: Alejandro Herrera
--@Fecha creación: 08/01/2022
--@Descripción: Creación de usuarios en los 4 nodos
clear screen
whenever sqlerror exit rollback;
set serveroutput on
Prompt Inciando creacion/eliminacion de usuarios.
accept syspass char prompt 'Proporcione el password de sys: ' hide
prompt =====================================
prompt Creando usuario en ahgbdd_s1
prompt =====================================
connect sys/system@ahgbdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en ahgbdd_s2
prompt =====================================
connect sys/system@ahgbdd_s2 as sysdba
@s-01-ilap-usuario.sql
prompt =====================================
prompt Creando usuario en kfgbdd_s1
prompt =====================================
connect sys/system@kfgbdd_s1 as sysdba
@s-01-ilap-usuario.sql
prompt =====================================
prompt Creando usuario en kfgbdd_s2
prompt =====================================
connect sys/system@kfgbdd_s2 as sysdba
@s-01-ilap-usuario.sql
Prompt Listo!
disconnect