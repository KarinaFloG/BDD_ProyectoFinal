--@Autor: Karina Flores García 
--@Autor: Alejandro Herrera Gandarela
--@Fecha creación: 23/12/2021
--@Descripción: DDL para sitio N2
prompt Creando tablas para el sitio N3 en AHGBDD_S2

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
    v_historico_status_laptop_f1_ahg_s2 varchar2(40)        := 'HISTORICO_STATUS_LAPTOP_F1_AHG_S2';
    v_status_laptop varchar2(30) 	            := 'STATUS_LAPTOP';
    v_tipo_procesador_r_ahg_s2 varchar2(30)     := 'TIPO_PROCESADOR_R_AHG_S2';
	v_tipo_tarjeta_video_r_ahg_s2 varchar2(30)	:= 'TIPO_TARJETA_VIDEO_R_AHG_S2';
	v_tipo_almacenamiento_r_ahg_s2 varchar2(30) := 'TIPO_ALMACENAMIENTO_R_AHG_S2';
	v_tipo_monitor_r_ahg_s2 varchar2(30)	    := 'TIPO_MONITOR_R_AHG_S2';
	v_laptop_f5_ahg_s2 varchar2(30) 	        := 'LAPTOP_F5_AHG_S2';
    v_sucursal_f2_ahg_s2 varchar2(30) 	        := 'SUCURSAL_F2_AHG_S2';
	v_sucursal_taller_f2_ahg_s2 varchar2(30) 	:= 'SUCURSAL_TALLER_F2_AHG_S2';
    v_sucursal_venta_f2_ahg_s2 varchar2(30) 	:= 'SUCURSAL_VENTA_F2_AHG_S2';
    v_servicio_laptop_f2_ahg_s2 varchar2(30) 	:= 'SERVICIO_LAPTOP_F2_AHG_S2';
begin
	drop_table_if_exists(v_historico_status_laptop_f1_ahg_s2);
	drop_table_if_exists(v_status_laptop);
	drop_table_if_exists(v_tipo_procesador_r_ahg_s2);
	drop_table_if_exists(v_tipo_tarjeta_video_r_ahg_s2);
	drop_table_if_exists(v_tipo_almacenamiento_r_ahg_s2);
	drop_table_if_exists(v_tipo_monitor_r_ahg_s2);
	drop_table_if_exists(v_laptop_f5_ahg_s2);
	drop_table_if_exists(v_sucursal_f2_ahg_s2);
    drop_table_if_exists(v_sucursal_taller_f2_ahg_s2);
    drop_table_if_exists(v_sucursal_venta_f2_ahg_s2);
    drop_table_if_exists(v_servicio_laptop_f2_ahg_s2);
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
       		execute immediate 'drop index ' || name ||;
	end if;
end;
/
show errors;

declare
    v_historico_status_f1_ix varchar2(30) := 'HISTORICO_STATUS_F1_IX';
    v_laptop_proc_f5_ix varchar2(30) := 'LAPTOP_PROC_F5_IX';
    v_laptop_tarjeta_f5_ix varchar2(30) := 'LAPTOP_TARJETA_F5_IX';
    v_laptop_almacenamiento_f5_ix varchar2(30) := 'LAPTOP_ALMACENAMIENTO_F5_IX';
    v_laptop_monitor_f5_ix varchar2(30) := 'LAPTOP_MONITOR_F5_IX';
    v_servicio_lap_suc_f2_ix varchar2(30) := 'SERVICIO_LAP_SUC_F2_IX';
    v_sucursal_taller_suc_f2_ix varchar(30) := 'SUCURSAL_TALLER_SUC_F2_IX';
    v_sucursal_venta_suc_f2_ix varchar2(30) := 'SUCURSAL_VENTA_SUC_F2_IX';

begin
	drop_index_if_exists(v_historico_status_f1_ix);
    drop_index_if_exists(v_laptop_proc_f5_ix);
    drop_index_if_exists(v_laptop_tarjeta_f5_ix);
    drop_index_if_exists(v_laptop_almacenamiento_f5_ix);
    drop_index_if_exists(v_laptop_monitor_f5_ix);
    drop_index_if_exists(v_servicio_lap_suc_f2_ix);
    drop_index_if_exists(v_sucursal_taller_suc_f2_ix);
    drop_index_if_exists(v_sucursal_venta_suc_f2_ix);

