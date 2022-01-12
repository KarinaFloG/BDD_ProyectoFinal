--@Autor: Karina Flores García
--@Fecha creación: 08/01/2022 
--@Descripción: trigger para transparencia de instrucciones DML para tabla sucursal_venta

create or replace trigger t_dml_sucursal_venta
instead of insert or update or delete on sucursal_venta
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
            dbms_output.put_line('Insertando en el sitio 01');
            insert into sucursal_venta_f1(sucursal_id,hora_apertura,hora_cierre)
            values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
        --insercion remota
        else
            select count(*) into v_count
            from sucursal_f2
            where sucursal_id = :new.sucursal_id;
            if v_count > 0 then
                insert into sucursal_venta_f2(sucursal_id,hora_apertura,hora_cierre)
                values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
                else
                    select count(*) into v_count
                    from sucursal_f3
                    where sucursal_id = :new.sucursal_id;
                    if v_count > 0 then
                    insert into sucursal_venta_f3(sucursal_id,hora_apertura,hora_cierre)
                    values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
                    else
                        select count(*) into v_count
                        from sucursal_f4
                        where sucursal_id = :new.sucursal_id;
                        if v_count > 0 then
                            insert into sucursal_venta_f4(sucursal_id,hora_apertura,hora_cierre)
                            values(:new.sucursal_id,:new.hora_apertura,:new.hora_cierre);
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
        select count(*) into v_count
        from sucursal_f1
        where sucursal_id = :old.sucursal_id;
        --insercion local
        if v_count > 0 then
            dbms_output.put_line('Insertando en el sitio 01');
            delete from sucursal_venta_f1 where sucursal_id = :old.sucursal_id;
        --insercion remota
        else
            select count(*) into v_count
            from sucursal_f2
            where sucursal_id = :old.sucursal_id;
            if v_count > 0 then
                delete from sucursal_venta_f2 where sucursal_id = :old.sucursal_id;
            else
                select count(*) into v_count
                from sucursal_f3
                where sucursal_id = :old.sucursal_id;
                if v_count > 0 then
                    delete from sucursal_venta_f3 where sucursal_id = :old.sucursal_id;
                else
                    select count(*) into v_count
                    from sucursal_f4
                    where sucursal_id = :old.sucursal_id;
                    if v_count > 0 then
                        delete from sucursal_venta_f4 where sucursal_id = :old.sucursal_id;
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
