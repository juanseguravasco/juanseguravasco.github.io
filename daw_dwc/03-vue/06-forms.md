# Formularios en Vue
Para poder tener sincronizado el formulario con nuestros datos utilizamos la directiva **v-model** en cada campo. Algunos modificadores útiles de _v-model_ son:
* **.lazy**: hace que _v-model_ sincronice al producirse el evento _change_ en vez del _input_, es decir, que no sincroniza con cada tecla que pulsemos sino cuando acabamos de escribir y salimos del input.
* **.number**: convierte automáticamente el valor introducido (que se considera siempre String) a Number
* **.trim**: realiza un trim() sobre el texto introducido

Vamos a ver cómo usar los diferentes tipos de campos con Vue.

## Enlazar diferentes inputs
### input normal
En este caso simplemente añadimos la directiva **v-model** al input:
```[html]
<label>Nombre:</label>
<input type="text" v-model="user.nombre">
```

### radio button
Ponemos en todos los radiobuttons el **v-model** y a cada uno el **value** que se guardará al escoger dicha opción:
```[html]
<label>Sexo:</label>
<input type="radio" value="H" name="sexo" v-model="user.sexo">Hombre
<input type="radio" value="M" name="sexo" v-model="user.sexo">Mujer
```

### checkbox
Igual que cualquier input, le ponemos el **v-model**. Si no ponemos un _value_ los valores que se guardarán serán _true_ si está marcado y _false_ si no lo está:
```[html]
<input type="checkbox" v-model="user.acepto">Acepto las condiciones
```

