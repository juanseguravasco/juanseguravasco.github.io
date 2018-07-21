# Arrays

## Introducción
Son un tipo de objeto y no tienen tamaño fijo sino que podemos añadirle elementos en cualquier momento. 

Podemos crearlos como instancias del objeto Array:
```javascript
let a=new Array();        // a = []
let b=new Array(2,4,6);   // b = [2, 4, 6]
```
o mejor aún usando notación JSON:
```javascript
let a=[];
let b=[2,4,6);
```

Sus elementos pueden ser de cualquier tipo, incluso podemos tener elementos de tipos distintos en un mismo array. Si no está definido un elemento su valor será _undefined_. Ej.:
```javascript
let a=['Lunes', 'Martes', 2, 4, 6];
console.log(a[0]);  // imprime 'Lunes'
console.log(a[4]);  // imprime 6
a[7]='Juan';        // ahora a=['Lunes', 'Martes', 2, 4, 6, , , 'Juan']
console.log(a[7]);  // imprime 'Juan'
console.log(a[6]);  // imprime undefined
```

## Operaciones con Arrays
Vamos a ver los principales métodos y propiedades de los arrays.

### lenght
Esta propiedad devuelve la longitud de un array: 
```javascript
let a=['Lunes', 'Martes', 2, 4, 6];
console.log(a.length);  // imprime 5
```
Podemos reducir el tamaño de un array cambiando esta propiedad:
```javascript
a.length=3;  // ahora a=['Lunes', 'Martes', 2]
```

### Añadir elementos
Podemos añadir elementos al final de un array con `push` o al principio con `unshift`:
```javascript
let a=['Lunes', 'Martes', 2, 4, 6];
a.push('Juan');   // ahora a=['Lunes', 'Martes', 2, 4, 6, 'Juan']
a.unshift(7);     // ahora a=[7, 'Lunes', 'Martes', 2, 4, 6, 'Juan']
```

### Eliminar elementos
Podemos borrar el elemento del final de un array con `pop` o el del principio con `shift`. Ambos métodos devuelven el elemento que hemos borrado:
```javascript
let a=['Lunes', 'Martes', 2, 4, 6];
let ultimo=a.pop();   // ahora a=['Lunes', 'Martes', 2, 4] y ultimo=6
let primero=a.shift();           // ahora a=['Martes', 2, 4] y primero='Lunes'
```

### [splice](https://developer.mozilla.org/es/docs/Web/JavaScript/Referencia/Objetos_globales/Array/splice)
Permite eliminar elementos de cualquier posición del array y/o insertar otros en su lugar. Devuelve un array con los elementps eliminados. Sintaxis:
```javascript
Array.splice(posicion, num. de elementos a eliminar, 1º elemento a insertar, 2º elemento a insertar, 3º...)
```
Ejemplo:
```javascript
let a=['Lunes', 'Martes', 2, 4, 6];
let borrado=a.splice(1, 3);       // ahora a=['Lunes', 6] y borrado=['Martes', 2, 4];
a=['Lunes', 'Martes', 2, 4, 6];
borrado=a.splice(1, 0, 45, 56);   // ahora a=['Lunes', 45, 56, 'Martes', 2, 4, 6] y borrado=[];
a=['Lunes', 'Martes', 2, 4, 6];
borrado=a.splice(1, 3, 45, 56);   // ahora a=['Lunes', 45, 56, 6] y borrado=['Martes', 2, 4];
```

### slice
Devuelve un subarray con los elementos indicados pero sin modificar el array original. Sintaxis:
```javascript
Array.slice(posicion, num. de elementos a devolver)
```
Ejemplo:
```javascript
let a=['Lunes', 'Martes', 2, 4, 6];
let borrado=a.slice(1, 3);       // ahora a=['Lunes', 'Martes', 2, 4, 6] y borrado=['Martes', 2, 4];
```

### Arrays y Strings
Cada objeto (y los arrays son un tipo de objeto) tienen definido el método `.toString()` que lo convierte en una cadena. Este método es llamado automáticamente cuando, por ejemplo, queremos mostrar un array por la consola. En realidad `console.log(a)` ejecuta `console.log(a.toString())`. 

Además podemos convertir los elementos de un array a una cadena con `.join()` especificando qué carácter que se pondrá entre los elementos. Ej.:
```javascript
let a=['Lunes', 'Martes', 2, 4, 6];
let cadena=a.join('-');       // cadena='Lunes-Martes-2-4-6'
```

