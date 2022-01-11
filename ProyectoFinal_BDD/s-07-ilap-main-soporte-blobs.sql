--@Autor: Alejandro Herrera
--@Fecha creación:
--@Descripción: Script principal empleado para configurar el soporte
-- de datos BLOB en los 4 nodos.
Prompt configurando directorios y otorgando registros.
--ahgbdd_s1
Prompt configurando soporte BLOB para jrcbd_s1
connect ilap_bdd/ilap_bdd@ahgbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql
--ahgbdd_s2
Prompt configurando soporte BLOB para ahgbdd_s2
connect ilap_bdd/ilap_bdd@ahgbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql
--arcbd_s1
Prompt configurando soporte BLOB para kfgbdd_s1
connect ilap_bdd/ilap_bdd@kfgbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql
--arcbd_s2
Prompt configurando soporte BLOB para kfgbdd_s2
connect ilap_bdd/ilap_bdd@kfgbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql
Prompt Listo !