--@Autor: Karina Flores García
--@Fecha creación: 08/01/2022 
--@Descripción: trigger para transparencia de instrucciones DML para tabla historico_status_laptop

create or replace trigger t_dml_historico_historico_status_laptop
    instead of insert or update or delete on historico_status_laptop   
declare
begin
case
    when inserting then
        if to_char(:new.fecha_status,'YYYY') <='2009' then
            insert into historico_status_laptop_f1(historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id)
            values(:new.historico_status_laptop_id,:new.fecha_status,:new.status_laptop_id,:new.laptop_id);
        else if to_char(:new.fecha_status,'YYYY') >'2009' then
            insert into hisotrico_status_laptop_f2(historico_status_laptop_id,fecha_status,status_laptop_id,laptop_id)
            values(:new.historico_status_laptop_id,:new.fecha_status,:new.status_laptop_id,:new.laptop_id);
        else
            raise_application_error(-20010,
                'Valor incorrecto para el campo clave y banderas : '
                || :new.fecha_status
                || ' La fecha no tiene un valor correcto');
        end if;
    when updating then
        raise_application_error(-20030,
            ' La operacione update aun no han sido implementadas ');
        end if;
    when deleting then
        if to_char(:new.fecha_status,'YYYY') <='2009' then
            delete from historico_status_laptop_f1 where historico_status_laptop_id = :old.historico_status_laptop_id;
        else if to_char(:new.fecha_status,'YYYY') >'2009' then
            delete from historico_status_laptop_f2 where historico_status_laptop_id = :old.historico_status_laptop_id;
        else
            raise_application_error(-20010,
                'Valor incorrecto para el campo clave y banderas : '
                || :old.fecha_status
                || ' La fecha no tiene un valor correcto');
        end if;
end case;
end;
/   