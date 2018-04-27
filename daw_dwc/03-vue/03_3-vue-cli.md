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

Una vez creado el proyecto instalaremos sus dependencias entrando dentro de la carpeta y ejecutanro:
```[bash]
npm install
```

La página generada es:
![Proyecto de plantilla simple](./img/vue-webpack-simple-app.png)

Ha creado la carpeta _miAppWpSimple_ y dentro el scaffolding para nuestro proyecto con soporte para Webpack:
![Directorios del proyecto de plantilla simple](./img/vue-webpack-simple-app-folders.png)


## _Scaffolding_ creado
Los principales ficheros y directorios creados son:
* package.json: configuración del proyecto (nombre, autor, ...) y dependencias
* webpack.config.js: configuración de webpack
* index.html: html con un div donde se cargará la app y que carga el script build.js
* node_modules: librerías de las dependencias
* src/assets: nuestros CSS, imágenes, etc
* src/main.js: carga componentes y crea la instancia de Vue que 'pinta' el App.vue 
* src/....vue: los diferentes componentes

## Scripts de npm
En el package.json hay definidos 2 scripts:
* Dev: ejecuta el entorno de desarrollo
* Build: construye el JS de proudcción

En desarrollo ejecutaremos en la consola
```[bash]
npm run dev
```
Este script compila el código, muestra si hay errores y lo carga en el navegador (localhost:8080). Si cambiamos cualquier fichero JS de src recompila y recarga automáticamente.

Cuando nuestra aplicación esté lista para subir a producción ejecutaremos el script:
```[bash]
npm run build
```

## Crear un nuevo componente
Creamos un nuevo fichero dentro de **/src** con extensión _.vue_. Ese fichero contendrá las etiquetas \<template>, <script> y <style> para contener respectivamente el HTML, el JS y el CSS del componente (no es preciso que existan las 3 etiquetas).

Donde queramos usar ese componente debemos importarlo y registrarlo. Y ya podemos incluir el componente en el HTML:
```[javascript]
import CompName from './CompName.vue'
```

