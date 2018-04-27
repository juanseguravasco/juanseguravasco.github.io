# Introducción
Ya hemos visto que podemos pasar parámetros a un componente mediante _props_. Esto permite la comunicación de padres a hijos, pero queda por resolver cómo comunicarse los hijos con sus padres para informarles de cambios o eventos producidos y cómo comunicarse otros componentes entre sí.

Nos podemos encontrar las siguientes situaciones:
* Comunicación de padres a hijos: _props_
* Comunicación de hijos a padres: emitir eventos
* Comunicación entre otros componentes: crear un componente que haga de _bus_ de comunicaciones
* Comunicación más compleja: Vuex

## _props_
Ya hems visto que permiten pasar parámetros del padre al componente hijo. Si el valor del parámetro cambia en el padre automáticamente se reflejan esos cambos en el hijo.

Cualquier parámetro que pasemos sin _v-bind_ se considera texto. Si queremos pasar un número, booleano, array u objeto hemos de pasarlo con _v-bind_ igual que hacemos con las variables para que no se considere texto:
```[html]
<ul>
  <todo-item todo="Aprender Vue" :done="false" ></todo-item>
</ul>
```

Podemos pasar varios parámetros en un atributo _v-bind_ sin nombre:
```[html]
<ul>
  <todo-item v-bind="{ todo: 'Aprender Vue, done: false }" ></todo-item>
</ul>
```
y en e componente se reciben sus propiedades separadamente:
```[javascript]
Vue.component('todo-item, {
  props: ['todo', 'done'],
  ...
```

### No cambiar el valor de una _prop_
Al pasar un parámetro mediante una _prop_ su valor se mantendrá actualizado en el hijo si su valor cambiara en el padre, pero no al revés por lo que no debemos cambiar su valor en el componente hijo.

Si debemos cambiar su valor porque lo que nos pasan es sólo un valor inicial asignaremos el parámetro a otra variable:
```[javascript]
props: ['initialValue'],
data(): {
  return {
    myValue: this.initialValue
  }
}
```

Si debemos darle determinado formato también lo haremos sobre otra variable que es con la que trabajaremos:
```[javascript]
props: ['cadenaSinFormato'],
computed(): {
  cadenaFormateada() {
    return this.cadenaSinFormato.trim().toLowerCase();
  }
}
```

**OJO**: Si el parámetro es un objeto o un array éste se pasa por referencia por lo que si lo cambiamos en el componente hijo  afectará al padre, lo que debemos evitar.

### Validación de _props_
Al pasar un parámetro podemos indicar algunas cosas como su tipo, su valor por defecto si no se pasa, si es o no obligatorio e incluso una función para validaciones más complejas. Ej.:
```[javascript]
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
```[javascript]
  this.$emit('nombreEv', parametro);
```

El padre debe capturar el evento como cualquier otro. En su HTML hará:
```[html]
<my-component @nombreEv="fnManejadora"
...
```

y en su JS tendrá la función para manejar ese evento:
```[javascript]
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
```[html]
<ul>
  <todo-item todo="Aprender Vue" :done.sync="false" ></todo-item>
</ul>
```
Si cambia el valor de _done_ en el hijo también cambiará en el padre.

## Bus de comunicaciones
Si queremos pasar información entre varios componentes que no tienen por qué ser padres/hijos podemos crear un componente que haga de bus y que lo incluiremos en cada componente que queramos comunicar:

Para crear el objeto que gestione la comunicación entre componentes haremos:
```[javascript]
var EventBus = new Vue;
```
En cada componente que queramos que escuche eventos de ese bus importamos el componente y creamos un escuchador en el hook _created_:
```[javascript]
created() {
    EventBus.$on('nombreEv', function(param) {
        …
    })
```
Cada componente que queramos que emita al bus deberá también tener importado el _EventBus_. Para emitir, en el método del componente que queramos lanzamos el evento con:
```[javascript]
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

En primer lugar vemos que en el componente _todo-item_ estamos modificando el valor de un parámetro (cambiamos el _done_ de la tarea). Esto funciona porque lo que nos están pasando es un objeto (que se pasa por referencia) y no las propiedades independientemente (que se pasarían por copia) pero no debemos hacerlo así.

En su lugar interceptaremos el cambio en el checkbox e informaremos del mismo al componente padre (_todo-list_) emitiendo un evento.
