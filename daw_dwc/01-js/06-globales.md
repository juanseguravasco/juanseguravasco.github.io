# Objetos y Funciones globales. Expresiones regulares

## Introducción
En este tema vamos a ver 3 cosas fiferentes:
* las funciones globales de Javascript, muchas de las cuales ya hemos visto como _Number()_ o _String()_
* objetos globales que incorpora Javascript y que nos facilitarán mucho el trabajo (especialmente a la hora de trabajar con fechas)
* expresiones regulares, que son iguales que en otros lenguajes, y que nos serán de gran ayuda, sobre todo a la hora de validar formularios

## Funciones globales
* `parseInt(valor)`: devuelve el valor pasado como parámetro convertido a entero o _NaN_ si no es posible la conversión. Este método es mucho más permisivo que _Number_ y convierte cualquier cosa que comience por un número (si encuentra un carácter no numérico detiene la conversión y devuelve lo convertido hasta el momento). Ejemplos:
```javascript
console.log( parseInt(3.84) );            // imprime 3 (ignora los decimales)
console.log( parseInt('3.84') );          // imprime 3
console.log( parseInt('28manzanas') );    // imprime 28
console.log( parseInt('manzanas28') );    // imprime NaN
```
* `parseFloat(valor)`: igual pero devuelve un número decimal. Ejemplos: 
```javascript
console.log( parseFloat(3.84) );            // imprime 3.84
console.log( parseFloat('3.84') );          // imprime 3.84
console.log( parseFloat('3,84') );          // imprime 3 (la coma no es un carácter numérico)
console.log( parseFloat('28manzanas') );    // imprime 28
console.log( parseFloat('manzanas28') );    // imprime NaN
```
* `Number(valor)`: convierte el valor a un número. Es como _parseFloat_ pero más estricto y si no puede convertir todo el valor devuelve _NaN_. Ejemplos:
```javascript
console.log( Number(3.84) );            // imprime 3.84
console.log( Number('3.84') );          // imprime 3.84
console.log( Number('3,84') );          // imprime NaN (la coma no es un carácter numérico)
console.log( Number('28manzanas') );    // imprime NaN
console.log( Number('manzanas28') );    // imprime NaN
```
* `String(valor)`: convierte el valor pasado a una cadena de texto. Si le pasamos un objeto llama al método _.toString()_ del objeto. Ejemplos:
```javascript
console.log( String(3.84) );                  // imprime '3.84'
console.log( String([24, 3. 12]) );           // imprime '24,3,12'
console.log( {nombre: 'Marta', edad: 26} );   // imprime "[object Object]"
```
* `isNaN(valor)`: devuelve _true_ si lo pasado NO es un número o no puede convertirse en un número. Ejemplos:
```javascript
console.log( isNaN(3.84) );            // imprime false
console.log( isNaN('3.84') );          // imprime false
console.log( isNaN('3,84') );          // imprime true (la coma no es un carácter numérico)
console.log( isNaN('28manzanas') );    // imprime true
console.log( isNaN('manzanas28') );    // imprime true
```
* `isFinite(valor)`: devuelve _false_ si es número pasado es infinito (o demasiado grande)
```javascript
console.log( isFinite(3.84) );            // imprime true
console.log( isFinite(3.84 / 0) );            // imprime false
```
* `encodeURI(string)` / `decodeURI(string)`: transforma la cadena pasada a una URL codificada válida transformando los caracteres especiales que contenga, excepto , / ? : @ & = + $ #. Debemos usarla siempre que vayamos a pasar una URL. Ejemplo:
  * Decoded: “http://domain.com?val=1 2 3&val2=r+y%6"
  * Encoded: “http://domain.com?val=1%202%203&val2=r+y%256”
* `encodeURIComponent(string)` / `decodeURIComponent(string)`: transforma también os caracteres que no transforma la anterior. Debemos usarla para codificar parámetros pero no una URL entera. Ejemplo:
  * Decoded: “http://domain.com?val=1 2 3&val2=r+y%6"
  * Encoded: “http%3A%2F%2Fdomain.com%3Fval%3D1%202%203%26val2%3Dr%2By%256”
  
## Objetos del lenguaje
Además de los tipos primitivos de número, cadena, etc (que también se consideran objetos) JS tiene objetos Number, String, Array, Math, Date y RegExp. Ya hemos visto las principales propiedades y métodos de [_Number_](./01-sintaxis.html#number), [_String_](./01-sintaxis.html#string) y [_Array_](./02-arrays.html) y aquí vamos a ver las del resto.

## Objeto Math
Proporciona constantes y métodos para trabajar con valores numéricos:
* constantes: `.PI` (número pi), `.E` (número de Euler), `.LN2` (algoritmo natural en base 2), `.LN10` (logaritmo natural en base 10), `.LOG2E` (logaritmo de E en base 2), `.LOG10E` (logaritmo de E en base 10), `.SQRT2` (raíz cuadrada de 2), `.SQRT1_2` (raíz cuadrada de 1⁄2). Ejemplos:
```javascript
console.log( Math.PI );            // imprime 3.141592653589793
console.log( Math.SQRT2 );         // imprime 1.4142135623730951
```
* `Math.round(x)`: redondea x al entero más cercano
* `Math.floor(x)`: redondea x hacia abajo (5.99 → 5. Quita la parte decimal)
* `Math.ceil(x)`: redondea x hacia arriba (5.01 → 6)
* `Math.min(x1,x2,...)`: devuelve el número más bajo de los argumentos que se le pasan.
* `Math.max(x1,x2,...)`: devuelve el número más alto de los argumentos que se le pasan.
* `Math.pow(x, y)`: devuelve x y (x elevado a y).
* `Math.abs(x)`: devuelve el valor absoluto de x.
* `Math.random()`: devuelve un número decimal aleatorio entre 0 y 1 (no incluidos).
* `Math.cos(x)`: devuelve el coseno de x (en radianes).
* `Math.sin(x)`: devuelve el seno de x.
* `Math.tan(x)`: devuelve la tangente de x.
* `Math.sqrt(x)`: devuelve la raíz cuadrada de x

Ejemplos:
```javascript
console.log( Math.round(3.14) );     // imprime 3
console.log( Math.round(3.84) );     // imprime 4
console.log( Math.floor(3.84) );     // imprime 3
console.log( Math.ceil(3.14) );      // imprime 4
console.log( Math.sqrt(2) );         // imprime 1.4142135623730951
```

## Objeto Date
