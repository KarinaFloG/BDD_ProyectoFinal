--@Autor: Alejandro Herrera
--@Fecha creación: 09/01/2022
--@Descripción: Creación de vistas que no requieren manejo de BLOBs.
--sucursal
create or replace view sucursal as
select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f1
union all
select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f2
union all
select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f3
union all
select sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url from sucursal_f4;

--sucursal_taller
create or replace view sucursal_taller as
select q1.sucursal_id, q1.dia_descanso, q1.telefono_atencion from (
    select st1.sucursal_id, st1.dia_descanso, st1.telefono_atencion from sucursal_taller_f1 st1 where exists (
        select 1 from sucursal_f1 s1 where st1.sucursal_id = s1.sucursal_id ) 
    union all
    select st2.sucursal_id, st2.dia_descanso, st2.telefono_atencion from sucursal_taller_f2 st2 where exists (
        select 1 from sucursal_f2 s2 where st2.sucursal_id = s2.sucursal_id ) 
    union all
    select st3.sucursal_id, st3.dia_descanso, st3.telefono_atencion from sucursal_taller_f3 st3 where exists (
        select 1 from sucursal_f3 s3 where st3.sucursal_id = s3.sucursal_id ) 
    union all
    select st4.sucursal_id, st4.dia_descanso, st4.telefono_atencion from sucursal_taller_f4 st4 where exists (
        select 1 from sucursal_f4 s4 where st4.sucursal_id = s4.sucursal_id )     
) q1;

--sucursal venta
create or replace view sucursal_taller as
select q2.sucursal_id, q2.hora_apertura, q2.hora_cierre from (
    select sv1.sucursal_id, sv1.hora_apertura, sv1.hora_cierre from sucursal_venta_f1 sv1 where exists (
        select 1 from sucursal_f1 s1 where st1.sucursal_id = s1.sucursal_id ) 
    union all
    select sv2.sucursal_id, sv2.hora_apertura, sv2.hora_cierre from sucursal_venta_f2 sv2 where exists (
        select 1 from sucursal_f2 s2 where st2.sucursal_id = s2.sucursal_id ) 
    union all
    select sv3.sucursal_id, sv3.hora_apertura, sv3.hora_cierre from sucursal_venta_f3 sv3 where exists (
        select 1 from sucursal_f3 s3 where st3.sucursal_id = s3.sucursal_id ) 
    union all
    select sv4.sucursal_id, sv4.hora_apertura, sv4.hora_cierre from sucursal_venta_f4 sv4 where exists (
        select 1 from sucursal_f4 s4 where st4.sucursal_id = s4.sucursal_id )     
) q2;


--laptop
create or replace view laptop as
select q3.laptop_id, q3.num_serie, q3.cantidad_ram, q3.caracteristicas_extras, l1.foto, q3.tipo_tarjeta_video_id, q3.tipo_procesador_id, q3.tipo_almacenamiento_id,
q3.tipo_monitor_id, q3.laptop_remplazo_id from
 (
    select laptop_id, num_serie, cantidad_ram, caracteristicas_extras, foto, tipo_tarjeta_video_id, tipo_procesador_id, tipo_almacenamiento_id,
    tipo_monitor_id, laptop_remplazo_id from laptop_f2 
    union all
    select laptop_id, num_serie, cantidad_ram, caracteristicas_extras, foto, tipo_tarjeta_video_id, tipo_procesador_id, tipo_almacenamiento_id,
    tipo_monitor_id, laptop_remplazo_id from laptop_f3 
    union all
    select laptop_id, num_serie, cantidad_ram, caracteristicas_extras, foto, tipo_tarjeta_video_id, tipo_procesador_id, tipo_almacenamiento_id,
    tipo_monitor_id, laptop_remplazo_id from laptop_f4
    union all
    select laptop_id, num_serie, cantidad_ram, caracteristicas_extras, foto, tipo_tarjeta_video_id, tipo_procesador_id, tipo_almacenamiento_id,
    tipo_monitor_id, laptop_remplazo_id from laptop_f5 
) q3 
join laptop_f1 l1 on
l1.laptop_id = q3.laptop_id;

--laptop inventario
create or replace view laptop_inventario as
select li1.laptop_id, li2.fecha_status, li1.rfc_cliente, li1.num_tarjeta, li1.sucursal_id, li1.status_laptop_id 
from laptop_inventario_f1 li1 
join laptop_inventario_f2 li2 
on li1.laptop_id = li2.laptop_id;

--servicio laptop
create or replace view servicio_laptop
select q4.num_servicio, q4.laptop_id, q4.importe, q4.diagnostico, q4.factura, q4.sucursal_id from 
  (select num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id from servicio_laptop_f1 sl1 where exists(
      select 1 from sucursal_f1 s1 where s1.laptop_id = sl1.laptop_id )
  union all
    select num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id from servicio_laptop_f2 sl2 where exists(
      select 1 from sucursal_f2 s2 where s2.laptop_id = sl2.laptop_id )
  union all
    select num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id from servicio_laptop_f3 sl3 where exists(
      select 1 from sucursal_f3 s3 where s3.laptop_id = sl3.laptop_id )
  union all
    select num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id from servicio_laptop_f4 sl4 where exists(
      select 1 from sucursal_f4 s4 where s4.laptop_id = sl4.laptop_id )
  
) q4;

--Tipo monitor
create or replace view tipo_monitor as
select tipo_monitor_id,clave,descripcion
from tipo_monitor_r1;

--Tipo procesador
create or replace view tipo_procesador as 
select tipo_procesador_id, clave, descripcion
from tipo_procesador_r1;

--Tipo almacenamiento
create or replace view tipo_almacenamiento as
select tipo_almacenamiento_id, clave, descripcion
from tipo_almacenamiento_r1;

--Tipo tarjeta video
create or replace view tipo_tarjeta_video as
select tipo_tarjeta_video_id, clave, descripcion 
from tipo_tarjeta_video_r1;
  
  