# Introducción
Ya hemos visto que podemos pasar parámetros a un componente mediante _props_. Esto permite la comunicación de padres a hijos, pero queda por resolver cómo comunicarse los hijos con sus padres para informarles de cambios o eventos producidos y cómo comunicarse otros componentes entre sí.

Nos podemos encontrar las siguientes situaciones:
* Comunicación de padres a hijos: _props_
* Comunicación de hijos a padres: emitir eventos
* Comunicación entre otros componentes: crear un componente que haga de _bus_ de comunicaciones
* Comunicación más compleja: Vuex

# _props_
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
