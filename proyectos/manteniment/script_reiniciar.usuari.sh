#!/bin/bash
# Script per a fer a un usuari sudoer en el seu equip

echo Escriu el num d\'aula
read aula
echo Escriu el nom de l\'usuari que vols eliminar
read usuari

for ipn in 11 12 13 14 15 16 21 22 23 24 25 26 31 32 33 34 35 36 41 42 43 44 45 46 51
do
	ip="172.16."$aula"."$ipn

ssh $ip "deluser $usuari"
ssh $ip "rm -R /home/$usuari"
ssh $ip "useradd -s /bin/bash $usuari"
ssh $ip "echo $usuari:contrasenya | chpasswd"
ssh $ip "cp /etc/skel/.* /home/$usuari"
ssh $ip "cp -R /etc/skel/.config /home/$usuari"
ssh $ip "cp -R /etc/skel/.mozilla /home/$usuari"
ssh $ip "adduser $usuari vboxusers"
ssh $ip "adduser $usuari dialout"
ssh $ip "chown -R $usuari:$usuari /home/$usuari"
ssh $ip "chmod -R 750 /home/$usuari"
ssh $ip "reboot"

done