end;
/

--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      KAR
-- Project :      Nodo2.DM1
-- Author :       KAR
--
-- Date Created : Sunday, January 09, 2022 01:30:41
-- Target DBMS : Oracle 11g
--

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
-- TABLE: HISTORICO_STATUS_LAPTOP_F1_AHG_S2 
--

CREATE TABLE HISTORICO_STATUS_LAPTOP_F1_AHG_S2(
    HISTORICO_STATUS_LAPTOP_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                  TIMESTAMP(6)     NOT NULL,
    LAPTOP_ID                     NUMBER(10, 0),
    STATUS_LAPTOP_ID              NUMBER(5, 0)     NOT NULL,
    CONSTRAINT HISTORICO_STATUS_LAPTOP_F1_AHG_S2_PK PRIMARY KEY (HISTORICO_STATUS_LAPTOP_ID), 
    CONSTRAINT HIST_STAT_S2_LAP_ID_FK FOREIGN KEY (STATUS_LAPTOP_ID)
    REFERENCES STATUS_LAPTOP(STATUS_LAPTOP_ID) ON DELETE cascade
)
;



-- 
-- TABLE: TIPO_PROCESADOR_R_AHG_S2 
--

CREATE TABLE TIPO_PROCESADOR_R_AHG_S2(
    TIPO_PROCESADOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_PROCESADOR_R_AHG_S2_PK PRIMARY KEY (TIPO_PROCESADOR_ID)
)
;



-- 
-- TABLE: TIPO_TARJETA_VIDEO_R_AHG_S2 
--

