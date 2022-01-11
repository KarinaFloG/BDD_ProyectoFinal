--@Autor: Karina Flores García 
--@Autor: Alejandro Herrera Gandarela
--@Fecha creación: 23/12/2021
--@Descripción: DDL para sitio N4
prompt Creando tablas para el sitio N3 en KFGBDD_S2

create or replace procedure drop_table_if_exists(name in varchar2) is
	v_count number;
begin
	select count(*) 
	into v_count 
	from all_tables 
	where table_name = name;
	
	if (v_count > 0) then
       		execute immediate 'drop table ' || name || ' cascade constraints';
	end if;
end;
/

declare
	v_tipo_procesador_r_kfg_s2 varchar2(30)     := 'TIPO_PROCESADOR_R_KFG_S2';
	v_tipo_tarjeta_video_r_kfg_s2 varchar2(30)	:= 'TIPO_TARJETA_VIDEO_R_KFG_S2';
	v_tipo_almacenamiento_r_kfg_s2 varchar2(30) := 'TIPO_ALMACENAMIENTO_R_KFG_S2';
	v_tipo_monitor_r_kfg_s2 varchar2(30)	    := 'TIPO_MONITOR_R_KFG_S2';
	v_laptop_f1_kfg_s2 varchar2(30) 	        := 'LAPTOP_F1_KFG_S2';
    v_laptop_f3_kfg_s2 varchar2(30) 	        := 'LAPTOP_F3_KFG_S2';
    v_sucursal_f4_kfg_s2 varchar2(30) 	        := 'SUCURSAL_F4_KFG_S2';
	v_status_laptop varchar2(30) 	            := 'STATUS_LAPTOP';
	v_sucursal_taller_f4_kfg_s2 varchar2(30) 	:= 'SUCURSAL_TALLER_F4_KFG_S2';
    v_sucursal_venta_f4_kfg_s2 varchar2(30) 	:= 'SUCURSAL_VENTA_F4_KFG_S2';
    v_servicio_laptop_f4_kfg_s2 varchar2(30) 	:= 'SERVICIO_LAPTOP_F4_KFG_S2';
begin
	drop_table_if_exists(v_tipo_procesador_r_kfg_s2);
	drop_table_if_exists(v_tipo_tarjeta_video_r_kfg_s2);
	drop_table_if_exists(v_tipo_almacenamiento_r_kfg_s2);
	drop_table_if_exists(v_tipo_monitor_r_kfg_s2);
	drop_table_if_exists(v_laptop_f1_kfg_s2);
	drop_table_if_exists(v_laptop_f3_kfg_s2);
	drop_table_if_exists(v_sucursal_f4_kfg_s2);
	drop_table_if_exists(v_status_laptop);
    drop_table_if_exists(v_sucursal_taller_f4_kfg_s2);
    drop_table_if_exists(v_sucursal_venta_f4_kfg_s2);
    drop_table_if_exists(v_servicio_laptop_f4_kfg_s2);
end;
/

create or replace procedure drop_index_if_exists(name in varchar2) is
	v_count number;
begin
	select count(*) 
	into v_count 
	from user_indexes
	where index_name = name;
	
	if (v_count > 0) then
       		execute immediate 'drop index ' || name;
	end if;
end;
/
show errors;

declare
    v_laptop_proc_f1_ix varchar2(30) := 'LAPTOP_PROC_F1_IX';
    v_laptop_tarjeta_f1_ix varchar2(30) := 'LAPTOP_TARJETA_F1_IX';
    v_laptop_almacenamiento_f1_ix varchar2(30) := 'LAPTOP_ALMACENAMIENTO_F1_IX';
    v_laptop_monitor_f1_ix varchar2(30) := 'LAPTOP_MONITOR_F1_IX';
    v_laptop_proc_f3_ix varchar2(30) := 'LAPTOP_PROC_F3_IX';
    v_laptop_tarjeta_f3_ix varchar2(30) := 'LAPTOP_TARJETA_F3_IX';
    v_laptop_almacenamiento_f3_ix varchar2(30) := 'LAPTOP_ALMACENAMIENTO_F3_IX';
    v_laptop_monitor_f3_ix varchar2(30) := 'LAPTOP_MONITOR_F3_IX';
    v_servicio_lap_suc_f4_ix varchar2(30) := 'SERVICIO_LAP_SUC_F4_IX';
    v_sucursal_taller_suc_f4_ix varchar(30) := 'SUCURSAL_TALLER_SUC_F4_IX';
    v_sucursal_venta_suc_f4_ix varchar2(30) := 'SUCURSAL_VENTA_SUC_F4_IX';

