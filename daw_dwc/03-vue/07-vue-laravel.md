<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
Tabla de contenidos

- [Vue con Laravel](#vue-con-laravel)
  - [Instalación](#instalaci%C3%B3n)
    - [Saber más](#saber-m%C3%A1s)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Vue con Laravel
Es sencillo crear una SPA completa usando Vue en el Front-end y Laravel para crear el Back-end que sirva la API.

El funcionamiento es el siguiente:
* La primera petición le llega al router de Laravel que renderiza el diseño de la SPA
* Las demás peticiones usan la API _history.pushState_ para navegar sin recargar la página y las gestiona el enrutador Vue

## Creación del proyecto
```bash
laravel new laravue
cd laravue
npm install
npm i -S vue-router
```

Configuramos el router de Vue en el fichero /resources/js/router.js y lo importamos en /resources/js/app.js:
```javascript
// Fichero app.js
...
import App from './views/App'
import router from './router'

const app = new Vue({
    el: '#app',
    components: {
        App
    },
    router,
});
```

Creamos el fichero /resources/js/views/App.vue:
```HTML
```

Creamos la página principal /resources/views/spa.blade.php:
```HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Vue SPA Demo</title>
</head>
<body>
    <div id="app">
        <app></app>
    </div>

    <script src="{{ mix('js/app.js') }}"></script>
</body>
</html>
```
NOTA: la línea del <meta CSRF-TOKEN> es para evitar los errores de la consola por no pasasr el token csrf.

Configuramos /routes/web.php para que sirve siempre esa página:
```php
Route::get('/{any}', 'SpaController@index')->where('any', '.*');
```

y creamos el controlador:
```bash
php artisan make:controller SpaController
```
y lo editamos:
```php
<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;

class SpaController extends Controller
{
    public function index()
    {
        return view('spa');
    }
}
```

Ahora simplemente ejecutamos en la terminal
```bash
npm run prod
```
y ya tenemos la aplicación en marcha (así se compila el javascript y se crea el fichero mix-manifest.json para que no aparezca un error de "The Mix manifest does not exist").

Para que se compilen automáticamente los cambios que hagamos en Vue ejecutamos `npm run watch-poll` en una terminal. 
 
## Crear la API
Creamos las rutas en /routes/api.php. 

## Instalación
Creamos el nuevo proyecto laravel indicando la distribución `laravel-vue-spa`.
```bash
composer create-project --prefer-dist Laravel/laravel-vue-spa
```

### Saber más
* [Building a Vue SPA with Laravel](https://laravel-news.com/using-vue-router-laravel)
