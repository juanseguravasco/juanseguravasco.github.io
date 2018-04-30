# Variables
Javascript es un lenguaje débilmente tipado. Esto significa que no se indica de qué tipo es una variable al declararla e incluso puede cambiar su tipo a lo largo de la ejecución del programa. Ejemplo:
```[javascript]
let miVariable;         // declaro miVariable y como no se asigno un valor valdrá _undefined_
miVariable='Hola';      // ahora su valor es 'Hola', por tanto contiene una cadena de texto
miVariable=34;          // pero ahora contiene un número
miVariable=[3, 45, 2];  // y ahora un array
miVariable=undefined;   // para volver a valer elvalor especial _undefined_
```

Ni siquiera estamos obligados a declarar una variable antes de usarla, aunque es recomendable para evitar errores que nos constara depurar. Para que se produzca un error si no declaramos una variable debemos incluir en nuestro código la instrucción
```[javascript]
'use strict'
```

Las variables de declaran con **let** (lo recomendado desde ES2015), aunque también pueden declararse con **var**. La diferencia es que con _let_ la variable sólo existe en el bloque en que se declara mientras que con _var_ la variable existe en toda la función en que se declara. Cualquier variable que no se declara dentro de una función (o si se usa sin declarar) es _global_.

Se recomenda que Los nombres de las variables sigan la sintaxis _camelCase_ (ej.: _miPrimeraVariable_).

Desde ES2015 también podemos declarar constantes con **const**. Se les debe dar un valor al declararlas y si intentamos modificarlo posteriorment se produce un error.

## Funciones
Se declaran con **function** y se les pasan los parámetros entre paréntesis. La función puede devolver un valor usando **return** (si no tiene _return_ es como si devolviera _undefined_). 

Puede usarse una función antes de haberla declarado por el _hoising_ de Javascript (el navegador primero carga todas las funciones y mueve las declaraciones de las variables al principio y luego ejecuta el código).

### Parámetros
Si se llama una función con menos parámetros de los declarados el valor de los parámetros no pasados será _undefined_:
```[javascript]
potencia(4);

function potencia(base, exponente) {
    console.log(base);            // muestra 4
    console.log(exponente);       // muestra _undefined_
    let valor=1;
    for (let i=1; i<=exponente; i++) {
      valor=valor*base;
    }
    return valor;
}
```
Podemos dar un **valor por defecto** a los parámetros por si no los pasan asignándoles el valor al definirlos:
```[javascript]
potencia(4);

function potencia(base, exponente=2) {
    console.log(base);            // muestra 4
    console.log(exponente);       // muestra 2
    let valor=1;
    for (let i=1; i<=exponente; i++) {
      valor=valor*base;
    }
    return valor;
}
```

> NOTA: En ES5 para hacer esto se hacía
> ```[javascript]
> function potencia(base, exponente) {
>     exponente = exponente | 2;
> ...
> ```

También es posible acceder a los parámetros desde el array **arguments[]** si no sabemos cuántos recibiremos:
```[javascript]
function suma () {
    var result = 0;
    for (var i=0; i<arguments.length; i++)
        result += arguments[i];
    return result;
}
```
### Funciones anónimas
Podemos definir una función sin darle un nombre que pueden asignarse a una variable, autoejecutarse o asignasrse a un manejador de eventos. Ejemplo:
```[javascript]
let holaMundo = function() {
    alert('Hola mundo!');
}

holaMundo();        // se ejecuta la función
```

### Arrow functions (funciones _labda_)
ES2015 permite declarar una función anónima de forma más corta. Ejemplo sin _arrow function_:
```[javascript]
let potencia = function(base, exponente) {
    let valor=1;
    for (let i=1; i<=exponente; i++) {
      valor=valor*base;
    }
    return valor;
}
```
Lo que hacemos es:
* Eliminamos la palabra _function_
* Si sólo tiene 1 parámetro podemos eliminar los paréntesis de los parámetros
* Ponemos el símbolo _=>_
* Si la función sólo tiene 1 línea eliminamos las { } y la palabra _return_

El ejemplo con _arrow function_:
```[javascript]
let potencia = (base, exponente) => {
    let valor=1;
    for (let i=1; i<=exponente; i++) {
      valor=valor*base;
    }
    return valor;
}
```
Otro ejemplo, sin _arrow function_:
```[javascript]
let cuadrado = function(base) {
    return base * base;
}
```
conn _arrow function_:
```[javascript]
let cuadrado = base => base * base;
```

# Estructuras y bucles
## Estructura condicional _if_
El **if** es como en la mayoría de lenguajes. Puede tener asociado un **else** y pueden anidarse varios con **else if**.
```[javascript]
if (condicion) {
    ...
} else if (condicion2) {
    ...
} else if (condicion2) {
    ...
} else {
    ...
}
```
Se puede usar el operador **? :** que es como un _if_ que devuelve un valor:
```[javascript]
let esMayor = (edad>18)?true:false;
```

## Estructura condicional _switch_
El **switch** también es como en la mayoría de lenguajes. Hay que poner _break_ al final de cada bloque para que no continúe evaluando:
```[javascript]
switch(color) {
    case 'blanco':
    case 'amarillo':    // Ambos colores entran aquí
        colorFondo='azul';
        break;
    case 'azul':
        colorFondo='amarillo';
        break;
    default:            // Para cualquier otro valor
        colorFondo='negro';
}
```
Javascript permite que el _switch_ en vez de evaluar valores pueda evaluar expresiones. EN este caso se pone como condición _true_:
```[javascript]
switch(true) {
    case age < 18:
        console.log("Eres muy joven para entrar");
        break;
    case age < 65:
        console.log("Puedes entrar");
        break;
    default:
        console.log("Eres muy mayor para entrar");
}
```
## Bucle _while_
Podemos poner
```[javascript]
while (condicion) {
    // sentencias
}
```
que se ejecutará 0 o más veces o
```[javascript]
do {
    // sentencias
} while (condicion)
```
que al menos se ejecutará 1 vez.

## Bucle _for_
Tenemos muchos _for_ que podemos usar.

### Bucle _for_ con contador
```[javascript]
let datos=[5, 23, 12, 85]
let sumaDatos=0;

for (let i=0; i<datos.length; i++) {
    sumaDatos += datos[i];
}  
// El valor de sumaDatos será 125
```
### Bucle _for ... in_
```[javascript]
let datos=[5, 23, 12, 85]
let sumaDatos=0;

for (let indice in datos) {
    sumaDatos += datos[indice];
}  
// El valor de sumaDatos será 125
```
También sirve para recorrer las propiedades de un objeto:
```[javascript]
let profe={
    nom:”Juan”, 
    ape1=”Pla”, 
    ape2=”Pla”
}
let nombre='';

for (var campo in profe) {
   nombre += profe.campo + ' '; // o profe[campo];
}  
// El valor de nombre será “Juan Pla Pla ”
```
### Bucle _for ... of_
Es similar al _for...in_ pero en vez de devolver cada índice devuelve cada elemento. Es nuevo en ES2015:
```[javascript]
let datos=[5, 23, 12, 85]
let sumaDatos=0;

for (let valor of datos) {
    sumaDatos += valor;
}  
// El valor de sumaDatos será 125
```
También sirve para recorrer los caracteres de una cadena de texto:
```[javascript]
let cadena='Hola';

for (let letra of cadena) {
    console.log(letra);
}  
```

# Tipos de datos básicos
