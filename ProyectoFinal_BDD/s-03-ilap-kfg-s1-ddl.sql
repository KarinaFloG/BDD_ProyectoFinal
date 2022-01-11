--@Autor: Karina Flores García 
--@Autor: Alejandro Herrera Gandarela
--@Fecha creación: 23/12/2021
--@Descripción: DDL para sitio N3

prompt Creando tablas para el sitio N3 en KFGBDD_S1

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
	v_tipo_procesador_r_kfg_s1 varchar2(30)     := 'TIPO_PROCESADOR_R_KFG_S1';
	v_tipo_tarjeta_video_r_kfg_s1 varchar2(30)	:= 'TIPO_TARJETA_VIDEO_R_KFG_S1';
	v_tipo_almacenamiento_r_kfg_s1 varchar2(30) := 'TIPO_ALMACENAMIENTO_R_KFG_S1';
	v_tipo_monitor_r_kfg_s1 varchar2(30)	    := 'TIPO_MONITOR_R_KFG_S1';
	v_laptop_f4_kfg_s1 varchar2(30) 	        := 'LAPTOP_F4_KFG_S1';
	v_status_laptop varchar2(30) 	            := 'STATUS_LAPTOP';
	v_laptop_inventario_f1_kfg_s1 varchar2(30) 	:= 'LAPTOP_INVENTARIO_F1_KFG_S1';
	v_sucursal_taller_f3_kfg_s1 varchar2(30) 	:= 'SUCURSAL_TALLER_F3_KFG_S1';
    v_sucursal_venta_f3_kfg_s1 varchar2(30) 	:= 'SUCURSAL_VENTA_F3_KFG_S1';
    v_servicio_laptop_f3_kfg_s1 varchar2(30) 	:= 'SERVICIO_LAPTOP_F3_KFG_S1';
begin
	drop_table_if_exists(v_tipo_procesador_r_kfg_s1);
	drop_table_if_exists(v_tipo_tarjeta_video_r_kfg_s1);
	drop_table_if_exists(v_tipo_almacenamiento_r_kfg_s1);
	drop_table_if_exists(v_tipo_monitor_r_kfg_s1);
	drop_table_if_exists(v_laptop_f4_kfg_s1);
	drop_table_if_exists(v_status_laptop);
	drop_table_if_exists(v_laptop_inventario_f1_kfg_s1;)
	drop_table_if_exists(v_sucursal_taller_f3_kfg_s1);
    drop_table_if_exists(v_sucursal_venta_f3_kfg_s1);
    drop_table_if_exists(v_servicio_laptop_f3_kfg_s1);
end;
/


--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      KAR
-- Project :      Nodo3.DM1
-- Author :       KAR
--
-- Date Created : Sunday, January 09, 2022 01:31:29
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: TIPO_PROCESADOR_R_KFG_S1 
--

CREATE TABLE TIPO_PROCESADOR_R_KFG_S1(
    TIPO_PROCESADOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_PROCESADOR_R_KFG_S1_PK PRIMARY KEY (TIPO_PROCESADOR_ID)
)
;



-- 
-- TABLE: TIPO_TARJETA_VIDEO_R_KFG_S1 
--

