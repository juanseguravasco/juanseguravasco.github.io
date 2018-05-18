<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
Tabla de contenidos

- [Introducción](#introducci%C3%B3n)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Vue con Laravel
Es sencillo crear una SPA completa usando Vue en el Front-end y Laravel para crear el Back-end que sirva la API.

El funcionamiento es el siguiente:
* La primera petición le llega al router de Laravel que renderiza el diseño de la SPA
* Las demás peticiones usan la API _history.pushState_ para navegar sin recargar la página y las gestiona el enrutador Vue

## Instalación
Creamos el nuevo proyecto laravel indicando la distribución `laravel-vue-spa`.
```bash
composer create-project --prefer-dist Laravel/laravel-vue-spa
```

### Saber más
* [Building a Vue SPA with Laravel](https://laravel-news.com/using-vue-router-laravel)
