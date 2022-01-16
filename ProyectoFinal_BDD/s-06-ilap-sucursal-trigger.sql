--@Autor: Karina Flores García
--@Fecha creación: 08/01/2022 
--@Descripción: trigger para transparencia de instrucciones DML para tabla sucursal

create or replace trigger t_dml_sucursal
    instead of insert or update or delete on sucursal   
declare
begin
case
    when inserting then
        if substr(:new.clave,3,2) like 'NO' or (:new.es_taller=1 and :new.es_venta=1) then
            insert into sucursal_f1(sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
            values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);
        elsif substr(:new.clave,3,2) like 'EA' and (:new.es_taller=1 or :new.es_venta=1) then
            insert into sucursal_f2(sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
            values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);
        elsif substr(:new.clave,3,2) like 'WS' and (:new.es_taller=1 or :new.es_venta=1) then
            insert into sucursal_f3(sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
            values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);
        elsif substr(:new.clave,3,2) like 'SO' and (:new.es_taller=1 or :new.es_venta=1) then
            insert into sucursal_f4(sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
            values(:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);
        else
            raise_application_error(-20010,
                'Valor incorrecto para el campo clave y banderas : '
                || :new.clave
                || ' Solo se permiten los valores NO,EA,WS y SO ');
        end if;
    when updating then
        raise_application_error(-20030,
            ' Las operaciones update aun no han sido implementadas ');
    when deleting then
        if substr(:old.clave,3,2) like 'NO' or (:old.es_taller=1 and :old.es_venta=1) then
            delete from sucursal_f1 where sucursal_id = :old.sucursal_id;
        elsif substr(:old.clave,3,2) like 'EA' and (:old.es_taller=1 or :old.es_venta=1) then
            delete from sucursal_f2 where sucursal_id = :old.sucursal_id;
        elsif substr(:old.clave,3,2) like 'WS' and (:old.es_taller=1 or :old.es_venta=1) then
            delete from sucursal_f3 where sucursal_id = :old.sucursal_id;
        elsif substr(:old.clave,3,2) like 'SO' and (:old.es_taller=1 or :old.es_venta=1) then
            delete from sucursal_f4 where sucursal_id = :old.sucursal_id;
        else
            raise_application_error(-20010,
                'Valor incorrecto para el campo clave y banderas : '
                || :old.clave
                || ' Solo se permiten los valores NO,EA,WS y SO ');
        end if;
end case;
end;
/   
show errors