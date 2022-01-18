--@Autor: Alejandro Herrera
--@Fecha creación: 10/01/2022
--@Descripción: Definición de vistas con acceso a datos BLOB para el sitio ahgbdd_s2
create or replace view laptop as
    select q1.laptop_id,q1.num_serie,q1.cantidad_ram,q1.caracteristicas_extras,
    q1.tipo_tarjeta_video_id,q1.tipo_procesador_id,q1.tipo_almacenamiento_id,
    q1.tipo_monitor_id,q2.laptop_reemplazo_id,q2.foto
    from (
        select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
        tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
        tipo_monitor_id,laptop_reemplazo_id
        from laptop_f2
        union all
        select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
        tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
        tipo_monitor_id,laptop_reemplazo_id
        from laptop_f3
        union all
        select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
        tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
        tipo_monitor_id,laptop_reemplazo_id
        from laptop_f4
        union all
        select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
        tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
        tipo_monitor_id,laptop_reemplazo_id
        from laptop_f5
    ) q1
    join (
        select laptop_id,laptop_reemplazo_id,get_remote_foto_f1_by_id(laptop_id) as foto
        from laptop_f1
    )q2
    on q1.laptop_id=q2.laptop_id;



create or replace view servicio_laptop as
    select q1.num_servicio,q1.laptop_id,q1.importe,q1.diagnostico,q1.factura,q1.sucursal_id
    from(
        select num_servicio,laptop_id,importe,diagnostico,get_remote_serv_lap_f1_by_id(num_servicio,laptop_id) as factura,sucursal_id
        from servicio_laptop_f1
        union all
        select num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id
        from servicio_laptop_f2
        union all
        select num_servicio,laptop_id,importe,diagnostico,get_remote_serv_lap_f3_by_id(num_servicio,laptop_id) as factura,sucursal_id
        from servicio_laptop_f3
        union all
        select num_servicio,laptop_id,importe,diagnostico,get_remote_serv_lap_f4_by_id(num_servicio,laptop_id) as factura,sucursal_id
        from servicio_laptop_f4
    )q1;

