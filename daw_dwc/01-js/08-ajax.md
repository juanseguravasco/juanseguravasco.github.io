# Ajax

## Introducción
AJAX es el acrónimo de **_Asynchronous Javascript And XML_** (Javascript asíncrono y XML) y es lo que usamos para hacer peticiones asíncronas al servidor desde Javascript. Cuando hacemos una petición al servidor no nos responde inmediatamente (la petición tiene que llegar al servidor, procesarse allí y enviarse la respuesta que llegará al cliente). 

Lo que significa **asíncrono** es que la página no permanecerá bloqueada esperando esa respuesta sino que continuará ejecutando su código y en el momento en que llegue la respuesta del servidor se ejecutará la función que indicamos al hacer la llamada Ajax. Y **XML** es el formato en que se intercambia la información entre el servidor y el cliente, aunque actualmente el formato más usado es **JSON** que es más simple y legible.

Básicamente Ajax nos permite poder mostrar nuevos datos enviados por el servidor sin tener que recargar la página, que continuará disponible mientras se reciben y procesan los datos enviados por el servidor en segundo plano.

<a title="By DanielSHaischt, via Wikimedia Commons [CC BY-SA 3.0 
 (https://creativecommons.org/licenses/by-sa/3.0
)], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Ajax-vergleich-en.svg"><img width="512" alt="Ajax-vergleich-en" src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Ajax-vergleich-en.svg/512px-Ajax-vergleich-en.svg.png"></a>

Sin Ajax cada vez que necesitamos nuevos datos del servidor la página deja de estar disponible para el usuario hasta que se recarga con lo que envía el servidor. Con Ajax la página está siempre disponible para el usuarioy simplemente se modifica (cambiando el DOM) cuando llegan los datos del servidor:

![Librosweb: Introducción a Ajax](http://librosweb.es/img/ajax/f0103.gif)

## Métodos HTTP
Las peticiones Ajax usan el protocolo HTTP (igual que al cargar una página). Este protocolo envía al servidor unas cabeceras HTTP (con información como el _userAgent_ del navegador, el idioma, etc), el tipo de petición y, opcionalmente, datos o parámetros (por ejemplo en la petición que procesa un formulario se envían los datos del mismo).

Hay diferentes tipos de petición que podemos hacer:
* **GET**: suele usarse para obtener datos sin modificar nada (equivale a un SELECT en SQL). Si enviamos datos (ej. la ID del registro a obtener) suelen ir en la url de la petición (formato URIEncoded). Ej.: locahost/users/3 o www.google.es?search=js
* **POST**: suele usarse para añadir un dato en el servidor (equivalente a un INSERT). Los datos enviados van en el cuerpo de la petición HTTP
* **PUT**: es similar al _POST_ pero suele usarse para actualizar datos del servidor (como un UPDATE de SQL). Los datos se envían en el cuerpo de la petición (como en el POST) y la información para identificar el objeto a modificar en la url (como en el GET)
* **DELETE**: se usa para eliminar un dato en el servidor (como un DELETE de SQL). La información para identificar el objeto a eliminar se envía en la url (como en el GET)
* existen otros tipos que no veremos aquí (como _HEAD_, etc)

