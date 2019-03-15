<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Fer la imatge d'Aula](#fer-la-imatge-daula)
  - [Actualització](#actualitzaci%C3%B3)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Fer la imatge d'Aula
En la T-221 enguany sembla que havia equips amb dades de l'any pasat. Després de clonar podem llançar un script que esborre tots els fitxers de home, descargar, documentos y escritorio.

## Actualització
Per a actualitzar a una nova ersió de Mint hem d'executar des de la terminal:
```bash
mintupgrade
```

Si actualitzem Virtualbox ha de ser reconfigurat amb:
```bash
/sbin/vboxconfig
```

## Reiniciar els usuaris
Després de restaurar (o no) les particions dels usuaris, per assegurar-se que no queda res de l'any pasat (o si es canvia d0aula a meitat de curs) pesem un script per a reiniciar els usuaris:
```bash
echo Introduce el nombre del usuario a reiniciar
read usuari
deluser $usuari
rm -R /home/$usuari
useradd -s /bin/bash $usuari
echo $usuari:contrasenya | chpasswd
cp /etc/skel/.* /home/$usuari
cp -R /etc/skel/.config /home/$usuari
cp -R /etc/skel/.mozilla /home/$usuari
adduser $usuari vboxusers
adduser $usuari dialout
chown -R $usuari:$usuari /home/$usuari
chmod -R 750 /home/$usuari
reboot
```

