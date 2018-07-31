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

## Realizar peticiones Ajax
Para hacer una petición debemos crear una instancia del objeto **XMLHttpRequest** que es el que controlará todo el proceso. Los pasos a seguir son:
1 Creamos la instancia del objeto: `let peticion=new XMLHttpRequest()`
1 Para establecer la comunicación con el servidor ejecutamos el método **.open()** al que se le pasa como parámetro el tipo de petición (GET, POST, ...) y la URL del servidor: `peticion.open('GET', 'https://jsonplaceholder.typicode.com/users')`
1 OPCIONAL: Si queremos añadir cabeceras a la petición HTTP llamaremos al método **.setRequestHeader()**. Por ejemplo si enviamos datos con POST hay que añadir la cabecera _Content-type_ que le indica al servidor en qué formato van los datos: `peticion.setRequestHeader('Content-type', 'application/x-www-form-urlencoded)`
1 Enviamos la petición al servidor con el método **.send()**. A este método se le pasa como parámetro los datos a enviar al servidor (o nada si no se envían datos, por ejemplo, en una petición GET): `peticion.send('dato1='+encodeURIComponent(dato1)+'&dato2='+encodeURIComponent(dato2))`
1 Escuchamos los enventos que se producen nuestro objeto _peticion_ para saber cuándo está disponible la respuesta del servidor

## Eventos de XMLHttpRequest
Vamos a ver alguno de los eventos que se producen en el objeto de la petición
 * **readystatechange**: se produce cada vez que cambia el estado de la petición. Cuando hay un cambio en el estado cambia el valor de la propiedad **readyState**. Sus valores posibles son:
  * 0: petición no iniciada
  * 1: establecida conexión con el servidor
  * 2: petición recibida por el servidor
  * 3: se está procesando la petición
  * 4: petición finalizada y respuesta lista 
A nosotros sólo nos interesa cuando su valor sea 4 que significa que ya están los datos. En ese momento la propiedad **status** contiene el estado de la petición HTTP (200: Ok, 404: Servidor no encontrado, 500: Error de servidor, ...) que ha devuelto el servidor. Cuando _readyState_ vale 4 y _status_ vale 200 tenemos los datos en la propiedad **responseText** (o **responseXML** si el servidor los envía en formato XML).
* **load**: se produce cuando se recibe la respuesta del servidor. Equivale a _readyState===4_. En _status_ tendremos el estado de la respuesta
* **error**: se produce si sucede algún error al procesar la petición (de red, de servidor, ...)
* **timeout**: si ha transcurrido el tiempo indicado y no se ha recibido respuesta del servidor. Podemos cambiar el tiempo por defecto modificando la propiedad **timeout** antes de enviar la petición
* **abort**: si se cancela la petición (se hace llamando al método **.abort()** de la petición)
* **loadend**: se produce siempre que termina la petición, independiantemente de si se recibe respuesta o sucede algún error (incluyendo un _timeout_ o un _abort_)

sfd sfsd