CREATE TABLE TIPO_TARJETA_VIDEO_R_KFG_S1(
    TIPO_TARJETA_VIDEO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                    VARCHAR2(40)     NOT NULL,
    DESCRIPCION              VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_TARJETA_VIDEO_R_KFG_S1_PK PRIMARY KEY (TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: TIPO_ALMACENAMIENTO_R_KFG_S1 
--

CREATE TABLE TIPO_ALMACENAMIENTO_R_KFG_S1(
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                     VARCHAR2(40)     NOT NULL,
    DESCRIPCION               VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_ALMACENAMIENTO_R_KFG_S1_PK PRIMARY KEY (TIPO_ALMACENAMIENTO_ID)
)
;



-- 
-- TABLE: TIPO_MONITOR_R_KFG_S1 
--

CREATE TABLE TIPO_MONITOR_R_KFG_S1(
    TIPO_MONITOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_MONITOR_R_KFG_S1_PK PRIMARY KEY (TIPO_MONITOR_ID)
)
;



-- 
-- TABLE: LAPTOP_F4_KFG_S1 
--

CREATE TABLE LAPTOP_F4_KFG_S1(
    LAPTOP_ID                 NUMBER(10, 0)     NOT NULL,
    NUM_SERIE                 VARCHAR2(18)      NOT NULL,
    CARACTERISTICAS_EXTRAS    VARCHAR2(2000)    NOT NULL,
    LAPTOP_REEMPLAZO_ID       NUMBER(10, 0),
    CANTIDAD_RAM              NUMBER(6, 0)      NOT NULL,
    TIPO_PROCESADOR_ID        NUMBER(5, 0)      NOT NULL,
    TIPO_TARJETA_VIDEO_ID     NUMBER(5, 0)      NOT NULL,
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)      NOT NULL,
    TIPO_MONITOR_ID           NUMBER(5, 0)      NOT NULL,
    CONSTRAINT LAPTOP_F4_KFG_S1_PK PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT laptop_f4_proc_FK FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR_R_KFG_S1(TIPO_PROCESADOR_ID) ON DELETE cascade,
    CONSTRAINT laptop_S4_tarj_vid_fk FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO_R_KFG_S1(TIPO_TARJETA_VIDEO_ID) ON DELETE cascade,
    CONSTRAINT laptop_s4_alma_FK FOREIGN KEY (TIPO_ALMACENAMIENTO_ID)
    REFERENCES TIPO_ALMACENAMIENTO_R_KFG_S1(TIPO_ALMACENAMIENTO_ID) ON DELETE cascade,
    CONSTRAINT laptop_S4_moni_FK FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR_R_KFG_S1(TIPO_MONITOR_ID) ON DELETE cascade
)
;



-- 
-- TABLE: STATUS_LAPTOP 
--

CREATE TABLE STATUS_LAPTOP(
    STATUS_LAPTOP_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE               VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(400)    NOT NULL,
    CONSTRAINT STATUS_LAPTOP_PK PRIMARY KEY (STATUS_LAPTOP_ID)
)
;



-- 
-- TABLE: LAPTOP_INVENTARIO_F1_KFG_S1 
--

CREATE TABLE LAPTOP_INVENTARIO_F1_KFG_S1(
    LAPTOP_ID           NUMBER(10, 0)    NOT NULL,
    SUCURSAL_ID         NUMBER(5, 0)     NOT NULL,
    RFC_CLIENTE         VARCHAR2(13),
    NUM_TARJETA         VARCHAR2(16),
    STATUS_LAPTOP_ID    NUMBER(40, 0)    NOT NULL,
    CONSTRAINT LAPTOP_INVENTARIO_F1_KFG_S1_PK PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT LAPTOP_INV_F1_STATUS_LAPTOP_FK FOREIGN KEY (STATUS_LAPTOP_ID)
    REFERENCES STATUS_LAPTOP(STATUS_LAPTOP_ID) ON DELETE cascade
)
;



-- 
-- TABLE: SUCURSAL_F3_KFG_S1 
--

CREATE TABLE SUCURSAL_F3_KFG_S1(
    SUCURSAL_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(10)     NOT NULL,
    ES_TALLER      NUMBER(1, 0)     NOT NULL,
    ES_VENTA       NUMBER(1, 0)     NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    LATITUD        BINARY_FLOAT     NOT NULL,
    LONGITUD       BINARY_FLOAT     NOT NULL,
    URL            VARCHAR2(200)    NOT NULL,
    CONSTRAINT SUCURSAL_F3_KFG_S1_PK PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_TALLER_F3_KFG_S1 
--

CREATE TABLE SUCURSAL_TALLER_F3_KFG_S1(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    DIA_DESCANSO         NUMBER(1, 0)     NOT NULL,
    TELEFONO_ATENCION    VARCHAR2(20)     NOT NULL,
    CONSTRAINT SUCURSAL_TALLER_F3_KFG_S1_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT suc_taller_f3_suc_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F3_KFG_S1(SUCURSAL_ID) ON DELETE cascade
)
;



-- 
-- TABLE: SERVICIO_LAPTOP_F3_KFG_S1 
--

CREATE TABLE SERVICIO_LAPTOP_F3_KFG_S1(
    NUM_SERVICIO    NUMBER(10, 0)     NOT NULL,
    LAPTOP_ID       NUMBER(10, 0)     NOT NULL,
    IMPORTE         NUMBER(8, 2)      NOT NULL,
    DIAGNOSTICO     VARCHAR2(2000)    NOT NULL,
    FACTURA         BLOB,
    SUCURSAL_ID     NUMBER(10, 0)     NOT NULL,
    CONSTRAINT SERVICIO_LAPTOP_F3_KFG_S1_PK PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID), 
    CONSTRAINT Servicio_lap_f3_suc_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_TALLER_F3_KFG_S1(SUCURSAL_ID) ON DELETE cascade
)
;



-- 
-- TABLE: SUCURSAL_VENTA_F3_KFG_S1 
--

CREATE TABLE SUCURSAL_VENTA_F3_KFG_S1(
    SUCURSAL_ID      NUMBER(10, 0)    NOT NULL,
    HORA_APERTURA    DATE             NOT NULL,
    HORA_CIERRE      DATE             NOT NULL,
    CONSTRAINT SUCURSAL_VENTA_F3_KFG_S1_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT sucursal_venta_suc_f3_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F3_KFG_S1(SUCURSAL_ID) ON DELETE cascade
)
;



-- 
-- INDEX: Ref53 
--

CREATE INDEX laptop_proc_f4_ix ON LAPTOP_F4_KFG_S1(TIPO_PROCESADOR_ID)
;
-- 
-- INDEX: Ref64 
--

CREATE INDEX laptop_tarjeta_f4_ix ON LAPTOP_F4_KFG_S1(TIPO_TARJETA_VIDEO_ID)
;
-- 
-- INDEX: Ref75 
--

CREATE INDEX laptop_almacenamiento_f4_ix ON LAPTOP_F4_KFG_S1(TIPO_ALMACENAMIENTO_ID)
;
-- 
-- INDEX: Ref86 
--

CREATE INDEX laptop_monitor_f4_ix ON LAPTOP_F4_KFG_S1(TIPO_MONITOR_ID)
;
-- 
-- INDEX: Ref99 
--

CREATE INDEX laptop_inv_status_f1_ix ON LAPTOP_INVENTARIO_F1_KFG_S1(STATUS_LAPTOP_ID)
;
-- 
-- INDEX: Ref27 
--

CREATE INDEX servicio_lap_suc_f3_ix ON SERVICIO_LAPTOP_F3_KFG_S1(SUCURSAL_ID)
;
-- 
-- INDEX: Ref11 
--

CREATE INDEX sucursal_taller_suc_f3_ix ON SUCURSAL_TALLER_F3_KFG_S1(SUCURSAL_ID)
;
-- 
-- INDEX: Ref12 
--

CREATE INDEX sucursal_venta_suc_f3_ix ON SUCURSAL_VENTA_F3_KFG_S1(SUCURSAL_ID)
;
