<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
Tabla de contenidos

- [Comunicación entre componentes](#comunicaci%C3%B3n-entre-componentes)
  - [_props_](#_props_)
    - [No cambiar el valor de una _prop_](#no-cambiar-el-valor-de-una-_prop_)
    - [Validación de _props_](#validaci%C3%B3n-de-_props_)
  - [Emitir eventos](#emitir-eventos)
  - [Bus de comunicaciones](#bus-de-comunicaciones)
  - [Vuex](#vuex)
  - [Otras formas de comunicarse](#otras-formas-de-comunicarse)
- [Aplicación de ejemplo](#aplicaci%C3%B3n-de-ejemplo)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Comunicación entre componentes
Ya hemos visto que podemos pasar parámetros a un componente mediante _props_. Esto permite la comunicación de padres a hijos, pero queda por resolver cómo comunicarse los hijos con sus padres para informarles de cambios o eventos producidos y cómo comunicarse otros componentes entre sí.

Nos podemos encontrar las siguientes situaciones:
* Comunicación de padres a hijos: _props_
* Comunicación de hijos a padres: emitir eventos
* Comunicación entre otros componentes: crear un componente que haga de _bus_ de comunicaciones
* Comunicación más compleja: Vuex

## Props
Ya hemos visto que permiten pasar parámetros del padre al componente hijo. Si el valor del parámetro cambia en el padre automáticamente se reflejan esos cambos en el hijo.

Cualquier parámetro que pasemos sin _v-bind_ se considera texto. Si queremos pasar un número, booleano, array u objeto hemos de pasarlo con _v-bind_ igual que hacemos con las variables para que no se considere texto:
```html
<ul>
  <todo-item todo="Aprender Vue" :done="false" ></todo-item>
</ul>
```

Podemos pasar varios parámetros en un atributo _v-bind_ sin nombre:
```html
<ul>
  <todo-item v-bind="{ todo: 'Aprender Vue, done: false }" ></todo-item>
</ul>
```
y en e componente se reciben sus propiedades separadamente:
```javascript
Vue.component('todo-item, {
  props: ['todo', 'done'],
  ...
```

### No cambiar el valor de una prop
Al pasar un parámetro mediante una _prop_ su valor se mantendrá actualizado en el hijo si su valor cambiara en el padre, pero no al revés por lo que no debemos cambiar su valor en el componente hijo.

Si debemos cambiar su valor porque lo que nos pasan es sólo un valor inicial asignaremos el parámetro a otra variable:
```javascript
props: ['initialValue'],
data(): {
  return {
    myValue: this.initialValue
  }
}
```

Si debemos darle determinado formato también lo haremos sobre otra variable que es con la que trabajaremos:
```javascript
props: ['cadenaSinFormato'],
computed(): {
  cadenaFormateada() {
    return this.cadenaSinFormato.trim().toLowerCase();
  }
}
```

**OJO**: Si el parámetro es un objeto o un array éste se pasa por referencia por lo que si lo cambiamos en el componente hijo  afectará al padre, lo que debemos evitar.

### Validación de props
Al pasar un parámetro podemos indicar algunas cosas como:
* **type**: su tipo (String, Boolean, Number, Object, ...). Puede ser un array con varios tipos: `type: [Boolean, Number]`
* **default**: su valor por defecto si no se pasa ese parámetro
* **required**: si es o no obligatorio
* e incluso una función para validaciones más complejas

Ejemplos:
```javascript
props: {
  prop1: {
    type: String,
    required: true
  },
  prop2: {
    type: [Boolean, Number],
    default: false
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

## Emitir eventos
Si un componente hijo debe pasarle un dato a su padre o informarle de algo puede emitir un evento que el padre capturará y tratará convenientemente. Para emitir el evento el hijo hace:
```javascript
  this.$emit('nombreEv', parametro);
```

El padre debe capturar el evento como cualquier otro. En su HTML hará:
```html
<my-component @nombreEv="fnManejadora"
...
```

y en su JS tendrá la función para manejar ese evento:
```javascript
  ...
  methods: {
    fnManejadora(param) {
      ...
    },
  }
  ...
```

El componente hijo puede emitir cualquiera de los eventos estàndar de JS ('click', 'change', ...) o un evento personalizado ('cambiado', ...).

También se puede "sincronizar" un parámetro pasado por el padre para que se actualice si se modifica en el hijo con el modificador _.sync_ pero no es muy recomendable porque hace el código más difícil de mantener:
```html
<ul>
  <todo-item todo="Aprender Vue" :done.sync="false" ></todo-item>
</ul>
```
Si cambia el valor de _done_ en el hijo también cambiará en el padre.

## Bus de comunicaciones
Si queremos pasar información entre varios componentes que no tienen por qué ser padres/hijos podemos crear un componente que haga de bus y que lo incluiremos en cada componente que queramos comunicar:

Para crear el objeto que gestione la comunicación entre componentes haremos:
```javascript
var EventBus = new Vue;
```
En cada componente que queramos que escuche eventos de ese bus importamos el componente y creamos un escuchador en el hook _created_:
```javascript
created() {
    EventBus.$on('nombreEv', function(param) {
        …
    })
```
Cada componente que queramos que emita al bus deberá también tener importado el _EventBus_. Para emitir, en el método del componente que queramos lanzamos el evento con:
```javascript
EventBus.$emit('nombreEv', param)
```

## Vuex
Es un patrón y una librería para gestionar los estados en una aplicación Vue. Ofrece un almacenamiento centralizado para todos los componentes con unas reglas para asegurar que un estado sólo cambia de determinada manera.

Es el método a utilizar en aplicaciones medias y grandes y lo veremos con más detalle más adelante.

## Otras formas de comunicarse

* slots
* .native
* v-model de componentes

# Aplicación de ejemplo
Vamos a hacer que funcione la aplicación que separamos en componentes.

En primer lugar vamos a darle funcionalidad al botón de borrar toda la lista. En la función manejadora del componente sustituimos el _alert_ por
```javascript
this.$emit('delAll');
```
Ahora en el _template_ del componente padre capturaremos el evento _delAll_ (podríamos haber emitido también un 'click') y llamamos a la función que borrará toda la lista.

Con el botón de añadir haremos lo mismo pero en este caso al emitir el evento le pasaremos el texto a añadir:
```javascript
this.$emit('newl', this.newTodo);
```
Y la función manejadora lo recibe como parámetro (pero no se pone en el HTML):
```javascript
addTodo(title) {
  this.todos.push({title: title, done: false});
},
```

Lo mismo hacemos con el _dblclick_ sobre cada elemento de la lista para borrarlos.

Por último vemos que en el checkbos del componente _todo-item_ estamos modificando el valor de un parámetro (cambiamos el _done_ de la tarea). Esto funciona porque lo que nos están pasando es un objeto (que se pasa por referencia) y no las propiedades independientemente (que se pasarían por copia) pero no debemos hacerlo así.

Para evitarlo cambiamos el _v-model_ que es bidireccional (al modificar el checkbox se modifica la propiedad _done_) por un _v-bind_ es es unidireccional más una función que avisará al componente padre al cambiar el valor del checkbox para que cambie el valor de la tarea.

**Solución**:
<script async src="//jsfiddle.net/juansegura/u2joasts/embed/"></script>
