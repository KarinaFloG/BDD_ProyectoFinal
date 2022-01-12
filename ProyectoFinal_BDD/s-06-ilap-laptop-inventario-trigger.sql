--@Autor: Karina Flores García
--@Fecha creación: 08/01/2022 
--@Descripción: trigger para transparencia de instrucciones DML para tabla laptop_inventario

create or replace trigger t_dml_laptop_inventario
instead of insert or update or delete on laptop_inventario
declare
    v_count number;
begin
    case
        when inserting then
            --Fragmento vertical
            insert into laptop_inventario_f1(laptop_id,rfc_cliente,num_tarjeta,sucursal_id,status_laptop_id)
            values(:new.laptop_id,:new.rfc_cliente,:new.num_tarjeta,:new.sucursal_id,:new.status_laptop_id);
            
            insert into laptop_inventario_f2(laptop_id,fecha_status,sucursal_id,status_laptop_id)
            values(:new.laptop_id,:new.fecha_status,:new.sucursal_id,:new.status_laptop_id);
        when updating then
            raise_application_error(-20030,
                ' La operacion update no ha sido implementada');

        when deleting then
            delete from laptop_inventario_f1 where laptop_id = :old.laptop_id;  
            delete from laptop_inventario_f2 where laptop_id = :old.laptop_id;  
            
            
    end case;
end;
/
show errors