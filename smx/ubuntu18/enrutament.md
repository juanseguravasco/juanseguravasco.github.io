## Enrutament
Una vegada les 2 targetes estiguen correctament configurades perquè els clients tinguen accés a Internet haurem de configurar el enrutamiento en el servidor, la qual cosa comporta 2 accions:

habilitar l'enrutament
configurar NAT
Habilitar l'enrutament
L'enrutament el que fa és redirigir a la targeta de xarxa externa el tràfic de la targeta interna amb destinació a altres xarxes (com a Internet).

Per a habilitar l'enrutament editem el fitxer /etc/sysctl.conf i descomentem la línia:

net.ipv4.ip_forward=1
Perquè faça efecte hem de recarregar la configuració amb:

sysctl -p
També podem habilitar-ho temporalment, fins que reiniciem la màquina, executant l'ordre

echo 1 > /proc/sys/net/ipv4/ip_forward
(si en comptes de echo 1 posem echo 0 ho deshabilitem).

Per a comprovar si està habilitat executem l'ordre

cat /proc/sys/net/ipv4/ip_forward
(si retorna 1 és que està habilitat).

.

Configurar NAT en sistemes amb ifupdown
Respecte al NAT, amb versions de GNU/Linux que utilitzen ifupdown (en Ubuntu fins la 17.04) hem d'afegir una regla a iptables. Per exemple si la nostra targeta externa és la eth0 amb IP 10.0.2.20 i la nostra xarxa interna és la 192.168.101.0 el comando per a activar NAT seria:

iptables -t nat -A POSTROUTING -s 192.168.101.0/24 -o enp0s3 -j MASQUERADE
El que indiquem és d'on provindrà el tràfic a enrutar (-s xarxa interna/màscara, és a dir, -s 192.168.10.0/24) a quina targeta s'enviarà (-o targeta externa, és a dir, -o enp0s3) i que enrute a la IP que tinga la targeta externa (-j MASQUERADE). Si nostra IP externa sempre serà la mateixa podem posar l'opció -j SNAT --to 10.0.2.20 (on 10.0.2.20 seria la IP externa) en compte de -j MASQUERADE.

Si hem d'enrutar més d'una xarxa interna repetirem aquest comando per a cada xarxa a enrutar:

iptables -t nat -A POSTROUTING -s 192.168.102.0/24 -o enp0s3 -j MASQUERADE
Per a evitar haver d'executar aquest comando cada vegada que reiniciem el sistema instal·larem el paquet iptables-persistent que ens pregunta si emmagatzema la configuració actual de iptables (v4 i v6) i la càrrega de nou cada vegada que reiniciem el sistema. Si posteriorment fem modificacions en les iptables per a que ens torne a preguntar si guarda els canvis farem

dpkg-reconfigure iptables-persistent
Per a comprovar si el nostre sistema està fent NAT executem l'ordre:

iptables -t nat - L


.
Configurar NAT en sistemes netplan (Ubuntu 17.10 i posteriors)
Amb netplan s'utilitza el Firewal ufw (uncomplicated Firewall). Per defecte està desactivat i podem activar-ho o desactivar-ho amb els comandos ufw enable i ufw disable. Per a veure la configuració executem ufw status verbose:



Per a configurar NAT hem d'activar ufw i realitzar les següents accions:

Editar el fitxer /etc/default/ufw i canviar la línia DEFAULT_FORWARD_POLICY="DROP" per
DEFAULT_FORWARD_POLICY="ACCEPT"
Editar el titxer /etc/ufw/before.rules i afegir les següents línies al principi (abans de les regles de filtrat *filter). Aquest exemple és per a enrutar la xarxa interna 192.168.226.0:
# NAT table rules
*nat
:POSTROUTING ACCEPT [0:0]

# Forward traffic through eth0 - Change to match you out-interface
-A POSTROUTING -s 192.168.226.0/24 -o enp0s3 -j MASQUERADE

# don't delete the 'COMMIT' line or these nat table rules won't be processed
COMMIT
Només queda reiniciar el Firewall (podem desactivar-ho i tornar-lo a activar). Per a comprovar les regles que estan aplicant-se executem el comando que ja hem vist:

iptables  -t nat -L
 

1