### checkbox múltiple
Se trata de varios checkbox pero cuyos valores se guardan en el mismo campo, que debe ser un array. Le ponemos el **v-model** y el **value** que queramos que se guarde. La variable (en este ejemplo _user.ciclos_ será un array y guardará el value de cada checkbox marcado:
```[html]
<input type="checkbox" v-model="user.ciclosImparte" value="smx">Sistemas Microinformáticos y Redes<br>
<input type="checkbox" v-model="user.ciclosImparte" value="asix">Administración de Sistemas Informáticos y Redes<br>
<input type="checkbox" v-model="user.ciclosImparte" value="dam">Desarrollo de Aplicaciones Multiplataforma<br>
<input type="checkbox" v-model="user.ciclosImparte" value="daw">Desarrollo de Aplicaciones Web<br>
```
Si tenemos marcadas las casillas 1 y 3 el valor de _user.ciclos_ será \['smx', 'dam'].

#### Generar los checkbox automáticamente
Muchas veces las opciones a mostrar las tendremos en algún objeto (una tabla de la BBDD, ...). En ese caso podemos generar automáticamente un checkbox para cada elemento:
```[javascript]
ciclos: [
  {cod: 'smx', desc: 'Sistemas Microinformáticos y Redes'},
  {cod: 'asix', desc: 'Administración de Sistemas Informáticos y Redes'},
  {cod: 'dam', desc: 'Desarrollo de Aplicaciones Multiplataforma'},
  {cod: 'daw', desc: 'Desarrollo de Aplicaciones Web'},
]
```

```[html]
<div v-for="ciclo in ciclos" :key="ciclo.cod">
  <input type="checkbox" v-model="user.ciclosImparte" :value="ciclo.cod">{{ ciclo.desc }}<br>
</div>
```
### select
Lo único que hay que hacer es poner al select la directiva **v-model**:
```[html]
<select v-model="user.tutor">
  <option value=''>No es tutor</option>
  <option value="smx">Sistemas Microinformáticos y Redes</option>
  <option value="asix">Administración de Sistemas Informáticos y Redes</option>
  <option value="dam">Desarrollo de Aplicaciones Multiplataforma</option>
  <option value="daw">Desarrollo de Aplicaciones Web</option>
</select>
```
También podemos generar las opciones automáticamente:
```[html]
<select v-model="user.tutor">
  <option value=''>No es tutor</option>
  <option  v-for="ciclo in ciclos" :key="ciclo.cod" :value="ciclo.cod">
    {{ ciclo.desc }}
  </option>
</select>
```
Si queremos que sea un select múltiple sólo tenemos que ponerle el atributo _multiple_ a la etiqueta _\<select>_ y hacer que la variable _user.tutor_ sea un array, que se comportará como en los checkbox múltiples.
  
### Ejemplo
<script async src="//jsfiddle.net/juansegura/09f59xqe/embed/"></script>

## Inputs en subcomponentes

# Validar formularios
Podemos validar el formulario "a mano" como hemos visto en JS:

<script async src="//jsfiddle.net/juansegura/qmg5btx2/embed/"></script>

Además deberíamos poner clase de error a los inputs con errores para destacarlos, poner el cursor en el primer input erróneo, etc.

Todo esto es incómodo y poco productivo. Para mejorarlo podemos usar una de las muchísimas librerías para validación de formularios como:
* [VeeValidate](http://vee-validate.logaretm.com/)
* [vuelidate](https://github.com/monterail/vuelidate)
* [VueFormGenerator](https://github.com/vue-generators/vue-form-generator)
* ...

## Validar con VeeValidate
VeeValidate es una librería que permite validar formularios simplemente añadiendo a los inputs la directiva **v-validate**. 

Genera el objeto **Errors** donde se almacenan las validaciones que hemos definido y que tiene métodos como:
* errors.nay(): si queda alguna validación pendiente
* errors.has('name'): si el input 'name' tiene validaciones fallidas
* errors.first('name'): primer mensaje de error asociado al input 'name'
* ...

### Instalación
Como esta librería vamos a usarla en producción la instalaremos como dependencia del proyecto:
```[bash]
npm install vee-validate -S
```
La importaremos en el fichero principal de nuestra aplicación, _main.js_ y la declaramos:
```[vue]
import VeeValidate from 'vee-validate';

Vue.use(VeeValidate)
```

También es posible usarla directamente desde un CDN:
```[javascript]
<script src="https://unpkg.com/vee-validate@latest"></script>
<script>
  Vue.use(VeeValidate);
</script>
```

### Uso de VeeValidate
Simplemente añadimos a cada input la directiva **v-validate** donde indicamos el tipo de validación a hacer. Podemos mostrar los mensajes de error junto al input (el input debe tener un __name__ que es el valor por el que buscamos los errores):
```[html]
<input v-validate="'required|email'" name="email" type="text">
<span>{{ errors.first('email') }}</span>
```
Estamos indicando que debe cumplir las validaciones _required_ (no puede estar vacío) y _email_ (debe parecer un e-mail). También puede ponerse en formato de objeto:
```[html]
<input v-validate="{required: true, email: true}" name="email" type="text">
```
En la documentación de la librería podemos consultar las diferentes [reglas de validación](https://baianat.github.io/vee-validate/guide/rules.html) (hay más de 30). Algunas de las más comunes son:
* _required_: no puede estar vacío ni valer _undefined_ o _null_
* tipos de datos: _alpha_ (sólo caracteres alfanuméricos), _alpha_num_ (alfanuméricos o números), _numeric_, _integer_, _decimal_ (se especifica cuántos decimales), _email_, _url_, _date\_format_ (se especifica el formato), _ip_, ...
* _regex_: debe concordar con la expresión regular pasada
* _min_:4 (longitud mínima 4), _max_:50, _min_value_:18 (debe ser un nº >= 18), _max_value_:65, _between_:18:65, _date\_detween_, _in_:1,2,3, _not\_in:1,2,3, ...
* _is_ compara un campo con otro:
```[html]
<input v-validate="{ is: confirmation }" type="text" name="password">
<input v-model="confirmation" type="text" name="password_confirmation">
```
* ficheros: _mimes_, _image_, _size_

### Ejemplo
Vamos a ver cómo se validaría el formulario anterior con esta librería:
<script async src="//jsfiddle.net/juansegura/bsn5Lkzq/embed/"></script>

### Personalizar el validador
Para acabar el ejemplo nos falta validar que deba seleccionar entre 1 y 3 ciclos. Además deberíamos personalizar los mensajes de error (por defecto en inglés). 

Para validar los ciclos vamos a construir nuestro propio validador personalizado. Le llamaremos **arraylength**:
```[html]
      <div v-for="ciclo in ciclos" :key="ciclo.cod">
        <input v-validate="'arraylenght:1-3'" name="ciclos" type="checkbox" v-model="user.ciclos" :value="ciclo.cod">{{ ciclo.desc }}<br>
      </div>
```
Al validador le va a llegar como parámetro lo que yoescriba tras el carácter '**:**', en este caso _1-3_.

Ahora construimos nuestro validador personalizado:
```[javascript]
import { Validator } from 'vee-validate';

Validator.extend('arraylenght', {
  getMessage(field, args) {
    // will be added to default locale messages.
    // Returns a message.
    let limits=args[0].split('-');
    return('Debes marcar entre '+limits[0]+' y '+limits[1]+' '+field);
  },
  validate(value, args) {
    // Returns a Boolean or a Promise that resolves to a boolean.
    let limits=args[0].split('-');
    return (value.length>=limits[0] && value.length<=limits[1]);
  }
});
```
Debe tener un nombre (_arraylenght_) y 2 métodos:
* _getMessage_: recibe el nombre del campo (_field_) y una cadena con el parámetro pasado (_args_) y devuelve una cadena que será lo que se añadirá a los errores si el campo no es válido
* _validatee_: recibe el valor del campo (el valor de la variable vinculada a él en el _v-model_) y la cadena con el parámetro pasado (_args_). Esta función determina si el campo es o no válido devolviendo _true_ si el campo es válido o _false_ si no lo es.

Ahora falta personalizar el resto de mensajes del validador. Para ello construimos un diccionario personalizado con los mensajes que queramos personalizar (podemos ponerlos en varios idiomas) y lo añadimos al diccionario de la librería. El idioma por defecto de los mensajes es el inglés por lo que si personalizamos los mensajes para otro idioma hemos de indicar el idioma que queremos usar (los mensajes no personalizados aparecerán en inglés):
```[javascript]
const dictionary = {
  es: {
    messages:{
      required: (field, args) => 'El campo '+field+' es obligatorio'
    }
  },
  ca: {
    messages: {
      required: (field, args) => 'El camp '+field+' és obligatori'
    }
  }
};

Validator.localize(dictionary)  // añadimos nuestro diccionario
Validator.localize('es');       // indicamos el idioma de los mensajes
```
