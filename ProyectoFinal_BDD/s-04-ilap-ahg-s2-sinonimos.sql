--@Autor: Karina Flores García
--@Fecha creación: 21/12/2021
--@Descripción: Creación de sinónimos en los 4 nodos.

Prompt - - - - - - - - - - - - - - - - - - - - 
Prompt Conectandose a ahgbdd_s2
connect ilap_bdd/ilap_bdd@ahgbdd_s2
Prompt Creacion de sinonimos en ahgbdd_s2
Prompt - - - - - - - - - - - - - - - - - - - - 
--sucursal
create or replace synonym sucursal_f1 for sucursal_f1_ahg_s1@ahgbdd_s1;
create or replace synonym sucursal_f2 for sucursal_f2_ahg_s2@ahgbdd_s2; 
create or replace synonym sucursal_f3 for sucursal_f3_kfg_s1@kfgbdd_s1;
create or replace synonym sucursal_f4 for sucursal_f4_kfg_s2@kfgbdd_s2;
--sucursal taller
create or replace synonym sucursal_taller_f1 for sucursal_taller_f1_ahg_s1@ahgbdd_s1;
create or replace synonym sucursal_taller_f2 for sucursal_taller_f2_ahg_s2; 
create or replace synonym sucursal_taller_f3 for sucursal_taller_f3_kfg_s1@kfgbdd_s1;
create or replace synonym sucursal_taller_f4 for sucursal_taller_f4_kfg_s2@kfgbdd_s2;
--sucursal venta
create or replace synonym sucursal_venta_f1 for sucursal_venta_f1_ahg_s1@ahgbdd_s1;
create or replace synonym sucursal_venta_f2 for sucursal_venta_f2_ahg_s2; 
create or replace synonym sucursal_venta_f3 for sucursal_venta_f3_kfg_s1@kfgbdd_s1;
create or replace synonym sucursal_venta_f4 for sucursal_venta_f4_kfg_s2@kfgbdd_s2;
--servicio laptop
create or replace synonym servicio_laptop_f1 for servicio_laptop_f1_ahg_s1@ahgbdd_s1;
create or replace synonym servicio_laptop_f2 for servicio_laptop_f2_ahg_s2; 
create or replace synonym servicio_laptop_f3 for servicio_laptop_f3_kfg_s1@kfgbdd_s1;
create or replace synonym servicio_laptop_f4 for servicio_laptop_f4_kfg_s2@kfgbdd_s2;
--historico status
create or replace synonym historico_status_laptop_f1 for historico_status_laptop_f1_ahg_s2;
create or replace synonym historico_status_laptop_f2 for historico_status_laptop_f2_ahg_s1@ahgbdd_s1;
--laptop inventario
--laptop inventario
create or replace synonym laptop_inventario_f1 for laptop_inventario_f1_kfg_s1@kfgbdd_s1;
create or replace synonym laptop_inventario_f2 for laptop_inventario_f2_ahg_s1@ahgbdd_s1;
--laptop
create or replace synonym laptop_f1 for laptop_f1_kfg_s2@kfgbdd_s2;
create or replace synonym laptop_f2 for laptop_f2_ahg_s1@ahgbdd_s1;
create or replace synonym laptop_f3 for laptop_f3_kfg_s2@kfgbdd_s2;
create or replace synonym laptop_f4 for laptop_f4_kfg_s1@kfgbdd_s1;
create or replace synonym laptop_f5 for laptop_f5_ahg_s2;
--tipo monitor
create or replace synonym tipo_monitor_r1 for tipo_monitor_r_ahg_s2; 
create or replace synonym tipo_monitor_r2 for tipo_monitor_r_ahg_s1@ahgbdd_s1;
create or replace synonym tipo_monitor_r3 for tipo_monitor_r_kfg_s1@kfgbdd_s1;
create or replace synonym tipo_monitor_r4 for tipo_monitor_r_kfg_s2@kfgbdd_s2;
--tipo almacenamiento
create or replace synonym tipo_almacenamiento_r1 for tipo_almacenamiento_r_ahg_s2; 
create or replace synonym tipo_almacenamiento_r2 for tipo_almacenamiento_r_ahg_s1@ahgbdd_s1;
create or replace synonym tipo_almacenamiento_r3 for tipo_almacenamiento_r_kfg_s1@kfgbdd_s1;
create or replace synonym tipo_almacenamiento_r4 for tipo_almacenamiento_r_kfg_s2@kfgbdd_s2;
--tipo tarjeta video
create or replace synonym tipo_tarjeta_video_r1 for tipo_tarjeta_video_r_ahg_s2; 
create or replace synonym tipo_tarjeta_video_r2 for tipo_tarjeta_video_r_ahg_s1@ahgbdd_s1;
create or replace synonym tipo_tarjeta_video_r3 for tipo_tarjeta_video_r_kfg_s1@kfgbdd_s1;
create or replace synonym tipo_tarjeta_video_r4 for tipo_tarjeta_video_r_kfg_s2@kfgbdd_s2;
--tipo procesador
create or replace synonym tipo_procesador_r1 for tipo_procesador_r_ahg_s2; 
create or replace synonym tipo_procesador_r2 for tipo_procesador_r_ahg_s1@ahgbdd_s1;
create or replace synonym tipo_procesador_r3 for tipo_procesador_r_kfg_s1@kfgbdd_s1;
create or replace synonym tipo_procesador_r4 for tipo_procesador_r_kfg_s2@kfgbdd_s2;


