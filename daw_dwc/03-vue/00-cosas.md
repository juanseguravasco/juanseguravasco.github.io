# Usar Bootstrap
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
