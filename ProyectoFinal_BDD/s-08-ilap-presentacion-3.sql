--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: Archivo de carga inicial - fragmentos
clear screen
set serveroutput on
--Para visualizar export NLS_LANG=SPANISH_SPAIN.WE8ISO8859P1
Prompt ======================================
Prompt Preparando carga de Datos
Prompt ======================================
Prompt =>Seleccionar la PDB LOCAL para insertar datos
Prompt => Asegurarse que las imagenes existen en ambos servidores
connect ilap_bdd/ilap_bdd@&pdb
Prompt Personalizando el formato de fechas
alter session set NLS_DATE_FORMAT='yyyy-mm-dd hh24:mi:ss';
alter session set NLS_TIMESTAMP_FORMAT='yyyy-mm-dd hh24:mi:ss';
Prompt =>Al ocurrir un error se saldrá del programa y se hará rollback
whenever sqlerror exit rollback
Pause => Presionar Enter para Iniciar con la extracción de datos binarios, Ctrl-C para cancelar
--Invoca a un shell script para realizar la extracción y copia de archivos
!sh s-08-ilap-presentacion-3.sh
Prompt ==================================================
Prompt ¿ Listo para Iniciar con la carga ?
Prompt ==================================================
Pause => Presionar Enter para Iniciar, Ctrl-C para cancelar
Prompt => Realizando limpieza inicial ....
set feedback off
Prompt Eliminando datos de historico_status_laptop
delete from historico_status_laptop;
Prompt Eliminando datos de sucursal
delete from sucursal;
Prompt Eliminando datos de sucursal_taller
delete from sucursal_taller;
Prompt Eliminando datos de sucursal_venta
delete from sucursal_venta;
Prompt Eliminando datos de servicio_laptop
delete from servicio_laptop;
Prompt Eliminando datos de laptop_inventario
delete from laptop_inventario;
--completar. Tener cuidado con el orden de eliminación,
--debe ser eliminación con base a las dependencias de las tablas.
Prompt => Realizando Carga de datos ....
Prompt cargando tipo_tarjeta_video
@carga-inicial/tipo_tarjeta_video.sql
Prompt cargando tipo_procesador
@carga-inicial/tipo_procesador.sql
Prompt cargando tipo_monitor
@carga-inicial/tipo_monitor.sql
Prompt cargando tipo_almacenamiento
@carga-inicial/tipo_almacenamiento.sql
Prompt cargando sucursal
@carga-inicial/sucursal-1.sql
--es_venta = 1, es_taller = 0
@carga-inicial/sucursal-2.sql
--es_venta= 1, es_taller = 1
@carga-inicial/sucursal-3.sql
Prompt cargando sucursal_taller
-- id 1 al 1000
@carga-inicial/sucursal_taller-1.sql
-- id 2001 al 3000
@carga-inicial/sucursal_taller-2.sql
Prompt cargando sucursal_venta
-- id 1001 al 2000
@carga-inicial/sucursal_venta-1.sql
-- id 2001 al 3000
@carga-inicial/sucursal_venta-2.sql
Prompt cargando laptop (con datos BLOB)
--laptops sin reemplazo
--@carga-inicial/laptop-1.sql
@carga-inicial/laptop-1.sql
--Algunas de estas laptops tienen reemplazo
--@carga-inicial/laptop-2.sql
@carga-inicial/laptop-2.sql
Prompt cargando laptop_inventario
@carga-inicial/laptop_inventario.sql
Prompt cargando historico_status_laptop
@carga-inicial/historico_status_laptop-1.sql
@carga-inicial/historico_status_laptop-2.sql
Prompt cargando servicio_laptop (con datos BLOB)
--@carga-inicial/servicio_laptop-1.sql
@carga-inicial/servicio_laptop-1.sql
--@carga-inicial/servicio_laptop-2.sql
@carga-inicial/servicio_laptop-2.sql
Prompt Carga de datos completa. Haciendo commit!
commit;
exit