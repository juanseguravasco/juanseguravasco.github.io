# Document Object Model (DOM)

## Introducción
La mayoría de las veces que programamos con Javascript es para que se ejecute en una página web mostrada por el navegador. En este contexto tenemos acceso a ciertos objetos que nos permiten interactuar con la página (DOM) y con el navegador ( y Browser Object Model, BOM).

## Introducción
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

## Acceso a los nodos
Los principales métodos para acceder a los diferentes nodos son:
* `document.getElementById('id')`: devuelve el nodo con la _id_ indicada. Ej.:
```javascript
let nodo=document.getElementById('main');   // nodo contendrá el nodo cuya id es _main_
```
* `document.getElementsByClassName('clase')`: devuelve una colección (similar a un array) con todos los nodos de la _clase_ indicada. Ej.:
```javascript
let nodos=document.getElementsByClassName('error');   // nodos contendrá todos los nodos cuya clase es _error_
```
NOTA: las colecciones son similares a arrays (se accede a sus elementos con _\[indice]_) pero no se les pueden aplicar sus métodos _filter_, _map_, ... a menos que se conviertan a arrays con _Array.from()_
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
* `document.documentElement`: devuelve el nodo del elemento _<html>_
* `document.head`: devuelve el nodo del elemento _<head>_
* `document.body`: devuelve el nodo del elemento _<body>_
* `document.title`: devuelve el nodo del elemento _<title>_
* `document.link`: devuelve una colección con todos los hiperenlaces del documento
* `document.anchor`: devuelve una colección con todas las anclas del documento
* `document.form`: devuelve una colección con todos los formularios del documento
* `document.images`: devuelve una colección con todas las imágenes del documento
* `document.scripts`: devuelve una colección con todos los scripts del documento
  
## Acceso a nodos a partir de otros
En muchas ocasiones queremos acceder a cierto nodo a partir de uno dado. Para ello tenemos los siguientes métodos que se aplican sobre un elemento del árbol DOM:
* `elemento.parentNode`: devuelve el padre de _elemento_
* `elemento.children`: devuelve la colección con todos los elementos hijo de _elemento_ (sólo elementos HTML, no comentarios ni nodos de tipo texto)
* `elemento.childNodes`: devuelve la colección con todos los hijos de _elemento_, incluyendo comentarios y nodos de tipo texto por lo que no suele utilizarse
* `elemento.firstElementChild`: devuelve el elemento HTML que es el primer hijo de _elemento_ 
* `elemento.firstChild`: devuelve el nodo que es el primer hijo de _elemento_ (incluyendo nodos de tipo texto o comentarios)
* `elemento.lastElementChild`, `elemento.lastChild`: igual pero con el último hijo
* `elemento.nextElementSibling`: devuelve el elemento HTML que es el siguiente hermano de _elemento_ 
* `elemento.nextSibling`: devuelve el nodo que es el siguiente hermano de _elemento_ (incluyendo nodos de tipo texto o comentarios)
* `elemento.previousElementSibling`, `elemento.previousSibling`: igual pero con el hermano anterior
NOTA: siempre suelen usarse los métodos que sólo devuelven elementos HTML
* `elemento.hasChildNodes`: indica si _elemento_ tiene o no nodos hijos
* `elemento.childElementCount`: devuelve el nº de nodos hijo de  _elemento_

![Recorrer el árbol DOM](./img/dom-recorrerArbol.png)

### Propiedades de un nodo
Las principales propiedades de un nodo son:
* `elemento.innerHTML`: todo lo que hay entre la etiqueta que abre _elemento_ y la que lo cierra, incluyendo otras etiquetas HTML. Por ejemplo si _elemento_ es el nodo `<p>Esta página es <strong>muy simple</strong></p>`
```javascript
let contenido=elemento.innerHTML;   // contenido='Esta página es <strong>muy simple</strong>'
```
* `elemento.textContent`: todo lo que hay entre la etiqueta que abre _elemento_ y la que lo cierra, pero ignorando otras etiquetas HTML. Por ejemplo si _elemento_ es el nodo `<p>Esta página es <strong>muy simple</strong></p>`
```javascript
let contenido=elemento.textContent;   // contenido='Esta página es muy simple'
```
* `elemento.innerText`: igual que _textContent_
* `elemento.focus`: da el foco a _elemento_ (para inputs, etc). Para quitarle el foco `elemento.blur`
* `elemento.clientHeight` / `elemento.clientWidth`: devuelve el alto / ancho visible del _elemento_
* `elemento.offsetHeight` / `elemento.offsetWidth`: devuelve el alto / ancho total del _elemento_
* `elemento.clientLeft` / `elemento.clientTop`: devuelve la distancia de _elemento_ al borde izquierdo / superior
* `elemento.offsetLeft` / `elemento.offsetTop`: devuelve los píxels que hemos desplazado _elemento_ a la izquierda / abajo

