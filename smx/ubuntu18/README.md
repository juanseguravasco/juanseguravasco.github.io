# Coses a tindre en compte amb Ubuntu 18.04

##  Xarxa en Ubuntu 18.04
Des de la versió 18.04 Server Ubuntu ha abandonat el sistema de configuració de la xarxa ifupdown i lo ha canviat per netplan.

Els canvis que açò comporta són, entre uns altres:
* el fitxer de configuració és un fitxer YAML que hi ha dins de /etc/netplan (abans era /etc/network/interfícies)
* el servei ara és systemd-networkd (abans networking). Per a reiniciar-ho fem systemctl restart systemd-networkd
* per a activar o desactivar una interficie ja no existeixen ifup i ifdown sinó:
    * ip link set $targeta up
    * ip link set $targeta down
* hi ha una nova comanda, networkctl, per a veure què dispositius tenim. Amb el paràmetre status ens dóna la configuració de cadascun

### Fitxer de configuració
Es tracta d'un fitxer YAML. Açò significa que cada opció va en una línia i si una està dins de l'anterior ha d'anar indentada cap a dins 4 espais (ULL han de ser 4 i no serveix tabulador).

Exemple de fitxer d'una màquina amb una única targeta configurada per DHCP:
```bash
network:
    version: 2
    ethernets:
        enp0s3:
            dhcp4: yes
```
Si volem configurar una altra targeta i que siguen ambdues estàtiques:
```bash
network:
    version: 2
    ethernets:
        enp0s3:
            addresses: [10.0.2.10/24]
            gateway: 10.0.2.2
            nameservers:
                addresses: [172.16.20.1]
            dhcp4: false
            optional: true
        enp0s8:
            addresses: [192.168.0.1/24]
            dhcp4: false
            optional: true
```
**ATENCIÓ**: ha d'haver-hi un espai entre els : i el valor de l'opció i no pot haver-hi espais al final d'una línia.

Perquè s'apliquen els canvis no és necessari reiniciar el servei de xarxa sinó que n'hi ha prou amb fer:
```bash
netplan apply
```

En el cas de la versió Desktop segueix sent **NetworkManager** qui s'encarrega de configurar la xarxa, la qual cosa s'indica en el fitxer que hi ha en _/etc/netplan_:
