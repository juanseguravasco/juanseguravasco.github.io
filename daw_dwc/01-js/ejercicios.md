# Ejercicios de Javascript

## 1.- Sintaxis
### 1.1 Frase
Vamos a pedir al usuario que introduzca una frase y a continuación mostraremos en la consola:
* el número de letras y de palabras que tiene
* la frase en mayúsculas
* la frase con la primera letra de cada palabra en mayúsculas
* la frase escrita con las letras al revés
* la frase escrita con las palabras al revés
* si es o no un palíndromo (si se lee igual al revés) pero omitiendo espacios en blanco y sin diferenciar mayúsculas y minúsculas. 

Ej.: con la frase introducida “_La ruta nos aporto otro paso natural_” se mostraría
36 letras y 7 palabras
LA RUTA NOS APORTO OTRO PASO NATURAL
La Ruta Nos Aporto Otro Paso Natural
larutan osap orto otropa son atur aL
natural paso otro aporto nos ruta La
Sí es un palíndromo

Intenta usar en cada caso el bucle más adecuado. Las funciones `split` y `join` (lo opuesto) de String y Array nos pueden ayudar a algunas cosas.

**RECUERDA**:
* el código deberá estar en un fichero externo y se incluirá al final del body
* debes comentarlo para tener claro qué hace
* tanto el código JS como el HTML deben estar correctamente indentados
* ten en cuenta los datos que pueden “estropearnos” el programa: introducir un dato de un tipo que no te esperas, omitir algún parámetro, ...
* usa las recomendaciones indicadas: 'use strict', ...
* el código debe ser lo más limpio y claro posible, sin variables o código innecesario
* siempre es bueno refactorizar el código: cuando nuestro programa ya funciona bien le damos un “repaso” para mejorar su claridad (y lo volvemos a probar)

## 2.- Arrays
Podemos hacer un array de notas para sacar aprobados, suspensos, media, ...
NO este. Pensar uno

## 3.- POO
### 3.1.- Productos de un almacén
En este ejercicio vamos a trabajar con los productos de un almacén, para lo que crearemos las clases:
* **_Product_**: cada producto será un objeto con las propiedades _cod_, _name_, _price_ y _units_ (las unidades que tenemos de ese producto). Si no le pasamos unidades al constructor su número por defecto será 1. Esta clase tendrá los siguientes métodos:
  *  **_changeUnits_**: recibe la cantidad a aumentar (positiva o negativa) e incrementa (o decrementa) las unidades en la cantidad recibida. Si se intentan restar más unidades de las que hay no hace nada y devuelve _false_ y en otro caso cambia las unidades y devuelve _true_
  * **_productImport_**: devuelve el importe total del producto (su precio multiplicado por el nº de unidades)
  * además si se intenta imprimir el producto se mostrará su descripción, sus unidades entre paréntesis, su precio y el importe total, como en el siguiente ejemplo: `TV Samsung MP45 (5): 235,95 €/u => 1179,75 €`
* **_Store_**: es el almacén de productos y tendrá las propiedades _id_ (código numérico que nos pasan al crear el almacén) y _products_ (array de productos que al crearlo estará vacío) y los métodos:
  * **_findProduct_**: recibe un código de producto y devuelve el producto que tiene dicho código o _null_ si ese código no existe en el almacén
  * **_addProduct_**: recibe como parámetro el código y unidades a añadir y, opcionalmente, el nombre y precio (si se trata de un producto nuevo) y lo añade al almacén. Si ya existe el código suma al producto las unidades indicadas y si no existe crea un nuevo producto en el array. Devuelve _true_
  * **_delProduct_**: recibe como parámetro el código y las unidades a quitar de un producto y lo resta del almacén. Devuelve _true_ a menos que haya menos unidades de las que quieren restarse, en cuyo caso no hace nada y devuelve _false_
  * **_totalImport_**: devuelve el valor total de los productos del almacén
  * **_orderByUnits_**: devuelve el array de productos ordenado por unidades descendente
  * **_orderByDescrip_**: devuelve el array de productos ordenado por el nombre

Para probar que funciona correctamente ejecutaremos el nuestro fichero main.js:
```javascript
let almacen=new Store(1);
almacen.addProduct(1, 4, 'TV Samsung MP45', 345,95);
almacen.addProduct(2, 8, 'Portátil Acer Travelmate 200', 245,95);
almacen.addProduct(3, 15, 'Impresora Epson LX-455', 45,95);
almacen.addProduct(4, 25, 'USB Kingston 16GB', 5,95);

console.log('LISTADO DEL ALMACÉN');
almacen.products.forEach(prod=>console.log(prod.toString()));

almacen.addProduct(5, 15, 'USB Kingston 64GB', 15,95);
almacen.delProduct(3, 11);
almacen.delProduct(3, 7);
almacen.addProduct(6, 9);

console.log('LISTADO DEL ALMACÉN');
almacen.products.forEach(prod=>console.log(prod.toString()));
```
Queremos también que se muestro por consola todos los productos de los que tenemos menos de 5 unidades en stock o cuyo importe es inferior a 150 €.

### 3.2.- Carro de compra
Vamos a permitir que los usuarios hagan compras on-line para lo que crearemos una clase para los carritos de la compra:
* **_Cart_**: esta clase la usaremos para crear carritos de compra con los productos a comprar. Es como la clase _Store_ pero tiene además la propiedad _user_ con el identificador del usuario que hace la compra y que nos lo pasarán al crear el carrito. Además el método _delProduct_ eliminará el producto del array de productos si sus unidades son 0.

Haz además las funciones **_addToCart_** y **_removeFromCart_** que nos permitan añadir y quitar productos del carro y que recibirán como parámetros el código del producto y las unidades a añadir o quitar.

## 4.- DOM

## 5.- BOM

## 6.- Eventos

## 7.- Objetos globales

## 8.- Ajax

## 9.- APIs

