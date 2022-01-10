--@Autor: Alejandro Herrera
--@Fecha creación: 08/01/2022
--@Descripción: Eliminación y creación del usuario.
declare
v_count number(1,0);
begin
select count(*) into v_count
from dba_users
where lower(username) ='ilap_bdd';
if v_count > 0 then
execute immediate 'drop user ilap_bdd cascade';
else
dbms_output.put_line('El usuario ilap_bdd no existe');
end if;
end;
/
Prompt Creando al usuario ilap_bdd
create user ilap_bdd identified by ilap_bdd quota unlimited on users;

Prompt Otorgando permisos al usuario ilap_bdd
grant create session, create table, create procedure, create sequence, create view, create synonym, create database link to ilap_bdd;