CREATE TABLE TIPO_TARJETA_VIDEO_R_AHG_S2(
    TIPO_TARJETA_VIDEO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                    VARCHAR2(40)     NOT NULL,
    DESCRIPCION              VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_TARJETA_VIDEO_R_AHG_S2_PK PRIMARY KEY (TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: TIPO_ALMACENAMIENTO_R_AHG_S2 
--

CREATE TABLE TIPO_ALMACENAMIENTO_R_AHG_S2(
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                     VARCHAR2(40)     NOT NULL,
    DESCRIPCION               VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_ALMACENAMIENTO_R_AHG_S2_PK PRIMARY KEY (TIPO_ALMACENAMIENTO_ID)
)
;



-- 
-- TABLE: TIPO_MONITOR_R_AHG_S2 
--

CREATE TABLE TIPO_MONITOR_R_AHG_S2(
    TIPO_MONITOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_MONITOR_R_AHG_S2_PK PRIMARY KEY (TIPO_MONITOR_ID)
)
;



-- 
-- TABLE: LAPTOP_F5_AHG_S2 
--

CREATE TABLE LAPTOP_F5_AHG_S2(
    LAPTOP_ID                 NUMBER(10, 0)     NOT NULL,
    LAPTOP_REEMPLAZO_ID       NUMBER(10, 0),
    NUM_SERIE                 VARCHAR2(18)      NOT NULL,
    CANTIDAD_RAM              NUMBER(6, 0)      NOT NULL,
    CARACTERISTICAS_EXTRAS    VARCHAR2(2000)    NOT NULL,
    TIPO_PROCESADOR_ID        NUMBER(5, 0)      NOT NULL,
    TIPO_TARJETA_VIDEO_ID     NUMBER(5, 0)      NOT NULL,
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)      NOT NULL,
    TIPO_MONITOR_ID           NUMBER(5, 0)      NOT NULL,
    CONSTRAINT LAPTOP_F5_AHG_S2_PK PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT laptop_s2_proc_FK FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR_R_AHG_S2(TIPO_PROCESADOR_ID) ON DELETE cascade,
    CONSTRAINT laptop_S2_tarj_vid_fk FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO_R_AHG_S2(TIPO_TARJETA_VIDEO_ID) ON DELETE cascade,
    CONSTRAINT laptop_s2_alma_FK FOREIGN KEY (TIPO_ALMACENAMIENTO_ID)
    REFERENCES TIPO_ALMACENAMIENTO_R_AHG_S2(TIPO_ALMACENAMIENTO_ID) ON DELETE cascade,
    CONSTRAINT laptop_S2_moni_FK FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR_R_AHG_S2(TIPO_MONITOR_ID) ON DELETE cascade
)
;



-- 
-- TABLE: SUCURSAL_F2_AHG_S2 
--

CREATE TABLE SUCURSAL_F2_AHG_S2(
    SUCURSAL_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(10)     NOT NULL,
    ES_TALLER      NUMBER(1, 0)     NOT NULL,
    ES_VENTA       NUMBER(1, 0)     NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    LATITUD        BINARY_FLOAT     NOT NULL,
    LONGITUD       BINARY_FLOAT     NOT NULL,
    URL            VARCHAR2(200)    NOT NULL,
    CONSTRAINT SUCURSAL_F2_AHG_S2_PK PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_TALLER_F2_AHG_S2 
--

CREATE TABLE SUCURSAL_TALLER_F2_AHG_S2(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    DIA_DESCANSO         NUMBER(1, 0)     NOT NULL,
    TELEFONO_ATENCION    VARCHAR2(20)     NOT NULL,
    CONSTRAINT SUCURSAL_TALLER_F2_AHG_S2_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT suc_taller_S2_suc_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F2_AHG_S2(SUCURSAL_ID) ON DELETE cascade
)
;



-- 
-- TABLE: SERVICIO_LAPTOP_F2_AHG_S2 
--

CREATE TABLE SERVICIO_LAPTOP_F2_AHG_S2(
    NUM_SERVICIO    NUMBER(10, 0)     NOT NULL,
    LAPTOP_ID       NUMBER(10, 0)     NOT NULL,
    IMPORTE         NUMBER(8, 2)      NOT NULL,
    DIAGNOSTICO     VARCHAR2(2000)    NOT NULL,
    FACTURA         BLOB,
    SUCURSAL_ID     NUMBER(10, 0)     NOT NULL,
    CONSTRAINT SERVICIO_LAPTOP_F2_AHG_S2_PK PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID), 
    CONSTRAINT Servicio_lap_f2_suc_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_TALLER_F2_AHG_S2(SUCURSAL_ID) ON DELETE cascade
)
;



-- 
-- TABLE: SUCURSAL_VENTA_F2_AHG_S2 
--

CREATE TABLE SUCURSAL_VENTA_F2_AHG_S2(
    SUCURSAL_ID      NUMBER(10, 0)    NOT NULL,
    HORA_APERTURA    DATE             NOT NULL,
    HORA_CIERRE      DATE             NOT NULL,
    CONSTRAINT SUCURSAL_VENTA_F2_AHG_S2_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT sucursal_venta_suc_f2_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F2_AHG_S2(SUCURSAL_ID) ON DELETE cascade
)
;



-- 
-- INDEX: Ref108 
--

CREATE OR REPLACE INDEX historico_status_f1_ix ON HISTORICO_STATUS_LAPTOP_F1_AHG_S2(STATUS_LAPTOP_ID)
;
-- 
-- INDEX: Ref53 
--

CREATE OR REPLACE INDEX laptop_proc_f5_ix ON LAPTOP_F5_AHG_S2(TIPO_PROCESADOR_ID)
;
-- 
-- INDEX: Ref64 
--

CREATE OR REPLACE INDEX laptop_tarjeta_f5_ix ON LAPTOP_F5_AHG_S2(TIPO_TARJETA_VIDEO_ID)
;
-- 
-- INDEX: Ref75 
--

CREATE OR REPLACE INDEX laptop_almacenamiento_f5_ix ON LAPTOP_F5_AHG_S2(TIPO_ALMACENAMIENTO_ID)
;
-- 
-- INDEX: Ref86 
--

CREATE OR REPLACE INDEX laptop_monitor_f5_ix ON LAPTOP_F5_AHG_S2(TIPO_MONITOR_ID)
;
-- 
-- INDEX: Ref27 
--

CREATE OR REPLACE INDEX servicio_lap_suc_f2_ix ON SERVICIO_LAPTOP_F2_AHG_S2(SUCURSAL_ID)
;
-- 
-- INDEX: Ref11 
--

CREATE OR REPLACE INDEX sucursal_taller_suc_f2_ix ON SUCURSAL_TALLER_F2_AHG_S2(SUCURSAL_ID)
;
-- 
-- INDEX: Ref12 
--

CREATE OR REPLACE INDEX sucursal_venta_suc_f2_ix ON SUCURSAL_VENTA_F2_AHG_S2(SUCURSAL_ID)
;