begin
	drop_index_if_exists(v_laptop_proc_f1_ix);
    drop_index_if_exists(v_laptop_tarjeta_f1_ix);
    drop_index_if_exists(v_laptop_almacenamiento_f1_ix);
    drop_index_if_exists(v_laptop_monitor_f1_ix);
    drop_index_if_exists(v_laptop_proc_f3_ix);
    drop_index_if_exists(v_laptop_tarjeta_f3_ix);
    drop_index_if_exists(v_laptop_almacenamiento_f3_ix);
    drop_index_if_exists(v_laptop_monitor_f3_ix);
    drop_index_if_exists(v_servicio_lap_suc_f4_ix);
    drop_index_if_exists(v_sucursal_taller_suc_f4_ix);
    drop_index_if_exists(v_sucursal_venta_suc_f4_ix);

end;
/

--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      KAR
-- Project :      Nodo4.DM1
-- Author :       KAR
--
-- Date Created : Sunday, January 09, 2022 19:47:19
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: TIPO_PROCESADOR_R_KFG_S2 
--


CREATE TABLE TIPO_PROCESADOR_R_KFG_S2(
    TIPO_PROCESADOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_PROCESADOR_R_KFG_S2_PK PRIMARY KEY (TIPO_PROCESADOR_ID)
)
;



-- 
-- TABLE: TIPO_TARJETA_VIDEO_R_KFG_S2 
--

