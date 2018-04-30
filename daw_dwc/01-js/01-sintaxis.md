# Variables
Javascript es un lenguaje débilmente tipado. Esto significa que no se indica de qué tipo es una variable al declararla e incluso puede cambiar su tipo a lo largo de la ejecución del programa. Ejemplo:
```[javascript]
let miVariable;     // declaro miVariable y como no se asigno un valor valdrá _undefined_
miVariable='Hola';  // ahora su valor es 'Hola', por tanto contiene una cadena de texto
miVariable=34;      // pero ahora contiene un número
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
Se declaran con **function** y se les pasan los parámetros entre paréntesis. Una función puede tener un número variable de parámetros

Puede usarse una función antes de haberla declarado por el _hoising_ de Javascript (el navegador primero carga todas las funciones y mueve las declaraciones de las variables al principio y luego ejecuta el código).

