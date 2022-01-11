--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      KAR
-- Project :      Nodo1.DM1
-- Author :       KAR
--
-- Date Created : Sunday, January 09, 2022 01:28:39
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: STATUS_LAPTOP 
--


CREATE TABLE STATUS_LAPTOP(
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE               VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(400)    NOT NULL,
    CONSTRAINT status_laptop_pk PRIMARY KEY (STATUS_LAPTOP_ID) 
)
;



-- 
-- TABLE: HISTORICO_STATUS_LAPTOP_F2_AHG_S1 
--

CREATE TABLE HISTORICO_STATUS_LAPTOP_F2_AHG_S1(
    HISTORICO_STATUS_LAPTOP_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                  TIMESTAMP(6)     NOT NULL,
    STATUS_LAPTOP_ID              NUMBER(5, 0)     NOT NULL,
    LAPTOP_ID                     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT historico_status_laptop_f2_ahg_s1_pk PRIMARY KEY (HISTORICO_STATUS_LAPTOP_ID), 
    CONSTRAINT HIST_STAT_S1_LAP_ID_FK FOREIGN KEY (STATUS_LAPTOP_ID)
    REFERENCES STATUS_LAPTOP(STATUS_LAPTOP_ID) ON DELETE cascade
)
;



-- 
-- TABLE: TIPO_PROCESADOR_R_AHG_S1 
--

CREATE TABLE TIPO_PROCESADOR_R_AHG_S1(
    TIPO_PROCESADOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(400)    NOT NULL,
    CONSTRAINT tipo_procesador_r_ahg_s1_pk PRIMARY KEY (TIPO_PROCESADOR_ID)
)
;



-- 
-- TABLE: TIPO_TARJETA_VIDEO_R_AHG_S1 
--

