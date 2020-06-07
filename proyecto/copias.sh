#!/bin/bash
#crear copia de la base de datos
HOST=localhost
USER=editor_base
PASS=CARLOS.14
BACKUP_DIR=/home/ubuntu/Proyecto_final_DAW/proyecto
DB=videos
DIA=`date --date='1 days ago' +%d-%m-%Y`
STR=$BACKUP_DIR"/"$DB"_"$DIA".xml"

mysqldump -h $HOST -u $USER --password=$PASS $DB > $STR

git add $STR
git commit -m "copia del dia "$DIA
usuario=carl020297%40gmail.com
contrasena=
git push "https://$usuario:$contrasena@github.com/CarlosAndresGrisalesSanchez/Proyecto_final_DAW.git" p_usuarios

