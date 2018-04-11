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

Esta directiva se usa mucho así que se puede abreviar con '@'. El código equivalente sería:
```[hTML]
<button @click="delTodos">
```

