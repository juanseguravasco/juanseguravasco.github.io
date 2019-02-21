# Más cosas a aprender en Javascript

## WebSockets
WebSockets es una tecnología basada en el protocolo **ws** que permite establecer una conexión continua _full-duplex_ entre un cliente (puede ser un navegador) y un servidor. La conexión siempre la abre el cliente pero una vez abierta no se cierra por lo que el servidor puede comunicar en cualquier momento con el cliente y enviarle información.

Ejemplo:
```javascript
let exampleSocket=new WebSocket(uri);
exampleWebsocjet.onopen=function(event) {
    console.log('Se ha establecido la conexión');
}
exampleSocket.onclose=function(event) {
    console.log('Se ha cerrado la conexión');
}
exampleSocket.onerror=function(event) {
    console.log('Se ha producido un error en la conexión');
}
exampleSocket.onmessage=function(event) {
    console.log('Se ha recibido el mensaje:' + event.data);
}
```

El _uri_ de la conexión deberá usar el protocolo **ws** (o wss), no http (ej. "ws://miservidor.com/socketserver"). El evento _open_ se produce cuando la propiedad _readyState_ cambia a OPEN y el _close_ cuando cambia su valor a CLOSED. Cada vez que se reciba algo del servidor se produce el evento _message_ y en la propiedad **data** del mismo tendremos lo que se nos ha enviado.

Para enviar algo al servidor usamos el mátodo **.send**. Lo que le enviamos ex texto en formato utf-8 (o un objeto convertido a JSON):
```javascript
exampleSocket.send('Your message');
exampleSocket.send(JSON.stringify(msg));
```

También podemos enviar (y recibir) imágenes (convertidas a ArrayBuffer) o ficheros como un objeto Blob.

Para cerrar la conexión llamamos al método **.close()**:
```javascript
exampleSocket.close();
console.log('Conexión cerrada');
```

Para programar la parte del servidor podemos usar librerías que nos ayudan como [PHP-WebSockets](https://github.com/ghedipunk/PHP-WebSockets), SocketIO, ...

Las aplicaciones de esta tecnología son muchas:
* Juegos multjugador
* Aplicaciones de chat
* Actualización en tiempo real de cotizaciones de bolsa, recursos en uso o cualquier otra información
* ...

Podemos practicar con [www.websocket.org](https://www.websocket.org/echo.html) que tiene un servidor websocket que devuelve lo que le enviamos. En esta web también tenemos ejemplos de aplicaciones.

Saber más:
* [MDN: Escribiendo aplicaciones con WebSockets](https://developer.mozilla.org/es/docs/WebSockets-840092-dup/Writing_WebSocket_client_applications)
* [Carlos Azaustre: Crear chat con WebSockets](https://www.youtube.com/watch?v=ppiAvvkvAz0)

## WebComponents
Son distintas tecnologías que podemos usar (todas o alguna de ellas) para crear componentes reutilizables para nuestras páginas HTML. Las tcnologías que hay tras los Web Components son:
* [Custom Elements](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements): permite crear elementos HTML personalizados, es decir, nuevas etiquetas definidas por nosotros con funcionalidad propia
* [HTML Templates](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/template): la etiqueta `<templae>` permite definir fragmentos de código HTML que no serán renderizados y que usaremos más adelante
* [Shadow DOM](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_shadow_DOM): permite asociar un DOM oculto a un elemento
* [ES Modules](https://html.spec.whatwg.org/multipage/webappapis.html#integration-with-the-javascript-module-system): Es el estándar de ECMAScript para importar módulos Javascript.

Un WebComponent es un elemento que creamos y que tiene su propia representación (HTML) y funcionalidad (establecida con Javascript). Este elemento es reusable y compartible y se contruye sin librerías externas, sólo con HTML5, ES6 y CSS3.

Algunos ejemplos de componentes útiles que podríamos usar son:
* componente para loguearnos mediante Google, Facebook, etc
* componente que me muestre el tiempo en una ciudad
* componente para hacer un modal
* ...

Actualmente no todos los navegadores ofrecen soporte para WebComponents (de hecho el soporte es bastante pobre en la mayorái de ellos). Esto junto al hecho de que frameworks como Vue, Angular o React ofrecen soluciones con sus propios componentes han hecho que el uso de los WebComponents no acabde de despegar. Sin embargo hay lugares como [WebComponents.org](https://www.webcomponents.org/) donde podemos encontrar un catálogo de componentes hechos y que podemos usar en nuestras páginas.

