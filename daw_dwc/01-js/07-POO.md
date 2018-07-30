# Programación Orientada a Objetos en Javascript

## Introducción
Desde ES2015 la POO en Javascript es similar a como se hace en otros lenguajes: clases, herencia, ... 

Se crean con **new** o usando notación **JSON**:console.log(alumno[prop]);        // imprime 'Carlos'
console.log(alumno[prop]);        // imprime 'Carlos'

```javascript
let .getInfo()=new Object();
alumno.nombre='Carlos';     // se crea la propiedad 'nombre' y se le asigna un valor
alumno['apellidos']='Pérez Ortiz';    // se crea la propiedad 'apellidos'
alumno.edad=19;
alumno.getInfo=function() {
    return 'El alumno '+this.nombre+' '+this.apellidos+' tiene '+this.edad+'años';
}
```

Usando **JSON** (recomendado) el ejemplo anteropr sería:
```javascript
let alumno={
    nombre: 'Carlos',
    apellidos: 'Pérez Ortiz',
    edad: 19,
    getInfo: function() {
        return 'El alumno '+this.nombre+' '+this.apellidos+' tiene '+this.edad+'años';
    }
};
```

Podemos acceder a las propiedades con `.` (punto) o `[ ]`:
```javascript
console.log(alumno.nombre);       // imprime 'Carlos'
console.log(alumno['nombre']);    // imprime 'Carlos'
let prop='nombre';
console.log(alumno[prop]);        // imprime 'Carlos'
console.log(alumno.getInfo());    // imprime 'El alumno Carlos Pérez Ortíz tiene 19 años'
```

Podremos recorrer las propiedades de un objecto con `for..in`:
```javascript
for (let prop in alumno) {
    console.log(prop+': '+alumno[prop]);
}
```

## Clases
Desde ES2015 funcionan como en la mayoría de lengiajes:
```javascript
class Alumno {
    constructor(nombre, apellidos, edad) {
        this.nombre=nombre;
        this.apellidos=apellidos;
        this.edad=edad;
    }
    getInfo() {
        return 'El alumno '+this.nombre+' '+this.apellidos+' tiene '+this.edad+' años';
    }
}

let cpo=new Alumno('Carlos', 'Pérez Ortiz', 19);
console.log(cpo.getInfo());     // imprime 'El alumno Carlos Pérez Ortíz tiene 19 años'
```

### Herencia
Una clase puede heredar de otra utilizando la palabra reservada **extends** y heredará todas sus propiedades y métodos. Podemos sobrescribirlos en la clase hija (seguimos pudiendo llamar a los métodos de la clase padre utilizando la palabra reservada **super** -es lo que haremos si creamos un constructor en la clase hija-).
```javascript
class AlumnInf extends Alumno{
    constructor(nombre, apellidos, edad, ciclo) {
        super(nombre, apellidos, edad);
        this.ciclo=ciclo;
    }
    getInfo() {
        return super.getInfo()+' y estudia el Grado '+(this.getGradoMedio?'Medio':'Superior')+' de '+this.ciclo;
    }
    getGradoMedio() {
        if (this.ciclo.toUpperCase==='SMX')
            return true;
        return false;
    }
}

let cpo=new AlumnInf('Carlos', 'Pérez Ortiz', 19, 'DAW');
console.log(cpo.getInfo());     // imprime 'El alumno Carlos Pérez Ortíz tiene 19 años y estudia el Grado Superior de DAW'
```


