# Eventos

## Introducción
Nos permiten detectar acciones que realiza el usuario o cambios que suceden en la página y reaccionar en respuesta a ellas. Existen muchos eventos diferentes (podéis ver la lista en [w3schools](https://www.w3schools.com/jsref/dom_obj_event.asp)) aunque nosotros nos centraremos en los más comunes.

## Escuchadores de eventos
Podemos ejecutar código cuando se produce un evento (por ejemplo el evento _click_ del ratón) asociando al mismo una función. Hay varias formas de hacerlo.

### Forma clásica
La forma tradicional (no recomendada) es añadir el elemento HTML un atributo que se llama como el evento precedido de _on_ al que le indicamos el código a ejecutar:
```html
<button id="acepto" onclick="alert('Se ha aceptado')">Aceptar</button>
```

Una mejora es sacar el código Javascript del HTML:

<script async src="//jsfiddle.net/juansegura/L4z3jd87/embed/js,html,result/"></script>

### Event listeners
La forma recomendada de hacerlo es usando escuchadores de eventos. El método `addEventListener` recibe como primer parámetro el nombre del evento a escuchar y como segundo parámetro la función a ejecutar cuando se produzca:

<script async src="//jsfiddle.net/juansegura/L4z3jd87/embed/js,html,result/"></script>

Podemos poner varios escuchadores para el mismo evento y se ejecutarán todos ellos. Para eliminar un escuchador se usa el método `removeEventListener`.

## Tipos de eventos
Según qué o dónde se produce un evento estos se clasifican en:

### Eventos de página
Se producen en el documento HTML, normalmente en el BODY:
* **load**: se produce cuando termina de cargarse la página (cuando ya está construido el árbol DOM). Es útil para hacer acciones que requieran que el DOM esté cargado como modificar la página o poner escuchadores de eventos
* **unload**: al destruirse el documento (ej. cerrar)
* **beforeUnload**: antes de destruirse (podríamos mostrar un mensaje de confirmación)
* **resize**: si cambia el tamaño del documento (porque se redimensiona la ventana)

### Eventos de ratón
Los produce el usuario con el ratón:
* **click** / **dblclick**: cuando se hace click/doble click sobre un elemento
* **mousedown** / **mouseup**: al pulsar/soltar cualquier botón del ratón
* **mouseenter** / **mouseleave**: cuando el puntero del ratón entra/sale del elemento (tb. podemos usar mouseover/mouseout)
* **mousemove**: se produce continuamente mientras el puntero se mueva dentro del elemento

### Eventos de teclado
Los produce el usuario al usar el teclado:
* **keydown**: se produce al presionar una tecla y se repite continuamente si la tecla se mantiene pulsada
* **keyup**: cuando se deja de presionar la tecla
* **keypress**: acción de pulsar y soltar (sólo se produce en las teclas alfanuméricas)

El orden de secuencia de los eventos es:
_keyDown_ -> _keyPress_ -> _keyUp_

### Eventos de toque
Se producen al usar una pantalla táctil:
* **touchstart**: se produce cuando se detecta un toque en la pantalla táctil
* **touchend**: cuando se deja de pulsar la pantalla táctil
* **touchmove**: cuando un dedo es desplazado a través de la pantalla
* **touchcancel**: cuando se interrumpe un evento táctil.

### Eventos de formulario
Se producen en los formularios:
* **focus** / **blur**: al obtener/perder el foco el elemento
* **change**: al perder el foco un \<input> o \<textarea> si ha cambiado su contenido o al cambiar de valor un \<select> o un \<checkbox>
* **input**: al cambiar el valor de un \<imput> o \<textarea> (se produce cada vez que escribimos una letra es estos elementos)
* **select**: al cambiar el valor de un \<select> o al seleccionar texto de un \<imput> o \<textarea>
* **submit** / **reset**: al enviar/recargar un formulario

## Los objetos _this_ y _event_
Al producirse un evento se generan automáticamente en su función manejadora 2 objetos:
* **this**: hace referencia al elemento sobre el que se ha producid el evento
* **event**: es un objeto cin propiedades y métodos que nos dan información sobre el evento:
    * **.type**: qué evento se ha producido (click, submit, keyDown, ...)
    * **.target**: el elemento que lanza el evento (normalmente el mismo que _this_)
    * **cancelable**: si el evento puede cancelarse. En caso afirmativo se puede llamar a **event.preventDefault()** para cancelarlo
    * **.preventDefault()**: si un evento tiene un escuchador asociado se ejecuta el código de dicho escuchador y después el navegador realiza la acción que correspondería por defecto al evento si no tuviera escuchador (por ejemplo un escuchador del evento _click_ sobre un hiperenlace harái que se ejecute su código y después se saltará a la página indicada en el _href_ del hiperenlace). Este método cancela la acción por defecto del navegador para el evento. Por ejemplo si el evento era el _submit_ de un formulario éste no se enviará o si era un _click_ sobre un hiperenlace no se irá a la página indicada en él.
    * **.stopPropagation**: un evento se produce sobre un elemento y todos su padres. Por ejemplo si hacemos click en un \<span> que está en un \<p> que está en un \<div> que está en el BODY el evento se va propagando por todos estos elementos y saltarían los escuchadores asociados a todos ellos. Si alguno llama a este mátodo el evento no se propagará a los demás elementos padre.
    * dependiento del tipo de evento tendrá más propiedades:
        * eventos de ratón:
            * **.button**: qué botón del ratón se ha pulsado (0: izq, 1: rueda; 2: dcho).
            * **.clientX** / **.clientY**: las coordenadas del ratón respecto a la ventana cuando se produjo el evento
            * **.pageX** / **.pageY**: las coordenadas del ratón respecto al documento (si se ha hecho un scroll será el clientX/Y más el scroll)
            * **.screenX** / **.screenY**: las corrdenadas del ratón respecto a la pantalla
            * **.detail**: si se ha hecho click, doble click o triple click
        * eventos de teclado
y muchas más: .button (botón del ratón pulsado), .which (código de la tecla pulsada), ...

