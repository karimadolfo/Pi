#Este script borra todos los ficheros con extension recogida en el clean.up.
#Anadir extensiones a limpiar en clean.up y correr el script pasandole como argumento la carpeta a limpiar.
#Borrado permanente de ficheros con extension recogida en clean.up

#!/bin/bash
find $1 -type f -print0 | grep -zFf /home/osmc/scripts/clean.up| xargs -0 rm

