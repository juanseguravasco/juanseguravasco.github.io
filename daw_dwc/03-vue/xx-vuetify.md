# Vuetify

## Instalación
Instalamos la aplicación Vue 
```bash
vue init webpack intro-vuetify
cd intro-vuetify
npm install
npm install vuetify -S
```

En **main.js**:
```javascript
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

Vue.use(Vuetify)
```

En **index.js**:
```html
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
```

## Crear el layout
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


### Fuentes
* [Vuetify Material Framework in 60 minutes](https://www.youtube.com/watch?v=GeUhmMJUFZQ)
* [Intro and Overview of Vuetify.js (Build a CRUD client with Vue.js)](https://www.youtube.com/watch?v=5GfpGaHKfyo)