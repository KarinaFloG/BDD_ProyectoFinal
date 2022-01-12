--@Autor: Jorge A. Rodríguez C
--@Fecha creación: 13/04/2017
--@Descripción: Creación de trigger para implementar transparencia de insercio
clear screen
whenever sqlerror exit rollback
Prompt ==============================
Prompt Creando triggers en ahgbdd_s1
Prompt ==============================
connect ilap_bdd/ilap_bdd@ahgbdd_s1
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-ahg-s1-sucursal-taller-trigger.sql
@s-06-ilap-ahg-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-ahg-s1-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql
Prompt ==============================
Prompt Creando triggers en ahgbdd_s2
Prompt ==============================
connect ilap_bdd/ilap_bdd@ahgbdd_s2
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-ahg-s2-sucursal-taller-trigger.sql
@s-06-ilap-ahg-s2-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-ahg-s2-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql
Prompt ==============================
Prompt Creando triggers en kfgbdd_s1
Prompt ==============================
connect ilap_bdd/ilap_bdd@kfgbdd_s1
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-kfg-s1-sucursal-taller-trigger.sql
@s-06-ilap-kfg-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-kfg-s1-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql
Prompt ==============================
Prompt Creando triggers en kfgbdd_s2
Prompt ==============================
connect ilap_bdd/ilap_bdd@kfgbdd_s2
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-kfg-s2-sucursal-taller-trigger.sql
@s-06-ilap-kfg-s2-sucursal-venta-trigger.sql
@s-06-ilap-kfg-s2-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-kfg-s2-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql
Prompt Listo!
disconnect