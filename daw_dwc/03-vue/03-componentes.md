# Introducción
El sistema de componentes es un comcepto importante en Vue. Nuestras aplicaciones estarán compuestas de pequeños componentes reusables.

En definitiva nuestra aplicación será como un árbol de componentes con la instancia principal de Vue como raíz.
![Árbol de componentes](https://vuejs.org/images/components.png)

## Registrar un componente
Para registrarlo debemos darle un nombre y definir su plantilla (el código HTML que se insertará donde pongamos el componente). Lo hacemos en nuestro fichero JS:
```[javascript]
Vue.component('todo-item, {
  template: '<li>Cosa a hacer</li>'
})
```
El nombre de un componente puede estar el kebab-case (my-component-name) o en PascalCase (MyComponentName). Se recomienda que el nombre de un componente tenga al menos 2 palabras para evitar que pueda llamarse como alguna futura etiqueta HTML.

Ahora ya podemos usar el componente en nuestro HTML:
```[html]
<ul>
  <todo-item></todo-item>
</ul>
```
>**Resultado:**
><ul>
>  <li>Cosa a hacer</li>
></ul>

Podemos utilizar la etiqueta tal cual (_<todo-item>_) o ponerla como valor del atributo _is_:
```[html]
<ul>
  <li is="todo-item"></li>
</ul>
```
De esta forma evitamos errores de validación de HTML ya que algunos elementos sólo pueden tener determinados elementos hijos (por ejemplo los hijos de un \<ul> deben ser \<li> o los de un \<tr> deben ser \<td>).

## Parámetros: _props_
Podemos pasar parámetros a un componente anñadiendo atributos a su etiqueta:
```[html]
<ul>
  <todo-item todo="Aprender Vue"></todo-item>
</ul>
```
El parámetro lo recibimos en el componente en _props_:
```[javascript]
Vue.component('todo-item, {
  props: ['todo'],
  template: '<li>{{ todo.title }}</li>'
})
```
NOTA: si un parámetro tiene más de 1 palabra en el HTML lo pondremos en forma kebeb-case (ej.: `<todo-item :todo-elem=...>`) pero en el Javascript irá en camelCase (`Vue.component('todo-item',{ props: ['todoElem'],...})`).

>**Resultado:**
><ul>
>  <li>Aprender Vue</li>
></ul>

Lo que pasamos como parámetro a un componente se considera como _String_. Para pasar una variable o expresión JS debemos hacerlo con la directiva _v-bind_:
```[html]
<ul>
  <todo-item :todo="todos[0]"></todo-item>
</ul>
```

En nuestro caso queremos un componente _todo-item_ para cada elemento del array _todos_:
```[html]
<ul>
  <todo-item v-for="item in todos" :key="item.id" :todo="item"></todo-item>
</ul>
```
>**Resultado:**
><ul>
  >  <li>Learn JavaScript</li>
  >  <li> Learn Vue</li>
  >  <li>Play around in JSFiddle</li>
  >  <li>Build something awesome>Cosa a hacer</li>
></ul>

NOTA: al usar _v-for_ con un componente debemos indicarle en la propiedad _key_ la clave de cada elemento.

## A tener en cuenta
A la hora de definir componentes hay un par de cosa que debemos tener en cuenta

### _template_ debe contener un único elemento
El template de un componente debe tener un único elemento raíz por lo que, si queremos tener más de uno hay que englobarlos en un elemento (normalmente un <div>):

```[javascript]
// MAL
Vue.component('my-comp, {
  template: '<input id="query">
             <button id="search">Buscar</button>',
})

// BIEN
Vue.component('my-comp, {
  template: '<div>
               <input id="query">
               <button id="search">Buscar</button>
             </div>',
})
```

### _data_ debe ser una función
Un componente puede tener sus propios métodos y datos pero estos últimos no pueden devolverse directamente sino que _data_ debe ser una función:

```[javascript]
// MAL
Vue.component('my-comp, {
  data: {
    message: 'Hello',
    counter: 0
  }
})
```

```[javascript]
// BIEN
Vue.component('my-comp, {
  data(): {
    return {
      message: 'Hello',
      counter: 0
    }
  }
})
```

### Registrar un componente localmente
Un componente registrado como hemos visto es _global_ y puede usarse en cualquier instancia raíz de Vue creada posteriormente (con _new Vue()_ ) y también dentro de subcomponentes de dicha instancia.

Pero a veces queremos registrar un componente _localmente_ de forma que sólo se pueda usar localmente dentro de la instancia Vue o del subcomponente en que se registra.

En ese caso el componente a registrar se guarda en un objeto
```[javascript]
var ComponentA={ /* .... */ }
```
y se registra en cada instancia o subcomponente en que quiera usarse:
```[javascript]
// Para usarlo en la instancia raíz
new Vue({
  el: '#app',
  components: {
    'component-a': ComponentA,
  }
})

// Para usarlo en un subcomponente
var ComponentB={ 
  ...,
  components: {
    'component-a': ComponentA,
  }
}
```
Si estamos usando ES2015 (que es lo normal) loque se hace es guardar cada componente en un fichero con extensión _.vue_ e importarlo donde vaya a usarse:
```[javascript]
// fichero ComponentB.vue
import ComponentA from './ComponentA.vue'

export default { 
  ...,
  components: {
    ComponentA,
  }
}
```
