<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
Tabla de contenidos

- [Vue-router](#vue-router)
  - [Instalación](#instalaci%C3%B3n)
  - [Usar _VueRouter_](#usar-_vuerouter_)
  - [Crear un menú](#crear-un-men%C3%BA)
  - [Saltar a una ruta](#saltar-a-una-ruta)
  - [Cambio de parámetros en una ruta](#cambio-de-par%C3%A1metros-en-una-ruta)
  - [this.$route](#thisroute)
  - [Vistas  con nombre y Subvistas](#vistas--con-nombre-y-subvistas)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Vue-router
Es otra de las librerías del "ecosistema" de Vue más utilizadas ya que la necesitamos para hacer SPA (_Single Page Applications_).

Lo que haremos es _mapear_ componentes de nuestra aplicación a rutas URL de forma que cuando se pone determinada ruta en el navegador se carga en la página el componente indicado. También permite tener subrutas que mapeen subcomponentes dentro de otros.

## Instalación
Como esta librería vamos a usarla en producción la instalaremos como dependencia del proyecto:
```[bash]
npm install vue-router -S
```

## Usar _VueRouter_
La importaremos en el fichero principal de nuestra aplicación, _main.js_. A continuación la declaramos, creamos una instancia para nuestras rutas y la configuramos. También debemos importar todos los componentes que definamos en el router:
```vue
import Vue from 'vue'
import Router from 'vue-router'

import App from './App.vue'
import AppHome from './components/AppHome.vue'
import AppAbout from './components/AppAbout.vue'
import UsersTable from './components/UsersTable.vue'
import UserNew from './components/UserNew.vue'
import UserEdit from './components/UserEdit.vue'

Vue.use(Router)

const router=new Router({
  mode: 'history',
  routes: [
	{
		path: '/',
		component: AppHome
	},{
		path: '/about',
		component: AppAbout
	},{
		path: '/users',
		component: UsersTable
	},{
		path: '/new',
		component: UserNew
	},{
		path: '/edit/:id',
		component: UserEdit
		props: true
	}
  ],
}

new Vue({
  el: '#app',
  router: router,
  render: h => h(App)
})
```
El valor 'history' de la propiedad _mode_ indica que use rutas "amigables" y que no incluyan la # (ya que en realidad no se están cargando diferentes páginas sino partes de una única página -es una SPA-).

Para cada ruta que queramos mapear hay que definir:
* **path**: la url que hará que se cargue el componente
* **component**: el componente que se cargará donde se encuentre la etiqueta **\<router-view>** en el HTML

_VueRouter_ permite rutas dinámicas como la indicada para el componente _UserEdit_. La ruta _/edit/_ seguida de algo más hará que se cargue el componente _UserEdit_ y que dicho componente reciba en un parámetro llamado _id_ la parte final de la ruta (por ejemplo /edit/5 hace que el componente reciba una _prop_ llamada _id_ con valor 5).

Además de esas propiedades podemos indicar más para cada ruta:
* name: le damos a la ruta un nombre que luego podemos usar
* props: se usa en rutas dinámicas e indica que el componente recibirá el parámetro de la ruta en sus _props_. Si no se pone para acceder al parámetro _id_ lo haría desde `this.$route.params.id` 

En la parte del HTML en que queramos que se carguen los diferentes componentes de nuestra SPA incluiremos la etiqueta:
```html
<router-view></router-view>
```

## Crear un menú
Seguramente querremos un menú en nuestra SPA que nos permita ir a las diferentes rutas (que provocarán que se carguen los componentes). Para ello usaremos la etiqueta **\<router-link>**. Ejemplo:
```html
<router-link to="/">Home</router-link>
<router-link to="/about">Acerca de...</router-link>
```

Cuando accedemos a una ruta su elemento _\<router-link> adquiere la clase _.router-link-active.

Si le hemos puesto la propiedad _name_ a una ruta podemos hacer un enlace a ella con
```html
<router-link to="{name: 'nombre_de_a_ruta'}">Home</router-link>
```

Se puede hacer (aunque no es lo normal) una opción de menú a una ruta dinámica y pasarle el parámetro deseado. Por ejemplo para editar el usuario 5 haremos:
```html
<router-link to="{name: 'edit', params: {id: 5}}">Editar usuario 5</router-link>
```
En este caso es necesario que la ruta dinámica tenga un _name_.

## Saltar a una ruta
Podemos cargar la ruta que queramos desde JS con
```[javascrip]
this.$router.push(ruta)
```
Tenemos varios métodos para navegar por código:
* .push(newUrl): salta a la ruta _newUrl_ y la añade al historial
* .replace(newURL): salta a la nueva ruta pero reemplaza en el historial la ruta actual por esta
* .go(num): permite saltar el num. de páginas indicadas adelante (ej. _this.$route(go1)_) o atrás (_.go(-1)_) por el historial

Estos métodos son equivalentes a los métodos _history.push()_, _history.replace()_ y _history.go()_ de JS.

Además podemos pasar a push() y replace() funciones _callback_ que se ejecutarán al cambiar la ruta si todo va bien o si hay algún error.
```[javascrip]
this.$router.push(location, onComplete?, onAbort?)
```

Tabién se puede una _query_ a la ruta o parámetros. Ejemplos:
* this.$router.push({ path: 'register', query: { plan: 'private' }})	// Se obtiene '/register?plan=private
* this.$router.push({ name: 'users', params: { id: 123 }})	// Salta a una ruta por su _name_

## Cambio de parámetros en una ruta
Si cambiamos a la misma ruta pero con distintos parámetros Vue reutiliza la instancia del componente y no vuelve a lanzar sus _hooks_ (created, mounted, ...). Esto hará que no se ejecute el código que tengamos allí. Por ejemplo supongamos que en una ruta '/edit/5' al cargar el componente se pide el registro 5 y se muestra en la página. Si a continuación cargamos la ruta '/edit/8' seguiremos viendo los datos del registro 5).

La forma de solucionar esto es forzar la detección del cambio en la ruta y realizar allí la carga de los datos:
```[javascrip]
watch: {
    '$route' (to, from) {
        // Código que responde al cambio. En to tenemos la ruta anterior y en from la nueva
    }
} 
```

## this.$route
Es un objeto que contiene información de la ruta actual. Algunas de sus propiedades son:
* params: los parámetros de la ruta (puede haber más de 1)
* query: si huberia alguna consulta en la ruta (tras '?') se obtiene aquí
* path: la ruta absoluta

Más información en su [API](https://router.vuejs.org/es/api/route-object.html)

## Vistas  con nombre y Subvistas
Podemos cargar más de un componente usando varias etiquetas `<router-view>`. Por ejemplo si nestra página constará de 3  componentes (uno en la cabecera, otro el principal y otro en un _aside_ pondremos en el HTML:
```html
<router-view class="cabecera" name="top"></router-view>
<router-view class="main"></router-view>
<router-view class="aside" name="aside"></router-view>```
```

Para que se carguen los 3 componentes lo debemos indicar al definir las rutas:
```javascript
{
    path: '/',  
    components: {
        default: CompMain,		// CompMain se cargará en el <router-view> sin nombre
        cabecera: CompCabecera,
        b: CompAside
    }
}
```

También un componente puede incluir su propia etiqueta `<router-view>` que cargue dentro de él un subcomponente en función de una subruta. Por [ejemplo](http://jsfiddle.net/yyx990803/L7hscd8h/) tenemos una ruta _/user/:id_ que carga un componente _User_ con el nombre y la imagen del usuario y debajo cargará, en función de la ruta:
*  _/user/:id_: debajo cargará el componente con el home del usuario
*  _/user/:id/profile_: debajo cargará el componente con el perfil del usuario
*  _/user/:id/posts_: debajo cargará el componente con los posts del usuario
Definiremos la ruta del siguiente modo:
```javascript
{
    path: '/',  
    components: {
{
  path: '/user/:id', 
  component: User,
  children: [
    { path: '', component: UserHome },
    { path: 'profile', component: UserProfile },
    { path: 'posts', component: UserPosts }
  ]
}
```
