#! /bin/bash
#script para crear un inventario del networking de la consola del cliente
#describe las instancia
nombre_archivo="inventario-aws-$(date '+%Y-%m-%d').json" 
echo " el archivo a crear es $nombre_archivo "
aws ec2 describe-instances --filters Name=instance-state-name,Values=stopped --query "Reservations[*].Instances[*].[InstanceId,KeyName]" > $nombre_archivo
#luego crea un archivo y lo guarda
aws s3 cp $nombre_archivo s3://bucket-data-lab/
#copia el archivo en aws s3
##Eliminar archivo local
rm -f $nombre_archivo
##borra todo
echo  " archivo $nombre_archivo eliminado "
