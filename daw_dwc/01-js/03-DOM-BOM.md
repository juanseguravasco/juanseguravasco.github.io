# Document Object Model (DOM) y Browser Object Model (BOM)

## Introducción
La mayoría de las veces que programamos con Javascript es para que se ejecute en una página web mostrada por el navegador. En este contexto tenemos acceso a ciertos objetos que nos permiten interactuar con la página (DOM) y con el navegador (BOM).

## Document Object Model (DOM)
Es una estructura en árbol que representa todos los elementos HTML de la página y sus atributos. Todo lo que contien la página se representa como nodos del árbol y me diante el DOM podemos acceder a cada nodo, modificarlo, eliminarlo o añadir nuevos nodos de forma que cambiamos dinámicamente la página mostrada al usuario.

La raíz del árbol DOM es **document** y de este nodo cuelgan el resto de elementos HTML. Cada uno constituye su propio nodo y tiene subnodos con sus _atributos_, _estilos_ y elementos HTML que contiene. 

Por ejemplo, la página HTML:
```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Página simple</title>
</head>
<body>
  <p>Esta página es <strong>muy simple</strong></p>
</body>
</html>
```
se convierte en el siguiente árbol DOM:
![Árbol DOM](./img/dom-arbol.png)

Cada etiqueta HTML suele originar 2 nodos:
* Element: correspondiente a la etiqueta
* Text: correspondiente a su contenido (lo que hay entre la etiqueta y su par de cierre)

Cada nodo es un objeto con sus propiedades y métodos.

### Acceso a los nodos
Los principales métodos para acceder a los diferentes nodos son:
* `document.getElementById('id')`: devuelve el nodo con la _id_ indicada. Ej.:
```javascript
let nodo=document.getElementById('main');   // nodo contendrá el nodo cuya id es _main_
```
* `document.getElementsByClassName('clase')`: devuelve una colección (similar a un array) con todos los nodos de la _clase_ indicada. Ej.:
```javascript
let nodos=document.getElementsByClassName('error');   // nodos contendrá todos los nodos cuya clase es _error_
```
* `document.getElementsByTagName('etiqueta')`: devuelve una colección con todos los nodos de la _etiqueta_ HTML indicada. Ej.:
```javascript
let nodos=document.getElementsByTagName('p');   // nodos contendrá todos los nodos de tipo  _<p>_
```
* `document.querySelector('selector')`: devuelve el primer nodo seleccionad por el _selector_ CSS indicado. Ej.:
```javascript
let nodo=document.querySelector('p.error');   // nodo contendrá el primer párrafo de clase _error_
```
* `document.querySelectorAll('selector')`: devuelve una colección con todos los nodos seleccionados por el _selector_ CSS indicado. Ej.:
```javascript
let nodos=document.querySelectorAll('p.error');   // nodos contendrá todos los párrafos de clase _error_
```
NOTA: al aplicar estos métodos sobre _document_ se seleccionará sobre la página pero podrían también aplicarse a cualquier nodo y en ese caso la búsqueda se realizaría sólo entre los descendientes de dicho nodo.

NOTA: las colecciones son similares a arrays (se accede a sus elementos con _\[indice]_) pero no se les pueden aplicar sus métodos _filter_, _map_, ... a menos que se conviertan a arrays con _Array.from()_
* `document.documentElement`: devuelve el nodo del elemento _<html>_
* `document.head`: devuelve el nodo del elemento _<head>_
* `document.body`: devuelve el nodo del elemento _<body>_
* `document.title`: devuelve el nodo del elemento _<title>_
* `document.link`: devuelve una colección con todos los hiperenlaces del documento
* `document.anchor`: devuelve una colección con todas las anclas del documento
* `document.form`: devuelve una colección con todos los formularios del documento
* `document.images`: devuelve una colección con todas las imágenes del documento
* `document.scripts`: devuelve una colección con todos los scripts del documento
  

