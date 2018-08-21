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
NO este. Pensar uno

### 2.1 Array de productos
En este ejercicio vamos a trabajar con los productos de un almacén. Cada producto será un objeto con las propiedades _cod_, _descrip_, _price_, _stock_ (unidades en stock del producto) y _minStock_ (cantidad mínima que queremos tener siempre en stock). Todos ellos estarán en un array llamado _store_ y tenemos que crear las siguientes funcines:
* **_findProduct_**: recibe un array de productos y un código y devuelve el producto que tiene dicho código o _null_ si el código no existe
* **_sellProduct_**: recibe un array de productos, el código de un producto y una cantidad. Si no existe el producto o si existe pero el stock es menor que la cantidad que nos piden devuelve _false_. Si existe y hay suficientes unidades devuelve _true_ y las resta del stock del producto
* **_totalPrice_**: recibe un array de productos y devuelve el valor total de los mismos
* **_replenishStock_**: recibe un array de productos y devuelve un nuevo array con el pedido a realizar. En dicho array estarán todos los productos del array recibido cuyo stock es menor que _minStock_ y cada elemento del array será un objeto con las propiedades _cod_, _descrip_ y _units_ (unidades a pedir que serán las que faltan para tener en stock 5 veces el mínimo, p.ej. si _minStock_=10 y _stock_=7 habrá que pedir 43 unidades para volver a tener 10*5=50)
* **_newProducts_**: recibe el array de productos del almacén y un nuevo array con los nuevos productos que han llegado y debe añadirlos al almacén (si ya existe el código suma las unidades que han llegado al stock y si no existe crea un nuevo producto en el almacén y le pone como _minStock_ la unidades recibidas / 5 (redondeado).

## 3.- POO
En este ejercicio vamos a trabajar con los productos de un almacén, para lo que crearemos las clases:
* **_Product_**: cada producto será un objeto con las propiedades _cod_, _descrip_, _price_ y _units_ (las unidades del producto). Si no le pasamos unidades al constructor su número por defecto será 1. Esta clase tendrá los siguientes métodos:
  *  **_changeUnits_**: recibe la cantidad a aumentar (positiva o negativa) e incrementa (o decrementa) las unidades en la cantidad recibida. Si se intentan restar más unidades de las que hay no hace nada y devuelve _false_ y en otro caso cambia las unidades y devuelve _true_
  * **_productImport_**: devuelve el importe total del producto (su precio multiplicado por el nº de unidades)
  * además si se intenta imprimir el producto se mostrará su descripción, sus unidades entre paréntesis, su precio y el importe total, como en el siguiente ejemplo: `TV Samsung MP45 (5): 235,95 €/u => 1179,75 €`
* **_Store_**: es el almacén de productos y tendrá las propiedades _id_ (código numérico que nos pasan al crear el almacén) y _products_ (array de productos que al crearlo estará vacío) y los métodos:
  * **_findProduct_**: recibe un código de producto y devuelve el producto que tiene dicho código o _null_ si ese código no existe en el almacén
  * **_addProduct_**: recibe como parámetro el código, descripción, precio y unidades a añadir de un producto y lo añade al almacén. Si ya existe el código suma las unidades que han llegado al stock y si no existe crea un nuevo elemento en el array. Devuelve _true_
  * **_delProduct_**: recibe como parámetro el código y las unidades a quitar de un producto y lo resta del almacén. Devuelve _true_ a menos que no haya tantas unidades como quieren restarse, en cuyo caso no hace nada y devuelve _false_
  * **_totalImport_**: devuelve el valor total de los productos del almacén
  * **_orderByStock_**: devuelve el array de productos ordenado por stock descendente
  * **_orderByDescrip_**: devuelve el array de productos ordenado por la descripción pero sin tener en cuenta la capitalización
* **_Cart_**: esta clase la usaremos para crear carritos de compra con los productos a comprar. Es como la clase _Store_ pero tiene además la propiedad _user_ con el identificador del usuario que hace la compra y que nos lo pasarán al crear el carrito.
Además el método _delProduct_ eliminará el producto del array de productos si sus unidades son 0.


## 4.- DOM

## 4.- BOM

## 5.- Eventos

## 6.- Objetos globales

## 7.- POO

## 8.- Ajax

## 9.- APIs

