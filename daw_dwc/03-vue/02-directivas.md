# Directivas básicas
Vamos a ver algunas de las directivas básicas que incorpora Vue:
* `v-model`: permite enlazar un input a una variable (la hemos visto en el capítulo anterior)
* `v-if`: renderiza o no el elemento que la contiene en función de una condición
* `v-for`: repite un elemento HTML para cada elemento de un array
* `v-on`: para gesionar eventos

## Condicionales: v-if
Esta directiva permite renderizar o no un elemento HTML en función de una variable o expresión.

<script async src="//jsfiddle.net/juansegura/84jq5jbg/4/embed/js,html,result/"></script>

El checkbox está enlazado a la variable _marcado_ (a la que al inicio le hemos dado el valor true, por eso aparece marcado por defecto) y los párrafos se muestran o no en función del valor de dicha variable.

La directiva v-else es opcional (puede haber sólo un v-if).

## Bucles: v-for
Esta directiva repite el elemento HTML en que se encuentra una vez por cada elemento del array al que se enlaza.

<script async src="//jsfiddle.net/juansegura/o6bj81s3/4/embed/js,html,result/"></script>

La directiva v-for recorre el array _todos_ y para cada elemento del array crea una etiqueta <li> y carga dicho elemento en la variable _elem_ a la que podemos acceder dentro del <li>. 
  
## Eventos: v-on
Esta directiva captura un evento y ejecuta un método como respuesta al mismo.

<script async src="//jsfiddle.net/juansegura/255u8f1j/embed/js,html,result/"></script>

El evento que queremos capturar se pone tras ':' y se indica el método que se ejecutará.

Fijaos en el método _delTodos()_ que para hacer referencia desde el objeti Vue a alguna variable o método se le antepone *this.*

Esta directiva se usa mucho así que se puede abreviar con '@'. El código equivalente sería:
```[hTML]
<button @click="delTodos">
```

## Ejemplo de aplicación
Vamos a hacer una aplicación para gestionar una lista de cosas a hacer. Cada cosa a hacer tiene un título y puede estar hecha o no.

Debe aparecer la lista de cosas a hacer con:
* un checkbox para cada cosa que nos indica si está o no hecha (y que podemos marcar/desmarcar para cambiar su estado)
* el título de la cosa a hacer, que aparecerá tachado si su estado es que ya está hecha

Además queremos que:
* al hacer doble click en una cosa a hacer debe borrarse de la lista
* bajo la lista aparecerá un input con un botón para añadir nuevas cosas a la lista. Sólo se añade si hemos introducido texto y su estado al añadirla será de NO hecha
* debajo tendremos un botón que borrará toda la lista de cosas a hacer tras pedir confirmación al usuario

*Solución*
<script async src="//jsfiddle.net/juansegura/qfbtewhe/embed/js,html,result/"></script>

Cosas a comentar:
* *HTML* 
  * línea 4: la directiva v-for además de crear una variable con el elemento crea otra con su posición dentro del array que usaremos para borrarla
  * línea 4: al método que llamamos al producirse el evento _dblclick_ le pasamos el índice de dicho elemento en el array de cosas a hacer
  * línea 7: enlazamos cada checkbox con la propiedad _done_ del elemento de forma que al marcar al checkbox la propiedad valdrá *true* y al desmarcarlo valdrá *false*
  * líneas 9 a 14: para mostrar un elemento no hecho usamos un span y para mostrar uno hecho un del para que aparezca tachado
  * línea 18: el input lo enlazamos a una nueva variable, _newTodo_, donde guardaremos lo que se escriba
* *Javascript* 
  * línea 4: creamos la nueva variable _newTodo_ para guardar el título de la nueva cosa a añadir. Lo inicializamos a una cadena vacía y así el input estará vacío de entrada
  * línea 13: delTodo recibe como parámetro el índice del elemento a borrar así que sólo tiene que hacer un splice al array
  * línea 16: addTodo añade al array un nuevo elemento con el texto que hay en el input y después vacía dicho texto
