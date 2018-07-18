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

## Referencia vs Copia
