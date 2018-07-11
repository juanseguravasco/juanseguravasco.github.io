# Coses a tindre en compte amb Ubuntu 18.04

## Nom de les targetes
Les targetes de xarxa s'identifiquen com ethX (eth0, eth1, ...) si són targetes ethernet cablejades o wlanX si són targetes WiFi (en ocasions es diuen athX si són wifis Atheros o amb altres noms depenent del fabricant).

El problema és que el nom que se li assigna depèn de quan es configura la targeta en arrancar (la primera serà la eth0, la segona la eth1) el que podria canviar entre un reinicie i un altre. A més algunes distribucions, com Ubuntu, assignen sempre el mateix nom d'interfície a cada MAC pel que si es desbarata una targeta i la canviem la nova ja no seria eth0 sinó el següent nom no usat. Açò també passa en màquines virtuals on podem canviar les MAC de les nostres targetes.

Moltes configuracions (firewall, etc) depenen del nom que tinguen les targetes pel que si aquest canvia deixaran de funcionar correctament. Per a evitar aquests problemes de no saber com es dirà cada interfície de xarxa en les últimes distribucions GNU/Linux s'utilitza Predictable Network Interface Names que pretén assignar identificadors estables a les interfícies de xarxa basant-se en el tipus (local Ethernet, WLAN, WWAN…).

Així les targetes que el kernel nomena com ethX són renombrades a enoX (si la targeta està integrada en la placa base) o enpXsY (per a targetes en slots PCI) i aquests noms seran sempre els mateixos per a cada targeta. En màquines de VirtualBox la primera sol ser la emp0s3, la segona la enp0s8, ...

##  Xarxa en Ubuntu 18.04
Des de la versió 18.04 Server Ubuntu ha abandonat el sistema de configuració de la xarxa **ifupdown** i lo ha canviat per **netplan**.

Els canvis que açò comporta són, entre uns altres:
* el fitxer de configuració és un fitxer _YAML_ que hi ha dins de **/etc/netplan** (abans era /etc/network/interfícies)
* el servei ara és **systemd-networkd** (abans networking). Per a reiniciar-ho fem `systemctl restart systemd-networkd`
* per a activar o desactivar una interficie ja no existeixen **ifup** i **ifdown** sinó:
```bash
    ip link set $targeta up
    ip link set $targeta down
```
* hi ha una nova comanda, networkctl, per a veure què dispositius tenim. Amb el paràmetre `status` ens dóna la configuració de cadascun:

![Configuració de xarxa](./img/Ubuntu18-xarxa-04.png)

Si li poem el nom d'una targeta ens dona la informació de la mateixa:

![Configuració de xarxa](./img/Ubuntu18-xarxa-05.png)

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
![Configuració de xarxa](./img/Ubuntu18-xarxa-01.png)

**ATENCIÓ**: ha d'haver-hi un espai entre els : i el valor de l'opció i no pot haver-hi espais al final d'una línia.

Perquè s'apliquen els canvis no és necessari reiniciar el servei de xarxa sinó que n'hi ha prou amb fer:
```bash
netplan apply
```

En el cas de la versió Desktop segueix sent **NetworkManager** qui s'encarrega de configurar la xarxa, la qual cosa s'indica en el fitxer que hi ha en _/etc/netplan_:

![netplan](./img/Ubuntu18-xarxa-02.png)

## Enrutament
Una vegada les 2 targetes estiguen correctament configurades perquè els clients tinguen accés a Internet haurem de configurar el enrutamiento en el servidor, la qual cosa comporta 2 accions:
* habilitar l'enrutament
* configurar NAT

### Habilitar l'enrutament
L'enrutament el que fa és redirigir a la targeta de xarxa externa el tràfic de la targeta interna amb destinació a altres xarxes (com a Internet).

Si estem en Ubuntu 17.10 i posterior utilitzarem el Firewal **ufw** (uncomplicated Firewall). Per a habilitar l'enrutament editem el fitxer **/etc/ufw/sysctl.conf** i descomentem la línia:
```bash
net.ipv4.ip_forward=1
```
Per a recarregar el firewal el des-habilitem i el tornem a habilitar:
```bash
ufw disable
ufw enable
```
També podem activar eixa opció en la configuració del sistema en compte de en la del firewal descomentant la mateixa línia però del fitxer **/etc/ufw/sysctl.conf** (es el que hem de fer si tenim la versió 17.04 o anterior que no utilitza el firewall).

