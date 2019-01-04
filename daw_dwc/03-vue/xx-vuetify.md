<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Vuetify](#vuetify)
  - [Instalación](#instalaci%C3%B3n)
  - [Crear el layout](#crear-el-layout)
    - [Fuentes](#fuentes)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Vuetify
Podemos obtener toda la información sobre esta librería en [su página web](https://vuetifyjs.com/es-MX/getting-started/quick-start).

## Instalación
Vue se instala como cualquier otro plugin:
```bash
vue add vuetify
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
* [VuetifyJS.com](https://vuetifyjs.com/es-MX/getting-started/quick-start)
* [Vuetify Material Framework in 60 minutes](https://www.youtube.com/watch?v=GeUhmMJUFZQ)
* [Intro and Overview of Vuetify.js (Build a CRUD client with Vue.js)](https://www.youtube.com/watch?v=5GfpGaHKfyo)
