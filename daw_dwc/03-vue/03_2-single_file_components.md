<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
Tabla de contenidos

- [Single File Components](#single-file-components)
  - [\<template>](#%5Ctemplate)
  - [\<script>](#%5Cscript)
  - [\<style>](#%5Cstyle)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Single File Components
Declarar los componentes como hemos visto con `Vue.component()` en el fichero JS de la instancia genera varios problemas:
* Los nombres de los componentes deben ser únicos
* El HTML del template está en ese fichero en medio del JS lo que lo hace menos legible y el editor no lo resalta adecuadamente (ya que espera encontrar códgo JS no HTML)
* El HTML y el JS del componente están juntos pero no su CSS
* No podemos usar fácilmente herramientas para convertir SCSS a CSS, ES2015 a ES5, etc

Por tanto eso puede ser adecuado para proyectos pequeños pero no lo es cuando estos enpiezan a crecer.

La solución es guardar cada componente en un único fichero con extensión **.vue** que contendrá 3 secciones:
* \<template>: contiene todo el HTML del componente
* \<script>: con el JS del mismo
* \<style>: donde pondremos el CSS del componente
  
Aunque esto va contra la norma de tener el HTML, JS y CSS en ficheros separados en realidad están separados en diferentes secciones y todo junto en un único fichero con todo lo que necesita el componente.

La mayoría de editores soportan lestos ficheros (directamente o instalándoles algún plugin) por lo que el resaltado de las diferentes partes es correcto. Además con **vue-cli** podemos integrar fácilmente _Webpack_ de forma que podemos usar ES2015 y los preprocesadores más comunes (SASS, Pug/Jade, Stylus, ...) ya se se traducirá automáticamente a ES5, HTML5 y CSS3.

Vamos a ver cómo sería el fichero **TodoList.vue** con el componente _todo-list_ de la aplicación anterior.
## \<template>
Aquí incluiremos el HTML que sustituirá a la etiqueta del componente. Recuerda que dentro sólo puede haber un único elemento HTML (si queremos poner más de uno los incluiremos en otro que los englobe).
```[html
  <div>
    <h2>{{ title }}</h2>
    <ul>
        <todo-item 
          v-for="(item,index) in todos" 
          :key="item.id"
          :todo="item"
          @delItem="delTodo(index)"
          @doneChanged="changeTodo(index)">
        </todo-item>
    </ul>
    <add-item @newItem="addTodo"></add-item>
    <br>
    <del-all @delAll="delTodos"></del-all>
  </div>
```

## \<script>
Aquí definimos el componente. Será un objeto que exportaremos con sus diferentes propiedades. Si utiliza subcomponentes hay que importarlos antes y registrarlos:
```[javascript]
import TodoItem from './TodoItem.vue'
import AddItem from './AddItem.vue'
import DelAll from './DelAll.vue'

export default {
  name: 'todo-list',
  components: {
    'todo-item': TodoItem,
    'add-item': AddItem,
    'del-al': DelAll
  },
  props: ['title'],
  data() {
    return {
      todos: []
    }
  },		
  methods: {
    ...
  },
}
```
Entre las propiedades que podemos incluir están:
* name: el nombre del componente. Sólo es obligatorio en caso de componentes recursivos (si el componente se usará en otro componente al registrarlo allí le daremos el nombre que usaremos como etiqueta para el mismo y este se ignora)
* components: aquí registramos componentes hijos que queramos usar. Ponemos el nombre que le daremos y el objeto que lo contiene (antes debemos haber importado dicho objeto). En el HTML usaremos como etiqueta el nombre con que lo registramos aquí
* props: donde registramos los parámetros que nos pasa el componente padre
* data: función que devuelve un objeto con todas las variables del componente
* methods: objeto con los métodos del componente
* computed: aquí pondremos las propiedades calculadas del componente
* created(), mounted(), ...: funciones hook que se ejecutarán al crearse el componente, al montarse, ...

## \<style>
Aquí pondremos estilos CSS que se aplicarán al componente
```[CSS]
body {
  background: #20262E;
  padding: 20px;
  font-family: Helvetica;
}

#app {
  background: #fff;
  border-radius: 4px;
  padding: 20px;
  transition: all 0.2s;
}

li {
  margin: 8px 0;
}

h2 {
  font-weight: bold;
  margin-bottom: 15px;
}

del {
  color: rgba(0, 0, 0, 0.3);
}
```
