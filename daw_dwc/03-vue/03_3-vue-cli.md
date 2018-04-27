# Introducción
Se trata de una herramienta que incluye Vue que nos ayuda en:
* Crea automáticamente el _scaffolding_ básico de nuestro proyecto basándose en una serie de plantillas perdefinidas
* Incluye herramientas como Webpack, Babel, Uglify, ... que permiten
  * gestionar las dependencias de nuestro código
  * empaquetar todos los ficheros _.vue_ y librerías en un único fichero JS y CSS
  * traspilar el código ES2015/2016, SCSS, etc a ES5 y CSS3 estándar
  * minimizar el código generado
* Incluye herramientas que facilitan el desarrollo

## Instalación
Para usar **vue-cli** necesitamos tener instalado **npm** (el gestor de paquetes de Node.js).

Se instala con
```[bash]
npm install vue-cli -g
```
La opción -g es para que lo instale globalmente en el sistema y no instale unca copia para cada proyecto.

Para crear un nuevo proyecto haremos:
```[bash]
vue init _plantilla_ nombre-proyecto
```
Podemos usar, entre otras, las siguientes plantillas:
* simple: el proyecto será un único fichero que contendrá todo el código
* webpack-simple: crea un scaffolding sencillo que incluye webpack
* webpack: incluye también herramientas para testear el proyecto, entre otras
* PWA: para crear una Progressive Web App (App para móviles similar a una app nativa)

## Ejemplo plantilla simple
La crearemos con
```[bash]
vue init simple miAppSimple
```
Esto crea la carpeta _miAppSimple_ y dentro de ella el fichero _index.html_. No hay componentes ni ninguna herramienta extra, simplemente el fichero HTML donde está incluido también el JS.

Además nos hace una serie de preguntas (su nombre y su autor) para configurar nuestro proyecto:
![Crear proyecto de plantilla simple](./img/vue-simple.png)

La página generada es:
![Proyecto de plantilla simple](./img/vue-simple-app.png)

## Ejemplo webpack-simple
```[bash]
vue init webpack-simple appUsers
```
![Crear proyecto de plantilla simple](./img/vue-webpack-simple.png)

Una vez creado el proyecto instalaremos sus dependencias entrando dentro de la carpeta y ejecutmos:
```[bash]
npm install
```
Para arrancar el proyecto ejecutamos en la terminal
```[bash]
npm run dev
```
Este script compila el código, muestra si hay errores, lanza un servidor web en el puerto 8080 y carga el proyecto en el navegador (localhost:8080). Si cambiamos cualquier fichero JS de _src_ recompila y recarga la página automáticamente. La página generada es:
![Proyecto de plantilla simple](./img/vue-webpack-simple-app.png)

Cuando nuestra aplicación esté lista para subir a producción ejecutaremos el script:
```[bash]
npm run build
```

## _Scaffolding_ creado
Se ha creado la carpeta _miAppWpSimple_ y dentro el scaffolding para nuestro proyecto con soporte para Webpack:
![Directorios del proyecto de plantilla simple](./img/vue-webpack-simple-folders.png)

Los principales ficheros y directorios creados son:
* package.json: configuración del proyecto (nombre, autor, ...) y dependencias
* webpack.config.js: configuración de webpack
* index.html: html con un div donde se cargará la app y que carga el script build.js
* node_modules: librerías de las dependencias
* src/assets: nuestros CSS, imágenes, etc
* src/main.js: carga componentes y crea la instancia de Vue que 'pinta' el App.vue 
* src/....vue: los diferentes componentes

## package.json
Aquí se configura nuestra aplicación:
* name, description, version, author, license, ...: configuración general de la aplicación
* scripts: ejecutan entornos de configuración para webpack. Por defecto tenemos 2:
  * dev: lanza el servidor web de webpack y configura webpack y vue para el entorno de desarrollo
  * build: crea el fichero **/dist/build.js** con todo el código JS de la aplicación (es el único que vincularemos en index.html)
* dependences: se incluyen las librerías que utiliza nuestra aplicación en producción. Todas las dependencias se instalan dentro de **/node-modules**. Para instalar un nuevo paquete (por ejemplo _axios_ para hacer peticiones Ajax) ejecutamos en la terminal `npm install axios -S` (npm instala el paquete en node-modules y además con la opción -S se añade a las dependencias de package.json
* devDependencies: igual pero son paquetes que sólo se usan en desarrollo (babel, webpack, etc). También se instalan dentro de node-modules pero no estarán en build.js cuando se genere el fichero para producción. Para instalar una nueva dependencia de desarrollo ejecutaremos `npm install _paquete_ -D` (la opción -D la añade a package.json pero como dependencia de desarrollo).

## Estructura de nuestra aplicación
**Fichero index.html:**
```[html]
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>miapp-webpack-simple</title>
  </head>
  <body>
    <div id="app"></div>
    <script src="/dist/build.js"></script>
  </body>
</html>
```
Simplemente tiene el \<div> _app_ y vincula el script _build.js_.

**Fichero main.js:**
```[javascript]
import Vue from 'vue'
import App from './App.vue'

new Vue({
  el: '#app',
  render: h => h(App)
})
```
Importa la librería _Vue_ y el componente _App.vue_, crea la instancia de Vue y renderiza el componente _App_.

**Fichero App.vue:**
```[javascript]
```


## Crear un nuevo componente
Creamos un nuevo fichero dentro de **/src** con extensión _.vue_. Ese fichero contendrá las etiquetas \<template>, <script> y <style> para contener respectivamente el HTML, el JS y el CSS del componente (no es preciso que existan las 3 etiquetas).

Donde queramos usar ese componente debemos importarlo y registrarlo. Y ya podemos incluir el componente en el HTML:
```[javascript]
import CompName from './CompName.vue'
```

