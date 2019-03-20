#!/bin/bash
# Script per a eliminar TOTES les DADES dels equips dels alumnes

echo ATENCIÓ: aquest script elimina TOTES les dades de l\'usuari indicat en els equips dels alumnes. Per a continu$
read confirm
if [ "$confirm" != "CONTINUAR" ]
then
        echo Procés cancel·lat
        return
fi
echo Escriu el num d\'aula
read aula
echo Escriu el nom de l\'usuari que vols eliminar
read usuari

for ipn in 11 12 13 14 15 16 21 22 23 24 25 26 31 32 33 34 35 36 41 42 43 44 45 46 51
do
        ip="172.16."$aula"."$ipn

echo Borrando PC $ip
ssh $ip "deluser $usuari"
ssh $ip "rm -R /home/$usuari"
ssh $ip "useradd -s /bin/bash $usuari"
ssh $ip "echo $usuari:$usuari12 | chpasswd"
ssh $ip "cp /etc/skel/.* /home/$usuari"
ssh $ip "cp -R /etc/skel/.config /home/$usuari"
ssh $ip "cp -R /etc/skel/.mozilla /home/$usuari"
ssh $ip "adduser $usuari vboxusers"
ssh $ip "adduser $usuari dialout"
ssh $ip "chown -R $usuari:$usuari /home/$usuari"
ssh $ip "chmod -R 750 /home/$usuari"
ssh $ip "reboot"

done
