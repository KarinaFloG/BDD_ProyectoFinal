--@Autor: Karina Flores García
--@Fecha creación: 08/01/2022 
--@Descripción: trigger para transparencia de instrucciones DML para tabla servicio_laptop

create or replace trigger t_dml_servicio_laptop
instead of insert or update or delete on servicio_laptop
declare
    v_count number;
begin
case
    when inserting then
        --verifica si hay correspondencia local para evitar acceso remoto
        select count(*) into v_count
        from sucursal_f1
        where sucursal_id = :new.sucursal_id;
        --insercion local
        if v_count > 0 then
            insert into servicio_laptop_f1(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
            values(:new.num_servicio,:new.laptop_id,:new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);
        --insercion remota
        else
            select count(*) into v_count
            from sucursal_f2
            where sucursal_id = :new.sucursal_id;
            if v_count > 0 then
                insert into ti_servicio_laptop_f2(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
                values(:new.num_servicio,:new.laptop_id,:new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);
                insert into servicio_laptop_f2
                select * from ti_servicio_laptop_f2
                where laptop_id = :new.laptop_id and num_servicio = :new.num_servicio;
                delete from ti_servicio_laptop_f2
                where laptop_id = :new.laptop_id and num_servicio = :new.num_servicio;
            else
                
                select count(*) into v_count
                from sucursal_f3
                where sucursal_id = :new.sucursal_id;
                if v_count > 0 then
                    insert into ti_servicio_laptop_f3(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
                    values(:new.num_servicio,:new.laptop_id,:new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);
                    insert into servicio_laptop_f3
                    select * from ti_servicio_laptop_f3
                    where laptop_id = :new.laptop_id and num_servicio = :new.num_servicio;
                    delete from ti_servicio_laptop_f3
                    where laptop_id = :new.laptop_id and num_servicio = :new.num_servicio;
                else
                    select count(*) into v_count
                    from sucursal_f4
                    where sucursal_id = :new.sucursal_id;
                    if v_count > 0 then
                        insert into ti_servicio_laptop_f4(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
                        values(:new.num_servicio,:new.laptop_id,:new.importe,:new.diagnostico,:new.factura,:new.sucursal_id);
                        insert into servicio_laptop_f4
                        select * from ti_servicio_laptop_f4
                        where laptop_id = :new.laptop_id and num_servicio = :new.num_servicio;
                        delete from ti_servicio_laptop_f4
                        where laptop_id = :new.laptop_id and num_servicio = :new.num_servicio;
                    else
                        raise_application_error(-20020,
                        'Error de integridad para el campo sucursal_id : '
                        || :new.sucursal_id
                        || ' No se encontró el registro padre en fragmentos');
                    end if;
                end if;
            end if;
        end if;
    when updating then
        raise_application_error(-20030,
            'La operacion update no ha sido implementada');
    when deleting then
        --verifica si hay correspondencia local para evitar acceso remoto
       
        select distinct count(sucursal_id) into v_count
        from sucursal_f1
        where sucursal_id = :old.sucursal_id;
        --insercion local
        if v_count > 0 then

            delete from servicio_laptop_f1_ahg_s1 where laptop_id = :old.laptop_id and num_servicio = :old.num_servicio;
        --insercion remota
        else
            select distinct count(sucursal_id) into v_count
            from sucursal_f2
            where sucursal_id = :old.sucursal_id;
            if v_count > 0 then
                
                delete from servicio_laptop_f2_ahg_s2@ahgbdd_s2 where laptop_id = :old.laptop_id and num_servicio = :old.num_servicio;
            else
                select distinct count(sucursal_id) into v_count
                from sucursal_f3
                where sucursal_id = :old.sucursal_id;
                if v_count > 0 then
                    delete from servicio_laptop_f3_kfg_s1@kfgbdd_s1 where laptop_id = :old.laptop_id and num_servicio = :old.num_servicio;
                else
                    select distinct count(sucursal_id) into v_count
                    from sucursal_f4
                    where sucursal_id = :old.sucursal_id;
                    if v_count > 0 then
                        delete from servicio_laptop_f4_kfg_s2@kfgbdd_s2 where laptop_id = :old.laptop_id and num_servicio = :old.num_servicio;
                    else
                        raise_application_error(-20020,
                        'Error de integridad para el campo sucursal_id : '
                        || :old.sucursal_id
                        || ' No se encontró el registro padre en fragmentos');
                    end if;
                end if;
            end if;
        end if;
end case;
end;
/   
show errors