CREATE TABLE TIPO_TARJETA_VIDEO_R_KFG_S2(
    TIPO_TARJETA_VIDEO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                    VARCHAR2(40)     NOT NULL,
    DESCRIPCION              VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_TARJETA_VIDEO_R_KFG_S2_PK PRIMARY KEY (TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: TIPO_MONITOR_R_KFG_S2 
--

CREATE TABLE TIPO_MONITOR_R_KFG_S2(
    TIPO_MONITOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_MONITOR_R_KFG_S2_PK PRIMARY KEY (TIPO_MONITOR_ID)
)
;



-- 
-- TABLE: TIPO_ALMACENAMIENTO_R_KFG_S2 
--

CREATE TABLE TIPO_ALMACENAMIENTO_R_KFG_S2(
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                     VARCHAR2(40)     NOT NULL,
    DESCRIPCION               VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_ALMACENAMIENTO_R_KFG_S2_PK PRIMARY KEY (TIPO_ALMACENAMIENTO_ID)
)
;



-- 
-- TABLE: LAPTOP_F1_KFG_S2 
--

CREATE TABLE LAPTOP_F1_KFG_S2(
    LAPTOP_ID                 NUMBER(10, 0)    NOT NULL,
    LAPTOP_REEMPLAZO_ID       NUMBER(10, 0)    NOT NULL,
    FOTO                      BLOB             NOT NULL,
    TIPO_PROCESADOR_ID        NUMBER(5, 0)     NOT NULL,
    TIPO_TARJETA_VIDEO_ID     NUMBER(5, 0)     NOT NULL,
    TIPO_MONITOR_ID           NUMBER(5, 0)     NOT NULL,
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)     NOT NULL,
    CONSTRAINT LAPTOP_F1_KFG_S2_PK PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT laptop_f1_proc_FK FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR_R_KFG_S2(TIPO_PROCESADOR_ID) ON DELETE cascade,
    CONSTRAINT laptop_f1_tarj_vid_fk FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO_R_KFG_S2(TIPO_TARJETA_VIDEO_ID) ON DELETE cascade,
    CONSTRAINT laptop_f1_moni_FK FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR_R_KFG_S2(TIPO_MONITOR_ID) ON DELETE cascade,
    CONSTRAINT laptop_f1_alma_FK FOREIGN KEY (TIPO_ALMACENAMIENTO_ID)
    REFERENCES TIPO_ALMACENAMIENTO_R_KFG_S2(TIPO_ALMACENAMIENTO_ID) ON DELETE cascade
)
;



-- 
-- TABLE: LAPTOP_F3_KFG_S2 
--

CREATE TABLE LAPTOP_F3_KFG_S2(
    LAPTOP_ID                 NUMBER(10, 0)     NOT NULL,
    LAPTOP_REEMPLAZO_ID       NUMBER(10, 0),
    NUM_SERIE                 VARCHAR2(18)      NOT NULL,
    CANTIDAD_RAM              NUMBER(6, 0)      NOT NULL,
    CARACTERISTICAS_EXTRAS    VARCHAR2(2000)    NOT NULL,
    TIPO_PROCESADOR_ID        NUMBER(5, 0)      NOT NULL,
    TIPO_TARJETA_VIDEO_ID     NUMBER(5, 0)      NOT NULL,
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)      NOT NULL,
    TIPO_MONITOR_ID           NUMBER(5, 0)      NOT NULL,
    CONSTRAINT LAPTOP_F3_KFG_S2_PK PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT laptop_f3_proc_FK FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR_R_KFG_S2(TIPO_PROCESADOR_ID) ON DELETE cascade,
    CONSTRAINT laptop_f3_tarj_vid_fk FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO_R_KFG_S2(TIPO_TARJETA_VIDEO_ID) ON DELETE cascade,
    CONSTRAINT laptop_f3_alma_FK FOREIGN KEY (TIPO_ALMACENAMIENTO_ID)
    REFERENCES TIPO_ALMACENAMIENTO_R_KFG_S2(TIPO_ALMACENAMIENTO_ID) ON DELETE cascade,
    CONSTRAINT laptop_f4_moni_FK FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR_R_KFG_S2(TIPO_MONITOR_ID) ON DELETE cascade
)
;



-- 
-- TABLE: SUCURSAL_F4_KFG_S2 
--

CREATE TABLE SUCURSAL_F4_KFG_S2(
    SUCURSAL_ID    NUMBER(10, 0)     NOT NULL,
    CLAVE          VARCHAR2(10)      NOT NULL,
    ES_TALLER      NUMBER(1, 0)      NOT NULL,
    ES_VENTA       NUMBER(1, 0)      NOT NULL,
    NOMBRE         VARCHAR2(40)      NOT NULL,
    LATITUD        BINARY_FLOAT      NOT NULL,
    LONGITUD       BINARY_FLOAT      NOT NULL,
    URL            VARCHAR2(2000)    NOT NULL,
    CONSTRAINT SUCURSAL_F4_KFG_S2_PK PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_TALLER_F4_KFG_S2 
--

CREATE TABLE SUCURSAL_TALLER_F4_KFG_S2(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    DIA_DESCANSO         NUMBER(1, 0)     NOT NULL,
    TELEFONO_ATENCION    VARCHAR2(20)     NOT NULL,
    CONSTRAINT SUCURSAL_TALLER_F4_KFG_S2_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT suc_taller_f4_suc_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F4_KFG_S2(SUCURSAL_ID) ON DELETE cascade
)
;



-- 
-- TABLE: SERVICIO_LAPTOP_F4_KFG_S2 
--

CREATE TABLE SERVICIO_LAPTOP_F4_KFG_S2(
    NUM_SERVICIO    NUMBER(10, 0)     NOT NULL,
    LAPTOP_ID       NUMBER(10, 0)     NOT NULL,
    IMPORTE         NUMBER(8, 2)      NOT NULL,
    DIAGNOSTICO     VARCHAR2(2000)    NOT NULL,
    FACTURA         BLOB,
    SUCURSAL_ID     NUMBER(10, 0)     NOT NULL,
    CONSTRAINT SERVICIO_LAPTOP_F4_KFG_S2_PK PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID), 
    CONSTRAINT Servicio_lap_f4_suc_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_TALLER_F4_KFG_S2(SUCURSAL_ID) ON DELETE cascade,
    CONSTRAINT Servicio_lap_F4_lap_S2_FK FOREIGN KEY (LAPTOP_ID)
    REFERENCES LAPTOP_F1_KFG_S2(LAPTOP_ID) ON DELETE cascade
)
;