## Manipular el árbol DOM
Vamos a ver qué métodos nos permiten cambiar el árbol DOM, y por tanto modificar la página:
* `document.createElement('etiqueta')`: crea un nuevo elemento HTML con la etiqueta indicada, pero aún no se añade a la página. Ej.:
```javascript
let nuevoLi=document.createElement('li');
```
* `document.createTextNode('texto')`: crea un nuevo nodo de texto con el texto indicado, que luego tendremos que añadir a un nodo HTML. Ej.:
```javascript
let textoLi=document.createTextNode('Nuevo elemento de lista');
```
* `elemento.appendChild(nuevoNodo)`: añade _nuevoNodo_ como último hijo de _elemento_. Ahora ya se ha añadido a la página. Ej.:
```javascript
nuevoLi.appendChild(textoLi);     // añade el texto creado al elemento LI creado
let miPrimeraLista=document.getElementsByTagName('ul')[0];  // selecciona el 1º UL de la página
miPrimeraLista.appendChild(nuevoLi);    // añade LI como último hijo de UL, es decir al final de la lista
```
* `elemento.insertBefore(nuevoNodo, nodo)`: añade _nuevoNodo_ como hijo de _elemento_ antes del hijo _nodo_. Ej.:
```javascript
let miPrimeraLista=document.getElementsByTagName('ul')[0];  // selecciona el 1º UL de la página
let primerElementoDeLista=miPrimeraLista.getElementsByTagName('li')[0];  // selecciona el 1º LI de miPrimeraLista
miPrimeraLista.appendChild(nuevoLi, primerElementoDeLista);    // añade LI al principio de la lista
```
* `elemento.removeChild(nodo)`: borra _nodo_ de _elemento_ y por tanto se elimina de la página. Ej.:
```javascript
let miPrimeraLista=document.getElementsByTagName('ul')[0];  // selecciona el 1º UL de la página
let primerElementoDeLista=miPrimeraLista.getElementsByTagName('li')[0];  // selecciona el 1º LI de miPrimeraLista
miPrimeraLista.removeChild(primerElementoDeLista);    // borra el primer elemento de la lista
// También podríamos haberlo borrado sin tener el padre con:
primerElementoDeLista.parentNode.removeChild(primerElementoDeLista);
```
* `elemento.replaceChild(nuevoNodo, viejoNodo)`: reemplaza _viejoNodo_ con _nuevoNodo_ como hijo de _elemento_. Ej.:
```javascript
let miPrimeraLista=document.getElementsByTagName('ul')[0];  // selecciona el 1º UL de la página
let primerElementoDeLista=miPrimeraLista.getElementsByTagName('li')[0];  // selecciona el 1º LI de miPrimeraLista
miPrimeraLista.replaceChild(nuevoLi, primerElementoDeLista);    // reemplaza el 1º elemento de la lista con nuevoLi
```
* `elementoAClonar.cloneNode(boolean)`: devuelve un clon de _elementoAClonar_ o de _elementoAClonar_ con todos sus descendientes según le pasemos como parámetro _false_ o _true_. Luego podremos insertarlo donde queramos.

Ejemplo: dado el siguiente código HTML vamos a añadir un nuevo párrafo al final del div con el texto 'Párrafo añadido al final' y otro que sea el 2º del div co el texto 'Este es el <strong>nuevo</strong> segundo párrafo':
```html
<div id="articulos">
  <p>Este es el primer párrafo que tiene <strong>algo en negrita</strong>.</p>
  <p>Este era el segundo párrafo pero será desplazado hacia abajo.</p>
  <p>Y este es el último párrafo pero luego añadiremos otro después.<p>
</div>
```
El código a ejecutar es:
