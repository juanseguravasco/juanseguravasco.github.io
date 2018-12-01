<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
Tabla de contenidos

- [Falta por hacer](#falta-por-hacer)
- [Usar Bootstrap](#usar-bootstrap)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Falta por hacer
Además de lo que hay abajo:
* validar formularios con subcomponentes con veeValidator
* Vue-laravel
* Vuex: https://medium.com/fullstackio/managing-state-in-vue-js-23a0352b1c87
* ServerSide Rendering: al obtener la página un robot (curl miURL) no devuelve sólo la <app> sino el HTML para que los robots la puedan ndexar correctamente. Más info: https://vuejs.org/v2/guide/ssr.html. Explicación de qué es y cómo funciona en Angular: http://app.getresponse.com/click.html?x=a62b&lc=BmvXkb&mc=CL&s=mh7Vjl&u=B71jy&y=T&

y poner más ejempls y ejerciccios de todo

# Usar Bootstrap
Mirar: https://www.sitepoint.com/bootstrap-vue-js-bootstrap-vue/

Se puede vincular el CSS directamente en index.html
o
1. Bajar las dependencias
```[bash]
npm install --save bootstrap-vue
npm install --save bootstrap
npm install --save-dev vue-style-loader
```
1. en **main.js** añadir:
```[jasvascript]
import Vue from 'vue';
/* ( there may be other imports here ) */
import BootstrapVue from 'bootstrap-vue/dist/bootstrap-vue.esm';
import 'bootstrap-vue/dist/bootstrap-vue.css';
import 'bootstrap/dist/css/bootstrap.css';
/* ( there may be other imports here ) */

Vue.use(BootstrapVue);
```
