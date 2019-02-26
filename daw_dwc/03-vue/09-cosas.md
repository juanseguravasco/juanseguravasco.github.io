# Siguientes cosas a aprender en Vue
Algunas cosas interesantes que nos pueden ser útiles en nuestros proyectos son:
* [Vuetify](#Vuetify)
* [Vuex](#vuex)
* [Vue con Laravel / con Lumen](#vue-con-laravel)
* [Autenticación](#autenticaci%C3%B3n)
* [ServerSide Rendering](#ssr-server-side-rendering)

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

El flujo de datos de una aplicación podemos verlo (de manera muy simplificada) en el siguiente esquema:

![one-way data flow](https://vuex.vuejs.org/flow.png)

Los componentes de Vue llaman a una _Acción_ (mediante _Dispatch_) que ejecutará un proceso asíncrono (por ejemplo una petición a una API). Cuando se resuelve la acción se ejecuta un _Commit_ que produce una _Mutación_ que muta el _Estado_ de la aplicación por lo que se renderiza el componente para mostrar el nuevo estado. En el estado almacenaremos tanto datos (accesibles desde cualquier componente) como métodos que se utilicen en más de un componente.

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

### Creación del proyecto
```bash
laravel new laravue
cd laravue
npm install
npm i -S vue-router
```

### Configuramos el proyecto en Vue
Configuramos el router de Vue en un nuevo fichero JS (por ejemplo **/resources/js/router.js**) y lo importamos en el fichero principal, **/resources/js/app.js** (el equivalente al **main.js** de un proyecto con _vue-cli_):
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

Creamos el fichero **/resources/js/App.vue** que será el equivalente al **App.vue** de los proyectos _vue-cli_:
```HTML
<template>
    <div>
        <h1>Vue Router Demo App</h1>

        <p>
            <router-link to="/">Home</router-link>
            ...
            <router-link to="/about">Sobre nosotros...</router-link>
        </p>

        <div class="container">
            <router-view></router-view>
        </div>
    </div>
</template>
```

### Configuramos Laravel
Creamos la vista principal en **/resources/views/spa.blade.php**:
```HTML
<!DOCTYPE html>
<html lang="{{ str_replace('_','-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
NOTA: la línea del _\<meta CSRF-TOKEN>_ es para evitar los errores de la consola por no pasar el token csrf.

Configuramos **/routes/web.php** para que sirva siempre esa página:
```php
Route::get('/{any}', 'SpaController@index')->where('any', '.*');
```

para lo que creamos el controlador:
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

### Compilamos Vue
Ahora simplemente ejecutamos en la terminal
```bash
npm run dev
```
y ya tenemos la aplicación en marcha. Si aparece un error de _"The Mix manifest does not exist"_ ejecutaremos `npm run prod`  que crea el fichero _mix-manifest.json_.

Para que se compilen automáticamente los cambios que vayamos haciendo en Vue mientras desarrollamos el proyecto ejecutamos `npm run watch-poll` en una terminal. 

### Creamos la API
Para obtener datos de una API debemos en primer lugar crear la ruta en **/routes/api.php**:
```php
Route::namespace('Api')->group(function () {
    Route::get('/alumnos', 'AlumnosController@index');
});
```

Esto nos crea sólo la ruta para el verbo GET. Una opción mejor es crear todas las rutas del recurso con:
```php
Route::resource('alumnos',’AlumnosController’,['only'=>['index','store','show','update','destroy' ]]);
```
La opción _only_ es opcional y permite restringir las rutas que se crearán para que no se muestren las que no utilizaremos (podemos comprobarlo con un `php artisan route:list`).

Otra opción es usar `apiResources` que crea sólo funciones para los métodos API:
```php
Route::apiResource('alumnos',’AlumnosController’);
```

También podemos crear las rutas para varios controladores a la vez con `resources` en vez de `resource`:
```php
Route::resources(
  [
    'alumnos' => 'Api\AlumnosController',
    'profes' => 'Api\ProfesoresController',
  ],
  ['only'=>['index','store','show','update','destroy' ]]
);
```


Luego creamos el controlador y el recurso:
```php
php artisan make:controller Api/AlumnosController --api
```
La opción `--resource` (o `-r`) crea automáticamente los puntos de entrada para los métodos indicados. La opción `--api` es igual pero no crea funciones para los métodos _create_ ni _edit_.

y el recurso:
```php
php artisan make:resource AlumnoResource
```
Un recurso es un modelo que se debe transformar a un objeto JSON (lo que necesitamos en una API).

y editamos el controlador:
```php
<?php

namespace App\Http\Controllers\Api;

use App\Alumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\AlumnoResource;

class AlumnosController extends Controller {
    public function index()  {
        return AlumnoResource::collection(Alumno::paginate(10));
        // Esto devuelve, además del data información para paginar la salida

        // lo anterior equivaldría, sin usar el recurso, a
        $alumnos=Alumno::all()->toArray();
        return response()->json($alumnos);        
    }

    public function show($id)  {
       return new AlumnoResource(Alumno::find($id));
    }
    
    public function store(Request $request)  {
    
        $alumno = Alumno::create([
            'alumno_id' => $request->alumno()->id,
            'nombre' => $request->nombre,
            'apellidos' => $request->apellidos,
            ...
        ]);

      return new AlumnoResource($alumno);
    }
}
```


 
### Saber más
* [Building a Vue SPA with Laravel](https://laravel-news.com/using-vue-router-laravel)
* [Laravel 5.7 + Vue + Vue Router = SPA](https://medium.com/@weehong/laravel-5-7-vue-vue-router-spa-5e07fd591981). Igual pero usando la librería Vuetify

## Autenticación
Una parte importante de cualquier aplicación es la autenticación de usuarios. Para ver cómo gestionarla podemos consultar cualquiera de estos enlaces:
* [Authentication Best Practices for Vue](https://blog.sqreen.io/authentication-best-practices-vue/)
* [Vue Authentication And Route Handling Using Vue-router](https://scotch.io/tutorials/vue-authentication-and-route-handling-using-vue-router)

## SSR (Server Side Rendering)
Esta tecnología permite que al obtener la página un robot (haciendo `curl miURL`) no devuelva sólo la \<app> sino el HTML para que los robots la puedan indexar correctamente. 

Más info: [Server-Side Rendering](https://vuejs.org/v2/guide/ssr.html).

Explicación de qué es y cómo funciona en Angular: [Angular & SEO](http://app.getresponse.com/click.html?x=a62b&lc=BmvXkb&mc=CL&s=mh7Vjl&u=B71jy&y=T&)
