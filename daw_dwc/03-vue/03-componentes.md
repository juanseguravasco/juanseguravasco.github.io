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
**NOTA**: Se recomienda que el nombre de un componente tenga al menos 2 palabras para evitar que pueda llamarse como alguna futura etiqueta HTML.

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

## Parámetros: _props_
Podemos pasar parámetros a un componente con la directiva _v-bind_:
```[html]
<ul>
  <todo-item :todo="'Aprender Vue'"></todo-item>
</ul>
```
En nuestro caso queremos un componente _todo-item_ para cada elemento del array _todos_:
```[html]
<ul>
  <todo-item v-for="item in todos" :key="item.id" :todo="elem"></todo-item>
</ul>
```

NOTA: al usar _v-for_ con un componente debemos indicarle en la propiedad _key_ la clave de cada elemento.

El parámetro lo recibimos en el componente en _props_:
```[javascript]
Vue.component('todo-item, {
  props: ['ìtem'],
  template: '<li>{{ item.title }}</li>'
})
```
NOTA: si un parámetro tiene más de 1 palabra en el HTML lo pondremos en forma kebeb-case (ej.: `<todo-item :todo-elem=...>`) pero en el Javascript irá en camelCase (`Vue.component('todo-item',{ props: ['todoElem'],...})`).


### Validación de _props_
Al pasar un parámetro podemos indicar algunas cosas como su tipo, su valor por defecto si no se pasa, si es o no obligatorio e incluso una función para validaciones más complejas. Ej.:
```[javascript]
props: {
  prop1: {
    type: String,
    required: true
  },
  prop2: {
    type: Number,
    default: 100
  },
  prop3: {
    type: Object,
    default(): { return {message: 'Hola'} }   # Si es un objeto o array _default_ debe devolver el valor
  },
  prop4: {
    validator(value) {
      return ...                # Si devuelve *true* será válido
    }
  }
```
## _data_ debe ser una función
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