-- 
-- TABLE: STATUS_LAPTOP 
--

CREATE TABLE STATUS_LAPTOP(
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE               VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(400)    NOT NULL,
    CONSTRAINT STATUS_LAPTOP_PK PRIMARY KEY (STATUS_LAPTOP_ID)
)
;



-- 
-- TABLE: SUCURSAL_VENTA_F4_KFG_S2 
--

CREATE TABLE SUCURSAL_VENTA_F4_KFG_S2(
    SUCURSAL_ID      NUMBER(10, 0)    NOT NULL,
    HORA_APERTURA    DATE             NOT NULL,
    HORA_CIERRE      DATE             NOT NULL,
    CONSTRAINT SUCURSAL_VENTA_F4_KFG_S2_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT sucursal_venta_suc_f4_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F4_KFG_S2(SUCURSAL_ID) ON DELETE cascade
)
;



-- 
-- INDEX: Ref613 
--

CREATE INDEX laptop_proc_f1_ix ON LAPTOP_F1_KFG_S2(TIPO_PROCESADOR_ID)
;
-- 
-- INDEX: Ref714 
--

CREATE INDEX laptop_tarjeta_f1_ix ON LAPTOP_F1_KFG_S2(TIPO_TARJETA_VIDEO_ID)
;
-- 
-- INDEX: Ref915 
--

CREATE INDEX laptop_monitor_f1_ix ON LAPTOP_F1_KFG_S2(TIPO_MONITOR_ID)
;
-- 
-- INDEX: Ref816 
--

CREATE INDEX laptop_almacenamiento_f1_ix ON LAPTOP_F1_KFG_S2(TIPO_ALMACENAMIENTO_ID)
;
-- 
-- INDEX: Ref617 
--

CREATE INDEX laptop_proc_f3_ix ON LAPTOP_F3_KFG_S2(TIPO_PROCESADOR_ID)
;
-- 
-- INDEX: Ref718 
--

CREATE INDEX laptop_tarjeta_f3_ix ON LAPTOP_F3_KFG_S2(TIPO_TARJETA_VIDEO_ID)
;
-- 
-- INDEX: Ref819 
--

CREATE INDEX laptop_almacenamiento_f3_ix ON LAPTOP_F3_KFG_S2(TIPO_ALMACENAMIENTO_ID)
;
-- 
-- INDEX: Ref920 
--

CREATE INDEX laptop_monitor_f3_ix ON LAPTOP_F3_KFG_S2(TIPO_MONITOR_ID)
;
-- 
-- INDEX: Ref212 
--

CREATE INDEX servicio_lap_suc_f4_ix ON SERVICIO_LAPTOP_F4_KFG_S2(SUCURSAL_ID)
;
-- 
-- INDEX: Ref11 
--

CREATE INDEX sucursal_taller_suc_f4_ix ON SUCURSAL_TALLER_F4_KFG_S2(SUCURSAL_ID)
;
-- 
-- INDEX: Ref12 
--

CREATE INDEX sucursal_venta_suc_f4_ix ON SUCURSAL_VENTA_F4_KFG_S2(SUCURSAL_ID)
;