En aquest cas perquè faça efecte hem de recarregar la configuració amb:
```bash
sysctl -p
```

També podem habilitar-ho temporalment, fins que reiniciem la màquina, executant l'ordre
```bash
echo 1 > /proc/sys/net/ipv4/ip_forward
```
(si en comptes de echo 1 posem echo 0 ho deshabilitem).

Per a comprovar si està habilitat executem l'ordre
```bash
cat /proc/sys/net/ipv4/ip_forward
```
(si retorna 1 és que està habilitat).

### Configurar NAT en sistemes netplan (Ubuntu 17.10 i posteriors)
Amb netplan s'utilitza el Firewal **ufw**. Per defecte està desactivat i podem activar-ho o desactivar-ho amb els comandos ufw enable i ufw disable. Per a veure la configuració executem ufw status verbose:

![netplan](./img/Ubuntu18-xarxa-06.png)

Per a configurar NAT hem d'activar ufw i realitzar les següents accions:
1. Editar el fitxer **/etc/default/ufw** i canviar la línia `DEFAULT_FORWARD_POLICY="DROP"` per 
  ```bash
  DEFAULT_FORWARD_POLICY="ACCEPT"
  ```
2. Editar el titxer **/etc/ufw/before.rules** i afegir les següents línies al principi, abnans de les regles de filtrat (`*filter`)
```bash
# NAT table rules
*nat
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -s 192.168.100.0/24 -o enp0s3 -j MASQUERADE
COMMIT
```

Només queda reiniciar el Firewall (podem desactivar-ho i tornar-lo a activar). Per a comprovar les regles que estan aplicant-se executem el comando que ja hem vist:
```bash
iptables  -t nat -L
```
Si volem eliminar totes les regles que tenim ara en iptables (per a tornar-las a posar o per si ens hem equivocat):
```bash
iptables  -t nat -F
```
### Configurar NAT des de Webmin
Si fem la configuració de l'enrutament des de Webmin tot funciona igual però l'enrutament l'activa en **/etc/sysctl.conf** (no en /etc/ufw/sysctl.conf) i les regles de nat les guarda en **/etc/iptables.up.rules** (en compte de en /etc/ufw/before.rules) i les carrega afegint la següent línia a **/etc/network/interfaces**:
```bash
post-up iptables restore < /etc/iptables.up.rules
```

### ### Configurar NAT amb `iptables`
Si volem podem afegir una regla a iptables igual que es feia en les versions anterios. Per exemple si la nostra targeta externa és la eth0 amb IP 10.0.2.20 i la nostra xarxa interna és la 192.168.10.0 el comando per a activar NAT seria:
```bash
iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -o enp0s3 -j SNAT --to 10.0.2.20
```

El que indiquem és d'on provindrà el tràfic a enrutar (`-s xarxa interna/màscara`, és a dir, `-s 192.168.10.0/24`) a quina targeta s'enviarà (-o targeta externa, és a dir, `-o enp0s3`) i quin és la IP d'aquesta targeta externa (`-j SNAT --to 10.0.2.20`). Si nostra IP externa pot canviar (perquè és dinàmica) el que posarem és `-j MASQUERADE`.

Per a evitar haver d'executar aquest comando cada vegada que reiniciem el sistema instal·larem el paquet **iptables-persistent** que ens pregunta si emmagatzema la configuració actual de iptables (v4 i v6) i la càrrega de nou cada vegada que reiniciem el sistema. Si posteriorment fem modificacions en les iptables per a que ens torne a preguntar si guarda els canvis farem
```bash
dpkg-reconfigure iptables-persistent
```

Per a comprovar si el nostre sistema està fent NAT executem l'ordre:
```bash
iptables -t nat - L
```
![iptables -t nat - L](./img/Ubuntu18-xarxa-03.jpg)
