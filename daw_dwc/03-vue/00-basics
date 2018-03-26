# Conceptos básicos
Aquí veremos lo básico para conover el framework Vue2 y ser capaces de utilizarlo como plataforma de desarrollo de aplicaciones web.

Este material está basado en la [guía oficial de Vue2](https://vuejs.org/v2/guide/) y veremos además los servicios de vue-router y axios entre otros.

Vue es un framework progresivo para la construcción de interfaces de usuario desde el lado del cliente. Lo de framework
"progresivo" significa que está diseñado para ser crecer: su núcleo está enfocado sólo en la capa de visualización pero es
fácil añadirle otras bibliotecas o proyectos existentes (algunos desarrollados por el mismo equipo de Vue) que nos permitan
crear incluso complejas SPA.

## Instalar Vue
Para utilizar Vue sólo necesitamos enlazarlo en nuestra página desde un CDN:
```[HTML]
<!-- development version, includes helpful console warnings -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
```
o
```[HTML]
<!-- production version, optimized for size and speed -->
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
```

Más adelante usaremos la herramienta `vue-cli` para crear un completo _scaffolding_ para nuestras aplicaciones (donde 
podremos fácilmmente incluir otras bibliotecas, trabajar con componentes o construir una SPA de forma sencilla).

## Hello World
Vamos a ver cómo se hace una página con Vue viendo un [ejemplo en JSFiddle](https://jsfiddle.net/chrisvfritz/50wL7mdz/).

### HTML
En en HTML debemos vincular los scripts de la librería de Vue y de nuestro código. 

Vue se ejecutará dentro de un elemento de nuestra página (al que se le poner como id _app_) que en este caso es un `<div>`.
Dentro de ese elemento podemos usar expresiones de Vue. En este ejemplo se usa el _moustache_ ( {{ ... }} ) que muestra en
la página la variable o expresión Javscript que contiene.

### Javascript
En el fichero JS debemos crear un nuevo objeto Vue que recibe como parámetro un objeto con varias propiedades:
* el: el elemento que contendrá la aplicación identificado en notación CSS (# para id, . para clase, ...). Si hubiera más 
de 1 elemento identificado así se cogería sólo el primero (es como hacer un querySelector del mismo)
* data: objeto donde definiremos todas las variables que vamos a usar en la vista. En nuestro caso sólo tenemos una que 
es _message_. A cada variable le debemos dar un valor inicial.
* pueden haber más como methdos (objeto con métodos que podemos llamar desde la vista), props (array de variables que se 
pasan de inicio, usado en componentes), computed (propiedades calculadas),... que veremmos más adelante.
