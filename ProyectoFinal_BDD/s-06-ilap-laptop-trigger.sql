--@Autor: Karina Flores García
--@Fecha creación: 08/01/2022 
--@Descripción: trigger para transparencia de instrucciones DML para tabla laptop

create or replace trigger t_dml_laptop
    instead of insert or update or delete on laptop   
declare
begin
case
    when inserting then
        if :new.num_serie between '0%' and '1%' then
            insert into laptop_f2(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,tipo_tarjeta_video_id,tipo_procesador_id,
                tipo_almacenamiento_id,tipo_monitor_id,laptop_reemplazo_id);
            values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,:new.tipo_tarjeta_video_id,
                :new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_reemplazo_id);
        elsif :new.num_serie between '2%' and '3%' then
            insert into laptop_f3(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,tipo_tarjeta_video_id,tipo_procesador_id,
                tipo_almacenamiento_id,tipo_monitor_id,laptop_reemplazo_id);
            values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,:new.tipo_tarjeta_video_id,
                :new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_reemplazo_id);
        elsif :new.num_serie between '4%' and '5%' then
            insert into laptop_f4(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,tipo_tarjeta_video_id,tipo_procesador_id,
                tipo_almacenamiento_id,tipo_monitor_id,laptop_reemplazo_id);
            values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,:new.tipo_tarjeta_video_id,
                :new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_reemplazo_id);
        elsif :new.num_serie between '6%' and '9%' then
            insert into laptop_f5(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,tipo_tarjeta_video_id,tipo_procesador_id,
                tipo_almacenamiento_id,tipo_monitor_id,laptop_reemplazo_id);
            values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,:new.tipo_tarjeta_video_id,
                :new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_reemplazo_id);
        else
            raise_application_error(-20010,
                'Valor incorrecto para el campo clave y banderas : '
                || :new.clave
                || ' Solo se permiten los valores NO,EA,WS y SO ');
        end if;

        --Insercion de blob
        insert into ti_laptop_1(laptop_id,foto,tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
            tipo_monitor_id,laptop_reemplazo_id)
        values(:new.laptop_id,:new.foto,:new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
            :new.tipo_monitor_id,:new.laptop_reemplazo_id);
        --inserta en el sitio remoto a través de la tabla temporal
        insert into laptop_f1
        select * from ti_laptop_1
        where laptop_id = :new.laptop_id;
        delete from ti_laptop_1
        where laptop_id = :new.laptop_id;
    when updating then
        raise_application_error(-20030,
            ' Las operaciones update aun no han sido implementadas ');
        end if;
    when deleting then
        if :new.num_serie between '0%' and '1%' then
            delete from laptop_1 where laptop_id = :old.laptop_id;
        elsif :new.num_serie between '2%' and '3%' then
            delete from laptop_2 where laptop_id = :old.laptop_id;
        elsif :new.num_serie between '4%' and '5%' then
            delete from laptop_3 where laptop_id = :old.laptop_id;
        elsif :new.num_serie between '6%' and '9%' then
            delete from laptop_4 where laptop_id = :old.laptop_id;
        else
            raise_application_error(-20010,
                'Valor incorrecto para el campo num_serie : '
                || :old.num_serie);
        end if;
end case;
end;
/   