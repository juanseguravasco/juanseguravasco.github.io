# Browser Object Model (BOM)

## Introducción
Si en el tema anterior vimos cómo interactuar con la página (DOM) en este veremos cómo acceder a objetos que nos permitan interactuar con el navegador ( y Browser Object Model, BOM).

Usando los objetos BOM podemos:
* Abrir, cambiar y cerrar ventanas
* Ejecutar código en cierto tiempo (_timers_)
* Obtener información del navegador
* Ver y modificar propiedades de la pantalla
* Gestionar cookies, ...

## Timers
Permiten ejecutar código en el futuro (cuando transcurran los milisegundos indicados). Hay 2 tipos:
* `timeout(función, milisegundos)`: ejecuta la función indicada una sóla vez, cuando transcurran los milisegundos
* `setInterval(función, milisegundos)`: ejecuta la función indicada cada vez que transcurran los milisegundos, hasta que sea cancelado el _timer_. A ambas se le pueden pasar más parámetros tras los milisegundos y serán los parámetros que recibirá la función a ejecutar.

Ambas funciones devuelven un identificador que nos permitirá cancelar la ejecución del código, con:
* `clearTiemout(identificador)`
* `clearInterval(identificador)`

Ejemplo:
```javascript

```

## Objetos del BOM
Al contrario que para el DOM, no existe un estándar de BOM pero es bastante parecido en los diferentes navegadores. 

### Objeto [window](http://www.w3schools.com/jsref/obj_window.asp)
Representa la ventana del navegador y es el objeto principal. De hecho puede omitirse al llamar a sus propiedades y métodos, por ejemplo, el método `alert()` es en realidad `window.alert()`.

Sus principales propiedades y métodos son:
* `.name`: nombre de la ventana actual
* `.location`: URL de la ventana
* `.status`: valor de la barra de estado
* `.history`: array con el historial de páginas
* `.screenX`/`.screenY`: distancia del elemento a la esquina izquierda/superior pantalla
* `.outerWidth`/`.outerHeight`: ancho/alto total de la pantalla, sin contar la barra superior del navegador
* `.innerWidth`/`.innerHeight`: ancho/alto visible del documento
* `.screen.width`/`.screen.height`: ancho/alto total de la pantalla (resolución)
* `.screen.availWidth`/`.screen.availHeight`: igual pero excluyendo la barra del S.O.
* `.open(url, nombre, opciones)`: abre una nueva ventana. Devuelve el nuevo objeto ventana. Las principales opciones son:
    * `.toolbar`: si tendrá barra de herramientas
    * `.location`: si tendrá barra de dirección
    * `.directories`: si tendrá botones Adelante/Atrás
    * `.status`: si tendrá barra de estado
    * `.menubar`: si tendrá barra de menú
    * `.scrollbar`: si tendrá barras de desplazamiento
    * `.resizable`: si se puede cambiar su tamaño 
    * `.width=px`/`.height=px`: ancho/alto
    * `.left=px`/`.top=px`: posición izq/sup de la ventana
* `.opener`: ventana desde a que se abrió
* `.close()`: la cierra (pide confirmación, a menos que la hayamos abierto con open)
* `.alert()`, `.confirm()`, `.prompt()`: ya los conocemos
* `.moveTo(x,y)`: la mueve a las coord indicadas
* `.moveBy(x,y)`: la desplaza los px indicados
* `.resizeTo(x,y)`: la da el ancho y alto indicados
* `.resizeBy(x,y)`: le añade ese ancho/alto
* Otros métodos: `.back()`, `.forward()`, `.home()`, `.stop()`, `.focus()`, `.blur()`, `.find()`, `.print()`, …
NOTA: por seguridad no se puede mover una ventana fuera de la pantalla ni darle un tamaño menor de 100x100 px ni tampoco se puede mover una ventana no abierta con .open() o si tiene varias pestañas

#### Diĺogos

### Objeto [location](http://www.w3schools.com/jsref/obj_location.asp)
Contiene información sobre la URL actual del navegador y podemos modificarla. Sus principales propiedades y métodos son:

### Otros objetos
Los otros objetos que incluye BOM son:
* [document](http://www.w3schools.com/jsref/dom_obj_document.asp)
* [history](http://www.w3schools.com/jsref/obj_history.asp)
* [navigator](http://www.w3schools.com/jsref/obj_navigator.asp)
* [screen](http://www.w3schools.com/jsref/obj_screen.asp)