Este método es el contrario de `.split()` que convierte una cadena en un array. Ej.:
```javascript
let notas='5-3.9-6-9.75-7.5-3';
let arrayNotas=notas.split('-');        // arrayNotas=[5, 3.9, 6, 9.75, 7.5, 3]
let cadena='Que tal estás';
let arrayPalabras=cadena.split(' ');    // arrayPalabras=['Que`, 'tal', 'estás']
let arrayLetras=cadena.split('');       // arrayLetras=['Q','u','e`,' ','t',a',l',' ','e',s',t',á',s']
```

### Otros métodos comunes
Otros métodos que se usan a menudo con arrays son:
* `.concat()`: concatena arrays
```javascript
let a=[2, 4, 6];
let b=['a', 'b', 'c'];
let c=a.concat(b);       // c=[2, 4, 6, 'a', 'b', 'c']
```
* `.reverse()`: invierte el orden de los elementos del array
```javascript
let a=[2, 4, 6];
let c=a.reverse();       // c=[6, 4, 2]
```
* `.reverse()`: invierte el orden de los elementos del array
```javascript
let a=[2, 4, 6];
let b=['a', 'b', 'c'];
let c=a.concat(b);       // c=[2, 4, 6, 'a', 'b', 'c']
```
* `.sort()`: ordena **alfabéticamente** los elementos del array
```javascript
let a=['hola','adios','Hola','Adios',2,5,13,45]
let b=a.sort();       // b=[13, 2, 45, 5, "Adios", "Hola", "adios", "hola"]
```
* `.indexOf()`: devuelve la primera posición del elemento pasado como parámetro o -1 si no se encuentra en el array
* `.lastIndexOf()`: devuelve la última posición del elemento pasado como parámetro o -1 si no se encuentra en el array

### Functional Programming
Desde la versión 5.1 javascript incorpora métodos de FP en el lenguaje, especialmente para trabajar con arrays:

#### filter
Devuelve un nuevo array con los elementos que cumplen determinada condición del array al que se aplica. Su parámetro es una función, habitualmente anónima, que va interactuando con los elementos del array. Esta función recibe como primer parámetro el elemento actual, como segundo parámetro su índice y como tercer parámetro el array completo y devuelve **true** para los elementos que se incluirán en el array a devolver y **false** para el resto.

Ejemplo: dado un array con todas devolver un array con las notas de los aprobados:
```javascript
let arrayNotas=[5, 3.9, 6, 9.75, 7.5, 3];
let aprobados=arrayNotas.filter(function(nota) {
  return nota>=5;
});       // aprobados=[5, 6, 9.75, 7.5]
```
Usando funciones lambda la sintaxis queda mucho más simple:
```javascript
let arrayNotas=[5, 3.9, 6, 9.75, 7.5, 3];
let aprobados=arrayNotas.filter(nota => nota>=5);
```

#### find
Como _filter_ pero devuelve el primer elemento que cumpla la condición (o _undefined_ si no la cumple nadie). Ejemlplo:
let todosAprobados=arrayNotas.every(nota => nota>=5);   // false
```javascript
let arrayNotas=[5, 3.9, 6, 9.75, 7.5, 3];
let primerAprobado=arrayNotas.find(nota => nota>=5);    // primerAprobado=5
```
#### findIndex
Como _find_ pero en vez de devolver el elemento devuelve su posición (o -1 si nadie cumple la condición). En el ejemplo anterior el valor devuelto sería 0 (ya que el primer elemento cumple la condición).

#### every / some
La primera devuelve **true** si TODOS los elementos del array cumplen la condición y **false** en caso contrario. La segunda
devuelve **true** si ALGÚN elemento del array cumple la condición. Ejemplo:
```javascript
let arrayNotas=[5, 3.9, 6, 9.75, 7.5, 3];
let todosAprobados=arrayNotas.every(nota => nota>=5);   // false
let algunAprobado=arrayNotas.some(nota => nota>=5);     // true
```

#### reduce
Devuelve un valor calculado a partir de los elementos del array. En este caso la función recibe como primer parámetro el valor calculado hasta ahora y el método tiene como 1º parámetro la función y como 2º parámetro al valor calculado inicial (si no se indica será el primer alemento del array).

Ejemplo: queremos obtener la suma de las notas:
```javascript
let arrayNotas=[5, 3.9, 6, 9.75, 7.5, 3];
let total=arrayNotas.reduce((total,nota) => total+=nota, 0);    // total=35.15
// podríamos haber omitido el valor inicial 0 para total
let total=arrayNotas.reduce((total,nota) => total+=nota);    // total=35.15
```
Ejemplo: queremos obtener la nota más alta:
```javascript
let arrayNotas=[5, 3.9, 6, 9.75, 7.5, 3];
let maxNota=arrayNotas.reduce((max,nota) => nota>max?nota:max);    // max=9.75
```

#### map
Permite modificar cada elemento de un array y devuelve un nuevo array con los elementos del original modificados. Ejemplo: queremos subir un 10% cada nota:
```javascript
let arrayNotas=[5, 3.9, 6, 9.75, 7.5, 3];
let arrayNotasSubidas=arrayNotas.map(nota => nota+nota*10%);
```


#### forEach

#### includes
Devuelve **true** si el array incluye el elemento pasado como parámetro. Ejemplo:
```javascript
let arrayNotas=[5, 3.9, 6, 9.75, 7.5, 3];
arrayNotas.includes(7.5);     // true
```


```javascript
array.filter(
```

## Referencia vs Copia
