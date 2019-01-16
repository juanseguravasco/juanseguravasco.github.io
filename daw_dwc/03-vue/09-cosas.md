<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
Tabla de contenidos

- [Falta por hacer](#falta-por-hacer)
- [Usar Bootstrap](#usar-bootstrap)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Más cosas a aprender en Vue
Algunas cosas interesantes que nos pueden ser útiles en nuestros proyectos son:
* Vuetify
* Vuex
* Autenticación
* Vue-laravel / Vue-Lumen
* ServerSide Rendering

## Vuetify
Es un plugin que nos permite utilizar en Vue los elementos de Material Design. Podemos obtener toda la información sobre esta librería en [su página web](https://vuetifyjs.com/es-MX/getting-started/quick-start).

### Instalación
Vue se instala como cualquier otro plugin:
```bash
vue add vuetify
```

### Crear el layout
En **App.vue** borramos todo su contenido y lo sustituimos por el código de [layout](https://vuetifyjs.com/en/layout/pre-defined) que deseemos de Vuetify. Para ver el código pinchamos en la imagen del layout deseada y lo copiamos.

A continuación ponemos el `<router-view>` donde corresponda (en el caso del layout _Baseline_ en sustitución de la etiqueta `<v-flex>` que contiene los botones para ver el código en GitHub o Codepen.

Cada elemento del menú es una etiqueta `<v-list-tile>` dentro del `<v-navigation-drawer>`. Para modificar el menú vamos a _Vuetify -> UI components -> Navigation drawers_.

Para cada elemento que queramos añadir:
* Su icono está dentro de `<v-icon>` y para elegirlo vamos a [Material Design](https://material.io/tools/icons/?style=baseline) y elegimos el que queramos. Para modificar su aspecto vamos a _Vuetify -> UI components -> Icons_ y copiamos el código que queramos
* Para que enlace a la ruta que queramos añadimos a la etiqueta `<v-list-tile-title>` una etiqueta `<router-link :to="{ name: nombre_de_la_ruta }>`, ejemplo:
```html
<v-list-tile-title>
  <routerlink :to="{ name: 'perfil' }">Perfil</router-link>
</v-list-tile-title>
```

Respecto al _footer_ 


### Saber más
* [VuetifyJS.com](https://vuetifyjs.com/es-MX/getting-started/quick-start)
* [Vuetify Material Framework in 60 minutes](https://www.youtube.com/watch?v=GeUhmMJUFZQ)
* [Intro and Overview of Vuetify.js (Build a CRUD client with Vue.js)](https://www.youtube.com/watch?v=5GfpGaHKfyo)


## Vuex
Es un patrón de gestión de estado más una libreria que proporcionan un almacén de datos centralizado para todos los componentes de la aplicación y aseguran que los datos sólo puedan cambiarse de forma controlada. Además se integra con las _Dev tools_.

Ya vimos lo que es un _state management pattern_: un almacén donde tenemos tanto nuestros datos como los métodos que los modifican.

El flujo de datos  de una aplicación podemos verlo (de manera muy simplificada) en el siguiente esquema:

![one-way data flow](https://vuex.vuejs.org/flow.png)

El **estado** de los datos se representa en la **vista**, donde el usuario tiene herramientas que provocan **acciones** que modifican el **estado**. Pero cuando tenemos la aplicación dividida en componentes la cosa se complica porque hay varias vistas que pueden modificar los mismos datos.

Con Vuex el dicho flujo podemos verlo de la siguiente manera:

![Vuex data flow](https://vuex.vuejs.org/vuex.png)

El uso de Vuex implica mayor complejidad en nuestra aplicación por lo que es recomendable su uso en aplicaciones de tamaño medio o grande. Para aplicacioes pequeñas normalmente es suficiente con soluciones más simples como el _eventBus_ o un _store  pattern_ hecho por nosotros.

### Usar Vuex
La forma de modificar los datos del almacén de Vuex es llamando a las mutaciones que hayamos definido para dichos datos. Podemos ver un ejemplo básico en Fiddle:

<script async src="//jsfiddle.net/n9jmu5v7/1269/embed/js,html,result/"></script>

### Saber más
* [Vuex](https://vuex.vuejs.org/)
* [Cómo Construir Aplicaciones Complejas y a Gran Escala Vue.js con Vuex](https://code.tutsplus.com/es/tutorials/how-to-build-complex-large-scale-vuejs-applications-with-vuex--cms-30952)
* [Vuex for Everyone](https://vueschool.io/courses/vuex-for-everyone)
* [VueJS: Introducción a vuex](https://elabismodenull.wordpress.com/2017/05/29/vuejs-introduccion-a-vuex/)
* [Managing State in Vue.js](https://medium.com/fullstackio/managing-state-in-vue-js-23a0352b1c87)


## Vue con Laravel
Es sencillo crear una SPA completa usando Vue en el Front-end y Laravel para crear el Back-end que sirva la API.

El funcionamiento es el siguiente:
* La primera petición le llega al router de Laravel que renderiza el diseño de la SPA
* Las demás peticiones usan la API _history.pushState_ para navegar sin recargar la página y las gestiona el enrutador Vue

### Instalación
Creamos el nuevo proyecto laravel indicando la distribución `laravel-vue-spa`.
```bash
composer create-project --prefer-dist Laravel/laravel-vue-spa
```

### Saber más
* [Building a Vue SPA with Laravel](https://laravel-news.com/using-vue-router-laravel)

## Autenticación
Una parte importante de cualquier aplicación es la autenticación de usuarios. Para ver cómo gestionarla podemos consultar cualquiera de estos enlaces:
* [Authentication Best Practices for Vue](https://blog.sqreen.io/authentication-best-practices-vue/)
* [Vue Authentication And Route Handling Using Vue-router](https://scotch.io/tutorials/vue-authentication-and-route-handling-using-vue-router)

## SSR (Server Side Rendering)
Esta tecnología permite que al obtener la página un robot (haciendo `curl miURL`) no devuelva sólo la \<app> sino el HTML para que los robots la puedan indexar correctamente. 

Más info: [Server-Side Rendering](https://vuejs.org/v2/guide/ssr.html).

Explicación de qué es y cómo funciona en Angular: [Angular & SEO](http://app.getresponse.com/click.html?x=a62b&lc=BmvXkb&mc=CL&s=mh7Vjl&u=B71jy&y=T&)