CREATE TABLE TIPO_TARJETA_VIDEO_R_AHG_S1(
    TIPO_TARJETA_VIDEO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                    VARCHAR2(40)     NOT NULL,
    DESCRIPCION              VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_TARJETA_VIDEO_R_AHG_S1_PK PRIMARY KEY (TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: TIPO_ALMACENAMIENTO_R_AHG_S1 
--

CREATE TABLE TIPO_ALMACENAMIENTO_R_AHG_S1(
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                     VARCHAR2(40)     NOT NULL,
    DESCRIPCION               VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_ALMACENAMIENTO_R_AHG_S1_PK PRIMARY KEY (TIPO_ALMACENAMIENTO_ID)
)
;



-- 
-- TABLE: TIPO_MONITOR_R_AHG_S1 
--

CREATE TABLE TIPO_MONITOR_R_AHG_S1(
    TIPO_MONITOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(400)    NOT NULL,
    CONSTRAINT TIPO_MONITOR_R_AHG_S1_PK PRIMARY KEY (TIPO_MONITOR_ID)
)
;



-- 
-- TABLE: LAPTOP_F2_AHG_S1 
--

CREATE TABLE LAPTOP_F2_AHG_S1(
    LAPTOP_ID                 NUMBER(10, 0)     NOT NULL,
    LAPTOP_REEMPLAZO_ID       NUMBER(10, 0),
    NUM_SERIE                 VARCHAR2(18)      NOT NULL,
    CANTIDAD_RAM              NUMBER(6, 0),
    CARACTERISTICAS_EXTRAS    VARCHAR2(2000)    NOT NULL,
    TIPO_PROCESADOR_ID        NUMBER(5, 0)      NOT NULL,
    TIPO_TARJETA_VIDEO_ID     NUMBER(5, 0)      NOT NULL,
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)      NOT NULL,
    TIPO_MONITOR_ID           NUMBER(5, 0)      NOT NULL,
    CONSTRAINT LAPTOP_F2_AHG_S1_PK PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT laptop_s1_proc_FK FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR_R_AHG_S1(TIPO_PROCESADOR_ID) ON DELETE cascade,
    CONSTRAINT laptop_S1_tarj_vid_fk FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO_R_AHG_S1(TIPO_TARJETA_VIDEO_ID) ON DELETE cascade,
    CONSTRAINT laptop_s1_alma_FK FOREIGN KEY (TIPO_ALMACENAMIENTO_ID)
    REFERENCES TIPO_ALMACENAMIENTO_R_AHG_S1(TIPO_ALMACENAMIENTO_ID) ON DELETE cascade,
    CONSTRAINT laptop_S1_moni_FK FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR_R_AHG_S1(TIPO_MONITOR_ID) ON DELETE cascade
)
;



-- 
-- TABLE: LAPTOP_INVENTARIO_F2_AHG_S1 
--

CREATE TABLE LAPTOP_INVENTARIO_F2_AHG_S1(
    LAPTOP_ID           NUMBER(10, 0)    NOT NULL,
    SUCURSAL_ID         NUMBER(10, 0),
    FECHA_STATUS        TIMESTAMP(6)     NOT NULL,
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CONSTRAINT LAPTOP_INVENTARIO_F2_AHG_S1_PK PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT LAP_INV_S1_STATUS_FK FOREIGN KEY (STATUS_LAPTOP_ID)
    REFERENCES STATUS_LAPTOP(STATUS_LAPTOP_ID) ON DELETE cascade
)
;



-- 
-- TABLE: SUCURSAL_F1_AHG_S1 
--

CREATE TABLE SUCURSAL_F1_AHG_S1(
    SUCURSAL_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(10)     NOT NULL,
    ES_TALLER      NUMBER(1, 0)     NOT NULL,
    ES_VENTA       NUMBER(1, 0)     NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    LATITUD        BINARY_FLOAT     NOT NULL,
    LONGITUD       BINARY_FLOAT     NOT NULL,
    URL            VARCHAR2(200)    NOT NULL,
    CONSTRAINT SUCURSAL_F1_AHG_S1_PK PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_TALLER_F1_AHG_S1 
--

CREATE TABLE SUCURSAL_TALLER_F1_AHG_S1(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    DIA_DESCANSO         NUMBER(1, 0)     NOT NULL,
    TELEFONO_ATENCION    VARCHAR2(20)     NOT NULL,
    CONSTRAINT SUCURSAL_TALLER_F1_AHG_S1_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT suc_taller_S1_suc_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F1_AHG_S1(SUCURSAL_ID) ON DELETE cascade
)
;



-- 
-- TABLE: SERVICIO_LAPTOP_F1_AHG_S1 
--

CREATE TABLE SERVICIO_LAPTOP_F1_AHG_S1(
    NUM_SERVICIO    NUMBER(10, 0)     NOT NULL,
    LAPTOP_ID       NUMBER(10, 0)     NOT NULL,
    IMPORTE         NUMBER(8, 2)      NOT NULL,
    DIAGNOSTICO     VARCHAR2(2000)    NOT NULL,
    FACTURA         BLOB,
    SUCURSAL_ID     NUMBER(10, 0)     NOT NULL,
    CONSTRAINT SERVICIO_LAPTOP_F1_AHG_S1_PK PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID), 
    CONSTRAINT servicio_lap_f1_suc_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_TALLER_F1_AHG_S1(SUCURSAL_ID) ON DELETE cascade
)
;



-- 
-- TABLE: SUCURSAL_VENTA_F1_AHG_S1 
--

CREATE TABLE SUCURSAL_VENTA_F1_AHG_S1(
    SUCURSAL_ID      NUMBER(10, 0)    NOT NULL,
    HORA_APERTURA    DATE             NOT NULL,
    HORA_CIERRE      DATE             NOT NULL,
    CONSTRAINT SUCURSAL_VENTA_F1_AHG_S1_PK PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT sucursal_venta_suc_f1_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F1_AHG_S1(SUCURSAL_ID) ON DELETE cascade
)
;



-- 
-- INDEX: Ref78 
--

CREATE INDEX Ref78 ON HISTORICO_STATUS_LAPTOP_F2_AHG_S1(STATUS_LAPTOP_ID)
;
-- 
-- INDEX: Ref918 
--

CREATE INDEX Ref918 ON LAPTOP_F2_AHG_S1(TIPO_PROCESADOR_ID)
;
-- 
-- INDEX: Ref1119 
--

CREATE INDEX Ref1119 ON LAPTOP_F2_AHG_S1(TIPO_TARJETA_VIDEO_ID)
;
-- 
-- INDEX: Ref1220 
--

CREATE INDEX Ref1220 ON LAPTOP_F2_AHG_S1(TIPO_ALMACENAMIENTO_ID)
;
-- 
-- INDEX: Ref1321 
--

CREATE INDEX Ref1321 ON LAPTOP_F2_AHG_S1(TIPO_MONITOR_ID)
;
-- 
-- INDEX: Ref79 
--

CREATE INDEX Ref79 ON LAPTOP_INVENTARIO_F2_AHG_S1(STATUS_LAPTOP_ID)
;
-- 
-- INDEX: Ref217 
--

CREATE INDEX Ref217 ON SERVICIO_LAPTOP_F1_AHG_S1(SUCURSAL_ID)
;
-- 
-- INDEX: Ref13 
--

CREATE INDEX Ref13 ON SUCURSAL_TALLER_F1_AHG_S1(SUCURSAL_ID)
;
-- 
-- INDEX: Ref15 
--

CREATE INDEX Ref15 ON SUCURSAL_VENTA_F1_AHG_S1(SUCURSAL_ID)
;
