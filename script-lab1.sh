#! /bin/bash
#script para crear un inventario del networking de la consola del cliente
#describe las instancia
nombre_archivo="inventario-aws-$(date '+%Y-%m-%d').json" 
echo "file to create is $nombre_archivo"
aws ec2 describe-instances > $nombre_archivo

#luego crea un archivo y lo guarda
echo "uploading to s3"
aws s3 cp $nombre_archivo s3://bucket-data-lab/
#copia el archivo en aws s3

## Delete local file 
rm -f $nombre_archivo
echo "file $nombre_archivo deleted"
