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
### 2.1 Array de productos
En este ejercicio vamos a trabajar con los productos de un almacén. Cada producto será un objeto con las propiedades _cod_, _descrip_, _price_, _stock_ (unidades en stock del producto) y _minStock_ (cantidad mínima que queremos tener siempre en stock). Todos ellos estarán en un array llamado _store_ y tenemos que crear las siguientes funcines:
* **_findProduct_**: recibe un array de productos y un código y devuelve el producto que tiene dicho código o _null_ si el código no existe
* **_sellProduct_**: recibe un array de productos, el código de un producto y una cantidad. Si no existe el producto o si existe pero el stock es menor que la cantidad que nos piden devuelve _false_. Si existe y hay suficientes unidades devuelve _true_ y las resta del stock del producto
* **_totalPrice_**: recibe un array de productos y devuelve el valor total de los mismos
* **_replenishStock_**: recibe un array de productos y devuelve un nuevo array con el pedido a realizar. En dicho array estarán todos los productos del array recibido cuyo stock es menor que _minStock_ y cada elemento del array será un objeto con las propiedades _cod_, _descrip_ y _units_ (unidades a pedir que serán las que faltan para tener en stock 5 veces el mínimo, p.ej. si _minStock_=10 y _stock_=7 habrá que pedir 43 unidades para volver a tener 10*5=50)
* **_newProducts_**: recibe el array de productos del almacén y un nuevo array con los nuevos productos que han llegado y debe añadirlos al almacén (si ya existe el código suma las unidades que han llegado al stock y si no existe crea un nuevo producto en el almacén y le pone como _minStock_ la unidades recibidas / 5 (redondeado).
* **_orderByStock_**: recibe un array de productos y devuelve uno ordenado por stock descendente
* **_orderByDescrip_**: recibe un array de productos y devuelve uno ordenado por la descripción pero sin tener en cuenta la capitalización

## 3.- POO
### 3.1 Array de Productos
Vamos a modificar el ejercicio anterior para aprovechar las ventajas de la POO. Crearemos las clases:
* **_Product_**: es cada uno de los productos y tendrá las propiedades que hemos visto antes y los métodos:
  * **_changeStocksellProduct_**: recibe la cantidad a vender y devuelve _false_ si no hay suficiente stock o _true_ si sí que lo hay en cuyo caso resta del stock la cantidad
  * **_buyProduct_**: al revés, para cuando compramos producto. Devuuelve _true_ y suma al stock la cantidad pasada. NOTA: podríamos hacer un único método para ambas cosas???
* **_Store_**: es el almacén y tendrá las propiedades _id_ (código numérico que nos pasan al crear el almacén) y _products_ (array de productos que al crearlo estará vacío) y los métodos:
  * **_findProduct_**: recibe un código de producto y devuelve el producto que tiene dicho código o _null_ si ese código no existe en el almacén
  * **_addProduct_**: recibe un producto y lo añade al almacén (si ya existe el código suma las unidades que han llegado al stock y si no existe crea un nuevo elemento en el array
  * **_replenishStock_**: devuelve un array con el pedido a realizar. En dicho array estarán todos los productos del almacén cuyo stock es menor que _minStock_ y cada elemento del array será un objeto con las propiedades _cod_, _descrip_ y _units_ (unidades a pedir que serán las que faltan para tener en stock 5 veces el mínimo, p.ej. si _minStock_=10 y _stock_=7 habrá que pedir 43 unidades para volver a tener 10*5=50)
  * **_totalPrice_**: devuelve el valor total de los productos del almacén
* **_Cart_**: para crear carritos de compra con los productos a comprar. Esta clase hereda de _Store_ y tendrá además la propiedad _idUser_ con el identificador del usuario que hace la compra y que nos los pasarán al crear el carrito.las propiedades vistas antes y convertiremos las funciones _findProduct_ y _soldProduct_ que creamos antes en métodos de la clase. También crearemos los siguientes métodos:


## 4.- DOM

## 4.- BOM

## 5.- Eventos

## 6.- Objetos globales

## 7.- POO

## 8.- Ajax

## 9.- APIs

