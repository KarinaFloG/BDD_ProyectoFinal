--@Autor: Karina Flores García
--@Fecha creación: 20/12/2021
--@Descripción: Creación de ligas en los 4 nodos.
clear screen
whenever sqlerror exit rollback
Prompt ============================
Prompt Creando ligas en ahgbdd_s1
Prompt ============================
connect ilap_bdd/ilap_bdd@ahgbdd_s1
-- PDB local
create database link ahgbdd_s2.fi.unam using 'AHGBDD_S2';
--PDB remotas
create database link kfgbdd_s1.fi.unam using 'KFGBDD_S1';
Create database link kfgbdd_s2.fi.unam using 'KFGBDD_S2';
Prompt ============================
Prompt Creando ligas en ahgbdd_s2
Prompt ============================
connect ilap_bdd/ilap_bdd@ahgbdd_s2
-- PDB local
create database link ahgbdd_s1.fi.unam using 'AHGBDD_S1';
--PDB remotas
create database link kfgbdd_s1.fi.unam using 'KFGBDD_S1';
Create database link kfgbdd_s2.fi.unam using 'KFGBDD_S2';
Prompt ============================
Prompt Creando ligas en kfgbdd_s1
Prompt ============================
connect ilap_bdd/ilap_bdd@kfgbdd_s1
-- PDB local
create database link kfgbdd_s2.fi.unam using 'KFGBDD_S2';
--PDB remotas
create database link ahgbdd_s1.fi.unam using 'AHGBDD_S1';
Create database link ahgbdd_s2.fi.unam using 'AHGBDD_S2';
Prompt ============================
Prompt Creando ligas en kfgbdd_s2
Prompt ============================
connect ilap_bdd/ilap_bdd@kfgbdd_s2
-- PDB local
create database link kfgbdd_s1.fi.unam using 'KFGBDD_S1';
--PDB remotas
create database link ahgbdd_s1.fi.unam using 'AHGBDD_S1';
Create database link ahgbdd_s2.fi.unam using 'AHGBDD_S2';
Prompt Listo